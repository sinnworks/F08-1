using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using F08_1.Models.ViewModels;
using UploadFile.Site.Controllers;

namespace F08_1.Controllers
{
    public class IndexController : Controller
    {
        // GET: Index
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        public ActionResult Cart()
        {
            return View();
        }

        public ActionResult Categories()
        {
            return View();
        }

        public ActionResult Products()
        {
            return View();
        }

        public ActionResult ContactUs()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ContactUs(ContactUsVm model)
        {
            #region save file
            var validator = new FileExtensionValidator(model.File, ".jpg", ".jpeg", ".png");

            if (!validator.IsValid())
            {
                ModelState.AddModelError(nameof(model.File), "上傳的副檔名不符規定, 只能上傳 .jpg, .jpeg, .png");
            }
            else
            {
                // save uploaded file
                if (model.File.IsNotNull())
                {

                    string path = Server.MapPath("/Uploads");
                    string fileName = System.IO.Path.GetFileName(model.File.FileName);
                    string fullPath = System.IO.Path.Combine(path, fileName);
                    try
                    {
                        model.File.SaveAs(fullPath);
                        model.FileName = fileName;

                        //return View();
                    }
                    catch (Exception ex)
                    {
                        ModelState.AddModelError(string.Empty, "上傳檔案失敗: " + ex.Message);

                    }
                }
            }
            #endregion
            if (ModelState.IsValid)
            {
                // todo create record
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View(model);
            }
        }
    }
}