using F08_1.Models.EFModels;
using F08_1.Models.Infra;
using F08_1.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.WebSockets;

namespace BookStore.Site.Controllers
{
    public class MembersController : Controller
    {
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Register()
        {
            var list = new List<SelectListItem>
            {
                new SelectListItem { Value = "0", Text = "female" },
                new SelectListItem { Value = "1",Text = "male"},
                new SelectListItem { Value = "2",Text = "Other"}
            };
            ViewData["GenderList"] = new SelectList(list,"Value","Text",null);

            return View();
        }

        [HttpPost]
        public ActionResult Register(RegisterVm vm)
        {
            if (!ModelState.IsValid) //沒有通過驗證
            {
                return View(vm);
            }
            try
            {
                RegisterMember(vm);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(vm);
            }

            return View("RegisterConfirm");
        }

        // 將isConfirmed設為true
        // 9f5eac08c2f6437b8aa30df878e58935
        public ActionResult ActiveRegister(int memberId, string confirmCode)
        {
            if (memberId <= 0 || string.IsNullOrEmpty(confirmCode))
            {
                return View();
            }

            var db = new AppDbContext();

            // 根據 memberId, confirmCode 取得 Member
            var member = db.Members.FirstOrDefault(p => p.Id == memberId && p.ConfirmCode == confirmCode && p.IsConfirmed == false);
            if (member == null)
            {
                return View();
            }

            // 將它更新為已確認
            member.IsConfirmed = true;
            member.ConfirmCode = null;
            db.SaveChanges();

            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginVm vm)
        {
            if (!ModelState.IsValid)
            {
                return View(vm);
            }

            try
            {
                ValidLogin(vm);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(vm);
            }

            var processResult = ProcessLogin(vm);

            Response.Cookies.Add(processResult.Cookie);

            return Redirect(processResult.ReturnUrl);
        }
        

        public ActionResult Logout()
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            return Redirect("/Members/Login");
        }

        [Authorize]
        public ActionResult EditProfile()
        {
            var currentUserAccount = User.Identity.Name;
            var vm = GetMemberProfile(currentUserAccount);

            return View(vm);
        }

        [Authorize]
        [HttpPost]
        public ActionResult EditProfile(EditProfileVm vm)
        {
            var currentUserAccount = User.Identity.Name;
            if (!ModelState.IsValid)
            {
                return View(vm);
            }
            try
            {
                UpdateProfile(vm, currentUserAccount);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(vm);
            }

            return RedirectToAction("Index"); // 回到會員中心頁
        }

        [Authorize]
        public ActionResult EditPassword()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult EditPassword(EditPasswordVm vm)
        {
            if (!ModelState.IsValid)
            {
                return View(vm);
            }
            try
            {
                var currentAccount = User.Identity.Name;
                ChangePassword(vm, currentAccount);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(vm);
            }

            return RedirectToAction("Index");
        }


        public ActionResult ForgetPassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ForgetPassword(ForgotPasswordVm vm)
        {
            if (!ModelState.IsValid) return View(vm);

            var urlTemplate = Request.Url.Scheme + "://" +  // 生成 http:.// 或 https://
                              Request.Url.Authority + "/" + // 生成網域名稱或 ip
                              "Members/ResetPassword?memberid={0}&confirmCode={1}"; // 生成網頁 url

            try
            {
                ProcessResetPassword(vm.Account, vm.Email, urlTemplate);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(vm);
            }

            return View("ForgetPasswordConfirm");

        }

        public ActionResult ResetPassword(int memberId, string confirmCode)
        {
            return View();
        }

        [HttpPost]
        public ActionResult ResetPassword(int memberId, string confirmCode, ResetPasswordVM vm)
        {
            // 檢查 vm 是否通過驗證
            if (!ModelState.IsValid) return View(vm);

            try
            {
                ProcessResetPassword(memberId, confirmCode, vm);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View(vm);

            }

            // 顯示重設密碼成功畫面
            return View("ConfirmResetPassword");
        }

        /// <summary>
        /// 基於安全考量, 若 memberId, confirmCode有錯, 都不會顯示錯誤訊息, 只會顯示重設密碼畫面
        /// </summary>
        /// <param name="memberId"></param>
        /// <param name="confirmCode"></param>
        /// <param name="vm"></param>
        private void ProcessResetPassword(int memberId, string confirmCode, ResetPasswordVM vm)
        {
            var db = new AppDbContext();

            // 檢查 memberId, confirmCode 是否正確
            var memberInDb = db.Members.FirstOrDefault(m => m.Id == memberId &&
                                                        m.IsConfirmed == true &&
                                                        m.ConfirmCode == confirmCode);
            if (memberInDb == null) return; // 不動聲色的離開

            // 重設密碼
            var salt = HashUtility.GetSalt();
            var hashedPassword = HashUtility.ToSHA256(vm.Password, salt);
            memberInDb.EncryptedPassword = hashedPassword;
            memberInDb.ConfirmCode = null;
            db.SaveChanges();
        }

        private void ProcessResetPassword(string account, string email, string urlTemplate)
        {
            var db = new AppDbContext();
            // 檢查account,email正確性
            var memberInDb = db.Members.FirstOrDefault(m => m.Account == account);
            if (memberInDb == null)
            {
                throw new Exception("帳號不存在");
            }

            if (string.Compare(email, memberInDb.Email, StringComparison.CurrentCultureIgnoreCase) != 0)
            {
                throw new Exception("帳號或 Email 錯誤");
            }

            // 檢查 IsConfirmed必需是true, 因為只有已啟用的帳號才能重設密碼
            if (memberInDb.IsConfirmed == false)
            {
                throw new Exception("您還沒有啟用本帳號, 請先完成才能重設密碼");
            }

            // 更新記錄, 填入 confirmCode
            var confirmCode = Guid.NewGuid().ToString("N");
            memberInDb.ConfirmCode = confirmCode;
            db.SaveChanges();

            // 發送重設密碼信
            var url = string.Format(urlTemplate, memberInDb.Id, confirmCode);

            //new EmailHelper().SendForgetPasswordEmail(url, memberInDb.Name, email);

        }

        private void ChangePassword(EditPasswordVm vm, string account)
        {
            var db = new AppDbContext();
            var memberInDb = db.Members.FirstOrDefault(p => p.Account == account);
            if (memberInDb == null)
            {
                throw new Exception("帳號不存在");
            }

            var salt = HashUtility.GetSalt();

            // 判斷輸入的原始密碼是否正確
            var hashedOrigPassword = HashUtility.ToSHA256(vm.OriginalPassword, salt);
            if (string.Compare(memberInDb.EncryptedPassword, hashedOrigPassword, true) != 0)
            {
                throw new Exception("原始密碼不正確");
            }

            // 將新密碼雜湊
            var hashedPassword = HashUtility.ToSHA256(vm.Password, salt);

            // 更新記錄
            memberInDb.EncryptedPassword = hashedPassword;
            db.SaveChanges();
        }

        private void UpdateProfile(EditProfileVm vm, string account)
        {
            // 利用 vm.Id去資料庫取得 Member
            var db = new AppDbContext();
            var memberInDb = db.Members.FirstOrDefault(p => p.Id == vm.Id);

            // 如果這筆記錄與目前使用者不符, 就拒絕
            if (memberInDb.Account != account)
            {
                throw new Exception("您沒有權限修改別人的資料");
            }

            memberInDb.Name = vm.Name;
            memberInDb.Email = vm.Email;
            memberInDb.PhoneNumber = vm.PhoneNumber;

            db.SaveChanges();
        }

        private EditProfileVm GetMemberProfile(string account)
        {
            var db = new AppDbContext();

            var member = db.Members.FirstOrDefault(p => p.Account == account);
            if (member == null)
            {
                throw new Exception("帳號不存在");
            }

            var vm = member.ToEditProfileVm();

            return vm;
        }

        private void ValidLogin(LoginVm vm)
        {
            var db = new AppDbContext();

            // 根據帳號取得 Member
            var member = db.Members.FirstOrDefault(p => p.Account == vm.Account);
            if (member == null)
            {
                throw new Exception("帳號或密碼有誤");// 原則上, 不要告知細節
            }

            // 檢查是否已經確認
            if (member.IsConfirmed == false)
            {
                throw new Exception("您尚未開通會員資格, 請先收確認信, 並點選信裡的連結, 完成認證, 才能登入本網站");
            }

            // 將vm裡的密碼先雜湊之後,再與db裡的密碼比對
            var salt = HashUtility.GetSalt();
            var hashedPassword = HashUtility.ToSHA256(vm.Password, salt);
            var encryptedPass = member.EncryptedPassword.Trim(); //因為一開始資料類型設定MAX，現在改為(70)，會出現空白，所以要把空白刪掉

            if (string.Compare(hashedPassword,encryptedPass, true) != 0)
            {
                throw new Exception("帳號或密碼有誤");
            }

        }

        private (string ReturnUrl, HttpCookie Cookie) ProcessLogin(LoginVm vm)
        {
            var rememberMe = false; // 如果LoginVm有RememberMe屬性, 記得要設定
            var account = vm.Account;
            var roles = string.Empty; // 在本範例, 沒有用到角色權限,所以存入空白

            // 建立一張認證票
            var ticket =
                new FormsAuthenticationTicket(
                    1,          // 版本別, 沒特別用處
                    account,
                    DateTime.Now,   // 發行日
                    DateTime.Now.AddDays(2), // 到期日
                    rememberMe,     // 是否續存
                    roles,          // userdata
                    "/" // cookie位置
                );

            // 將它加密
            var value = FormsAuthentication.Encrypt(ticket);

            // 存入cookie
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, value);

            // 取得return url
            var url = FormsAuthentication.GetRedirectUrl(account, true); //第二個引數沒有用處

            return (url, cookie);

        }
        
        private void RegisterMember(RegisterVm vm)
        {
            var db = new AppDbContext();

            // 判斷帳號是否已經存在
            var memberInDb = db.Members.FirstOrDefault(p => p.Account == vm.Account);
            if (memberInDb != null)
            {
                throw new Exception("帳號已經存在");
            }

            //將 vm 轉成 Member
            var member = vm.ToEFModel();

            // 叫用 EF 寫入資料庫
            db.Members.Add(member); 
            db.SaveChanges();


            // todo 發出確認信
        }


    }
}