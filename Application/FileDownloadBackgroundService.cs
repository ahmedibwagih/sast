using System;
using System.IO;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Text.Json;
using Core.UnitOfWork;
using Infrastructure.UnitOfWork;
using Microsoft.Extensions.DependencyInjection;
using System.Text;
using System.Linq;
using Microsoft.Data.SqlClient;
using Core;

class ExtractedData
{
    public string Name { get; set; }
    public string schema { get; set; }
    public Dictionary<string, List<string>> Properties { get; set; }
}

public class FileDownloadBackgroundService :   IHostedService, IAsyncDisposable
{
    private readonly ILogger<FileDownloadBackgroundService> _logger;
    private Timer _timer;
    private readonly HttpClient _httpClient;
    private readonly string _destinationFolder;
    private readonly IServiceScopeFactory _serviceScopeFactory;
    // List of file URLs to download
    private readonly string conStr;
    private readonly int SecurityListUpdateEvry;
    private readonly string[] _fileUrls ;
   // {
//"https://data.opensanctions.org/datasets/20241130/eu_fsf/entities.ftm.json?v=20241130065702-mya"
//,"https://data.opensanctions.org/datasets/20241130/gb_hmt_sanctions/entities.ftm.json?v=20241130061402-lag"
//,"https://data.opensanctions.org/datasets/20241129/ae_local_terrorists/entities.ftm.json?v=20241129184204-nfh"
//,"https://data.opensanctions.org/datasets/20241130/us_ofac_sdn/entities.ftm.json?v=20241130061002-dwu"
//,"https://data.opensanctions.org/datasets/20241130/us_ofac_cons/entities.ftm.json?v=20241130063503-dfn"
//,"https://data.opensanctions.org/datasets/20241130/qa_nctc_sanctions/entities.ftm.json?v=20241130065903-ele"
   // };

  //  IUnitOfWork UnitOfWork;
    public FileDownloadBackgroundService(ILogger<FileDownloadBackgroundService> logger, IConfiguration configuration
        , IServiceScopeFactory serviceScopeFactory
        //,IUnitOfWork unitOfWork
        )
    {
        _logger = logger;
        _httpClient = new HttpClient();
        _serviceScopeFactory = serviceScopeFactory;
        //  UnitOfWork = unitOfWork;
        // Get the destination folder from appsettings.json
        SecurityListUpdateEvry = configuration.GetValue<int>("SecurityListUpdateEvry");
        conStr = configuration.GetValue<string>("ConnectionStrings:DB");
        _destinationFolder = configuration.GetValue<string>("SecurityListFilePath");
        _fileUrls = configuration.GetSection("SecurityListFileUrls").Get<string[]>();
        if (string.IsNullOrEmpty(_destinationFolder))
        {
            throw new ArgumentNullException("DestinationFolder", "Destination folder must be configured in appsettings.json.");
        }
    }

    public async Task StartAsync(CancellationToken cancellationToken)
    {
       // return;
        // Create a scope to resolve scoped services
        using (var scope = _serviceScopeFactory.CreateScope())
        {
            // Resolve the scoped IUnitOfWork service
            var unitOfWork = scope.ServiceProvider.GetRequiredService<IUnitOfWork>();

            // Perform your background work with the scoped service
            await DoBackgroundWorkAsync(unitOfWork, cancellationToken);
        }
    }

    //public Task StartAsync(CancellationToken cancellationToken)
    //{

    //    using (var scope = _serviceScopeFactory.CreateScope())
    //    {
    //        // Resolve the scoped IUnitOfWork service
    //        var unitOfWork = scope.ServiceProvider.GetRequiredService<IUnitOfWork>();

    //        // Perform your background work with the scoped service
    //        await DoBackgroundWorkAsync(unitOfWork, cancellationToken);
    //    }
    //    return Task.CompletedTask;
    //}
    public Task StopAsync(CancellationToken cancellationToken)
    {
        // Handle stop logic here if needed
        return Task.CompletedTask;
    }

    //public async ValueTask DisposeAsync()
    //{
    //    // Dispose logic if needed
    //}

    private async Task DoBackgroundWorkAsync(IUnitOfWork unitOfWork, CancellationToken cancellationToken)
    {
        // Your background work logic here
        // Example: Call a method on IUnitOfWork
        //await unitOfWork.SomeMethodAsync(cancellationToken);
        _logger.LogInformation("FileDownloadBackgroundService started.");

        // Ensure the destination folder exists
        if (!Directory.Exists(_destinationFolder))
        {
            Directory.CreateDirectory(_destinationFolder);
        }

        // Set the timer to run once every 24 hours (86400000 milliseconds)
        //_timer = new Timer(DownloadFiles, null, TimeSpan.Zero, TimeSpan.FromDays(1));
        _timer = new Timer(Download_Insert_Files, unitOfWork, TimeSpan.Zero, TimeSpan.FromDays(SecurityListUpdateEvry));
    }

    private async void Download_Insert_Files(object unitOfWorkObj)
    {
        try
        {
            return;
            IUnitOfWork unitOfWork = (IUnitOfWork)unitOfWorkObj;
            _logger.LogInformation("Starting file downloads...");

            // Loop through each file URL in the list
            foreach (var fileUrl in _fileUrls)
            {
                // Construct a file name based on the URL (you could customize this logic)
                var fileName = Path.GetFileName(fileUrl).Replace(".","").Replace("?", "").Replace("=", "");
                var destinationPath = Path.Combine(_destinationFolder, fileName);
                await DownloadFile(fileUrl, destinationPath);
                InsertFile(destinationPath, unitOfWork);
            }

            _logger.LogInformation("All files downloaded successfully.");
        }
        catch (Exception ex)
        {
            _logger.LogError($"Error downloading files: {ex.Message}");
        }
    }

    private async Task DownloadFile(string fileUrl, string destinationPath)
    {
        try
        {
            // Send GET request to the file URL
            using (HttpResponseMessage response = await _httpClient.GetAsync(fileUrl))
            {
                // Ensure the request was successful
                response.EnsureSuccessStatusCode();

                // Open a file stream to save the file to the specified path
                using (Stream fileStream = await response.Content.ReadAsStreamAsync())
                using (FileStream fs = new FileStream(destinationPath, FileMode.Create, FileAccess.Write))
                {
                    // Copy the response stream (file content) to the destination file stream
                    await fileStream.CopyToAsync(fs);
                    _logger.LogInformation($"File downloaded successfully to {destinationPath}");
                }
            }
        }
        catch (Exception ex)
        {
            _logger.LogError($"Error downloading file from {fileUrl}: {ex.Message}");
        }
    }


    async void InsertFile(string filePath, IUnitOfWork unitOfWork)
    {
        using (FileStream stream = new FileStream(filePath, FileMode.Open, FileAccess.Read))
        using (StreamReader reader = new StreamReader(stream))
        {
            string line;
            string connectionString = conStr;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string DQuery = "delete from ClientSecurityFile where Add4 =@Add4 ";

                using (SqlCommand command = new SqlCommand(DQuery, connection))
                {
                    command.Parameters.AddWithValue("@Add4", filePath);
                    command.ExecuteNonQuery();
                }
                    while ((line = ReadNextJsonObject(reader)) != null)
                {
                    using (JsonDocument doc = JsonDocument.Parse(line))
                    {
                        var extractedData = ExtractNameAndProperties(doc.RootElement);
                        List<string> names = new List<string>();
                        // name.Append(extractedData[0].Name);
                        string schema = extractedData[0].schema;
                        string address = "";
                        string passportNumber = "";
                        string birthPlace = "";
                        string nationality = "";
                        string birthDate = "";

                        // Print the extracted data
                        foreach (var data in extractedData)
                        {

                            Console.WriteLine("Properties:");
                            foreach (var property in data.Properties)
                            {
                                if (property.Key.ToLower() == "name")
                                {
                                    names = property.Value;
                                }

                                if (property.Key.ToLower() == "address")
                                {
                                    foreach (var value in property.Value)
                                    {
                                        address += value;
                                    }
                                }

                                if (property.Key.ToLower() == "passportNumber")
                                {
                                    foreach (var value in property.Value)
                                    {
                                        passportNumber += value;
                                    }
                                }

                                if (property.Key.ToLower() == "birthPlace")
                                {
                                    foreach (var value in property.Value)
                                    {
                                        birthPlace += value;
                                    }
                                }

                                if (property.Key.ToLower() == "nationality")
                                {
                                    foreach (var value in property.Value)
                                    {
                                        nationality += value;
                                    }
                                }
                                if (property.Key.ToLower() == "birthDate")
                                {
                                    foreach (var value in property.Value)
                                    {
                                        birthDate += value;
                                    }
                                }

                                // address += ($"  {property.Key}: {string.Join(", ", property.Value)}");

                            }



                            if (schema.ToLower() == "person")
                            {
                                foreach (var name in names.ToList())
                                {


                                    // SQL Insert command
                                    string insertQuery = "INSERT INTO ClientSecurityFile (IsDeleted,Name,NatId,Country,Add1,Add2,Add3,Add4) VALUES (0,@Name,@NatId,@Country,@Add1,@Add2,@Add3,@Add4)";


                                    // Execute the insert command

                                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                                    {
                                        // Add parameters to prevent SQL injection
                                        command.Parameters.AddWithValue("@Name", name);
                                        command.Parameters.AddWithValue("@NatId", passportNumber);
                                        command.Parameters.AddWithValue("@Country", birthPlace);
                                        command.Parameters.AddWithValue("@Add1", address);
                                        command.Parameters.AddWithValue("@Add2", birthDate);
                                        command.Parameters.AddWithValue("@Add3", nationality);
                                        command.Parameters.AddWithValue("@Add4", filePath);

                                        try
                                        {
                                            // Open the connection


                                            // Execute the insert command
                                            int rowsAffected = command.ExecuteNonQuery();

                                            // Display the result
                                            //Console.WriteLine($"{rowsAffected} row(s) inserted successfully.");
                                        }
                                        catch (Exception ex)
                                        {
                                            // Handle exceptions
                                            // Console.WriteLine("Error: " + ex.Message);
                                        }

                                        //        using (var command = unitOfWork..GetDbConnection().CreateCommand())
                                        //    {
                                        //        await  unitOfWork.ClientSecurityFile.AddAsync(new Core.Entities.Clients.ClientSecurityFile() { Add4= filePath, Name = name, Add1 = address, NatId = passportNumber,Country=birthPlace,Add2=birthDate,Add3=nationality });
                                        //    await unitOfWork.CompleteAsync();
                                        //}
                                    }
                                }
                            }
                        }
                    }
                }




            }
        }
    }

    string ReadNextJsonObject(StreamReader reader)
    {
        StringBuilder jsonObject = new StringBuilder();
        int braceCount = 0;
        while (!reader.EndOfStream)
        {
            char c = (char)reader.Read();

            if (c == '{')
            {
                braceCount++;
            }

            if (braceCount > 0)
            {
                jsonObject.Append(c);
            }

            if (c == '}')
            {
                braceCount--;
                if (braceCount == 0)
                {
                    return jsonObject.ToString();
                }
            }
        }

        return jsonObject.Length > 0 ? jsonObject.ToString() : null;
    }

    List<ExtractedData> ExtractNameAndProperties(JsonElement arrayElement)
    {
        var extractedDataList = new List<ExtractedData>();

        // Since this handles single objects, just process one element
        var extractedData = new ExtractedData
        {
            Name = arrayElement.TryGetProperty("name", out JsonElement nameElement) ? nameElement.GetString() : "Unnamed",
            schema = arrayElement.TryGetProperty("schema", out JsonElement schemaElement) ? schemaElement.GetString() : "Unnamed",
            Properties = new Dictionary<string, List<string>>()
        };

        if (arrayElement.TryGetProperty("properties", out JsonElement propertiesElement))
        {
            foreach (var property in propertiesElement.EnumerateObject())
            {
                var propertyValues = new List<string>();
                foreach (var value in property.Value.EnumerateArray())
                {
                    propertyValues.Add(value.GetString());
                }

                extractedData.Properties[property.Name] = propertyValues;
            }
        }

        extractedDataList.Add(extractedData);

        return extractedDataList;
    }




    //void InsertFile(string filePath)
    //{
    //    const int maxBufferSize = 65536; // 64 KB
    //    const int defaultBufferSize = 16384; // 16 KB

    //    long fileSize = new FileInfo(filePath).Length;
    //    int bufferSize = (int)Math.Min(fileSize / 10, maxBufferSize); // Adjust buffer size dynamically
    //    bufferSize = bufferSize > 0 ? bufferSize : defaultBufferSize;

    //    using (FileStream stream = new FileStream(filePath, FileMode.Open, FileAccess.Read))
    //    {
    //        var buffer = new byte[bufferSize];
    //        int bytesRead;
    //        JsonReaderState state = new JsonReaderState();

    //        while ((bytesRead = stream.Read(buffer, 0, buffer.Length)) > 0)
    //        {
    //            Utf8JsonReader reader = new Utf8JsonReader(buffer.AsSpan(0, bytesRead), isFinalBlock: bytesRead < buffer.Length, state);

    //            while (reader.Read())
    //            {
    //                if (reader.TokenType == JsonTokenType.StartObject)
    //                {
    //                    ParseJsonObject(ref reader);
    //                }
    //            }

    //            state = reader.CurrentState;
    //        }
    //    }
    //}

    //void insert_file(string filePath)
    //{
    //    using (FileStream stream = new FileStream(filePath, FileMode.Open, FileAccess.Read))
    //    {
    //        var buffer = new byte[16384]; // Adjust buffer size as needed
    //        int bytesRead;
    //        JsonReaderState state = new JsonReaderState();

    //        while ((bytesRead = stream.Read(buffer, 0, buffer.Length)) > 0)
    //        {
    //            Utf8JsonReader reader = new Utf8JsonReader(buffer.AsSpan(0, bytesRead), isFinalBlock: bytesRead < buffer.Length, state);

    //            while (reader.Read())
    //            {
    //                if (reader.TokenType == JsonTokenType.StartObject)
    //                {
    //                    // Parse each individual JSON object
    //                    ParseJsonObject(ref reader);
    //                }
    //            }

    //            state = reader.CurrentState;
    //        }
    //    }
    //}

    //void ParseJsonObject(ref Utf8JsonReader reader)
    //{
    //    var extractedData = new ExtractedData { Properties = new Dictionary<string, List<string>>() };

    //    while (reader.Read() && reader.TokenType != JsonTokenType.EndObject)
    //    {
    //        if (reader.TokenType == JsonTokenType.PropertyName)
    //        {
    //            string propertyName = reader.GetString();

    //            if (propertyName == "properties")
    //            {
    //                reader.Read();
    //                if (reader.TokenType == JsonTokenType.StartObject)
    //                {
    //                    while (reader.Read() && reader.TokenType != JsonTokenType.EndObject)
    //                    {
    //                        string key = reader.GetString();
    //                        reader.Read();

    //                        var values = new List<string>();
    //                        if (reader.TokenType == JsonTokenType.StartArray)
    //                        {
    //                            while (reader.Read() && reader.TokenType != JsonTokenType.EndArray)
    //                            {
    //                                values.Add(reader.GetString());
    //                            }
    //                        }

    //                        extractedData.Properties[key] = values;
    //                    }
    //                }
    //            }
    //            else if (propertyName == "name")
    //            {
    //                reader.Read();
    //                extractedData.Name = reader.GetString();
    //            }
    //        }
    //    }

    //    //// Output extracted data
    //    //Console.WriteLine($"Name: {extractedData.Name}");
    //    //Console.WriteLine("Properties:");
    //    //foreach (var property in extractedData.Properties)
    //    //{
    //    //    Console.WriteLine($"  {property.Key}: {string.Join(", ", property.Value)}");
    //    //}
    //    //Console.WriteLine();
    //}


    //void insert_file(string filePath)
    //{
    //    using (FileStream stream = new FileStream(filePath, FileMode.Open, FileAccess.Read))
    //    {
    //        // Create a buffer to stream the JSON file
    //        var buffer = new byte[1024]; // Adjust buffer size based on memory constraints
    //        int bytesRead;
    //        JsonReaderState state = new JsonReaderState();

    //        while ((bytesRead = stream.Read(buffer, 0, buffer.Length)) > 0)
    //        {
    //            Utf8JsonReader reader = new Utf8JsonReader(buffer.AsSpan(0, bytesRead), isFinalBlock: bytesRead < buffer.Length, state);

    //            // Process each JSON token
    //            while (reader.Read())
    //            {
    //                if (reader.TokenType == JsonTokenType.StartObject)
    //                {
    //                    // Parse the individual object
    //                    ParseJsonObject(ref reader);
    //                }
    //            }

    //            // Update the state for next buffer
    //            state = reader.CurrentState;
    //        }
    //    }
    //}

    //void ParseJsonObject(ref Utf8JsonReader reader)
    //{
    //    var extractedData = new ExtractedData { Properties = new Dictionary<string, List<string>>() };

    //    while (reader.Read() && reader.TokenType != JsonTokenType.EndObject)
    //    {
    //        if (reader.TokenType == JsonTokenType.PropertyName)
    //        {
    //            string propertyName = reader.GetString();

    //            // Handle "properties" object specifically
    //            if (propertyName == "properties")
    //            {
    //                reader.Read();
    //                if (reader.TokenType == JsonTokenType.StartObject)
    //                {
    //                    while (reader.Read() && reader.TokenType != JsonTokenType.EndObject)
    //                    {
    //                        string key = reader.GetString();
    //                        reader.Read();

    //                        var values = new List<string>();
    //                        if (reader.TokenType == JsonTokenType.StartArray)
    //                        {
    //                            while (reader.Read() && reader.TokenType != JsonTokenType.EndArray)
    //                            {
    //                                values.Add(reader.GetString());
    //                            }
    //                        }

    //                        extractedData.Properties[key] = values;

    //                        if (key.ToString().ToLower() == "name")
    //                        {
    //                            extractedData.Name = values[0];
    //                        }
    //                    }
    //                }
    //            }
    //            else if (propertyName == "name")
    //            {
    //                reader.Read();
    //                extractedData.Name = reader.GetString();
    //            }
    //        }
    //    }

    //    // Output the extracted data
    //    Console.WriteLine($"Name: {extractedData.Name}");
    //    Console.WriteLine("Properties:");
    //    foreach (var property in extractedData.Properties)
    //    {
    //        Console.WriteLine($"  {property.Key}: {string.Join(", ", property.Value)}");
    //    }
    //    Console.WriteLine();
    //}



    // void insert_file(string filePath)
    //{

    //    // Read the JSON file into a string
    //    string jsonString ="["+ File.ReadAllText(filePath) +"]";

    //    // Parse the JSON string into a JsonDocument
    //    using (JsonDocument doc = JsonDocument.Parse(jsonString))
    //    {
    //        // Call the function to extract the name and properties for each object in the array
    //        var extractedData = ExtractNameAndProperties(doc.RootElement);

    //        // Print out the extracted data
    //        foreach (var data in extractedData)
    //        {
    //            Console.WriteLine($"Name: {data.Name}");
    //            Console.WriteLine("Properties:");
    //            foreach (var property in data.Properties)
    //            {
    //                Console.WriteLine($"  {property.Key}: {string.Join(", ", property.Value)}");
    //            }
    //            Console.WriteLine(); // Add a newline between entries
    //        }
    //    }
    //}

    //// Class to hold extracted name and properties


    //// Function to extract name and properties from each object in the array
    // List<ExtractedData> ExtractNameAndProperties(JsonElement arrayElement)
    //{
    //    var extractedDataList = new List<ExtractedData>();

    //    // Ensure the root element is an array
    //    if (arrayElement.ValueKind == JsonValueKind.Array)
    //    {
    //        foreach (var item in arrayElement.EnumerateArray())
    //        {
    //            var extractedData = new ExtractedData
    //            {
    //                // Extract the 'name' from the properties object (if available)
    //                Name = item.GetProperty("properties").GetProperty("name")[0].GetString(),
    //                Properties = new Dictionary<string, List<string>>()
    //            };

    //            // Extract the 'properties' object
    //            var properties = item.GetProperty("properties");

    //            foreach (var property in properties.EnumerateObject())
    //            {
    //                // Extract the array values as a list of strings
    //                var propertyValues = new List<string>();
    //                foreach (var value in property.Value.EnumerateArray())
    //                {
    //                    propertyValues.Add(value.GetString());
    //                }

    //                // Add the extracted values to the dictionary
    //                extractedData.Properties[property.Name] = propertyValues;
    //            }

    //            extractedDataList.Add(extractedData);
    //        }
    //    }

    //    return extractedDataList;
    //}
    ////public Task StopAsync(CancellationToken cancellationToken)
    //{
    //    _logger.LogInformation("FileDownloadBackgroundService stopped.");

    //    // Dispose the timer
    //    _timer?.Change(Timeout.Infinite, 0);

    //    return Task.CompletedTask;
    //}

    public void Dispose()
    {
        _timer?.Dispose();
        _httpClient.Dispose();
    }

    public ValueTask DisposeAsync()
    {
        throw new NotImplementedException();
    }
}
