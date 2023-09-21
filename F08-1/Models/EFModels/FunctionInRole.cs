namespace F08_1.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class FunctionInRole
    {
        public int Id { get; set; }

        public int RoleId { get; set; }

        public int FunctionsId { get; set; }

        public virtual Function Function { get; set; }

        public virtual Role Role { get; set; }
    }
}
