using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace F08_1.Models.EFModels
{
    public class ContactUs
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Id { get; set; }

        [Display(Name = "收件人")]
        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [Required]
        [StringLength(10)]
        public string Gender { get; set; }

        [Required]
        public string Suggestion { get; set; }

        public byte[] Image { get; set; }

        [Required]
        [StringLength(10)]
        public string PhoneNumber { get; set; }

        public HttpPostedFileBase File { get; set; }
    }
}