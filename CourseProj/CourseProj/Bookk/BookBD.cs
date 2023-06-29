using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace CourseProj.Bookk
{
    internal class BookBD
    {
       // public decimal ID_BOOK { get; set; }
        public string BOOK_NAME { get; set; }

        public string AuthorsString { get; set; }
        public List<string> Authors { get; set; }
        public string GenresString { get; set; }
        public List<string> Genres { get; set; }

        public string PublisherHouseString { get; set; }
        public List<string> PublisherHouse { get; set; }


        public decimal? PAGE_NUMBER { get; set; }
        public string ISBN { get; set; }
        public string BOOKBINSINGTYPE { get; set; }
        public decimal? YEAR_OF_PUBLICATION { get; set; }
        public string LANGUAGE { get; set; }
        public string DESCRIPTION { get; set; }
        public string BOOK_IMAGESOURCE { get; set; }
        public decimal? NUMBERSOFBOOKS { get; set; }
        public decimal? BOOKPRICE { get; set; }
    }
}
