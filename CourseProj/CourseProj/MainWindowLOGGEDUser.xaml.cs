using CourseProj ;
using CourseProj.Services;
using System;
using System.Collections.Generic;
using System.ComponentModel;
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

namespace CourseProj
{
    /// <summary>
    /// Логика взаимодействия для MainWindowLOGGEDUser.xaml
    /// </summary>
    public partial class MainWindowLOGGEDUser : Window
    {


        private static string PathForDate = $"{Environment.CurrentDirectory}\\alldata3.json";
        public FileIOService _fileOIService = new FileIOService(PathForDate);

        public BindingList<Book> BookList = new BindingList<Book>();

        Cursor Geom, Pix, Pony;

        Stack<string> undoAction = new Stack<string>();
        Stack<string> redoAction = new Stack<string>();
        public MainWindowLOGGEDUser()
        {
            InitializeComponent();

            string cursorDir = Directory.GetParent(Environment.CurrentDirectory).Parent.FullName + "\\MyCursors";
            Geom = new Cursor($"{cursorDir}\\curs1.ani");
            Pix = new Cursor($"{cursorDir}\\curs2.cur");
            Pony = new Cursor($"{cursorDir}\\curs3.ani");
        }

        public void Window_Loaded( object sender, RoutedEventArgs e )
        {
            _fileOIService = new FileIOService(PathForDate);

            try
            {
                BookList = _fileOIService.LoadDate();

            }
            catch (Exception ex)
            {
                MessageBox.Show($"Что-то не так с загрузкой данных из файла. Ошибка: {ex}");
                Close();
            }

            Books.ItemsSource = BookList;
            BookList.ListChanged += BookList_ListChanged1;


        }

        private void SearchBox_TextChanged( object sender, System.Windows.Controls.TextChangedEventArgs e )
        {
            if (SearchBox.Text != string.Empty)
            {
                var SearchResult = BookList.Where(t => t.Title.ToLower().Contains(SearchBox.Text.ToLower()) || t.Autor.ToLower().Contains(SearchBox.Text.ToLower())).ToList();


                BindingList<Book> List = new BindingList<Book>(SearchResult);
                Books.ItemsSource = SearchResult;

            }
            else
            {
                Books.ItemsSource = BookList;

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


        private void BookList_ListChanged1( object sender, ListChangedEventArgs e )
        {
            if (e.ListChangedType == ListChangedType.ItemAdded || e.ListChangedType == ListChangedType.ItemDeleted || e.ListChangedType == ListChangedType.ItemChanged)
            {
                try
                {
                    _fileOIService.SaveData(sender);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Проблема с сохранением данных. Ошибка: {ex}");
                    Close();
                }
            }
        }
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


        public void ExitUserPageMain_Click( object sender, RoutedEventArgs e )
        {
            new MainWindovNoLog().Show();
        }

        public void WatchMyOrders_Click( object sender, RoutedEventArgs e )
        {
            new OrdersInf().Show();
        }

        public void WatchMyBroni_Click( object sender, RoutedEventArgs e )
        {
            new BroniBook().Show();
        }

        public void FilterWin_Open( object sender, RoutedEventArgs e )
        {
            new FilterItems(BookList, Books).Show();
        }



        private void Refresh_Click( object sender, RoutedEventArgs e )
        {

            try
            {
                BookList = _fileOIService.LoadDate();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Что-то не так с загрузкой данных из файла. Ошибка: {ex}");
                Close();
            }
            Books.ItemsSource = BookList;
        }

      

        private void SearchBox_KeyDown( object sender, KeyEventArgs e )
        {
            undoAction.Push(SearchBox.Text);
        }

        // -------------------------------------------


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

