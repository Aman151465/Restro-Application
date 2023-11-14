import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_view/waiting_screen.dart';

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Restaurant App',
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedCategory = 'Starter';
  List<MenuItem> menuItems = [
    //Starter List

    MenuItem(
      itemName: 'Paneer Tikka',
      itemDescription: 'Spicy grilled cottage cheese cubes.',
      itemPrice: 199.0,
      category: 'Starter',
      ImageUrl:
          'https://images.pexels.com/photos/3928854/pexels-photo-3928854.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
    MenuItem(
      itemName: 'Aloo Gobi',
      itemDescription: 'Potato and cauliflower curry.',
      itemPrice: 149.0,
      category: 'Starter',
      ImageUrl:
          'https://imgs.search.brave.com/_6M3K0qr2ihWe9wvUoS2CJP0RSHfROXNdltGEHPZz6E/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pLmd1/aW0uY28udWsvaW1n/L21lZGlhLzMwMDZl/M2VlNGQwMDIxMDVh/MTNmNjkwNjY4MGM3/ODI0YWE0Nzk2OGQv/MzU4XzQzN18zMDI5/XzE4MTcvbWFzdGVy/LzMwMjkuanBnP3dp/ZHRoPTQ0NSZkcHI9/MSZzPW5vbmU',
    ),
    MenuItem(
      itemName: 'Samosa',
      itemDescription: 'Crispy pastry filled with spiced potatoes.',
      itemPrice: 49.0,
      category: 'Starter',
      ImageUrl:
          'https://imgs.search.brave.com/Ah2cBB3gYb1K4OMypIsj4z5NcWmtQqLyif008__y8eg/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTEy/NzE0MzI1Ni9waG90/by9zYW1vc2EuanBn/P3M9NjEyeDYxMiZ3/PTAmaz0yMCZjPW9O/VkRRYnJxVjlKd0J4/cDREZXE1S0JYQVV3/eWJVYzNQVWhocFA5/SlFQd2s9',
    ),
    MenuItem(
      itemName: 'Chicken Tikka',
      itemDescription:
          ' Boneless chicken pieces marinated in yogurt and spices, grilled to perfection.',
      itemPrice: 220,
      category: 'Starter',
      ImageUrl:
          'https://images.pexels.com/photos/12737811/pexels-photo-12737811.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),
    MenuItem(
      itemName: 'Hara Bhara Kabab',
      itemDescription:
          'A vegetarian kebab made from a blend of spinach, green peas, and spices, shallow-fried.',
      itemPrice: 190,
      category: 'Starter',
      ImageUrl:
          'https://media.istockphoto.com/id/1488738096/photo/hara-bhara-kabab-with-green-chutney.jpg?b=1&s=612x612&w=0&k=20&c=VhQZ49aj_6jfbcP4W0p6eM9PB5KLJS2Gk8vR79JW6Dk=',
    ),
    MenuItem(
      itemName: 'Chole Bhature',
      itemDescription:
          'A North Indian favorite, consisting of spicy chickpea curry (chole) served with deep-fried bread (bhature).',
      itemPrice: 180,
      category: 'Starter',
      ImageUrl:
          'https://media.istockphoto.com/id/1314802039/photo/forehead-castle-chat.jpg?b=1&s=612x612&w=0&k=20&c=fmLmC7vl7CN2Z0ez3h_3VnyYwA3lYTXRME8tj9jVJyQ=',
    ),
    MenuItem(
      itemName: 'Pakoras',
      itemDescription:
          'Assorted fritters made from vegetables and gram flour, deep-fried to crispy perfection.',
      itemPrice: 120.0,
      category: 'Starter',
      ImageUrl:
          'https://media.istockphoto.com/id/1412117500/photo/mix-veg-pakora-with-tomato-mint-sauce-on-old-wooden-table-top-view.jpg?b=1&s=612x612&w=0&k=20&c=0dQNG8eUgTVLPlv2bd8QgsH4Pv91ZFvm8yqi5sdKQJ8=',
    ),
    MenuItem(
      itemName: 'Papdi Chaat',
      itemDescription:
          'Crispy fried dough wafers served with yogurt and chutneys, a delightful street food.',
      itemPrice: 130.0,
      category: 'Starter',
      ImageUrl:
          'https://media.istockphoto.com/id/1490358662/photo/doi-papri-chaat-papdi-dahi-bhalla-bhallay-potato-crackers-masala-and-yogurt-served-in-plate.jpg?b=1&s=612x612&w=0&k=20&c=S9wrswyFLg7B0NBlaewfUKUMCIqPXZz2_7QWuyPz5ww=',
    ),
    MenuItem(
      itemName: 'Aloo Tikki',
      itemDescription:
          'Mashed potato patties spiced with herbs, shallow-fried until golden brown.',
      itemPrice: 110.0,
      category: 'Starter',
      ImageUrl:
          'https://media.istockphoto.com/id/1204866803/photo/indian-potato-patties-aloo-tikki-served-with-yogurt-close-up-in-a-dish-horizontal-top-view.jpg?b=1&s=612x612&w=0&k=20&c=dGr7SZQWgF9SnK6e03yGz0SjnUgaiDkxGF1GvYufP_I=',
    ),
    MenuItem(
      itemName: 'Tandoori Prawns',
      itemDescription:
          'Juicy prawns marinated in yogurt and tandoori spices, cooked in a clay oven.',
      itemPrice: 250.0,
      category: 'Starter',
      ImageUrl:
          'https://images.pexels.com/photos/8697539/pexels-photo-8697539.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),

    //Veg List

    MenuItem(
      itemName: 'Vegetable Biryani',
      itemDescription:
          'Fragrant rice cooked with mixed vegetables, herbs, and spices.',
      itemPrice: 180.0,
      category: 'Veg',
      ImageUrl:
          'https://img.freepik.com/premium-photo/tawa-pulao-pulav-pilaf-pilau-is-indian-street-food-made-using-basmati-rice-vegetables-spices-selective-focus_466689-70801.jpg?size=626&ext=jpg&ga=GA1.1.1566930965.1696924579&semt=ais',
    ),
    MenuItem(
      itemName: 'Aloo Paratha',
      itemDescription:
          'Whole wheat flatbread stuffed with spiced potato filling, typically served with yogurt or pickle.',
      itemPrice: 140.0,
      category: 'Veg',
      ImageUrl:
          'https://img.freepik.com/free-photo/delicious-indian-dosa-composition_23-2149086051.jpg?size=626&ext=jpg&ga=GA1.1.1566930965.1696924579&semt=ais',
    ),
    MenuItem(
      itemName: 'Gobi Manchurian',
      itemDescription:
          'Crispy cauliflower florets tossed in a tangy and spicy Indo-Chinese sauce.',
      itemPrice: 160.0,
      category: 'Veg',
      ImageUrl:
          'https://img.freepik.com/free-photo/meatballs-sweet-sour-tomato-sauce_2829-19545.jpg?size=626&ext=jpg&ga=GA1.1.1566930965.1696924579&semt=ais',
    ),
    MenuItem(
      itemName: 'Dal Makhani',
      itemDescription:
          'Creamy black lentils cooked with butter and aromatic spices.',
      itemPrice: 190.0,
      category: 'Veg',
      ImageUrl:
          'https://img.freepik.com/premium-photo/dal-makhani-dal-makhni-is-north-indian-recipe-served-bowl-selective-focus_466689-79082.jpg?size=626&ext=jpg&ga=GA1.1.1566930965.1696924579&semt=ais',
    ),
    MenuItem(
      itemName: 'Chole Bhature',
      itemDescription:
          'Spicy chickpea curry (chole) served with deep-fried bread (bhature), a North Indian favorite.',
      itemPrice: 180.0,
      category: 'Veg',
      ImageUrl:
          'https://imgs.search.brave.com/HfzaYUgVe1s3-FYAQwpxCDc42u4oSRyz26wauM3i8l4/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA2LzEyLzQwLzA1/LzM2MF9GXzYxMjQw/MDUzOF82emxNM2xl/bHlVVVFqZ1NERjNW/TW1tNDZtQ3VEUURW/Ti5qcGc',
    ),
    MenuItem(
      itemName: 'Matar Paneer',
      itemDescription:
          'A classic Indian dish with green peas and paneer (cottage cheese) in a tomato-based gravy.',
      itemPrice: 195.0,
      category: 'Veg',
      ImageUrl:
          'https://media.istockphoto.com/id/1325271813/photo/green-peas-or-matar-paneer-curry.jpg?b=1&s=612x612&w=0&k=20&c=sGTw8bEJ_mI0EcPmkhpAPX8SsXFPLvNdcs4kDLbyzro=',
    ),
    MenuItem(
      itemName: 'Vegetable Korma',
      itemDescription:
          'Assorted vegetables cooked in a creamy and mildly spiced coconut-based sauce.',
      itemPrice: 210.0,
      category: 'Veg',
      ImageUrl:
          'https://imgs.search.brave.com/fBOo58GAw8B5RloSYW4BSnMaaaNUcxXd_Uc428QofQw/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9zcGlj/ZWNyYXZpbmdzLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAx/OS8wOS9WZWdldGFi/bGUtS29ybWEtMy0x/LTY4M3gxMDI0Lmpw/Zw',
    ),
    MenuItem(
      itemName: 'Jeera Rice',
      itemDescription:
          'Fragrant basmati rice cooked with cumin seeds, a perfect accompaniment to curries.',
      itemPrice: 100.0,
      category: 'Veg',
      ImageUrl:
          'https://imgs.search.brave.com/3qBiLE8QLsSJYng2C6O5YW1ICRiwVw9YYoLGINY0vks/rs:fit:500:0:0/g:ce/aHR0cHM6Ly93d3cu/d2hpc2thZmZhaXIu/Y29tL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDIxLzA2L0plZXJh/LVJpY2UtMi0xLTEt/MTIwMHgxODAwLmpw/Zw',
    ),
    MenuItem(
      itemName: 'Spinach and Paneer Curry',
      itemDescription:
          'A flavorful spinach gravy with cubes of paneer (cottage cheese).',
      itemPrice: 205.0,
      category: 'Veg',
      ImageUrl:
          'https://imgs.search.brave.com/juyuolvDgAavLfFsdwf-9wSB6fQMJtrVi1bP38Lw25A/rs:fit:500:0:0/g:ce/aHR0cHM6Ly93d3cu/aW5kaWFuaGVhbHRo/eXJlY2lwZXMuY29t/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDIy/LzA0L3BhbGFrLXBh/bmVlci1yZWNpcGUu/anBnLndlYnA',
    ),
    MenuItem(
      itemName: 'Veg Hakka Noodles',
      itemDescription:
          'Stir-fried noodles with mixed vegetables in a spicy and tangy sauce.',
      itemPrice: 170.0,
      category: 'Veg',
      ImageUrl:
          'https://imgs.search.brave.com/zU4NKBwkMzLphUxgaCWdkCD2-6qcItpXym4p-x58cL0/rs:fit:500:0:0/g:ce/aHR0cHM6Ly93d3cu/d2hpc2thZmZhaXIu/Y29tL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDIwLzEwL1ZlZy1I/YWtrYS1Ob29kbGVz/LTItMS0xMjAweDE4/MDAuanBn',
    ),
    MenuItem(
      itemName: 'Mixed Vegetable Curry',
      itemDescription:
          'A medley of seasonal vegetables cooked in a savory tomato-based gravy.',
      itemPrice: 185.0,
      category: 'Veg',
      ImageUrl:
          'https://imgs.search.brave.com/SXgDRqv4MxCHFr7e1Rm788qpfTYNgbJiJ6-cSEpMehU/rs:fit:500:0:0/g:ce/aHR0cHM6Ly93d3cu/ZWF6eXBlYXp5bWVh/bHouY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy8yMDE3LzA4L01p/eGVkLVZlZ2V0YWJs/ZS1DaGlja2VuLUN1/cnJ5XzItMzIweDMy/MC5qcGc',
    ),

    //Non-Veg

    MenuItem(
      itemName: 'Butter Chicken',
      itemDescription:
          'Tender pieces of chicken in a creamy tomato and butter-based gravy.',
      itemPrice: 250.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://images.pexels.com/photos/7625056/pexels-photo-7625056.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),
    MenuItem(
      itemName: 'Chicken Biryani',
      itemDescription:
          'Fragrant basmati rice cooked with succulent chicken pieces, spices, and herbs.',
      itemPrice: 220.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://images.pexels.com/photos/12737656/pexels-photo-12737656.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),
    MenuItem(
      itemName: 'Fish Curry',
      itemDescription:
          'Fresh fish cooked in a spicy and tangy curry with coconut milk and aromatic spices.',
      itemPrice: 280.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://th.bing.com/th/id/OIP._DkJIWOEzyNzPlqZkQAv7AHaEK?w=288&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    ),
    MenuItem(
      itemName: 'Lamb Rogan Josh',
      itemDescription:
          'Tender pieces of lamb slow-cooked in a rich and aromatic gravy.',
      itemPrice: 290.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://th.bing.com/th/id/OIP.eZmlyHdH1i5_ekoVtNi-NgHaE7?w=285&h=190&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    ),
    MenuItem(
      itemName: 'Tandoori Chicken',
      itemDescription:
          'Marinated chicken pieces cooked in a clay oven, resulting in a smoky flavor.',
      itemPrice: 230.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://www.spiceindiaonline.com/wp-content/uploads/2021/05/Tandoori-Chicken-20.jpg',
    ),
    MenuItem(
      itemName: 'Chicken Tikka Masala',
      itemDescription:
          'Marinated and grilled chicken served in a creamy tomato-based sauce.',
      itemPrice: 240.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://th.bing.com/th/id/OIP.wxsWa66V2z2wqNeM5JW8oQHaLF?pid=ImgDet&rs=1',
    ),
    MenuItem(
      itemName: 'Prawn Curry',
      itemDescription:
          'Plump prawns cooked in a spicy and flavorful coconut-based curry.',
      itemPrice: 270.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://th.bing.com/th/id/OIP.B2huzSuvXLKY51yFv-oWAAHaHa?pid=ImgDet&rs=1',
    ),
    MenuItem(
      itemName: 'Mutton Biryani',
      itemDescription:
          'Aromatic rice cooked with tender mutton pieces, spices, and herbs.',
      itemPrice: 300.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://flavarich.com/wp-content/uploads/2018/10/mutton-biryani-2.jpg',
    ),
    MenuItem(
      itemName: 'Chicken Korma',
      itemDescription:
          'Chicken pieces cooked in a rich and creamy cashew-based gravy.',
      itemPrice: 260.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://th.bing.com/th/id/OIP.UZVFrAot9xVCiSJub3PmywHaLH?pid=ImgDet&rs=1',
    ),
    MenuItem(
      itemName: 'Egg Curry',
      itemDescription:
          'Boiled eggs in a spiced tomato-based curry with onions and bell peppers.',
      itemPrice: 180.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://th.bing.com/th/id/OIP.oyxUvIeDpLCioNkh6D7V3QAAAA?pid=ImgDet&rs=1',
    ),
    MenuItem(
      itemName: 'Schezwan Shrimp',
      itemDescription:
          'Shrimp stir-fried with vegetables in a spicy Schezwan sauce.',
      itemPrice: 290.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://th.bing.com/th/id/OIP.oJSvOJ-uR1VV8g7r0tmWiQHaEG?pid=ImgDet&rs=1',
    ),
    MenuItem(
      itemName: 'Chicken Chettinad',
      itemDescription:
          'Chicken cooked in a spicy and aromatic Chettinad-style gravy with roasted spices.',
      itemPrice: 250.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://th.bing.com/th/id/OIP.mUU8JXNQwEiwTwv7p7PLHwHaHa?pid=ImgDet&rs=1',
    ),
    MenuItem(
      itemName: 'Fish Tandoori',
      itemDescription:
          'Fish marinated in yogurt and tandoori spices, cooked in a clay oven.',
      itemPrice: 280.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://www.foodfusion.com/wp-content/uploads/2019/11/Grilled-Tandoori-Fish-Recipe-by-Food-fusion-1.jpg',
    ),
    MenuItem(
      itemName: 'Mutton Rogan Josh',
      itemDescription:
          'Tender mutton pieces slow-cooked in a flavorful and spicy gravy.',
      itemPrice: 300.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://th.bing.com/th/id/OIP.EC-7-HjMzo9eRK3WR08-hQHaE8?pid=ImgDet&rs=1',
    ),
    MenuItem(
      itemName: 'Goan Prawn Curry',
      itemDescription:
          'Prawns cooked in a coconut-based curry with Goan spices.',
      itemPrice: 270.0,
      category: 'Non-Veg',
      ImageUrl:
          'https://th.bing.com/th/id/OIP.fkYAvawtBWVArP93XO1bGgHaKa?pid=ImgDet&rs=1',
    ),

    //Desert

    MenuItem(
      itemName: 'Chocolate Cake',
      itemDescription: 'Moist chocolate cake with a rich chocolate ganache.',
      itemPrice: 20.0,
      category: 'Dessert',
      ImageUrl:
          'https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),

    MenuItem(
      itemName: 'Strawberry Cheesecake',
      itemDescription: 'Creamy cheesecake topped with fresh strawberries.',
      itemPrice: 18.0,
      category: 'Dessert',
      ImageUrl:
          'https://images.pexels.com/photos/1126359/pexels-photo-1126359.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),

    MenuItem(
      itemName: 'Tiramisu',
      itemDescription:
          'Classic Italian dessert with coffee-soaked ladyfingers and mascarpone cheese.',
      itemPrice: 22.0,
      category: 'Dessert',
      ImageUrl:
          'https://images.pexels.com/photos/4861852/pexels-photo-4861852.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),

    MenuItem(
      itemName: 'Apple Pie',
      itemDescription:
          'Warm apple pie with a flaky crust, best served with vanilla ice cream.',
      itemPrice: 16.0,
      category: 'Dessert',
      ImageUrl:
          'https://images.pexels.com/photos/6163263/pexels-photo-6163263.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),

    MenuItem(
      itemName: 'Red Velvet Cupcakes',
      itemDescription: 'Moist red velvet cupcakes with cream cheese frosting.',
      itemPrice: 12.0,
      category: 'Dessert',
      ImageUrl:
          'https://images.pexels.com/photos/853005/pexels-photo-853005.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),

    MenuItem(
      itemName: 'Lemon Sorbet',
      itemDescription: 'Refreshing lemon sorbet, a perfect palate cleanser.',
      itemPrice: 8.0,
      category: 'Dessert',
      ImageUrl:
          'https://images.pexels.com/photos/4021983/pexels-photo-4021983.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),

    MenuItem(
      itemName: 'Chocolate Fondue',
      itemDescription:
          'Assorted fruits and marshmallows dipped in melted chocolate.',
      itemPrice: 25.0,
      category: 'Dessert',
      ImageUrl:
          'https://images.pexels.com/photos/219162/pexels-photo-219162.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),

    MenuItem(
      itemName: 'Pecan Pie',
      itemDescription: 'Sweet and nutty pecan pie, a Southern favorite.',
      itemPrice: 14.0,
      category: 'Dessert',
      ImageUrl:
          'https://images.pexels.com/photos/6164608/pexels-photo-6164608.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),

    MenuItem(
      itemName: 'Banana Split',
      itemDescription:
          'Bananas, ice cream, and toppings for a classic dessert.',
      itemPrice: 15.0,
      category: 'Dessert',
      ImageUrl:
          'https://images.pexels.com/photos/6895879/pexels-photo-6895879.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),

    MenuItem(
      itemName: 'Molten Chocolate Lava Cake',
      itemDescription: 'Warm chocolate cake with a gooey chocolate center.',
      itemPrice: 18.0,
      category: 'Dessert',
      ImageUrl:
          'https://images.pexels.com/photos/1998633/pexels-photo-1998633.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),

    MenuItem(
      itemName: 'Coconut Macaroons',
      itemDescription: 'Chewy and sweet coconut macaroons.',
      itemPrice: 10.0,
      category: 'Dessert',
      ImageUrl:
          'https://images.pexels.com/photos/7474221/pexels-photo-7474221.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),

    MenuItem(
      itemName: 'Peach Cobbler',
      itemDescription: 'Baked cobbler with juicy peaches and a buttery crust.',
      itemPrice: 16.0,
      category: 'Dessert',
      ImageUrl:
          'https://imgs.search.brave.com/j4wraB8yyI-v7tRwd3HYsHYoVzwIFzyQTscz_iqz5ck/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90YXN0/ZXNiZXR0ZXJmcm9t/c2NyYXRjaC5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMTQv/MDgvUGVhY2gtQ29i/Ymxlci0xNS5qcGc',
    ),

    MenuItem(
      itemName: 'Blueberry Cheesecake',
      itemDescription: 'Creamy cheesecake topped with a blueberry compote.',
      itemPrice: 18.0,
      category: 'Dessert',
      ImageUrl:
          'https://images.pexels.com/photos/827516/pexels-photo-827516.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),

    MenuItem(
      itemName: 'Key Lime Pie',
      itemDescription: 'Tangy key lime pie with a graham cracker crust.',
      itemPrice: 14.0,
      category: 'Dessert',
      ImageUrl:
          'https://images.pexels.com/photos/4529015/pexels-photo-4529015.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),

    MenuItem(
      itemName: 'Cinnamon Churros',
      itemDescription: 'Crispy fried churros with a dusting of cinnamon sugar.',
      itemPrice: 10.0,
      category: 'Dessert',
      ImageUrl:
          'https://images.pexels.com/photos/18675005/pexels-photo-18675005/free-photo-of-close-up-of-churros-and-sauces.jpeg?auto=compress&cs=tinysrgb&w=400',
    ),
  ];
  final ScrollController scrollController = ScrollController();

  List<CartItem> cartItems = [];

  void addToCart(MenuItem item) {
    setState(() {
      // Check if the item is already in the cart
      var existingItem = cartItems.firstWhere(
        (cartItem) => cartItem.menuItem == item,
        orElse: () => CartItem(menuItem: item, quantity: 0),
      );

      if (existingItem.quantity == 0) {
        cartItems.add(existingItem);
        existingItem.quantity++;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                '${item.itemName} x${existingItem.quantity} added to cart'),
          ),
        );
      }
    });
  }

  void removeFromCart(CartItem item) {
    setState(() {
      if (item.quantity > 1) {
        // If the quantity is greater than 1, decrease the quantity
        item.quantity--;
      } else {
        // If the quantity is 1 or less, remove the item from the cart
        cartItems.remove(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Color.fromARGB(255, 236, 184, 88),
          actions: [
            Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory =
                            'Starter'; // Change the selected category
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange, // Background color
                      onPrimary: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Button border radius
                      ),
                    ),
                    child: const Text(
                      'Starter',
                      style: TextStyle(
                        fontFamily: 'Kanit', // Specify the font family
                        fontSize: 16.0, // Adjust the font size
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory =
                            'Veg'; // Change the selected category
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Background color
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Button border radius
                      ),
                    ),
                    child: const Text(
                      'Veg',
                      style: TextStyle(
                        fontFamily: 'Kanit', // Specify the font family
                        fontSize: 16.0, // Adjust the font size
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory =
                            'Non-Veg'; // Change the selected category
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Background color
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Button border radius
                      ),
                    ),
                    child: const Text(
                      'Non-Veg',
                      style: TextStyle(
                        fontFamily: 'Kanit', // Specify the font family
                        fontSize: 16.0, // Adjust the font size
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory =
                            'Dessert'; // Change the selected category
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          255, 237, 210, 141), // Background color
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Button border radius
                      ),
                    ),
                    child: Text(
                      'Desert',
                      style: TextStyle(
                        fontFamily: 'Kanit', // Specify the font family
                        fontSize: 16.0, // Adjust the font size
                      ),
                    ),
                  ),
                  SizedBox(width: 3),
                ],
              ),
            ),
          ]),
      backgroundColor:
          Color.fromARGB(255, 236, 184, 88), // Background color of the body
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: getMenuItemsByCategory(selectedCategory).length,
                itemBuilder: (context, index) {
                  final menuItem = getMenuItemsByCategory(selectedCategory)[
                      index]; // Get the menu item for the current index
                  return MenuItemCard(
                    menuItem: menuItem,
                    onAddToCart: () => addToCart(menuItem),
                    onQuantityChanged: (newQuantity) {
                      var existingItem = cartItems.firstWhere(
                        (cartItem) => cartItem.menuItem == menuItem,
                        orElse: () => CartItem(menuItem: menuItem, quantity: 0),
                      );
                      existingItem.quantity = newQuantity;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 12, top: 5, left: 10, right: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.black,
            backgroundColor: const Color.fromARGB(154, 255, 153, 0),
            foregroundColor: Colors.white,
            minimumSize: const Size(150, 50),
            padding: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            'Your Cart',
            style: TextStyle(
              fontFamily: 'Kanit',
              fontSize: 21,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderList(
                  cartItems: cartItems,
                  removeFromCart: (item) {
                    removeFromCart(item);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<MenuItem> getMenuItemsByCategory(String category) {
    return menuItems.where((item) => item.category == category).toList();
  }
}

class MenuItem {
  final String itemName;
  final String itemDescription;
  final double itemPrice;
  final String ImageUrl;
  final String category;
  int quantity;

  MenuItem({
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
    required this.ImageUrl,
    required this.category,
    this.quantity = 0,
  });
}

class CartItem {
  final MenuItem menuItem;
  int quantity;

  CartItem({
    required this.menuItem,
    required this.quantity,
  });
}

class MenuItemCard extends StatefulWidget {
  final MenuItem menuItem;
  final VoidCallback onAddToCart;
  final ValueChanged<int> onQuantityChanged;

  const MenuItemCard({
    super.key,
    required this.menuItem,
    required this.onAddToCart,
    required this.onQuantityChanged,
  });

  @override
  _MenuItemCardState createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  // int quantity = 0;

  @override
  Widget build(BuildContext context) {
    int quantity = widget.menuItem.quantity;
    return Card(
      color: quantity > 0 ? Colors.green : Color.fromARGB(231, 239, 165, 61),
      elevation: 20, // Add elevation for a card-like appearance
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.network(
                widget.menuItem.ImageUrl,
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.menuItem.itemName,
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.menuItem.itemDescription,
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Price: ₹${widget.menuItem.itemPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 0),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (quantity > 0) {
                          setState(() {
                            quantity--;
                            widget.menuItem.quantity = quantity;
                            widget.onQuantityChanged(quantity);
                          });
                        }
                      },
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 18.0,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                          widget.menuItem.quantity = quantity;
                          widget.onQuantityChanged(quantity);
                          widget.onAddToCart(); // Add the item to the cart
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  final List<CartItem> cartItems;
  final Function(CartItem) removeFromCart;
  // final Function(CartItem) setItemCountToZero;

  OrderList({
    required this.cartItems,
    required this.removeFromCart,
    // required this.setItemCountToZero,
  });

  double calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.menuItem.itemPrice * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Your Ordered List',
          style: TextStyle(
            fontFamily: 'Kanit',
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return Card(
            color: Color.fromARGB(203, 245, 199, 61),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: ListTile(
              contentPadding: EdgeInsets.all(8),
              leading: ClipOval(
                child: Image.network(
                  cartItem.menuItem.ImageUrl,
                  width: 80.0, // Adjust the width of the image as needed
                  height: 100, // Adjust the height of the image as needed
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                '${cartItem.menuItem.itemName} (x${cartItem.quantity})',
                style: TextStyle(fontFamily: 'Kanit', fontSize: 16.0),
              ),
              subtitle: Text(
                'Price: \₹${(cartItem.menuItem.itemPrice * cartItem.quantity).toStringAsFixed(2)}',
                style: TextStyle(fontFamily: 'Kanit', fontSize: 14.0),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  removeFromCart(cartItem);
                  // setItemCountToZero(cartItem);
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Total Amount: \₹${calculateTotal().toStringAsFixed(2)}',
              style: const TextStyle(
                fontFamily: 'Kanit',
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: const Size(150, 50),
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Order',
                style: TextStyle(
                  fontFamily: 'Kanit',
                ),
              ),
              onPressed: () async {
                try {
                  final FirebaseFirestore firestore =
                      FirebaseFirestore.instance;

                  // Create a new document in the "orders" collection
                  final DocumentReference orderRef =
                      await firestore.collection('orders').add({
                    'tableNumber': '1', // Replace with the actual table number
                    'totalPrice':
                        calculateTotal().toString(), // Total price of the order
                    'items': cartItems.map((cartItem) {
                      return {
                        'itemName': cartItem.menuItem.itemName,
                        'quantity': cartItem.quantity,
                        'price': cartItem.menuItem.itemPrice,
                        'ImageUrl': cartItem.menuItem.ImageUrl,
                      };
                    }).toList(),
                    'timestamp': FieldValue.serverTimestamp(),
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WaitingScreen(
                              upiId: 'aman151465@okicici',
                            )),
                  );
                } catch (e) {
                  print('Error creating order: $e');
                  // Handle the error as needed, e.g., show an error message to the user.
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
