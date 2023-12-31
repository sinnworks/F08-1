﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using F08_1.Models.Infra;

namespace F08_1.Models.ViewModels
{
    public class ResetPasswordVM
    {
        [Display(Name = "新密碼")]
        [Required(ErrorMessage = DAHelper.Required)]
        [StringLength(1000, ErrorMessage = DAHelper.StringLength)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Display(Name = "確認密碼")]
        [Required(ErrorMessage = DAHelper.Required)]
        [StringLength(70, ErrorMessage = DAHelper.StringLength)]
        [Compare(nameof(Password), ErrorMessage = DAHelper.Compare)]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }
    }
}