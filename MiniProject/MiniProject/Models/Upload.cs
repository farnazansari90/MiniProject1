using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace MiniProject.Models
{
    public class Upload
    {
        public int ID { get; set; }

        [StringLength(160, MinimumLength = 20, ErrorMessage = "Message cannot be longer than 160 characters and less than 20 characters")]
        [RegularExpression("^([a-zA-Z0-9 .'-,]+)$", ErrorMessage = "Invalid character")]
        public string Message { get; set; }

        [NotMapped]
        public HttpPostedFileBase UploadedFile { get; set; }

        [StringLength(100)]
        public string FileName { get; set; }

        [MaxLength(1000)]
        public string FileUrl { get; set; }

        public DateTime CreateDate { get; set; }
    }
}