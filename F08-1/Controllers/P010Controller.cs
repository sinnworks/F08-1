using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using F08_1.Infrastructures;
using F08_1.Models.ViewModels;

namespace F08_1.Controllers
{
    public class P010Controller : Controller
    {
        // GET: ContactUs
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult A02(P010A02VM model, HttpPostedFileBase file)
        {
            // save uploaded file
            string path = Server.MapPath("/Uploads");
            var helper = new UploadFileHelper();

            try
            {
                string result = helper.SaveAs(path, file);
                model.OriginalFileName = System.IO.Path.GetFileName(file.FileName);
                model.FileName = result;

                Create(model);

                return RedirectToAction("Index", "Home");
            }
            catch (UploadFileNullException uploadFileNullex)
            {
                model.OriginalFileName = string.Empty;
                model.FileName = string.Empty;
                Create(model);

                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError(string.Empty, "上傳檔案失敗: " + ex.Message);

            }

            return RedirectToAction("Index", "Home");
        }

        private void Create(P010A02VM model)
        {
            // todo 將記錄存檔
        }
    }
}