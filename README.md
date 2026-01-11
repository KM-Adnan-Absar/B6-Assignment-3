 Vehicle Rental Management System (PostgreSQL)
 Project Overview

The Vehicle Rental Management System is a relational database project built using PostgreSQL that manages:

Users (Admin & Customers)

Vehicles (Car, Bike, Truck)

Bookings (Rental records)

This project demonstrates real-world database design, table relationships, and important SQL queries such as:

JOIN

EXISTS

WHERE

GROUP BY

HAVING

It can be used as the backend database for any vehicle rental application.

 Objectives

Design a proper relational database

Maintain data integrity using constraints

Store and manage rental bookings

Retrieve meaningful information using SQL queries

Practice real-life SQL use cases

 Technology Used

Database: PostgreSQL

Language: SQL

 Database Schema
1. Users Table

Stores information about system users (Admin and Customers).

Column Name	Description
user_id	Primary Key
name	User name
email	Unique email
role	Admin / Customer
password	User password
phone_number	Contact number

 2. Vehicles Table
Stores information about vehicles available for rent.

Column Name	Description
vehicle_number	Primary Key
vehicle_name	Vehicle name
type	car / bike / truck
model	Model year
registration_number	Unique registration
rental_price	Price per day
availability_status	available / rented / maintanance

 3. Bookings Table

Stores booking records.

Column Name	Description
booking_id	Primary Key
user_id	Foreign Key → users
vehicle_number	Foreign Key → vehicles
start_date	Booking start date
end_date	Booking end date
booking_status	pending / completed / cancelled
total_cost	Total rental cost
🔗 Relationships

One User can make many Bookings

One Vehicle can have many Bookings

The Bookings table connects Users and Vehicles using Foreign Keys

 Sample Data

The database includes:

Sample users (Admin & Customers)

Sample vehicles (Car, Bike, Truck)

Sample bookings

So all queries can be tested immediately.

 QL Features Used

PRIMARY KEY

FOREIGN KEY

UNIQUE

CHECK

JOIN

EXISTS

WHERE

GROUP BY

HAVING

COUNT()


Queries Explanation
 Query 1: JOIN

Purpose:
Displays all booking information along with:

Customer name

Vehicle name

Booking dates

Status

Total cost

Concept Used:
INNER JOIN between bookings, users, and vehicles

 Query 2: EXISTS

Purpose:
Finds all vehicles that have never been booked.

Concept Used:
NOT EXISTS subquery

 Query 3: WHERE

Purpose:
Finds all vehicles that are:

Type = car

Status = available

Concept Used:
WHERE filtering

 Query 4: GROUP BY & HAVING

Purpose:

Counts total bookings per vehicle

Shows only vehicles that have more than 2 bookings

Concept Used:
COUNT(), GROUP BY, HAVING

 How to Run This Project

Install PostgreSQL

Create a new database

Open Query Tool

Run the queries.sql file

Execute the queries one by one

 Project Files

queries.sql → Contains:

Table creation

Data insertion

All required SQL queries

README.md → Project documentation

