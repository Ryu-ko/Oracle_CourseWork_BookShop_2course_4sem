   M S B A M L   `   `   `  ����E  ACourseProj, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:CourseProj
CourseProj  5           CourseProj.MainWindovNoLog   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      *localclr-namespace:CourseProj     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5        � Title$  	Book Shop��5	      $
��1300��5
      $	��600��5      $��Calibri)�5       � Icon$ ./Imgs/bookshel.png��5       � WindowStartupLocation$ CenterScreen=�5       	  WinBg#���   5       � 	Resources 5       �� 
TargetType �� Triggers :� RoutedEvent g� AutoReverse �� TargetProperty		 W� To
 g� Duration��%�   '��       �� 5   
   " ��6    5      :� 5      $ Click��6   [�5      �� 5      .��5      �� .��5   "   W�  . $ Width�5   %   $		 100X�5   %   $
 0:0:0.4D�5    %   5!      5"      5$      5'      5*       J� CommandBindings 5,      )  #System.Windows.Input.CommandBinding  5-   
   -   5        5-        5.   
   -   5        5.      .��53      �� $��4q�6    �� CornerRadius$	 130��6!   ._�55   
   �  � ColumnDefinitions 56      �� 57      $
��0.2* �6#   �� 58      $��* �6#   �� 59      $
��0.5* �6#   �� 5:      $��0.45* �6#    � RowDefinitions 5=      �� 5>      $��0.15* �6    �� 5?      $��* �6    .+�5C      � $��0��6   $��0��6     5D      �� 5E      $��* �6%   �� 5F      $
��0.5* �6%   .+�5I      �� $��0��5J      $��73��5K      $��58��5L      $��Center=�5M      $	��Top=�5N      $��./Imgs/bookshel.png��5O      $��2��62   �� 5Q      $��1��5R      $��Center=�5S      $��Center=�5T      $��0,0,0,2q�5U      $��16(�5V      ���	#FF7CDCC4$
��Bold"�5X      Bookly5[      5\      � 5^      $��0��6   $��1��6    .+�5`      �� -   5         ��Name$ 	SearchBox��5a      $��40��5b      $��
15,0,10,10q�5c      $��2,2,2,3q�5d      $��20(�5e      ���	#FF0B9D79���	#FF67BBA6 �� SelectionBrush �	#FF56C368 �� TextAlignment$
 Left=�5i      
������ .��5k   9    J� InputBindings 5m      �� 5n      
 �� Key$ Return��6%    �� Command 62   �� *EnterSearch+.��5o   -   5q      5s      � 5t      $��0��6   $��2��6    .+�5v      �� $��Center=�6    �� Orientation$ 
Horizontal=�5w      $��35 0 0 0q�5x      .+�5y      	� -   5         	�Name$ VNalich��5z   #   $��Center=�5{   $   $��В наличии��5|   $   
�������$��16(�5   %    d� 	IsChecked$
 TrueY�5�   #   ��5~   #   Z� 5�   #   	� 5�      -   5        $ NoNalich��5�   $   $��40 0 0 0q�5�   $   $��Center=�5�   %   $��Нет в наличии��5�   %   
�������$��16(�5�   ;   ��6$   Z� 6;   5�      5�      � 5�      $��0��5�      $��3��5�      $��Center=�5�      $��Center=�5�      .+�5�      �� $ 
Horizontal=�6   .+�5�      �� $
��10,5q�5�      $��0q�5�      $��16(�5�      $��28��5�      $��27��5�       J� OpacityMask �	#FFD9D6D6  SottItm#���  5�      5�      �� 5�      -   5         ��Name$ Button1��5�      $��25,0,0,0q�5�      $��80��5�      $��30��5�       � Cursor$
 Hand��5�      $��
Войти��5�        ButtonStyleTW#���  5�        ButtonTemplate#���  5�      5�      5�      5�      � 5�      $��1��5�      $��4��5�      $��Center=�5�      $	��Top=�5�      $��0,50,0,0q�5�       5�      �� 5�      $	��12* �6'   �� 5�      $��* �6'    5�      �� 5�      $��* �6$   �� 5�      $��* �6$   �� 5�      $��* �6$   �� 5�      $��* �6$   .+�5�      � $��4��5�      $��1��5�      $��Center=�5�      $	��Top=�5�       � Orientation$ Vertical=�5�        CyanBgStyle2#���  5�      ��5�      Z� .+�5�      ��   SettingsTxtBlck#���  5�       
 h_Exp3#���  5�      $��16(�5�      $��Center=�5�      � 5�      $
��Auto��5�   "   $��Center=�5�   "   $ 
Horizontal=�5�   "   .+�5�      �� -   5        $ RusLocal��5�         cbi_rus#���  5�       #���  5�       #���  5�      �� 5�      -   5        $ EnLocal��5�        
 cbi_en#���  5�   !   #���  5�   !   #���  5�      5�      �� 5�      #���  6     
	 h_Exp1#��� 	 5�       $��16(�5�       $��	0,10,0, 7q�5�   !   $��Center=�5�      � 5�      $��Center=�6    $ 
Horizontal=�6=   .+�5�      �� -	   5        $ btnPixel��5�   !    
 
but_PixCur#��� 
 5�      #���  5�      �� 5�      -
   5        $ btnPony��5�   !     btnPony#���  5�      #���  5�      �� 5     -   5        $ btnGeometric��5  !     but_geomCur#���  5     #���  5     5     �� 5     #���  5       h_Theme#���  5     $��16(�5     $��	0,10,0, 7q�5     $��Center=�5     � 5     $
��Auto��5  "   $��Center=�5  "   $ 
Horizontal=�5  "   .+�5     �� -   5        $ Green��5        theme_Green#���  5  !     ButtonStyle#���  5     �� 5     -   5        $ 	DarkTheme��5        
theme_Dark#���  5!      #���  5"     5&     �� 5(     -   5         ��Name$ checkBoxDis��5)     $
 Hand��5*     $��10,5,0,0q�5+     $��Center=�5,       checkBoxDis#���  5-       checkBoxDisTxt#���  5.     53     55     �� 59     $��1��5:     $��0��5;     $��3��5<       TabControlStyle#���  5=     
�������$��0,0,0,0q�5?     ���	#00ACACAC.@�5B     �� $��0��5C     $��0��5D     ���	#FF37957E$��0,0,0,0q�5F     ���	#00ACACAC���	#00000000��5K     �� 5L     -   5        $��Books��5M     $��1��5N     $��5��5O       	ListBoxBg#���  5P     ���	#FF43CBA9��5U     �� 5V  "   .R�5X  &   � $��	0 20 0  0q�6,   $
��Left=�5Y  ,   $��Center=�5Z  ,    5[  *   �� 5\  .   $��* �6?   �� 5]  .   $
��0.6* �6?    5`  *   �� 5a  .   $��* �6<   .+�5d  *   � $��0��6/   $��0��6<   $��Center=�5e  /   $	��Top=�5f  /   $	��350��5g  /   $��0,0,0,20q�5h  /    5j  .   �� 5k  2    5n  .   �� 5o  2   $
��0.3* �6@   �� 5p  2   $��0* �6@   �� 5q  2   $��0* �6@   �� 5r  2   $��0* �6@   �� 5s  2   $��0* �6@   �� 5t  2   $��0* �6@   �� 5u  2   $��0* �6@   .+�5y  .   � $��0��63   $��0��6@   $��Center=�5z  /   .+�5|  2   ��  ��Name$ ProductsPhoto��5}  1   $	��300��5~  1   $	��200��5  1   $��Center=�5�  1   ��5�  1   �� *BOOK_IMAGESOURCE+5�  1   5�  /   � 5�  .   $��1��5�  1   $��0��5�  1   $��0,10,0,0q�5�  1   $��Center=�5�  1   .+�5�  2   �� $��Center=�6=   $ 
Horizontal=�6X   .+�5�  6   ��  ��Name$ BookNameInput��5�  9   $��0,0,0,5q�5�  9   $��24(�5�  9   ��5�  9   �� *	BOOK_NAME+5�  3   5�  /   � 5�  .   $��2��63   $��0��6@   $��Center=�6Q   $��0 0 0 5q�5�  3   .+�5�  2   �� $ 
Horizontal=�6=   .+�5�  6   �� $��18(�6@     b_Autor#���  6N   ���	#FFBEFFE36o   �� 5�  6   $��18(�6@   $��: ��6N   ���	#FFBEFFE36X   �� 5�  6   $ 
autorInput��5�  9   $��18(�5�  9   ��5�  9   �� *AuthorsString+5�  3   5�  /   � 5�  .   $��3��63   $��0��6@   $��Center=�5�  3   $��0 20 0 5q�5�  4   .+�5�  2   �� $ 
Horizontal=�6=   .+�5�  6   �� $��18(�6@   $��Жанр��6N   ���	#FFBEFFE36Z   �� 5�  6   $��18(�6@   $��: ��6N   ���	#FFBEFFE36X   �� 5�  6   $ 
GenreInput��5�  9   $��18(�5�  9   ��5�  9   �� *GenresString+5�  3   5�  /   � 5�  .   $��4��63   $��0��5�  3   $��Center=�5�  3   $��0 5 0 0q�5�  4   .+�5�  2   �� $ 
Horizontal=�6=   .+�5�  6   �� $��18(�6@   $)��#Количество страниц��6N   ���	#FFBEFFE36h   �� 5�  6   $��18(�6@   $��: ��6N   ���	#FFBEFFE36X   �� 5�  6   $ 
PagesInput��5�  9   $��18(�5�  9   ��5�  9   �� *PAGE_NUMBER+5�  3   5�  /   � 5�  .   $��5��63   $��0��5�  3   $��Center=�5�  3   $��0 5 0 0q�5�  3   .+�5�  2   �� $ 
Horizontal=�6=   .+�5�  6   �� $��18(�6@   $��Язык��6N   ���	#FFBEFFE36[   �� 5�  6   $��18(�6@   $��: ��6N   ���	#FFBEFFE36X   �� 5�  6   $ languageInput��5�  9   $��18(�5�  9   ��5�  9   �� *
LANGUAGE+5�  3   5�  /   � 5�  .   $��6��63   $��0��5�  3   $��Center=�5�  3   $��0 5 0 0q�5�  4   .+�5�  2   �� $ 
Horizontal=�6=   .+�5�  6   �� $��18(�6@   $��Цена��6N   ���	#FFBEFFE36Z   �� 5�  6   $��18(�6@   $��: ��6N   ���	#FFBEFFE36X   �� 5�  6   $ 
PriceInput��5�  9   $��18(�5�  9   ��5�  9   �� *	BOOKPRICE+�� 5�  6   $��18(�6@   $
�� Byn��6N   
�������6Z   5�  3   5�  /   5�  +   � 5�  *   $��0��6/   $��1��5�  /   $
��Left=�5�  /   $��Center=�5�  /   $��0 15 0 0q�5�  /    5�  .   �� 5�  2    5�  .   �� 5�  2   $
��0.3* �6@   �� 5�  2   $
��0.3* �6@   �� 5�  2   $
��0.3* �6@   �� 5�  2   $
��0.3* �6@   �� 5�  2   $
��0.3* �6@   �� 5�  2   $
��0.3* �6@   .+�5�  .   � $��0��63   $��1��5�  3   $��0 0 0 0q�5   3   $
��Left=�5  3   .+�5  2   �� $ 
Horizontal=�6=   .+�5  6   �� $��18(�6@     b_Binding_type#���  6N   ���	#FFBEFFE36v   �� 5  6   $��18(�6@   $��: ��6N   ���	#FFBEFFE36X   �� 5  6   $ bindingtypeInput��5  9   $��18(�5  9   ��5	  9   �� *BOOKBINSINGTYPE+5
  3   5  /   � 5  .   $��1��63   $��1��5  3   $��0 5 0 0q�5  3   $
��Left=�5  3   .+�5  2   �� $ 
Horizontal=�6=   .+�5  6   �� $��18(�6@   $!��Год публикации��6N   ���	#FFBEFFE36d   �� 5  6   $��18(�6@   $��: ��6N   ���	#FFBEFFE36X   �� 5  6   $ yearOfPublicationInput��5  9   $��18(�5  9   ��5  9   �� *YEAR_OF_PUBLICATION+5  3   5  /   � 5  .   $��2��63   $��1��5  3   $��0 5 0 0q�5  3   $
��Left=�5  3   .+�5!  2   �� $ 
Horizontal=�6=   .+�5"  6   �� $��18(�6@   $��Издательство��6N   ���	#FFBEFFE36b   �� 5#  6   $��18(�6@   $��: ��6N   ���	#FFBEFFE36X   �� 5$  6   $ PublisherHouseInput��5%  9   $��18(�5&  9   ��5'  9   �� *PublisherHouseString+5(  3   5)  /   � 5+  .   $��3��63   $��1��5,  3   $��0 5 0 0q�5-  3   $
��Left=�5.  3   .+�50  2   �� $ 
Horizontal=�6=   .+�51  6   �� $��18(�6@   $
��ISBN��6N   ���	#FFBEFFE36Z   �� 52  6   $��18(�6@   $��: ��6N   ���	#FFBEFFE36X   �� 53  6   $ 	ISBNInput��54  9   $��18(�55  9   ��56  9   �� *ISBN+57  3   58  /   � 5:  .   $��4��63   $��1��5;  3   $��0 5 0 0q�5<  3   $
��Left=�5=  3   .+�5?  2   �� $ 
Horizontal=�6=   .+�5@  6   �� $��18(�6@   $#��Количество книг��6N   ���	#FFBEFFE36e   �� 5A  6   $��18(�6@   $��: ��6N   ���	#FFBEFFE36X   �� 5B  6   $ NumberOfBooksInput��5C  9   $��18(�5D  9   ��5E  9   �� *NUMBERSOFBOOKS+5F  3   5G  /   � 5I  .   $��5��63   $��1��5J  3   $��0 5 0 0q�5K  3   $
��Left=�5L  3   .+�5N  2   �� $ 
Horizontal=�6=   .+�5O  6   �� $��18(�6@   $��Описание��6N   ���	#FFBEFFE36^   �� 5P  6   $��18(�6@   $��: ��6N   ���	#FFBEFFE36X   �� 5Q  6   $ BookDescriptionInput��5R  9   $��18(�5S  9   $	��520��5U  9   $	��400��5V  9   $
��Wrap=�5W  9   ��5T  9   �� *DESCRIPTION+5W  9   5Y  3   5Z  /   5[  +   5\  '   5^  #   5`     5d     5g     5h     5i     5j     