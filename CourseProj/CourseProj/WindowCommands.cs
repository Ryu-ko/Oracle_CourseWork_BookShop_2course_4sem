using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace CourseProj
{
    public class WindowCommands
    {
        static WindowCommands()
        {
            EngSelect = new RoutedCommand("EngSelect", typeof(MainWindowAdmin));
            RusSelect = new RoutedCommand("RusSelect", typeof(MainWindowAdmin));
        }
        public static RoutedCommand EngSelect { get; set; }
        public static RoutedCommand RusSelect { get; set; }

        public static readonly RoutedUICommand Exit = new RoutedUICommand
            (
                "Exit",
                "Exit",
                typeof(WindowCommands),
                new InputGestureCollection()
                {
                    new KeyGesture(Key.Q, ModifierKeys.Alt)
                }
            );
    }
}
