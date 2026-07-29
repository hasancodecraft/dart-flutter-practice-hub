import 'package:flutter/material.dart';

// Imports ProductController.
// This controller sends API requests and stores the product list.
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_http_methods/CRUD/controller/product_controller.dart';

// Imports the Data model.
// A Data object represents one product.
import 'package:module_09_flutter_basics/module_17_api_integration/class_02_http_methods/CRUD/model/product_model.dart';

// StatefulWidget is used because API data can change.
// After products are loaded or created, the screen must rebuild.
class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {

  /*
    Creates one ProductController object.

    Connection:
    crud.dart → ProductController → API server

    This page uses the controller to:
    1. Get products from the server.
    2. Create a new product.
    3. Access the products list.
  */
  ProductController productController = ProductController();
 
  /*
    Loads the latest products from the API.

    Flow:
    fetchData()
        ↓
    productController.getProduct()
        ↓
    GET request is sent
        ↓
    Products are stored in productController.products
        ↓
    setState() rebuilds the GridView
  */
  Future fetchData() async {
    // Waits until getProduct() finishes receiving and converting the API data.
    await productController.getProduct();

    // Rebuilds the UI after the products list changes.
    setState(() {
      
    });
  }
  
  @override
  void initState() {
    // Calls the parent class initialization first.
    super.initState();

    // Loads existing products only once when this page is first created.
    fetchData();
  }

  /*
    Opens a dialog where the user can enter a new product.

    Flow:
    Add button
        ↓
    productDialog()
        ↓
    User enters values
        ↓
    Values are read using controller.text
        ↓
    A Data object is created
        ↓
    createProduct() sends it to the API
  */
  productDialog(){
    // Each TextEditingController stores the value of one TextField.
    TextEditingController productNameController = TextEditingController();
    TextEditingController productIMGController = TextEditingController();
    TextEditingController productQTYController = TextEditingController();
    TextEditingController productUnitPriceController = TextEditingController();
    TextEditingController productTotalPriceController = TextEditingController();

    // Shows an AlertDialog above the current CRUD page.
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Create Product"),
      content: Column(
        // Makes the Column use only the height needed by its children.
        mainAxisSize: MainAxisSize.min,
        children: [
          // Stores the entered product name in productNameController.
          TextField(
            controller: productNameController,
            decoration: InputDecoration(
              labelText: 'name',
            ),
          ),

          SizedBox(height: 10,),

          // Stores the entered image URL in productIMGController.
          TextField(
            controller: productIMGController,
            decoration: InputDecoration(
              labelText: 'Image',
            ),
          ),

          SizedBox(height: 10,),

          // Stores the entered quantity in productQTYController.
          TextField(
            controller: productQTYController,
            decoration: InputDecoration(
              labelText: 'QTY',
            ),
          ),

          SizedBox(height: 10,),

          // Stores the entered unit price in productUnitPriceController.
          TextField(
            controller: productUnitPriceController,
            decoration: InputDecoration(
              labelText: 'Unit price',
            ),
          ),

          SizedBox(height: 10,),

          // Stores the entered total price in productTotalPriceController.
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
              // This button currently has no action inside onPressed.
              TextButton(
                onPressed: (){}, 
                child: Text("Cancel")),
              
              ElevatedButton(
                onPressed: () async{
                  /*
                    Creates one Data model object from the TextField values.

                    Connection:
                    TextFields
                        ↓
                    controller.text
                        ↓
                    Data object
                        ↓
                    ProductController.createProduct()
                        ↓
                    POST request
                        ↓
                    API server
                  */
                  productController.createProduct(Data(
                    // TextField values are received as Strings.
                    productName : productNameController.text,
                    img: productIMGController.text,

                    // int.parse() converts numeric text into an int value.
                    qty: int.parse(productQTYController.text),

                    // This current line reads from the total-price controller.
                    unitPrice: int.parse(productUnitPriceController.text),

                    totalPrice: int.parse(productTotalPriceController.text)
                    )
                  );

                  /*
                    Gets the latest product list after the create request
                    and rebuilds the screen through setState().
                  */
                  await fetchData();

                  // Closes the AlertDialog and returns to the CRUD screen.
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
        title: Text("Product List CRUD"),
        backgroundColor: Colors.blue,
      ),

      /*
        Builds the UI from productController.products.

        Connection:
        ProductController.products
            ↓
        GridView.builder
            ↓
        One product is selected by index
            ↓
        Its image, name, and price are displayed
      */
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // Shows two product cards in each row.
          crossAxisCount: 2,

          // Adds horizontal space between the two columns.
          crossAxisSpacing: 10,

          // Controls the width-to-height ratio of each grid item.
          childAspectRatio: 0.83
          ), 

        // Creates the same number of items as the products list length.
        itemCount: productController.products.length,

        itemBuilder: (context, index){
          /*
            Gets one Data object using the current index.

            Example:
            index 0 → first product
            index 1 → second product
          */
          final items = productController.products[index];

          return Column(
            children: [
              SizedBox(
                height: 140,
                child: 
                  // Reads the image URL from the current product object.
                  Image.network(items.img.toString()),   
              ),

              // Reads and shows the current product name.
              Text(items.productName.toString(), style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold
              ),),

              // Reads and shows the current product's total price.
              Text("Price -${items.totalPrice} ", style: TextStyle(
               color: Colors.deepPurpleAccent
              ),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Edit UI is ready, but its update action is not added yet.
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.edit_note, color: Colors.orange,)),

                  // Delete UI is ready, but its delete action is not added yet.
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.delete, color: Colors.red,))
                ],
              )
            ],
          );
        }),

        // Opens the create-product dialog when the add button is pressed.
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            productDialog();
          }, 
          child: Icon(Icons.add)),
    );
  }
}