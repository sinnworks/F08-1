using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace F08_1.Models.EFModels
{
    public partial class AppDbContent : DbContext
    {
        public AppDbContent()
            : base("name=AppDbContent")
        {
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<ContactUs> ContactUs { get; set; }
        public virtual DbSet<MemberCart> MemberCarts { get; set; }
        public virtual DbSet<Member> Members { get; set; }
        public virtual DbSet<OrderItem> OrderItems { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ShoppingCart> ShoppingCarts { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>()
                .HasMany(e => e.Products)
                .WithRequired(e => e.Category)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ContactUs>()
                .Property(e => e.Gender)
                .IsFixedLength();

            modelBuilder.Entity<ContactUs>()
                .Property(e => e.PhoneNumber)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<MemberCart>()
                .HasMany(e => e.ShoppingCarts)
                .WithRequired(e => e.MemberCart)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Member>()
                .Property(e => e.Gender)
                .IsFixedLength();

            modelBuilder.Entity<Member>()
                .Property(e => e.PhoneNumber)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Member>()
                .Property(e => e.Email)
                .IsFixedLength();

            modelBuilder.Entity<Member>()
                .Property(e => e.Account)
                .IsFixedLength();

            modelBuilder.Entity<Member>()
                .Property(e => e.Password)
                .IsFixedLength();

            modelBuilder.Entity<Member>()
                .HasMany(e => e.MemberCarts)
                .WithRequired(e => e.Member)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Member>()
                .HasMany(e => e.Orders)
                .WithRequired(e => e.Member)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.OrderItems)
                .WithRequired(e => e.Order)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.OrderItems)
                .WithRequired(e => e.Product)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.ShoppingCarts)
                .WithRequired(e => e.Product)
                .WillCascadeOnDelete(false);
        }
    }
}
