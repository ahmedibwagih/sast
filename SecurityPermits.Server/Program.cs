using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using SecurityPermits.Server;
using SecurityPermits.Server.Models;
using SecurityPermits.Server.Services;
using Serilog;
using System;
using System.Text;

var builder = WebApplication.CreateBuilder(args);
//log
builder.Host.UseSerilog((ctx, lc) => lc
    .WriteTo.Console()
    .WriteTo.File("logs/SecurityPermits.txt", rollingInterval: RollingInterval.Day)
    .ReadFrom.Configuration(ctx.Configuration));

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<SecurityPermitsContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("SecurityPermitsConnection")));
builder.Services.AddAutoMapper(typeof(Program));
//added
builder.Services.AddHttpContextAccessor();
//builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
//builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme);
//builder.Services.AddAuthorization();


//        .AddJwtBearer(options =>
//        {
//            options.TokenValidationParameters = new TokenValidationParameters
//            {
//                ValidateIssuer = true,
//                ValidateAudience = true,
//                ValidateLifetime = true,
//                ValidateIssuerSigningKey = true,
//                ValidIssuer = "SCBANK",
//                ValidAudience = "SCBANK",
//                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("P@$$w0rdP@$$w0rdP@$$w0rdP@$$w0rd")),
//            };
//        });

builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "Security Permits API", Version = "v1" });
   
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Description = "JWT Authorization header using the Bearer scheme. Enter 'Bearer' [space] and then your token in the text input below.",
        Name = "Authorization",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer"
    });
    c.AddSecurityRequirement(new OpenApiSecurityRequirement
        {
            {
                new OpenApiSecurityScheme
                {
                    Reference = new OpenApiReference
                    {
                        Type = ReferenceType.SecurityScheme,
                        Id = "Bearer"
                    }
                },
                new string[] { }
            }
        });
});


builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowLocalhost4200",
        builder =>
        {
            builder.WithOrigins("http://localhost:4200")
                .AllowAnyHeader()
                .AllowAnyMethod();
        });
});

builder.Services.AddCors(options =>
{
    options.AddPolicy("Allowscbworkflow",
        builder =>
        {
            builder.WithOrigins("https://scbworkflow.scb.local:4448")
                .AllowAnyHeader()
                .AllowAnyMethod();
        });
});
builder.Services.AddScoped<IScBankUserService, ScBankUserService>();


//builder.Services.AddScoped<SecurityPermitsContext>();
//builder.Services.AddScoped<IMapper, Mapper>();
//builder.Services.AddScoped<IScBankUserService>(provider =>
//{
//    var dbContext = provider.GetRequiredService<SecurityPermitsContext>();
//    return new ScBankUserService(dbContext);
//});

var app = builder.Build();
app.MapGet("/test", () => "test");
if (app.Environment.IsDevelopment())
    app.UseCors("AllowLocalhost4200");
else
    app.UseCors("Allowscbworkflow");

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "Security Permits API V1");
        // Optionally, configure other settings like the Swagger UI path
        // c.RoutePrefix = "docs";
    });
}

app.UseDefaultFiles();
app.UseStaticFiles();
app.UseHttpsRedirection();


//app.UseAuthentication();
//app.UseAuthorization();

//added
app.UseRouting();

app.MapControllers();

app.MapFallbackToFile("/index.html");

app.Run();
