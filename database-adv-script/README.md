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

## Author

- ALX Backend ProDev Student
