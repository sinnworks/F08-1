using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace F08_1.Models.EFModels
{
    public partial class AppDbContext : DbContext
    {
        public AppDbContext()
            : base("name=AppDbContext")
        {
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<ContactU> ContactUs { get; set; }
        public virtual DbSet<CouponMemberRel> CouponMemberRels { get; set; }
        public virtual DbSet<Coupon> Coupons { get; set; }
        public virtual DbSet<DepartmentPosition> DepartmentPositions { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<DiscountDetail> DiscountDetails { get; set; }
        public virtual DbSet<Discount> Discounts { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<FunctionInRole> FunctionInRoles { get; set; }
        public virtual DbSet<Function> Functions { get; set; }
        public virtual DbSet<MemberCart> MemberCarts { get; set; }
        public virtual DbSet<Member> Members { get; set; }
        public virtual DbSet<OrderItem> OrderItems { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Position> Positions { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<RoleEmployee> RoleEmployees { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<RuleBas> RuleBases { get; set; }
        public virtual DbSet<ShoppingCart> ShoppingCarts { get; set; }
        public virtual DbSet<Tag> Tags { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>()
                .HasMany(e => e.Products)
                .WithRequired(e => e.Category)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ContactU>()
                .Property(e => e.Gender)
                .IsFixedLength();

            modelBuilder.Entity<ContactU>()
                .Property(e => e.PhoneNumber)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Coupon>()
                .Property(e => e.CouponName)
                .IsUnicode(false);

            modelBuilder.Entity<Coupon>()
                .Property(e => e.Discount)
                .HasPrecision(10, 2);

            modelBuilder.Entity<Coupon>()
                .HasMany(e => e.CouponMemberRels)
                .WithRequired(e => e.Coupon)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Discount>()
                .HasMany(e => e.DiscountDetails)
                .WithRequired(e => e.Discount)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Function>()
                .HasMany(e => e.FunctionInRoles)
                .WithRequired(e => e.Function)
                .HasForeignKey(e => e.FunctionsId)
                .WillCascadeOnDelete(false);

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
                .HasMany(e => e.CouponMemberRels)
                .WithRequired(e => e.Member)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Member>()
                .HasMany(e => e.MemberCarts)
                .WithRequired(e => e.Member)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Member>()
                .HasMany(e => e.Orders)
                .WithRequired(e => e.Member)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.Discounts)
                .WithRequired(e => e.Order)
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

            modelBuilder.Entity<Role>()
                .HasMany(e => e.FunctionInRoles)
                .WithRequired(e => e.Role)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.RoleEmployees)
                .WithRequired(e => e.Role)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<RuleBas>()
                .HasMany(e => e.Tags)
                .WithRequired(e => e.RuleBas)
                .HasForeignKey(e => e.RuleBasesId)
                .WillCascadeOnDelete(false);
        }
    }
}
