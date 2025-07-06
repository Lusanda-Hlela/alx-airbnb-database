# Advanced SQL Joins – Airbnb Database

This script demonstrates complex SQL queries using various types of joins in the Airbnb database schema.

## Queries

### 1. INNER JOIN: Bookings and Users
- Retrieves all bookings with their associated user information.
- Filters out bookings not linked to a user.

### 2. LEFT JOIN: Properties and Reviews
- Lists all properties, including those with no reviews.
- Helpful for identifying unrated properties.
- Results are ordered by property ID for consistency.


### 3. FULL OUTER JOIN: Users and Bookings
- Retrieves all users and all bookings, including unlinked ones.
- Implemented using `UNION` to simulate FULL OUTER JOIN in MySQL.

## Files

- `joins_queries.sql` – Contains SQL scripts.
- `README.md` – Explanation and documentation.


# Advanced SQL Subqueries – Airbnb Database

This script demonstrates the use of both correlated and non-correlated subqueries for data analysis.

## Queries

### 1. Non-Correlated Subquery: Properties with Average Rating > 4.0
- Retrieves all properties with an average rating higher than 4.0.
- Uses a `HAVING` clause in a subquery on the `reviews` table.

### 2. Correlated Subquery: Users with More Than 3 Bookings
- Selects users who have made more than 3 bookings.
- For each user, a subquery counts the number of bookings.
- The inner query is dependent on each outer row (correlated).

## Files

- `subqueries.sql` – Contains SQL subquery implementations.
- `README.md` – Documentation of queries and logic.

# Aggregations and Window Functions – Airbnb Database

This script includes SQL queries demonstrating how to use aggregation and window functions to analyze booking data.

## Queries

### 1. Total Bookings per User
- Uses `COUNT` and `GROUP BY` to calculate how many bookings each user has made.
- Joins `users` and `bookings` tables.

### 2. Ranking Properties by Bookings
- Uses `ROW_NUMBER()` to assign a unique rank to each property based on booking volume.
- Also includes a `RANK()` version to demonstrate how ties are handled (same rank for same booking count).

## Files

- `aggregations_and_window_functions.sql` – SQL script.
- `README.md` – Documentation.

## Author

- ALX Backend ProDev Student
