using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Web;
using MiniProject.Models;

namespace MiniProject.DAL
{
    public class Context : DbContext
    {
        public Context() : base("MiniProjContext")
        {
        }

        public DbSet<Upload> Uploads { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}