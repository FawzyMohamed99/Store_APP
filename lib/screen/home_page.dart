import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app_api/Services/all_product_services.dart';
import 'package:store_app_api/models/product_model.dart';
import 'package:store_app_api/widget/custom_card.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              )),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 65),
          child:
              FutureBuilder<List<ProductModel>>(
                  future: AllProductsServices().getAllProducts(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      List<ProductModel> products=snapshot.data!;
                      return GridView.builder(
                        itemCount: products.length,
                          clipBehavior: Clip.none,
                          itemBuilder: (context, index) {
                            return CustomCard(products: products[index],);
                          },
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 100,
                          ));
                    }
                    else{
                      print('noooo');
                      return Center(child: CircularProgressIndicator(),);

                    }
          })),

    );
  }
}
