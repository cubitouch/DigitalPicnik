using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DigitalPicnik.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Digital Picnik";
            return View();
        }

        [HttpGet]
        public ActionResult New()
        {
            ViewBag.Title = "Créer une nouvelle liste";
            ViewBag.ActionLabel = "Créer";
            return View();
        }
        [HttpPost]
        public ActionResult New(Guid id, string title, string description)
        {
            List picnik;
            if (id == new Guid())
            {
                // create new picnik list
                picnik = new List();
            }
            else
            {
                // update picnik
                picnik = List.LoadById(id);
            }

            picnik.Title = title;
            picnik.Description = description;
            if (picnik.Save())
            {
                // redirect
                return RedirectToAction("Edit", new { id = picnik.Id });
            }
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult EditInfo(Guid id)
        {
            ViewBag.Title = "Modifier votre liste";
            ViewBag.ActionLabel = "Modifier";
            return View("New", List.LoadById(id));
        }

        [HttpGet]
        public ActionResult Edit(Guid id)
        {
            List picnik = List.LoadById(id);
            ViewBag.Title = picnik.Title;
            return View(picnik);
        }

        [HttpPost]
        public JsonResult AddLine(Guid id)
        {
            List picnik = List.LoadById(id);
            Item item = new Item();
            item.ListId = id;
            item.Save();

            return Json(picnik.Items);
        }
        [HttpPost]
        public JsonResult UpdateLine(Guid id, string name, string label)
        {
            Item item = Item.LoadById(id);
            item.Name = name;
            item.Label = label;
            item.Save();

            return Json(item.List.Items);
        }
        [HttpPost]
        public JsonResult DeleteLine(Guid id)
        {
            Item item = Item.LoadById(id);
            List picnik = item.List;
            picnik.Items.Remove(item);
            item.Delete();
            return Json(picnik.Items);
        }
    }
}