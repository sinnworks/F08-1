using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace F08_1.Models.ViewModels
{
    public class RegisterVm
    {
        public int Id { get; set; } 

        [Display(Name ="姓名")]
        [Required]
        [StringLength(30)]
        public string Name { get; set; }

        [Display(Name = "性別")]
        [Required]        
        public int Gender { get; set; }

        [Display(Name = "出生日期")]
        [Required]
        public DateTime BirthDate { get; set; }

        [Display(Name = "Email")]
        [Required]
        [StringLength(100)]
        public string Email { get; set; }

        [Display(Name = "手機號碼")]
        [Required]
        [StringLength(10)]
        public string PhoneNumber { get; set; }

        [Display(Name ="帳號")]
        [Required]
        [StringLength(30)]
        public string Account { get; set; }

        [Display(Name ="密碼")]
        [Required]
        [StringLength(30)]
        public string Password { get; set; }

        [Display(Name ="確認密碼")]
        [Required]
        [StringLength (30)]
        [Compare(nameof(Password))]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }

        [Display(Name = "城市")]
        [Required]
        [StringLength(100)]
        public string City { get; set; }

        [Display(Name = "區域")]
        [Required]
        [StringLength(100)]
        public string District { get; set; }

        [Display(Name = "地址")]
        [Required]
        [StringLength(100)]
        public string Address { get; set; }



    }
}