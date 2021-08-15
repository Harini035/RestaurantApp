import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:restaurant_app/cartmodel.dart';

class Menu extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "Pizza",
        price: 180,
        imgUrl: "https://media.istockphoto.com/photos/tasty-pepperoni-pizza-and-cooking-ingredients-tomatoes-basil-on-black-picture-id1083487948?k=6&m=1083487948&s=612x612&w=0&h=lK-mtDHXA4aQecZlU-KJuAlN9Yjgn3vmV2zz5MMN7e4=",
        qty: 1),
    Product(
        id: 2,
        title: "Burger",
        price: 220,
        imgUrl: "https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YnVyZ2Vyc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
        qty: 1),
    Product(
        id: 3,
        title: "Shawarma",
        price: 120,
        imgUrl: "https://res.cloudinary.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/njxgll7iqpsn9pyoivzs",
        qty: 1),
    Product(
        id: 4,
        title: "Biriyani",
        price: 150,
        imgUrl: "https://thumbs.dreamstime.com/b/dum-chicken-biriyani-close-up-image-kerala-thalassery-which-mixed-masala-yellow-colour-arranged-copper-serving-215558887.jpg",
        qty: 1),
    Product(
        id: 5,
        title: "French Fries",
        price: 100,
        imgUrl: "https://kirbiecravings.com/wp-content/uploads/2019/09/easy-french-fries-1.jpg",
        qty: 1),
    Product(
        id: 6,
        title: "Fish Fry",
        price: 120,
        imgUrl: "https://c.ndtvimg.com/2021-02/gsq3frgg_fish-fry_625x300_10_February_21.jpg",
        qty: 1),
    Product(
        id: 7,
        title: "Blue Lagoon Mojito",
        price: 90,
        imgUrl: "https://i.pinimg.com/originals/84/87/8d/84878da36d27e4c0603ecd48bee6c548.jpg",
        qty: 1),
    Product(
        id: 8,
        title: "Noodles",
        price: 110,
        imgUrl: "https://www.indianhealthyrecipes.com/wp-content/uploads/2021/07/hakka-noodles-recipe.jpg",
        qty: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          )
        ],
      ),
      body:
      GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: _products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 0.8),
        itemBuilder: (context, index){
          return ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                return Card( child: Column( children: <Widget>[
                  Image.network(_products[index].imgUrl, height: 120, width: 120,),
                  Text(_products[index].title, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("Rs."+_products[index].price.toString()),
                  OutlineButton(
                      child: Text("Add"),
                      onPressed: () => model.addProduct(_products[index]))
                ]));
              });
        },
      ),

      // ListView.builder(
      //   itemExtent: 80,
      //   itemCount: _products.length,
      //   itemBuilder: (context, index) {
      //     return ScopedModelDescendant<CartModel>(
      //         builder: (context, child, model) {
      //       return ListTile(
      //           leading: Image.network(_products[index].imgUrl),
      //           title: Text(_products[index].title),
      //           subtitle: Text("\$"+_products[index].price.toString()),
      //           trailing: OutlineButton(
      //               child: Text("Add"),
      //               onPressed: () => model.addProduct(_products[index])));
      //     });
      //   },
      // ),

    );
  }
}