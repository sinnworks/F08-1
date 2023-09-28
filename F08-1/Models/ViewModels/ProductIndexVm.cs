using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace F08_1.Models.ViewModels
{
    public class ProductIndexVm
    {
        public int Id { get; set; }

        [Display(Name = "名稱")]
        public string Name { get; set; }

        [Display(Name = "分類名稱")]
        public string CategoryName { get; set; }

        [Display(Name = "價格")]
        public int UnitPrice { get; set; }

    }
}