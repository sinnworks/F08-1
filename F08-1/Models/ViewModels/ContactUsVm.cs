using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace F08_1.Models.ViewModels
{
    public class ContactUsVm
    {
        public int Id { get; set; }

        [Display(Name = "姓名")]
        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [Display(Name = "性別")]
        [Required]
        [StringLength(10)]
        public string Gender { get; set; }

        [Display(Name = "留言內容")]
        [Required]
        [StringLength(1000)]
        public string Suggestion { get; set; }

        public byte[] Image { get; set; }

        [Display(Name = "手機號碼")]
        [Required]
        [StringLength(10)]
        public string PhoneNumber { get; set; }

        [Display(Name = "上傳檔案")]
        [Required]
        public HttpPostedFileBase File { get; set; }
    }

    public class P010A02VM
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        // 上傳的原始檔案
        public string OriginalFileName { get; set; }

        public string FileName { get; set; }
    }
}