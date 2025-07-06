# Performance Monitoring Report – Airbnb Database

## Overview

We monitored and refined the performance of critical SQL queries using `EXPLAIN ANALYZE` to uncover execution bottlenecks and applied targeted schema improvements.

---

## Query 1: Count Bookings per User

### Original Query:
```sql
SELECT u.id, u.name, COUNT(b.id) AS total_bookings
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.id;
