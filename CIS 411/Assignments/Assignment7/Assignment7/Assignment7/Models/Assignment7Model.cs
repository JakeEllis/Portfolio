using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Assignment7.Models
{
    public class Assignment7Model
    {
        [Required]
        public string Url { get; set; }
    }
}