using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MiniProject.Models;

namespace MiniProject.DAL
{
    public class Initializer : System.Data.Entity.DropCreateDatabaseIfModelChanges<Context>
    {

        protected override void Seed(Context context)
        {
            var uploads = new List<Upload>
            {
            new Upload{Message="12345678910123456789101",FileName="abc",CreateDate=DateTime.Parse("2017-05-01")}
            };

            uploads.ForEach(s => context.Uploads.Add(s));
            context.SaveChanges();
           
        }
    }
}