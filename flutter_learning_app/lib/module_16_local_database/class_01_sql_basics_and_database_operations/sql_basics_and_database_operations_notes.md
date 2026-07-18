# Module 16: Local Database

## Class 1: SQL Basics and Database Operations

---

## 1. What is a Database?

A database is an organized place where an application stores and manages data.

Examples of stored data:

- User information
- Notes and tasks
- Product details
- Login information
- App settings
- Messages
- Cart items

A database helps an app to:

- Save data
- Read data
- Update data
- Delete data
- Search data easily

---

## 2. What is a Local Database?

A local database stores data directly on the user's device.

The data may remain available even after:

- Closing the app
- Restarting the app
- Turning off the internet
- Restarting the device

Example:

A Todo app can save tasks on the phone.  
The user can open and view those tasks without an internet connection.

---

## 3. Why Do We Use a Local Database?

### Offline Capability

A local database allows users to access app data without an internet connection.

Example:

A user can read saved notes even when mobile data or Wi-Fi is unavailable.

### Better Performance

Data is read directly from the device.

Therefore, the app does not always need to wait for a server response.

This makes the app:

- Faster
- More responsive
- Less dependent on network speed

### User Privacy

Local data stays on the user's device unless the app sends it to a server.

This can reduce unnecessary exposure of private data.

However, sensitive information should still be encrypted and protected.

### Reduced Internet and Server Cost

The app can read saved data from the device instead of repeatedly downloading it.

This reduces:

- Internet usage
- Server requests
- Server load
- Bandwidth cost

---

## 4. What is an Offline-First App?

An offline-first app mainly works with locally stored data.

The app can work without the internet and synchronize data with a server when the connection becomes available.

Basic flow:

```text
User performs an action
        ↓
Data is saved locally
        ↓
App continues working offline
        ↓
Internet becomes available
        ↓
Local data can be synchronized with the server
```

---

# Today's Class Notes

## 5. Best Practices for a Local Database

### Design the Schema Carefully

Plan the database structure before writing code.

Decide:

- What data will be stored
- Which tables or objects are needed
- Which data type each field will use
- How different data items are related

A good structure makes the database easier to understand, update, and maintain.

### Handle Migrations

A migration updates an old database structure when the app changes.

Example:

```text
Old table: id, name
New table: id, name, phone
```

A proper migration adds the new field without deleting the user's old data.

### Optimize Queries

A query should read only the data that is needed.

Good practices:

- Use conditions to filter data
- Avoid loading all records unnecessarily
- Avoid repeating the same query many times
- Use indexes for frequently searched fields when needed

Efficient queries make the app faster.

### Secure Sensitive Data

Do not store passwords, tokens, or private information as plain text.

Sensitive data should be encrypted or stored with a secure-storage solution.

A local database is stored on the device, but that does not make it automatically secure.

---

## 6. Syncing Local Data with a Backend

Local data can be uploaded to a remote server when the internet becomes available.

Basic flow:

```text
User changes data
        ↓
Data is saved locally
        ↓
Internet becomes available
        ↓
Local data is sent to the server
```

### Sync Strategies

Data can be synchronized in different ways:

- **Periodic sync:** Sync after a fixed time
- **Event-based sync:** Sync after an action, such as saving a task
- **Manual sync:** The user presses a sync button

### Conflict Resolution

A conflict happens when the same data is changed both locally and on the server.

The app needs a rule to decide which change should be kept.

Common rules:

- Keep the newest change
- Keep the server version
- Ask the user to choose

### Timestamps and Versions

A timestamp records when data was changed.

A version number records which copy is newer.

These values help the app detect and solve sync conflicts.

### Resource Efficiency

Syncing uses internet data and battery power.

The app should avoid unnecessary or repeated synchronization.

---

## 7. Real-World Uses of Local Databases

### Note-Taking Apps

Notes can be saved instantly and opened without the internet.

### Todo and Task Apps

Users can create, read, update, and delete tasks offline.

### Offline Maps

Map information and routes can be saved on the device for offline navigation.

### E-Commerce Carts

Cart items can remain saved even if the internet disconnects or the app closes.

---

## 8. Why SQLite?

SQLite is a relational database that stores data in tables.

It is useful when the app has structured data, relationships, and complex queries.

### ACID Compliance

ACID helps database transactions remain safe and reliable.

- **Atomicity:** A transaction finishes fully or not at all
- **Consistency:** Data stays valid
- **Isolation:** Multiple operations do not incorrectly affect each other
- **Durability:** Saved data remains after the transaction completes

### Complex Queries

SQLite supports operations such as:

- `WHERE`
- `JOIN`
- `GROUP BY`
- `COUNT()`
- `SUM()`
- `AVG()`

These operations help filter, combine, and calculate data.

### Data Integrity

SQLite can protect data using:

- Primary keys
- Foreign keys
- Unique constraints
- Check constraints

These rules help prevent invalid or duplicate data.

### Mature and Reliable

SQLite has been used for many years and is stable for production applications.

---

## 9. Setting Up SQLite in Flutter

### Step 1: Add Packages

Add the required packages to `pubspec.yaml`.

```yaml
dependencies:
  sqflite:
  path:
```

- `sqflite` is used for SQLite database operations.
- `path` is used to build the database file path safely.

### Step 2: Import the Libraries

```dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
```

### Step 3: Initialize the Database

The app needs to:

1. Find the database folder
2. Create the database file path
3. Open or create the database
4. Set the database version

### Step 4: Create Tables

Tables are normally created inside the database's first-time creation callback.

Example:

```sql
CREATE TABLE tasks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  isDone INTEGER NOT NULL
);
```

---

## 10. CRUD Operations

CRUD contains the four main database operations.

| CRUD | SQL Command | Work |
|---|---|---|
| Create | `INSERT` | Add new data |
| Read | `SELECT` | Get saved data |
| Update | `UPDATE` | Change existing data |
| Delete | `DELETE` | Remove data |

### Create

```sql
INSERT INTO tasks (title, isDone)
VALUES ('Learn SQLite', 0);
```

### Read

```sql
SELECT * FROM tasks;
```

### Update

```sql
UPDATE tasks
SET isDone = 1
WHERE id = 1;
```

### Delete

```sql
DELETE FROM tasks
WHERE id = 1;
```

`WHERE` is very important in `UPDATE` and `DELETE`.

Without `WHERE`, many or all records may be changed or deleted.

---

## Quick Revision

```text
Local database
→ Stores data on the device

Offline-first app
→ Works with local data without depending fully on the internet

Schema
→ The planned structure of the database

Migration
→ Safely updates an old database structure

Sync
→ Sends local data to a backend or receives server data

SQLite
→ Relational, table-based, and SQL-based database

CRUD
→ Create, Read, Update, Delete
```