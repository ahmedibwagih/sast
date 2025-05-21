using System;
using AutoMapper;
using Core.UnitOfWork;
using Infrastructure.UnitOfWork;

namespace Application.Mapper
{
    public class MapperObject
    {

        //public MapperObject(IUnitOfWork unitOfWork)
        //{
        //    MapperObject.UnitOfWork = unitOfWork;
        //}
        private static readonly Lazy<IMapper> Lazy = new(() =>
        {
          
            var config = new MapperConfiguration(cfg =>
            {
                cfg.ShouldMapProperty = p => p.GetMethod.IsPublic || p.GetMethod.IsAssembly;
                cfg.AddProfile<MappingProfile>();
            });
            var mapper = config.CreateMapper();
            return mapper;
        });

        public static IMapper Mapper => Lazy.Value;
    }
}
