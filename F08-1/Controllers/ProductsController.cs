using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using F08_1.Models.EFModels;
using F08_1.Models.ViewModels;

namespace F08_1.Controllers
{
    public class ProductsController : Controller
    {
        // GET: Products
        public ActionResult Index()
        {
            List<ProductIndexVm> vms = GetProducts();
            return View(vms);
        }

        private List<ProductIndexVm> GetProducts()
        {
            var db = new AppDbContext();
            var products = db.Products.AsNoTracking()
                            .Include("Category")
                            .Select(p => new ProductIndexVm
                            {
                                Id = p.Id,
                                Name = p.Name,
                                CategoryName = p.Category.Name,
                                UnitPrice = p.UnitPrice
                            })
                            .ToList();

            return products;
        }
    }
}