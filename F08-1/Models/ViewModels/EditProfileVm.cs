using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using F08_1.Models.EFModels;

namespace F08_1.Models.ViewModels
{
    public class EditProfileVm
    {
        public int Id { get; set; }

        [Required]
        [StringLength(30)]
        public string Account { get; set; }

        [Required]
        [StringLength(1000)]
        public string EncryptedPassword { get; set; }

        [Required]
        [StringLength(256)]
        public string Email { get; set; }

        [Required]
        [StringLength(30)]
        public string Name { get; set; }

        [StringLength(10)]
        public string PhoneNumber { get; set; }

        public bool? IsConfirmed { get; set; }

        [StringLength(1000)]
        public string ConfirmCode { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}