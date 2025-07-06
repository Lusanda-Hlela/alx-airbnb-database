# Partitioning Performance Report – Airbnb Database

## Overview

To optimize query performance on the large `bookings` table, we implemented **table partitioning** based on the `start_date` column. This improves performance when querying bookings by date ranges, especially for high-volume datasets.

## Partitioning Strategy

- The `bookings` table was recreated using **range partitioning** on the `start_date` column.
- Created two partitions:
  - `bookings_2023`: for dates from `2023-01-01` to `2024-01-01`
  - `bookings_2024`: for dates from `2024-01-01` to `2025-01-01`
- Indexes were added to each partition on `start_date` for faster access.

## SQL Query Used to Test

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date >= '2023-06-01' AND start_date < '2023-07-01';
