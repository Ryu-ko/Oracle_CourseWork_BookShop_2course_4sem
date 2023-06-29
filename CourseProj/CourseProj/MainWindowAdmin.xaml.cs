using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Windows;
using System.Linq;
using System.Windows.Input;
using CourseProj ;
using CourseProj.Services;
using Newtonsoft.Json;
using System.Windows.Controls;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Threading;
using CourseProj.Bookk;
using Oracle.ManagedDataAccess.Client;
using System.Data;

namespace CourseProj
{
    public partial class MainWindowAdmin : Window
    {


        BindingList<BookBD> books = new BindingList<BookBD>();
        BindingList<BookBD> booksForSearch = new BindingList<BookBD>();


        public MainWindowAdmin()
        {
            MainWindovNoLog mainWindovNoLog = new MainWindovNoLog();
            mainWindovNoLog.Close();

            InitializeComponent();


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
                        if (item.BOOK_NAME.ToLower().Contains(SearchBox.Text.ToLower()))
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



        private void Light_Selected(object sender, RoutedEventArgs e)
        {
            var uri = new Uri("Resources/Light_mode.xaml", UriKind.Relative);                           // определяем путь к файлу ресурсов
            ResourceDictionary resourseDict = Application.LoadComponent(uri) as ResourceDictionary;     // загружаем словарь ресурсов
            Application.Current.Resources.Clear();                                                      // очищаем коллекцию ресурсов приложения
            Application.Current.Resources.MergedDictionaries.Add(resourseDict);                         // добавляем загруженный словарь ресурсов
        }

        private void Dark_Selected(object sender, RoutedEventArgs e)
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


      
        private void Image_MouseDown(object sender, MouseButtonEventArgs e)
        {
            Close();
        }

        private void RusLocal_Selected(object sender, RoutedEventArgs e)
        {
            var uri = new Uri("Resources/rusLang.xaml", UriKind.Relative);
            ResourceDictionary resourseDict = Application.LoadComponent(uri) as ResourceDictionary;
            Application.Current.Resources.Clear();
            Application.Current.Resources.MergedDictionaries.Add(resourseDict);
        }

        private void EngLocal_Selected(object sender, RoutedEventArgs e)
        {
            var uri = new Uri("Resources/engLang.xaml", UriKind.Relative);
            ResourceDictionary resourseDict = Application.LoadComponent(uri) as ResourceDictionary;
            Application.Current.Resources.Clear();
            Application.Current.Resources.MergedDictionaries.Add(resourseDict);
        }

 


        private void CommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {

        }


        public void AddItem_func( object sender, RoutedEventArgs e )
        {
            new AddItem().Show();
        }

        public void ExitAdminPageMain_Click( object sender, RoutedEventArgs e )
        {
            new EnterPage().Show();
        }

        public void WatchOrders_Click( object sender, RoutedEventArgs e )
        {
            new OrdersInf().Show();
        }

        public void WatchBroni_Click( object sender, RoutedEventArgs e )
        {
            new BroniBook().Show();
        }

        public void WatchtUsers_Click( object sender, RoutedEventArgs e )
        {
            new UsersInf().Show();
        }

        //public void FilterWin_Open( object sender, RoutedEventArgs e )
        //{
        //    new FilterItems().Show();
        //}



        //    private void Refresh_Click(object sender, RoutedEventArgs e)
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

        //private void Delete_Click(object sender, RoutedEventArgs e)
        //{
        //    var button = sender as Image;
        //    if (button != null)
        //    {
        //        var deletedBook = button.DataContext as Book;

        //        BookList.Remove(deletedBook);
        //    }
        //    else
        //    {
        //        return;
        //    }

        //    try
        //    {
        //        _fileOIService.SaveData(BookList);
        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show($"Проблема с сохранением данных. Ошибка: {ex}");
        //        Close();
        //    }


        //}


        //private void Edit_Click(object sender, RoutedEventArgs e)
        //{
        //    var button = sender as Image;
        //    if (button != null)
        //    {
        //        var editedBook = button.DataContext as Book;

        //        new EditItem(editedBook).Show();

        //        editedBook = EditItem.ShowEditedBook();

        //    }
        //    else
        //    {
        //        return;
        //    }


        //    try
        //    {
        //        _fileOIService.SaveData(BookList);
        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show($"Проблема с сохранением данных. Ошибка: {ex}");
        //        Close();
        //    }

        //    Books.ItemsSource = BookList;
        //}



        private void ExitCommand_CanExecute( object sender, CanExecuteRoutedEventArgs e )
        {
            e.CanExecute = true;
        }

        private void ExitCommand_Executed( object sender, ExecutedRoutedEventArgs e )
        {
            Application.Current.Shutdown();
        }
    }
}
