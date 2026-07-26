import 'package:flutter/material.dart';
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_http_methods/CRUD/controller/product_controller.dart';
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_http_methods/CRUD/model/product_model.dart';

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

  productDialog(){
    TextEditingController productNameController = TextEditingController();
    TextEditingController productIMGController = TextEditingController();
    TextEditingController productQTYController = TextEditingController();
    TextEditingController productUnitPriceController = TextEditingController();
    TextEditingController productTotalPriceController = TextEditingController();

    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Create Product"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: productNameController,
            decoration: InputDecoration(
              labelText: 'name',
            ),
          ),

          SizedBox(height: 10,),
          TextField(
            controller: productIMGController,
            decoration: InputDecoration(
              labelText: 'Image',
            ),
          ),

          SizedBox(height: 10,),
          TextField(
            controller: productQTYController,
            decoration: InputDecoration(
              labelText: 'QTY',
            ),
          ),

          SizedBox(height: 10,),
          TextField(
            controller: productUnitPriceController,
            decoration: InputDecoration(
              labelText: 'Unit price',
            ),
          ),

          SizedBox(height: 10,),

          TextField(
            controller: productTotalPriceController,
            decoration: InputDecoration(
              labelText: 'Total price',
            ),
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: (){}, 
                child: Text("Cancle")),
              
              ElevatedButton(
                onPressed: () async{
                  productController.createProduct(Data(
                    productName : productNameController.text,
                    img: productIMGController.text,
                    qty: int.parse(productQTYController.text),
                    unitPrice: int.parse(productTotalPriceController.text),
                    totalPrice: int.parse(productTotalPriceController.text)
                    )
                  );
                  await fetchData();
                  Navigator.pop(context);
                }, 
                child: Text("Submit"))
            ],
          )

        ],
      ),
    )
    );
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

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            productDialog();
          }, 
          child: Icon(Icons.add)),
    );
  }
}