using System;
using System.Windows;
using System.ComponentModel;
using System.Windows.Controls;
using System.Windows.Media.Imaging;
using Microsoft.Win32;
using System.Text.RegularExpressions;
using Oracle.ManagedDataAccess.Client;
using System.Globalization;

namespace CourseProj
{
    /// <summary>
    /// Логика взаимодействия для AddItem.xaml
    /// </summary>
    public partial class AddItem : Window
    {

        public AddItem()
        {
            InitializeComponent();

        }



        private void Submit_TextChanged( object sender, EventArgs e )
        {
            MessageBox.Show("bruh");

            float f;
            int i;
            var exp = new Regex(@"\d{12}");

            string newChangedCostInput;

            if (CostInput.Text.Contains("."))
            {
                newChangedCostInput = CostInput.Text.Replace('.', ',');
            }
            else
            {
                newChangedCostInput = CostInput.Text;
            }

            if (!float.TryParse(newChangedCostInput, out f))
            {
                newChangedCostInput = "";
                MessageBox.Show("Введите корректную цену");
            }
            else if (float.Parse(newChangedCostInput) < 5.0 || float.Parse(newChangedCostInput) > 300.0)
            {
                newChangedCostInput = "";
                MessageBox.Show("Введите цену от 5 до 300");
            }
            //--------
            if (!int.TryParse(YearPublicInput.Text, out i))
            {
                YearPublicInput.Text = "";
                MessageBox.Show("Введите корректный год издания");
            }
            else if (Convert.ToInt32(YearPublicInput.Text) <= 1800 || Convert.ToInt32(YearPublicInput.Text) > 2023)
            {
                YearPublicInput.Text = "";
                MessageBox.Show("Введите год от 1800 до 2023");
            }
            //------
            if (!int.TryParse(KolVoBooksInput.Text, out i))
            {
                KolVoBooksInput.Text = "";
                MessageBox.Show("Введите корректное количество книг");
            }
            else if (Convert.ToInt32(KolVoBooksInput.Text) < 0 || Convert.ToInt32(KolVoBooksInput.Text) > 50)
            {
                KolVoBooksInput.Text = "";
                MessageBox.Show("Введите количество от 0 до 50");
            }
            //------
            if (!int.TryParse(pagesInput.Text, out i))
            {
                pagesInput.Text = "";
                MessageBox.Show("Введите корректное количество страниц");
            }
            else if (Convert.ToInt32(pagesInput.Text) < 10 || Convert.ToInt32(pagesInput.Text) > 1000)
            {
                pagesInput.Text = "";
                MessageBox.Show("Введите количество страниц от 10 до 1000");
            }

            string alldata;
            // ------------------- ПРОВЕРКА УСПЕШНО ВЫПОЛНЕНА -------------------------
            if (titleInput.Text != "" && autorInput.Text != "" && GenreInput.Text != "" && CostInput.Text != "" &&
                LanguageInput.Text != "" && YearPublicInput.Text != "" && KolVoBooksInput.Text != "" && DescriptionInput.Text != "" &&
                ImageInput.Text != "" && pagesInput.Text != "" && ISBNInput.Text != "")
            {
                MessageBox.Show("Все данные введены. Начинаем добавление!");

                using (Entities ent = new Entities())
                {
                    //Обрезать строку до пробела
                    string str = Convert.ToString(comboboxInput.Text);
                    String word = str.Substring(0, str.IndexOf(' '));
                    word = word.TrimEnd(' ');
  /* 
                    ent.Database.ExecuteSqlCommand("BEGIN ADD_NEW_BOOK(:addBookName, :addBookPages, :addBookISBN, :addBookBinding, :addBookYearPublic, :addBookIDPublishHous, :addBookLanguage, :addBookDescript, :addBookImageSoursce, :addBookNumbersOfBooks, :addBookPrice); END;",
                     new OracleParameter("addBookName", int.Parse(yearInputAdd.Text)),
                        new OracleParameter("addBookPages", float.Parse(newChangedCostInputAdd)),
                        new OracleParameter("addBookISBN", int.Parse(amountInputAdd.Text)),
                        new OracleParameter("addBookBinding", Global.USER_ID),
                        new OracleParameter("addBookYearPublic", descriptionInputAdd.Text),
                        new OracleParameter("addBookIDPublishHous", artistInputAdd.Text),
                        new OracleParameter("addBookLanguage", albumInputAdd.Text),
                        new OracleParameter("addBookDescript", Convert.ToString(ProductsPhoto.Source)),
                    new OracleParameter("addBookImageSoursce", word),
                        new OracleParameter("addBookNumbersOfBooks", calendar2.SelectedDate),

                        new OracleParameter("addBookNumbersOfBooks", calendar2.SelectedDate)
                         );
                    
                    string songsA = songsAInputAdd.Text;
                    ent.Database.ExecuteSqlCommand("BEGIN INSERT_SONGS(:p_songs, :p_artist_name, :p_album_name, :p_side); END;",
                        new OracleParameter("p_songs", songsA),
                        new OracleParameter("p_artist_name", artistInputAdd.Text),
                        new OracleParameter("p_album_name", albumInputAdd.Text),
                        new OracleParameter("p_side", "A"));

                    string songsB = songsBInputAdd.Text;
                    ent.Database.ExecuteSqlCommand("BEGIN INSERT_SONGS(:p_songs, :p_artist_name, :p_album_name, :p_side); END;",
                        new OracleParameter("p_songs", songsB),
                        new OracleParameter("p_artist_name", artistInputAdd.Text),
                        new OracleParameter("p_album_name", albumInputAdd.Text),
                        new OracleParameter("p_side", "B"));

                    string genres = genresInputAdd.Text;
                    ent.Database.ExecuteSqlCommand("BEGIN INSERT_GENRES(:p_genres); END;",
                        new OracleParameter("p_genres", genres)
                    );

                        */
                }

               

            }
        }
    }
}
