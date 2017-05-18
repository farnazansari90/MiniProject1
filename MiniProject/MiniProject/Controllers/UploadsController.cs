using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MiniProject.DAL;
using MiniProject.Models;

namespace MiniProject.Controllers
{
    public class UploadsController : Controller
    {
        private Context db = new Context();

        // GET: Uploads
        public ActionResult Index()
        {
            return View(db.Uploads.ToList());
        }

        // GET: Uploads/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Upload upload = db.Uploads.Find(id);
            if (upload == null)
            {
                return HttpNotFound();
            }
            return View(upload);
        }

        // GET: Uploads/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Uploads/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Upload upload)
        {
            if (ModelState.IsValid)
            {
                var checkMsg = CheckTodayMessage(upload.Message);
                if (checkMsg == null)
                {
                    var extension = Path.GetExtension(upload.UploadedFile.FileName);
                    if (extension == ".xlsx" || extension == ".csv")
                    {
                        if (upload.UploadedFile != null)
                        {
                            string _FileName = Path.GetFileName(upload.UploadedFile.FileName);
                            string _path = @"~\UploadedFiles\" + _FileName;
                            upload.UploadedFile.SaveAs(Server.MapPath(_path));

                            upload.FileName = _FileName;
                            upload.FileUrl = _path;
                        }
                        upload.CreateDate = DateTime.Now;
                        db.Uploads.Add(upload);
                        db.SaveChanges();
                        ViewBag.Message = "File Uploaded Successfully!";
                        ViewBag.SubmittedMsg = upload.Message;
                        //return RedirectToAction("Index");
                        return View();
                    }
                    ViewBag.ExtensionMessage = "File Uploaded should be Excel or CSV only!";
                    return View(upload);
                }
                ViewBag.CheckTodayMessage = "You are not allowed to submit the same message 2 times in one day.";
                return View(upload);

            }

            return View(upload);
        }

        public Upload CheckTodayMessage(string msg)
        {
            var now = DateTime.Now;
            var yesterday = now.AddHours(-24);
            var query = from table in db.Uploads
                         where table.Message == msg && table.CreateDate > yesterday && table.CreateDate <= now
                        select table;

            return query.FirstOrDefault();
        }

        // GET: Uploads/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Upload upload = db.Uploads.Find(id);
            if (upload == null)
            {
                return HttpNotFound();
            }
            return View(upload);
        }

        // POST: Uploads/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Message,FileName,FileUrl,CreateDate")] Upload upload)
        {
            if (ModelState.IsValid)
            {
                db.Entry(upload).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(upload);
        }

        // GET: Uploads/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Upload upload = db.Uploads.Find(id);
            if (upload == null)
            {
                return HttpNotFound();
            }
            return View(upload);
        }

        // POST: Uploads/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Upload upload = db.Uploads.Find(id);
            db.Uploads.Remove(upload);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
