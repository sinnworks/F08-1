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

        [Required]
        public string Name { get; set; }
        public HttpPostedFileBase File { get; set; }

        public string FileName { get; set; }
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