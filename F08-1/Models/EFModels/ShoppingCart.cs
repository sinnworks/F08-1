namespace F08_1.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ShoppingCart
    {
        public int Id { get; set; }

        public int Quantity { get; set; }

        public int UnitPrice { get; set; }

        public int TotalPrice { get; set; }

        public int ProductId { get; set; }

        public int MemberCartId { get; set; }

        public virtual MemberCart MemberCart { get; set; }

        public virtual Product Product { get; set; }
    }
}
