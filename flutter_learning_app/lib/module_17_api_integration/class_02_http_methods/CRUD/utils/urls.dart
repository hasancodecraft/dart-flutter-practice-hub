/*
  This file stores all API URLs in one place.

  Connection:

  product_controller.dart
        ↓
  Uses URLs from this class
        ↓
  Sends GET or POST requests
        ↓
  API server

  Keeping URLs here avoids writing the same server address
  repeatedly inside the controller.
*/

// Keeps all API addresses in one place so they can be reused easily.
class Urls{

  /*
    Stores the common server address.

    static means this value belongs directly to the Urls class.
    Therefore, no Urls object needs to be created.

    It can be accessed directly:

    Urls.baseURL

    URL structure:

    https://crud-api-ostad-live.onrender.com
        → Server address

    /api
        → API path

    /v1
        → Version 1 of the API
  */
  static String baseURL = 'https://crud-api-ostad-live.onrender.com/api/v1';

  /*
    Creates the complete endpoint for reading products.

    $baseURL inserts the value of baseURL into this String.

    Final URL:

    https://crud-api-ostad-live.onrender.com/api/v1/ReadProduct

    Connection:

    ProductController.getProduct()
        ↓
    Urls.readProductURL
        ↓
    http.get()
        ↓
    Products are received from the server
  */
  static String readProductURL = '$baseURL/ReadProduct';

  /*
    Creates the complete endpoint for creating a product.

    Final URL:

    https://crud-api-ostad-live.onrender.com/api/v1/CreateProduct

    Connection:

    ProductController.createProduct()
        ↓
    Urls.createProductURL
        ↓
    http.post()
        ↓
    New product data is sent to the server
  */
  static String createProductURL = '$baseURL/CreateProduct';
}