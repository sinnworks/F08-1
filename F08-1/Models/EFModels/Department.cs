namespace F08_1.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Department
    {
        public int Id { get; set; }

        public int DepartmentNumber { get; set; }

        [Required]
        [StringLength(30)]
        public string DepartmentName { get; set; }

        public int SupervisorEmployeeNumber { get; set; }

        public bool Disable { get; set; }
    }
}
