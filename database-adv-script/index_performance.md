# Index Performance Evaluation – Airbnb Database

This document summarizes the impact of adding indexes to improve query performance.

## Indexed Columns

| Table      | Column      | Reason for Indexing            |
| ---------- | ----------- | ------------------------------ |
| users      | id          | Used in JOINs                  |
| bookings   | user_id     | Used in JOIN and WHERE         |
| bookings   | property_id | Used in aggregations and JOINs |
| bookings   | start_date  | Often filtered by date ranges  |
| reviews    | property_id | JOIN with properties           |
| properties | id          | JOIN with bookings and reviews |

## Before Indexing

**Query:**

```sql
EXPLAIN
SELECT
    users.name,
    COUNT(bookings.id) AS total_bookings
FROM
    users
JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id;
```
