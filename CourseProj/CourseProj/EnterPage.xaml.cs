using System;
using System.Collections.Generic;
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
    /// Логика взаимодействия для EnterPage.xaml
    /// </summary>
    public partial class EnterPage : Window
    {
        
        public EnterPage()
        {
            InitializeComponent();
        }
        private void EnterClick( object sender, RoutedEventArgs ee )
        {
            if (LogininputTxt.Text == null || PasswordinputTxt.Text.Length == 0)
                MessageBox.Show("Заполните все поля");
            else
            {
                using (Entities ent = new Entities())
                {
                    if (LogininputTxt.Text == "admin" && PasswordinputTxt.Text == "123")
                    {   
                        MainWindovNoLog mainWindovNoLog = new MainWindovNoLog();
                        mainWindovNoLog.Close();

                        MessageBox.Show("It's admin");
                        MainWindowAdmin adminWin = new MainWindowAdmin();
                        adminWin.Show();
                        
                        Close();

                        
                    }
                    else
                    {
                        bool AccountExist = false;

                        //foreach (var item in ent.GETUSERSINF())
                        //{
                        //    if (LogininputTxt.Text == item.Login && PasswordinputTxt.Text == item.Password)
                        //    {
                        //        USER.USER_ID = item.ID_Account;
                        //        USER.LOGIN = item.Login;

                        //        MainWindowLOGGEDUser mainloggedus= new MainWindowLOGGEDUser();
                        //        mainloggedus.Show();
                        //        Close();
                        //        AccountExist = true;
                        //    }
                        //}
                        if (AccountExist == false)
                            MessageBox.Show("Данной учетной записи нет, зарегистрируйтесь. ");

                    }

                }

            }

        }

        private void RegisterPgeOpen( object sender, RoutedEventArgs ee )
        {

            new RegisterPage().Show();
        }
    }
}
