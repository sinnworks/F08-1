namespace F08_1.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Position
    {
        public int Id { get; set; }

        public int PositionNumber { get; set; }

        [Required]
        [StringLength(30)]
        public string PositionName { get; set; }

        public bool Disable { get; set; }
    }
}
