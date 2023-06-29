using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Windows;
using System.Linq;
using System.Windows.Input;
using CourseProj;
using CourseProj.Services;
using Newtonsoft.Json;
using System.Windows.Controls;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Threading;
using Oracle.ManagedDataAccess.Client;
using System.Data;

namespace CourseProj
{
    /// <summary>
    /// Логика взаимодействия для UsersInf.xaml
    /// </summary>
    public partial class UsersInf : Window
    {

        BindingList<USER> User = new BindingList<USER>();

        BindingList<ALL_USER_INF> UserAll = new BindingList<ALL_USER_INF>();

        public UsersInf()
        {
            InitializeComponent();


            using (Entities ent = new Entities())
            {
                UserAll.Clear();
                foreach (var item in ent.GETUSERSINF())
                {
                    var userr = new ALL_USER_INF()
                    {
                        User_Name = item.USER_NAME,
                        User_Email= item.USER_EMAIL,
                        User_Numer =item.USER_NUMER,
                        User_Sex = item.USER_SEX,
                        User_BirthYear =item.USER_BIRTHYEAR,
                        ID_Account= item.ID_ACCOUNT,
                        ID_UserAc=item.ID_USERAC,
                        Login = item.LOGIN,
                        Password=item.PASSWORD

                    };

                    UserAll.Add(userr);

                }
                UserData.ItemsSource = UserAll;

            }




        }
    }
}
