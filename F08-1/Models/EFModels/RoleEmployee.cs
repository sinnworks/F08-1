namespace F08_1.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("RoleEmployee")]
    public partial class RoleEmployee
    {
        public int Id { get; set; }

        public int RoleId { get; set; }

        public int EmployeeNumber { get; set; }

        public virtual Role Role { get; set; }
    }
}
