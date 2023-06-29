using CourseProj ;
using CourseProj.Bookk;
using CourseProj.Services;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Collections.ObjectModel;
using System.Threading;
using System.Data.Entity.Core.Objects;

namespace CourseProj
{
    /// <summary>
    /// Логика взаимодействия для MainWindovNoLog.xaml
    /// </summary>
    public partial class MainWindovNoLog : Window
    {

        private static string PathForDate = $"{Environment.CurrentDirectory}\\alldata3.json";
        // public FileIOService _fileOIService = new FileIOService(PathForDate);

        BindingList<BookBD> books = new BindingList<BookBD>();
        BindingList<BookBD> booksForSearch = new BindingList<BookBD>();

        Cursor Geom, Pix, Pony;

        public MainWindovNoLog()
        {
            InitializeComponent();

            string cursorDir = Directory.GetParent(Environment.CurrentDirectory).Parent.FullName + "\\MyCursors";
            Geom = new Cursor($"{cursorDir}\\curs1.ani");
            Pix = new Cursor($"{cursorDir}\\curs2.cur");
            Pony = new Cursor($"{cursorDir}\\curs3.ani");

            using (Entities ent = new Entities())
            {
                books.Clear();
                foreach (var item in ent.BOOKINF())
                {
                    var book = new BookBD()
                    {
                        BOOK_NAME = item.BOOK_NAME,
                        PAGE_NUMBER = item.PAGE_NUMBER,
                        ISBN = item.ISBN,
                        BOOKBINSINGTYPE = item.BOOKBINDINGTYPE,
                        YEAR_OF_PUBLICATION = item.YEAR_OF_PUBLICATION,
                        LANGUAGE = item.BOOK_LANGUAGE,
                        DESCRIPTION = item.BOOK_DESCRIPTION,
                        BOOK_IMAGESOURCE = item.BOOK_IMAGESOURCE,
                        NUMBERSOFBOOKS = item.NUMBERSOFBOOKS,
                        BOOKPRICE = item.BOOK_PRISE,
                        PublisherHouse = new List<string>(),
                        Authors = new List<string>(),
                        Genres = new List<string>()
                    };


                    // Получаем список книг для записи
                    var idBookParam = new OracleParameter("func_Book_ID", OracleDbType.Decimal);
                    idBookParam.Direction = ParameterDirection.Input;
                    idBookParam.Value = Convert.ToInt32(item.ID_BOOK);
                    var genres = ent.Database.SqlQuery<string>("BEGIN :result := GetALLGenresInf(:func_Book_ID); END;",
                        new OracleParameter("result", OracleDbType.RefCursor, ParameterDirection.Output),
                        idBookParam).ToList();
                    book.Genres.AddRange(genres);

                    var idBookParam2 = new OracleParameter("func_Book_ID", OracleDbType.Decimal);
                    idBookParam2.Direction = ParameterDirection.Input;
                    idBookParam2.Value = Convert.ToInt32(item.ID_BOOK);
                    var authors = ent.Database.SqlQuery<string>("BEGIN :result := GetALLAuthorsInf(:func_Book_ID); END;",
                        new OracleParameter("result", OracleDbType.RefCursor, ParameterDirection.Output),
                        idBookParam2).ToList();
                    book.Authors.AddRange(authors);

                    var idBookParam3 = new OracleParameter("func_Book_ID", OracleDbType.Decimal);
                    idBookParam3.Direction = ParameterDirection.Input;
                    idBookParam3.Value = Convert.ToInt32(item.ID_BOOK);
                    var publisherhouse = ent.Database.SqlQuery<string>("BEGIN :result := GetPublisherInf(:func_Book_ID); END;",
                        new OracleParameter("result", OracleDbType.RefCursor, ParameterDirection.Output),
                        idBookParam3).ToList();
                    book.PublisherHouse.AddRange(publisherhouse);

                    // Преобразуем списки песен и жанров в строки
                    book.GenresString = string.Join(", ", book.Genres);
                    book.AuthorsString = string.Join(", ", book.Authors);
                    book.PublisherHouseString = string.Join(", ", book.PublisherHouse);
                    // Добавляем объект book в список books
                    books.Add(book);


                }
                Books.ItemsSource = books;

            }
        }


        private void SearchBox_TextChanged( object sender, System.Windows.Controls.TextChangedEventArgs e )
        {
            using (Entities ent = new Entities())
            {
                if (SearchBox.Text == string.Empty)
                {
                    Books.ItemsSource = books;
                }
                else
                {
                    booksForSearch.Clear();
                    foreach (var item in ent.BOOKINF())
                    {
                        if (item.BOOK_NAME.ToLower().Contains(SearchBox.Text.ToLower()) )
                        {
                            var book = new BookBD()
                            {
                                BOOK_NAME = item.BOOK_NAME,
                                PAGE_NUMBER = item.PAGE_NUMBER,
                                ISBN = item.ISBN,
                                BOOKBINSINGTYPE = item.BOOKBINDINGTYPE,
                                YEAR_OF_PUBLICATION = item.YEAR_OF_PUBLICATION,
                                LANGUAGE = item.BOOK_LANGUAGE,
                                DESCRIPTION = item.BOOK_DESCRIPTION,
                                BOOK_IMAGESOURCE = item.BOOK_IMAGESOURCE,
                                NUMBERSOFBOOKS = item.NUMBERSOFBOOKS,
                                BOOKPRICE = item.BOOK_PRISE,
                                PublisherHouse = new List<string>(),
                                Authors = new List<string>(),
                                Genres = new List<string>()
                            };


                            // Получаем список книг для записи
                            var idBookParam = new OracleParameter("func_Book_ID", OracleDbType.Decimal);
                            idBookParam.Direction = ParameterDirection.Input;
                            idBookParam.Value = Convert.ToInt32(item.ID_BOOK);
                            var genres = ent.Database.SqlQuery<string>("BEGIN :result := GetALLGenresInf(:func_Book_ID); END;",
                                new OracleParameter("result", OracleDbType.RefCursor, ParameterDirection.Output),
                                idBookParam).ToList();
                            book.Genres.AddRange(genres);

                            var idBookParam2 = new OracleParameter("func_Book_ID", OracleDbType.Decimal);
                            idBookParam2.Direction = ParameterDirection.Input;
                            idBookParam2.Value = Convert.ToInt32(item.ID_BOOK);
                            var authors = ent.Database.SqlQuery<string>("BEGIN :result := GetALLAuthorsInf(:func_Book_ID); END;",
                                new OracleParameter("result", OracleDbType.RefCursor, ParameterDirection.Output),
                                idBookParam2).ToList();
                            book.Authors.AddRange(authors);

                            var idBookParam3 = new OracleParameter("func_Book_ID", OracleDbType.Decimal);
                            idBookParam3.Direction = ParameterDirection.Input;
                            idBookParam3.Value = Convert.ToInt32(item.ID_BOOK);
                            var publisherhouse = ent.Database.SqlQuery<string>("BEGIN :result := GetPublisherInf(:func_Book_ID); END;",
                                new OracleParameter("result", OracleDbType.RefCursor, ParameterDirection.Output),
                                idBookParam3).ToList();
                            book.PublisherHouse.AddRange(publisherhouse);

                            // Преобразуем списки песен и жанров в строки
                            book.GenresString = string.Join(", ", book.Genres);
                            book.AuthorsString = string.Join(", ", book.Authors);
                            book.PublisherHouseString = string.Join(", ", book.PublisherHouse);
                            // Добавляем объект book в список books
                           
                            booksForSearch.Add(book);

                         }
                    }
                    Books.ItemsSource = booksForSearch;
                }

            }
        }



            private void Light_Selected( object sender, RoutedEventArgs e )
        {
            var uri = new Uri("Resources/Light_mode.xaml", UriKind.Relative);                           // определяем путь к файлу ресурсов
            ResourceDictionary resourseDict = Application.LoadComponent(uri) as ResourceDictionary;     // загружаем словарь ресурсов
            Application.Current.Resources.Clear();                                                      // очищаем коллекцию ресурсов приложения
            Application.Current.Resources.MergedDictionaries.Add(resourseDict);                         // добавляем загруженный словарь ресурсов
        }

        private void Dark_Selected( object sender, RoutedEventArgs e )
        {
            var uri = new Uri("Resources/DarkTheme.xaml", UriKind.Relative);
            ResourceDictionary resourseDict = Application.LoadComponent(uri) as ResourceDictionary;
            Application.Current.Resources.Clear();
            Application.Current.Resources.MergedDictionaries.Add(resourseDict);
        }

        private void Green_Selected( object sender, RoutedEventArgs e )
        {
            var uri = new Uri("Resources/GreenTheme.xaml", UriKind.Relative);
            ResourceDictionary resourseDict = Application.LoadComponent(uri) as ResourceDictionary;
            Application.Current.Resources.Clear();
            Application.Current.Resources.MergedDictionaries.Add(resourseDict);
        }


        //private void BookList_ListChanged1( object sender, ListChangedEventArgs e )
        //{
        //    if (e.ListChangedType == ListChangedType.ItemAdded || e.ListChangedType == ListChangedType.ItemDeleted || e.ListChangedType == ListChangedType.ItemChanged)
        //    {
        //        try
        //        {
        //            _fileOIService.SaveData(sender);
        //        }
        //        catch (Exception ex)
        //        {
        //            MessageBox.Show($"Проблема с сохранением данных. Ошибка: {ex}");
        //            Close();
        //        }
        //    }
        //}
        private void btnCursor_Click( object sender, RoutedEventArgs e )
        {
            if (sender == btnGeometric)
            {
                this.Cursor = Geom;
            }
            else if (sender == btnPixel)
            {
                this.Cursor = Pix;
            }
            else if (sender == btnPony)
            {
                this.Cursor = Pony;
            }
        }

        private void Image_MouseDown( object sender, MouseButtonEventArgs e )
        {
            Close();
        }

        private void RusLocal_Selected( object sender, RoutedEventArgs e )
        {
            var uri = new Uri("Resources/rusLang.xaml", UriKind.Relative);
            ResourceDictionary resourseDict = Application.LoadComponent(uri) as ResourceDictionary;
            Application.Current.Resources.Clear();
            Application.Current.Resources.MergedDictionaries.Add(resourseDict);
        }

        private void EngLocal_Selected( object sender, RoutedEventArgs e )
        {
            var uri = new Uri("Resources/engLang.xaml", UriKind.Relative);
            ResourceDictionary resourseDict = Application.LoadComponent(uri) as ResourceDictionary;
            Application.Current.Resources.Clear();
            Application.Current.Resources.MergedDictionaries.Add(resourseDict);
        }




        private void CommandBinding_Executed( object sender, ExecutedRoutedEventArgs e )
        {

        }


      
        public void Enter_Click( object sender, RoutedEventArgs e )
        {
            new EnterPage().Show();
        }



        //public void FilterWin_Open( object sender, RoutedEventArgs e )
        //{
        //    new FilterItems(BookList, Books).Show();
        //}



        //private void Refresh_Click( object sender, RoutedEventArgs e )
        //{

        //    try
        //    {
        //        BookList = _fileOIService.LoadDate();
        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show($"Что-то не так с загрузкой данных из файла. Ошибка: {ex}");
        //        Close();
        //    }
        //    Books.ItemsSource = BookList;
        //}



    }
}
