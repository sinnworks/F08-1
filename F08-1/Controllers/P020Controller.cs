using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using F08_1.Models.ViewModels;

namespace UploadFile.Site.Controllers
{
    public class P020Controller : Controller
    {
        // GET: P020
        public ActionResult A01()
        {
            return View();
        }

        // 檢查, 上傳檔案必填
        [HttpPost]
        public ActionResult A01(ContactUsVm model)
        {
            #region save file
            var validator = new RequiredValidator(model.File);
            if (!validator.IsValid())
            {
                ModelState.AddModelError(nameof(model.File), "必填");
            }
            else
            {
                // save uploaded file
                string path = Server.MapPath("/Uploads");
                string fileName = System.IO.Path.GetFileName(model.File.FileName);
                string fullPath = System.IO.Path.Combine(path, fileName);
                try
                {
                    model.File.SaveAs(fullPath);
                    model.FileName = fileName;

                    return View();
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError(string.Empty, "上傳檔案失敗: " + ex.Message);

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


        public ActionResult A02()
        {
            return View();
        }

        // 檢查, 副檔名是否在允許範圍
        [HttpPost]
        public ActionResult A02(ContactUsVm model)
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

        public ActionResult A03()
        {
            return View();
        }

        // 檢查, 副檔名是否在允許範圍
        [HttpPost]
        public ActionResult A03(ContactUsVm model)
        {
            #region save file
            var validator = new FileSizeValidator(model.File, 200);

            if (!validator.IsValid())
            {
                ModelState.AddModelError(nameof(model.File), "上傳的檔案不能超過 200 KB");
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
    public abstract class BaseFileValidator
    {
        protected HttpPostedFileBase file;
        protected bool HasFile
        {
            get
            {
                return file != null && file.FileName.IsNotNull() && file.ContentLength > 0;
            }
        }
        public abstract bool IsValid();
    }

    public class FileSizeValidator : BaseFileValidator
    {
        private int maxBytes;

        public FileSizeValidator(HttpPostedFileBase file, int maxKB)
        {
            this.file = file;

            if (maxKB <= 0) throw new ArgumentOutOfRangeException(nameof(maxKB));

            this.maxBytes = maxKB * 1024;
        }

        public override bool IsValid()
        {
            if (!HasFile) return true; // 若沒上傳檔案, 一律不檢查, 傳回true
            return this.file.ContentLength <= maxBytes;
        }
    }

    public class FileExtensionValidator : BaseFileValidator
    {
        private string[] extensions;
        public FileExtensionValidator(HttpPostedFileBase file, params string[] extensions)
        {
            this.file = file;
            if (extensions == null) throw new ArgumentNullException(nameof(extensions));

            this.extensions = extensions.Select(x => x.ToLower()).ToArray();
        }

        public override bool IsValid()
        {
            if (!HasFile) return true; // 若沒上傳檔案, 一律不檢查, 傳回true
            string ext = System.IO.Path.GetExtension(this.file.FileName).ToLower(); // .jpg
            return this.extensions.Contains(ext);
        }
    }

    public class RequiredValidator
    {
        HttpPostedFileBase file;

        public RequiredValidator(HttpPostedFileBase file)
        {
            this.file = file;
        }

        public bool IsValid()
        {
            return this.file != null && this.file.ContentLength > 0 && this.file.FileName.IsNotNull();
        }
    }

    public static class stringExts
    {
        public static bool IsNotNull(this string source)
            => !string.IsNullOrWhiteSpace(source);
    }
    public static class FileExts
    {
        public static bool IsNotNull(this HttpPostedFileBase source)
        {
            return source != null && source.FileName.IsNotNull() && source.ContentLength > 0;
        }
    }
}