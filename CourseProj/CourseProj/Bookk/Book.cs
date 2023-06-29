using System;
using System.ComponentModel;
using System.Windows;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using Microsoft.Win32;


namespace CourseProj
{
    public class Book : INotifyPropertyChanged
    {
        private string title;
        private string autor;
        private string genre;//
        private int pages;
        private string isbn;
        private string bindingtype;
        private int year_of_publication;
        private string publishingHouse;//??
        private string language;
        private string description;  
        public ImageSource imgPath { get; set; }
        private int number_of_books;
        private int cost; 

        public string Title
        {
            get { return title; }
            set
            {
                if (title == value)
                    return;
                title = value;
                OnPropertyChanged("Title");
            }
        }
        public string Autor
        {
            get { return autor; }
            set
            {
                if (autor == value)
                    return;
                autor = value;
                OnPropertyChanged("Autor");
            }
        }
        public string Genre
        {
            get { return genre; }
            set
            {
                if (genre == value)
                    return;
                genre = value;
                OnPropertyChanged("Genre");
            }
        }
        
        public int Pages
        {
            get { return pages; }
            set
            {
                if (pages == value)
                    return;
                pages = value;
                OnPropertyChanged("pages");
            }
        }

        public string ISBN
        {
            get { return isbn; }
            set
            {
                if (isbn == value)
                    return;
                isbn = value;
                OnPropertyChanged("ISBN");
            }
        }

        public string Bindingtype
        {
            get { return bindingtype; }
            set
            {
                if (bindingtype == value)
                    return;
                bindingtype = value;
                OnPropertyChanged("Bindingtype");
            }
        }

        public int Year_of_publication
        {
            get { return year_of_publication; }
            set
            {
                if (year_of_publication == value)
                    return;
                year_of_publication = value;
                OnPropertyChanged("Year_of_publication");
            }
        }

        public string PublishingHouse
        {
            get { return publishingHouse; }
            set
            {
                if (publishingHouse == value)
                    return;
                publishingHouse = value;
                OnPropertyChanged("PublishingHouse");
            }
        }

        public string Language
        {
            get { return language; }
            set
            {
                if (language == value)
                    return;
                language = value;
                OnPropertyChanged("Language");
            }
        }

        public string Description
        {
            get { return description; }
            set
            {
                if (description == value)
                    return;
                description = value;
                OnPropertyChanged("Description");
            }
        }

        public int Number_of_books
        {
            get { return number_of_books; }
            set
            {
                if (number_of_books == value)
                    return;
                number_of_books = value;
                OnPropertyChanged("Number_of_books");
            }
        }


        public int Cost
                {
                    get { return cost; }
                    set
                    {
                        if (cost == value)
                            return;
                        cost = value;
                        OnPropertyChanged("Cost");
                    }
                }


        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}