using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using CourseProj;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using CourseProj.Services;
using Microsoft.Win32;

namespace CourseProj
{

    public partial class EditItem : Window
    {
        public static Book currentBook;
        OpenFileDialog openFileDialog = new OpenFileDialog();
        public EditItem()
        {
            InitializeComponent();
            openFileDialog.Filter = "Фотографии|*.jpg;*.png;*.jpeg;*.svg;";
        }

        public EditItem(Book editedBook)
        {
            currentBook = editedBook;
            InitializeComponent();
            openFileDialog.Filter = "Фотографии|*.jpg;*.png;*.jpeg;*.svg;";
        }


        private void OpenExplorer(object sender, RoutedEventArgs e)
        {
            if (openFileDialog.ShowDialog() == true)
            {
                try
                {
                    ProductsPhoto.Source = new BitmapImage(new Uri(openFileDialog.FileName, UriKind.Absolute));
                }
                catch
                {
                    MessageBox.Show("Выберите файл формата", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }

            }
        }

        private void EditItem_Loaded(object sender, RoutedEventArgs e)
        {
            titleInput.Text = currentBook.Title;
            autorInput.Text = currentBook.Autor;
            powerInput.Text = Convert.ToString(currentBook.Cost);
            pagesInput.Text = Convert.ToString(currentBook.Pages);

            ProductsPhoto.Source = currentBook.imgPath;

            if (currentBook.Bindingtype == "Твердый переплет" || currentBook.Bindingtype == "Твердый переплет")
                comboboxInput.SelectedIndex = 0;
            if (currentBook.Bindingtype == "Мягкая обложка" || currentBook.Bindingtype == "Мягкая обложка")
                comboboxInput.SelectedIndex = 1;
            if (currentBook.Bindingtype == "Твердый переплет с доп обложкой" || currentBook.Bindingtype == "Твердый переплет с доп обложкой")
                comboboxInput.SelectedIndex = 2;


        }

        private void Power_TextChanged(object sender, EventArgs e)
        {
            int i;
            if (!int.TryParse(powerInput.Text, out i))
            {
                powerInput.Text = "";
                MessageBox.Show("Plaese enter a valid Cost");
            }
            else if (Convert.ToInt32(powerInput.Text) <= 2 || Convert.ToInt32(powerInput.Text) > 5000)
            {
                powerInput.Text = "";
                MessageBox.Show("Plaese enter Cost between 2 and 5000");
            }
            ////////////////////////////////////////////
            if (!int.TryParse(pagesInput.Text, out i))
            {
                pagesInput.Text = "";
                MessageBox.Show("Plaese enter a valid Pages number");
            }
            else if (Convert.ToInt32(pagesInput.Text) <= 10 || Convert.ToInt32(pagesInput.Text) > 2000)
            {
                pagesInput.Text = "";
                MessageBox.Show("Plaese enter Pages number between 10 and 2000");
            }
            //////////////////////////////////////////
            if (ProductsPhoto.Source.ToString() == "" )
            {
                MessageBox.Show("Plaese enter image for the book!");
            }
            //////////////////////////////////////////

            if (titleInput.Text != "" && powerInput.Text != "" && pagesInput.Text != "" && ProductsPhoto.Source.ToString() != "" )
            {
                currentBook.Title = titleInput.Text;
                currentBook.Autor = autorInput.Text;
                currentBook.Cost = Convert.ToInt32(powerInput.Text);
                currentBook.Pages = Convert.ToInt32(pagesInput.Text);
                currentBook.imgPath = ProductsPhoto.Source;

                ComboBoxItem typeItem = (ComboBoxItem)comboboxInput.SelectedItem;
                string value = typeItem.Content.ToString();
                currentBook.Bindingtype = value;

            }
        }

        public static Book ShowEditedBook()
        {
            return currentBook;
        }
    }
}
