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