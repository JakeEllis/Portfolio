using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;

namespace Assignment_6.Models
{
    public class Articles
    {
        public int Id { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Article { get; set; }

        public string Category { get; set; }

        [Required]
        public string Author { get; set; }

        [Required]
        public DateTime Date { get; set; }

        public class ArticleDBContext : DbContext
        {
            public DbSet<Articles> Articles { get; set; }
        }



    }
}