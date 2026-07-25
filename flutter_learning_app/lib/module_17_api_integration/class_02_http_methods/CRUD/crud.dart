import 'package:flutter/material.dart';
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_http_methods/CRUD/controller/product_controller.dart';

class Curd extends StatefulWidget {
  const Curd({super.key});

  @override
  State<Curd> createState() => _CurdState();
}

class _CurdState extends State<Curd> {

  ProductController productController = ProductController();
 
  Future fetchData() async {
    await productController.getProduct();
    setState(() {
      
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prodect List CURD"),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.83
          ), 
        itemCount: productController.products.length,
        itemBuilder: (context, index){
          final items = productController.products[index];
          return Column(
            children: [
              SizedBox(
                height: 140,
                child: 
                  Image.network(items.img.toString()),   
              ),
              Text(items.productName.toString(), style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold
              ),),
              Text("Price -${items.totalPrice} ", style: TextStyle(
               color: Colors.deepPurpleAccent
              ),),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.edit_note, color: Colors.orange,)),

                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.delete, color: Colors.red,))
                ],
              )
            ],
          );
        }),
    );
  }
}