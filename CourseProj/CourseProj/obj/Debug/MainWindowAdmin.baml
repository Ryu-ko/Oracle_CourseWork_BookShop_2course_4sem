   M S B A M L   `   `   `  ����E  ACourseProj, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:CourseProj
CourseProj  5           CourseProj.MainWindowAdmin   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      *localclr-namespace:CourseProj     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5        � Title$  	Book Shop��5	      $
��1300��5
      $	��600��5      $��Calibri)�5       � Icon$ ./Imgs/bookshel.png��5       � WindowStartupLocation$ CenterScreen=�5       	  WinBg#���   5       � 	Resources 5       �� 
TargetType �� Triggers :� RoutedEvent g� AutoReverse �� TargetProperty		 W� To
 g� Duration��%�   '��       �� 5   
   " ��6    5      :� 5      $ Click��6   [�5      �� 5      .��5      �� .��5   "   W�  . $ Width�5    %   $		 100X�5!   %   $
 0:0:0.4D�5"   %   5#      5$      5&      5)      5,       J� CommandBindings 5.      )  #System.Windows.Input.CommandBinding  5/   
   -   5        5/        50   
   -   5        50      .��55      �� $��4q�6    �� CornerRadius$	 130��6!   ._�57   
   �  � ColumnDefinitions 58      �� 59      $
��0.2* �6#   �� 5:      $��1* �6#   �� 5;      $
��0.6* �6#   �� 5<      $
��0.3* �6#    � RowDefinitions 5?      �� 5@      $��0.15* �6    �� 5A      $��* �6    .+�5E      � $��0��6   $��0��6     5F      �� 5G      $��* �6%   �� 5H      $
��0.5* �6%   .+�5K      �� $��0��5L      $��73��5M      $��58��5N      $��Center=�5O      $	��Top=�5P      $��./Imgs/bookshel.png��5Q      $��2��62   �� 5S      $��1��5T      $��Center=�5U      $��Center=�5V      $��0,0,0,2q�5W      $��16(�5X      ���	#FF7CDCC4$
��Bold"�5Z      Bookly5]      5^      � 5`      $��0��6   $��1��6    .+�5b      �� -   5         ��Name$ 	SearchBox��5c      $��40��5d      $��
15,0,10,10q�5e      $��2,2,2,3q�5f      $��24(�5g      ���	#FF0B9D79���	#FF67BBA6 �� SelectionBrush �	#FF56C368 �� TextAlignment$ Center=�5l      
������ 5m      5o      � 5q      $��0��5r      $��2��5s      $��Center=�5t      .+�5v      �� -   5         ��Name$ AddItemTxtBlck��5w      $��40��5x      $��0,0,0,0q�5y      
������ $��0q�5{      $��16(�5}        add_book#���  5~       
 AddItm#���  5      5�      � 5�      $��0��5�      $��3��5�      $��Center=�5�      $��Center=�5�      .+�5�      ��  �� Orientation$ 
Horizontal=�6   .+�5�      �� $
��10,5q�5�      $��0q�5�      $��16(�5�      $��28��5�      $��27��5�       J� OpacityMask �	#FFD9D6D6  SottItm#���  5�      5�      �� 5�      -   5        $ Button1��5�      $��25,0,0,0q�5�      $��80��5�      $��30��5�       � Cursor$
 Hand��5�      $��
Выход��5�        ButtonStyleTW#���  5�        ButtonTemplate#���  5�      5�      5�      5�      �� 5�      -   5        $ WatchOrdersBlck��5�      $��40��5�      $��0,20,0,0q�5�      $��1��5�      $��4��5�      ���	#0C474747$��0q�5�      $��16(�5�      $'��!Посмотреть заказы��5�      #���  5�      $��Center=�5�      $	��Top=�5�      �� 5�      -   5        $ WatchUsersBlck��5�      $��40��5�      $��	0,100,0,0q�5�      $��1��5�      $��4��5�      
������ $��0q�5�      $��16(�5�      $��Пользователи��5�      #���  5�      $��Center=�5�      $	��Top=�5�      � 5�      $��1��5�      $��4��5�      $��Center=�5�      $��Bottom=�5�      $��	0,20,0,50q�5�       5�      �� 5�      $	��12* �6'   �� 5�      $��* �6'    5�      �� 5�      $��* �6$   �� 5�      $��* �6$   �� 5�      $��* �6$   �� 5�      $��* �6$   .+�5�      � $��4��5�      $��1��5�      $��Center=�5�      $	��Top=�5�       � Orientation$ Vertical=�5�      ��5�      Z� .+�5�      ��   SettingsTxtBlck#���  5�       
 h_Exp3#���  5�      $��16(�5�      $��Center=�5�      � 5�      $
��Auto��5�   "   $��Center=�5�   "   $ 
Horizontal=�5�   "   .+�5�      �� -   5        $ RusLocal��5�         cbi_rus#���  5�       #���  5�       #���  5�      �� 5�      -	   5        $ EnLocal��5�        
	 cbi_en#��� 	 5�   !   #���  5�   !   #���  5�      5      �� 5     #���  5      
 h_Theme#��� 
 5     $��16(�5     $��	0,10,0, 7q�5	     $��Center=�5
     � 5     $
��Auto��5  "   $��Center=�5  "   $ 
Horizontal=�5  "   .+�5     �� -
   5        $ Green��5        theme_Green#���  5  !     ButtonStyle#���  5     �� 5     -   5        $ 	DarkTheme��5        
theme_Dark#���  5      #���  5     5     �� 5!     -   5         ��Name$ checkBoxDis��5"     $
 Hand��5#     $��10,5,0,0q�5$     $��Center=�5%       checkBoxDis#���  5&       checkBoxDisTxt#���  5'     5,     5.     &   System.Windows.Controls.DataGrid  5/     -   5        $��Books��54     $��1��50     $��0��51     $��3��52     ���	#FF43CBA9   AutoGenerateColumns .     
IsReadOnly . $   HorizontalScrollBarVisibility$ Visible=�57        Columns 5:     0  *System.Windows.Controls.DataGridTextColumn  5;     ,  &System.Windows.Controls.DataGridColumn   Header$! Название книги��6)   1  +System.Windows.Controls.DataGridBoundColumn   Binding 5<  )   �� *	BOOK_NAME+  5?     $ 
Автор��6)    5@  )   �� *AuthorsString+  5C     $ Жанр��6)    5D  )   �� *GenresString+  5G     $ Тип переплета��6)    5H  )   �� *BOOKBINSINGTYPE+  5K     $ Год выпуска��6)    5L  )   �� *YEAR_OF_PUBLICATION+  5O     $ Язык��6)    5P  )   �� *
LANGUAGE+  5S     $ Страницы��6)    5T  )   �� *PAGE_NUMBER+  5W     $ Издатель��6)    5X  )   �� *PublisherHouseString+  5[     $
 ISBN��6)    5\  )   �� *ISBN+  5_     $# Количество книг��6)    5`  )   �� *NUMBERSOFBOOKS+  5c     $ Цена��6)    5d  )   �� *	BOOKPRICE+  5g     $ Изображение��6)    5h  )   �� *BOOK_IMAGESOURCE+  5k     $ Описание��6)    5l  )   �� *DESCRIPTION+5p     5r     5s     5t     