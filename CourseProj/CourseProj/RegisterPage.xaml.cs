
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Логика взаимодействия для RegisterPage.xaml
    /// </summary>
    public partial class RegisterPage : Window
    {
        public RegisterPage()
        {
            InitializeComponent();
        }


        private void RegisterCLick( object sender, RoutedEventArgs ee )
        {
            if (FIOinputTxt.Text == "" || EmailinputTxt.Text == "" || MobilPhoneinputTxt.Text == "" || DateBirthPick.SelectedDate == null || LogininputTxt.Text == ""  || PasswordinputTxt.Text == "")
                MessageBox.Show("Заполните все поля!");
            else
            {
                string sex;

                using (Entities ent = new Entities())
                {
                   
                   
                        ent.ENTERUSER(LogininputTxt.Text, PasswordinputTxt.Text, FIOinputTxt.Text, EmailinputTxt.Text, MobilPhoneinputTxt.Text, "Ж",
                           DateBirthPick.SelectedDate);
                        MessageBox.Show("Пользователь добавлен!");
                   
                  
                }
            }
        }
        private void OpenEnterPage( object sender, RoutedEventArgs ee )
        {
            new EnterPage().Show();

        }

        private void testtt( object sender, RoutedEventArgs ee )
        {
            using (Entities senya = new Entities())
            {
                foreach (var item in senya.PUBLISHERHOUSE)
                {
                    MessageBox.Show(item.ID_PUBLISHINGHOUSE + "  " + item.PUBLISHINGHOUSE_NAME + "  " );

                }
            }

        }

    }
}
