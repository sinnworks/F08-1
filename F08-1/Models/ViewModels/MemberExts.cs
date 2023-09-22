using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using F08_1.Models.EFModels;

namespace F08_1.Models.ViewModels
{
    public static class MemberExts
    {
        public static EditProfileVm ToEditProfileVm(this Member member)
        {
            return new EditProfileVm
            {
                Id = member.Id,
                Email = member.Email,
                Name = member.Name,
                PhoneNumber = member.PhoneNumber,
                //Account = member.Account,
                //EncryptedPassword = member.EncryptedPassword,
                //Gender = member.Gender,
                //BirthDate = member.BirthDate,
                //Address = member.Address


            };
        }
    }
}