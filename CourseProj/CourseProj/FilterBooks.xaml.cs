using System;
using System.Collections.Generic;
using System.ComponentModel;
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
using CourseProj ;

namespace CourseProj
{
    /// <summary>
    /// Логика взаимодействия для FilterItems.xaml
    /// </summary>
    public partial class FilterItems : Window
    {
        BindingList<Book> FilteredBookList = new BindingList<Book>();
        ListBox FilteredBook = new ListBox();
        int fromCost = 0, toCost = 0;
        int fromPages = 0, toPages = 0;
        string chosenBindingtype, chosenRating;


        public FilterItems(BindingList<Book> BookList, ListBox Books)
        {
            InitializeComponent();

            FilteredBookList = BookList;
            FilteredBook = Books;
        }

        private void radiobtnPages_Checked( object sender, RoutedEventArgs e )
        {

        }

        private void radiobtnYears_Checked( object sender, RoutedEventArgs e )
        {

        }
        //public void FilterList( object sender, RoutedEventArgs e )
        //{
        //    if ((bool)radiobtnCost.IsChecked)
        //    {
        //        if (costFrom.Text != "" && costTo.Text != "")
        //        {
        //            int i;
        //            if (int.TryParse(costFrom.Text, out i) && int.TryParse(costTo.Text, out i))
        //            {
        //                fromCost = Convert.ToInt32(costFrom.Text);
        //                toCost = Convert.ToInt32(costTo.Text);

        //                //FilteredBookList = (BindingList<Book>)FilteredBookList.Where(p => p.Cost >= fromCost && p.Cost <= toCost);
        //                var SortedList = from Book in FilteredBookList
        //                                 where Book.Cost >= fromCost && Book.Cost <= toCost
        //                                 select Book;

        //                FilteredBook.ItemsSource = SortedList;
        //            }
        //            else
        //            {
        //                costFrom.Text = "";
        //                costTo.Text = "";
        //                MessageBox.Show("Plaese enter a valid Cost Interval");
        //            }
        //        }
        //        else
        //        {
        //            costFrom.Text = "";
        //            costTo.Text = "";

        //            MessageBox.Show("Enter from and to Cost interval");
        //        }
        //    }
        //    //////////////////////
        //    if ((bool)radiobtnPages.IsChecked)
        //    {
        //        if (pagesFrom.Text != "" && pagesTo.Text != "")
        //        {
        //            int i;
        //            if (int.TryParse(pagesFrom.Text, out i) && int.TryParse(pagesTo.Text, out i))
        //            {
        //                fromPages = Convert.ToInt32(pagesFrom.Text);
        //                toPages = Convert.ToInt32(pagesTo.Text);

        //                var SortedList = from Book in FilteredBookList
        //                                 where Book.Pages >= fromPages && Book.Pages <= toPages
        //                                 select Book;

        //                FilteredBook.ItemsSource = SortedList;
        //            }
        //            else
        //            {
        //                pagesFrom.Text = "";
        //                pagesTo.Text = "";
        //                MessageBox.Show("Plaese enter a valid Pages Interval");
        //            }
        //        }
        //        else
        //        {
        //            pagesFrom.Text = "";
        //            pagesTo.Text = "";

        //            MessageBox.Show("Enter from and to Pages interval");
        //        }
        //    }

        //    /////////////////////////
        //    if ((bool)radiobtnBindingtype.IsChecked)
        //    {
        //        if ((bool)bindingtype1.IsChecked)
        //            chosenBindingtype = "Твердый переплет";
        //        if ((bool)bindingtype2.IsChecked)
        //            chosenBindingtype = "Мягкая обложка";
        //        if ((bool)bindingtype3.IsChecked)
        //            chosenBindingtype = "Твердый переплет с доп обложкой";

        //        var SortedList2 = from Book in FilteredBookList
        //                          where Book.Bindingtype == chosenBindingtype
        //                          select Book;

        //        FilteredBook.ItemsSource = SortedList2;

        //    }

        //    /////////////////////////
        //    if ((bool)radiobtnYears.IsChecked)
        //    { }
        

        //}

        public void ResetFilterList(object sender, RoutedEventArgs e)
        {
            FilteredBook.ItemsSource = FilteredBookList;
        }
    }
}
