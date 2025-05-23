using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

using System.Threading.Tasks;
using Core.DTOs;
using Core.Repositories.Base;
using System.Data;
using Infrastructure.Data;
using System.Linq.Dynamic.Core;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using Core.Other;
using Core.Entities.Clients;
using System.Reflection;
using Org.BouncyCastle.Utilities;
using Microsoft.EntityFrameworkCore.Internal;
using Org.BouncyCastle.Asn1;
using Microsoft.Extensions.Configuration;
using System.IO;
using Core.UnitOfWork;
using Microsoft.Data.SqlClient;


namespace Infrastructure.Repositories
{
    public class BaseRepository<T> : IRepository<T> where T : class
    {
        protected  DBContext _context;
        protected readonly DbSet<T> DbSet;

        public BaseRepository(DBContext context)
        {
            this._context = context;
            DbSet = this._context.Set<T>();
        }

        //IQueryable<T> AddWhere(IQueryable<T> Queryable,string cond)
        //{
        //    var parameter = Expression.Parameter(typeof(T), "entity");
        //    var predicate = DynamicExpressionParser.ParseLambda(typeof(T), typeof(bool), cond, null);
        //    var lambda = Expression.Lambda<Func<T, bool>>(predicate.Body, parameter);

        //    return Queryable.Where(lambda);
        //}GetAllAsync

        public virtual async Task<Tuple<ICollection<T>, int>> GetAllPagingAsync(PagingInputDto pagingInputDto)
        {
            IQueryable<T> query = GetQueryableForGetAllPaging();

            if (pagingInputDto.HiddenFilter != null)
            {
                query = query.Where(pagingInputDto.HiddenFilter);
            }

            if (pagingInputDto.Filter != null)
            {
                pagingInputDto.Filter = pagingInputDto.Filter.Trim();
                var props = typeof(T).GetProperties().Where(prop => Attribute.IsDefined(prop, typeof(FilterAttribute)));
                var condition = "";
                foreach (var p in props)
                {
                    condition = (condition == "" ? condition : condition + " || ") + p.Name + ".ToString().Contains(@0)";
                }

                query = query.Where(condition, pagingInputDto.Filter);
            }
            if (HasIsDeleted())
                query = query.Where("isdeleted == false  ");

            

            var order = query;
            if (pagingInputDto.OrderByField != null)
             order = query.OrderBy(pagingInputDto.OrderByField + " " + pagingInputDto.OrderType);

            var page = order.Skip(pagingInputDto.PageNumber * pagingInputDto.PageSize - pagingInputDto.PageSize).Take(pagingInputDto.PageSize);

            var total = await query.CountAsync();

            return new Tuple<ICollection<T>, int>(await page.ToListAsync(), total);
        }

        public virtual IQueryable<T> GetQueryableForGetAllPaging()
        {
            return DbSet.AsQueryable();
        }

        public virtual async Task<List<T>> GetAllAsync()
        {
            try
            {
                IQueryable<T> query = GetQueryableForGetAllPaging();

                if (HasIsDeleted())
                    return await query.Where("isdeleted == false ").ToListAsync();
                else
                    return await query.ToListAsync();
            }
            catch (Exception ex)
            {
            
            }
            return null;
        }

        public virtual async Task<List<T>> GetAllAsync_withDeleted()
        {
            try
            {
                IQueryable<T> query = GetQueryableForGetAllPaging();

              
                    return await query.ToListAsync();
            }
            catch (Exception ex)
            {

            }
            return null;
        }

        public virtual async Task<List<T>> GetAsync(string cond)
        {
            try
            {
                var query = DbSet.AsQueryable();
                query = query.Where(cond);
                if (HasIsDeleted())
                     return await query.Where("isdeleted == false  ").ToListAsync();
                else
                    return await query.ToListAsync();
            }
            catch (Exception ex)
            { 
            
            }
            return null;
        }

        public virtual async Task<T> GetByIdAsync(long id)
        {
            try
            {
                return await _context.Set<T>().FindAsync(id);
            }
            catch (Exception ex) {
                int newid = int.Parse(id.ToString());
                return await _context.Set<T>().FindAsync(newid);
            }
        }

        public virtual async Task<T> GetByIdLightAsync(long id)
        {
            try
            {
                return await _context.Set<T>().FindAsync(id);
            }
            catch (Exception ex)
            {
                int newid = int.Parse(id.ToString());
                return await _context.Set<T>().FindAsync(newid);
            }
        }

        public virtual async Task<T> AddAsync(T entity)
        {
            await DbSet.AddAsync(entity);
            return entity;
        }


        public virtual async Task<IList<T>> AddRangeAsync(IList<T> entity)
        {
            await DbSet.AddRangeAsync(entity);
            return entity;
        }

        public virtual async void Delete(T entity)
        {

           
            //if ((await RelationalDependencyChecker.HasRelationalDependenciesAsync(entity)) == true)
            //    throw new Exception("لا يمكن الحذف");

      
        
            //reattach entity
            // var entityType = _context.Model.FindEntityType(typeof(T));
            // var key = entityType.FindPrimaryKey();
            // var keyName = key.Properties[0].Name;
            // var keyProperty = typeof(T).GetProperty(keyName);
            // var keyValue = keyProperty.GetValue(entity);
            // T trackedEntity = await _context.Set<T>()
            //     .FirstOrDefaultAsync(e => EF.Property<object>(e, keyName).Equals(keyValue));
            // if (trackedEntity == null)
            //     throw new InvalidOperationException("Entity not found.");
            //// T entry = _context.Entry(trackedEntity);

            if (HasIsDeleted())
            {
                PropertyInfo prop = typeof(T).GetProperties().Where(prop => prop.Name.ToLower() == "isdeleted").ToList()[0];
                //&& (prop.PropertyType == typeof(bool) || prop.PropertyType == typeof(Boolean))
                if (prop != null)
                {
                    DbSet.Attach(entity);
                    prop.SetValue(entity, true);
                }
            }
            else
            {
                
                DbSet.Remove(entity);
            }
               
        }

        public virtual async void Delete(IEnumerable<T> entities)
        {
            
            //foreach (var item in entities)
            //{
            //    if ((await HasRelationalDependenciesAsync(item)) == true)
            //        throw new Exception("لا يمكن الحذف");
            //}
            if (HasIsDeleted())
            {
                foreach (T entity in entities)
                {
                    PropertyInfo prop = typeof(T).GetProperties().Where(prop => prop.Name.ToLower() == "isdeleted").ToList()[0];
                    //&& prop.PropertyType == typeof(bool)
                    if (prop != null )
                    {
                        prop.SetValue(entity, true);
                    }
                }
            }
            else
                DbSet.RemoveRange(entities);
        }

        public bool HasIsDeleted()
        {
            var Deletedprops = typeof(T).GetProperties().Where(prop => prop.Name.ToLower() == "isdeleted");
            if (Deletedprops.Count() > 0)
                return true;
            else
                return false;
           
        }
        public async Task<bool> HasRelationalDependenciesAsync(T entity) 
        {
           
            return await RelationalDependencyChecker.HasRelationalDependenciesAsync<T>(entity);
        }


    }
}



static class RelationalDependencyChecker
{

    //string Con = "";

    //public checkdb2(string _con)
    //{
    //    Con=_con;

    //}
    private static NewDBContext db;
    public static async Task<bool> HasRelationalDependenciesAsync<TEntity>(TEntity entity) where TEntity : class
    {
        await CreateOpenContextAsync();


        // Get key metadata
        var entityType = db.Model.FindEntityType(typeof(TEntity));
        var key = entityType.FindPrimaryKey();
        var keyName = key.Properties[0].Name;
        var keyProperty = typeof(TEntity).GetProperty(keyName);
        var keyValue = keyProperty.GetValue(entity);

        // Get fresh tracked entity
        var trackedEntity = await db.Set<TEntity>()
            .FirstOrDefaultAsync(e => EF.Property<object>(e, keyName).Equals(keyValue));

        if (trackedEntity == null)
            throw new InvalidOperationException("Entity not found.");

        // Load and check navigations
        var entry = db.Entry(trackedEntity);
        foreach (var navigation in entry.Navigations)
        {
            if (!navigation.IsLoaded)
                await navigation.LoadAsync();

            var value = navigation.CurrentValue;



            if (value is IEnumerable<object> collection && collection.Any())
            {
                var filtered = collection.Where(o =>
                {
                    var prop = o.GetType().GetProperty("IsDeleted");
                    return prop != null && !(bool)prop.GetValue(o);
                });

                if (filtered.Any())
                    return true;
            }
            //    return true;

            //if (value != null && value is not IEnumerable<object>)
            //    return true;
        }

        return false;

    }

    public static async Task CreateOpenContextAsync()
    {


        var connectionString = "";

        var options = new DbContextOptionsBuilder<DBContext>()
            .UseSqlServer(connectionString, x => x.UseNetTopologySuite())
            .Options;



        RelationalDependencyChecker.db = new NewDBContext(options);

        var connection = RelationalDependencyChecker.db.Database.GetDbConnection();
        if (connection.State == ConnectionState.Closed)
        {
            await connection.OpenAsync();
        }


    }


}

class NewDBContext : DBContext
{ 
   

  public NewDBContext(DbContextOptions<DBContext> options) : base(options)
    {

    }

}