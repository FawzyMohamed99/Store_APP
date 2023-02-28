import 'package:flutter/material.dart';
import 'package:store_app_api/Services/update_product_services.dart';
import 'package:store_app_api/models/product_model.dart';
import 'package:store_app_api/widget/custom_textfromfiled.dart';
import 'package:store_app_api/widget/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {

    ProductModel productt= ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'Description',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'Price',
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'Image',
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButon(
                  text: 'Update',
                  onTap: () async
                  {isLoading=true;
                    setState(() {});
                  await updateProduct(productt);
                    try{

                      print('sucess');
                    }catch(e){
                      print(e.toString());
                    }
                    isLoading=false;
                    setState(() {});
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async{
  await  UpdateProductService().updateProduct(
         id: product.id,
        title: productName ==null ? product.title: productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc ==null ? product.description :desc!,
        image: image == null ? product.image : image!,
        category: product.category
    );
  }
}
