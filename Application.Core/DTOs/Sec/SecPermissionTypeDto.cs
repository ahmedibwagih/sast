using Core.DTOs;
using System;
using System.Collections.Generic;


namespace Application.Core.DTOs.Sec
{

        public partial class SecPermissionTypeDto: EntityDto
        {
            public int PermissionTypeId { get; set; }

            public string PermissionTypeNameEn { get; set; }

            public string PermissionTypeNameAr { get; set; }


          
        }

    }
