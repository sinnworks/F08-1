namespace F08_1.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Employee
    {
        public int Id { get; set; }

        public int EmployeeNumber { get; set; }

        [Required]
        [StringLength(30)]
        public string EmployeeName { get; set; }

        public bool Gender { get; set; }

        [Required]
        [StringLength(10)]
        public string PhoneNumber { get; set; }

        [Required]
        [StringLength(50)]
        public string Address { get; set; }

        [Column(TypeName = "date")]
        public DateTime Birthday { get; set; }

        public int Salary { get; set; }

        [Required]
        [StringLength(50)]
        public string Account { get; set; }

        [Required]
        [StringLength(50)]
        public string Password { get; set; }

        public bool Disable { get; set; }
    }
}
