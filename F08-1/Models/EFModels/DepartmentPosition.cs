namespace F08_1.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DepartmentPosition")]
    public partial class DepartmentPosition
    {
        public int Id { get; set; }

        public int DepartmentNumber { get; set; }

        public int PositionNumber { get; set; }

        public int? EmployeeNumber { get; set; }
    }
}
