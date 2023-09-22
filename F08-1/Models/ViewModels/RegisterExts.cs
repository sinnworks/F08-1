using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using F08_1.Models.EFModels;
using F08_1.Models.Infra;

namespace F08_1.Models.ViewModels
{
    public static class RegisterExts
    {
        public static Member ToEFModel(this RegisterVm vm)
        {
            var salt = HashUtility.GetSalt();
            var hashEncryptedPassword = HashUtility.ToSHA256(vm.EncryptedPassword, salt);
            var confirmCode = Guid.NewGuid().ToString("N");

            return new Member
            {
                Id = vm.Id,
                Gender = vm.Gender,
                Account = vm.Account,
                EncryptedPassword = hashEncryptedPassword,
                Email = vm.Email,
                Name = vm.Name,
                PhoneNumber = vm.PhoneNumber,                
                Address = vm.Address,
                IsConfirmed = false,
                ConfirmCode = confirmCode
            };
        }
    }
}