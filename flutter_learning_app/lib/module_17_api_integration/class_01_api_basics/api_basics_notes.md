# Module 17: API Integration

## Class 1 — API Basics

### 1. What is an API?

An **API (Application Programming Interface)** helps two applications communicate.

Example:

```text
Flutter App → API → Server → Database
Flutter App ← Response ← Server
```

The app sends a **request**, and the server sends back a **response**.

---

### 2. HTTP

**HTTP** is the communication system used to send requests and responses over the web.

A request may contain:

- **Method** — what action to perform
- **URL/Endpoint** — where to send the request
- **Headers** — extra information
- **Body** — data sent to the server

A response normally contains:

- **Status code**
- **Response body/data**

---

### 3. Web API and REST API

A **Web API** is any API that works through the web using HTTP or HTTPS.

A **REST API** is a type of Web API that follows REST rules.

```text
All REST APIs are Web APIs.
Not all Web APIs are REST APIs.
```

REST APIs are usually:

- **Stateless** — every request contains the needed information
- **Scalable** — can handle more users and data
- **Loosely coupled** — client and server can be developed separately
- **Resource-based** — uses URLs such as `/users` or `/products`

---

### 4. HTTP Methods

| Method | Purpose | Example |
|---|---|---|
| `GET` | Read data | Get all products |
| `POST` | Create new data | Add a product |
| `PUT` | Replace the full data | Update a complete product |
| `PATCH` | Update part of the data | Change only the price |
| `DELETE` | Remove data | Delete a product |

Example REST endpoints:

```text
GET    /products
POST   /products
PUT    /products/5
PATCH  /products/5
DELETE /products/5
```

---

### 5. Status Codes

A status code tells the app what happened after a request.

#### Success — `2xx`

- `200 OK` — Request completed successfully
- `201 Created` — New data was created

#### Client Errors — `4xx`

- `400 Bad Request` — Invalid request or input
- `401 Unauthorized` — Login or authentication is required
- `404 Not Found` — Requested data was not found

#### Server Errors — `5xx`

- `500 Internal Server Error` — A problem happened on the server

Always check the status code before using the response data.

---

### 6. JSON

APIs commonly send data in **JSON** format.

```json
{
  "id": 1,
  "name": "Laptop",
  "price": 500
}
```

JSON data is converted into a Dart model class so the code becomes safer and easier to manage.

```text
JSON data → fromJson() → Dart object
```

---

### 7. Postman

**Postman** is a tool used to test APIs without building an app first.

With Postman, we can:

- Select an HTTP method
- Enter an API URL
- Add headers or body data
- Send the request
- View the status code
- View the JSON response

In this class, Postman was only demonstrated. No Postman coding was required.

---

### 8. HTTP Packages in Flutter

Flutter needs a networking package to call an API.

- **http** — simple and beginner-friendly
- **dio** — more advanced features such as interceptors, cancellation, upload, and download

The package is added to `pubspec.yaml`, then the project downloads it using:

```bash
flutter pub get
```

---

### 9. Asynchronous API Requests

API requests take time because data comes through the internet.

Dart uses:

- `Future` — a value that will be available later
- `async` — marks a function that contains asynchronous work
- `await` — waits for the result without freezing the full app

```text
Request starts
     ↓
UI stays active
     ↓
Response arrives later
```

This keeps the Flutter UI responsive.

---

### 10. Basic API Call Flow

```text
1. Send the HTTP request
2. Wait for the response
3. Check the status code
4. Decode the JSON body
5. Convert JSON into a Dart model
6. Return data or show an error
```

API logic should usually stay inside a separate service class or file. This keeps widgets clean.

---

### 11. Showing API Data in the UI

`FutureBuilder` can handle three common states:

```text
Loading → Success → Error
```

- **Loading:** Show a progress indicator
- **Success:** Show the received data
- **Error:** Show a useful error message

---

## Quick Summary

```text
Flutter App
    ↓ HTTP Request
REST API
    ↓
Server and Database
    ↓ HTTP Response + Status Code + JSON
Flutter App
    ↓
Convert JSON to Model
    ↓
Show Loading, Data, or Error
```

### Important Rules

- Use the correct HTTP method.
- Check the status code.
- Handle errors properly.
- Convert JSON into typed Dart models.
- Keep API logic separate from UI code.
