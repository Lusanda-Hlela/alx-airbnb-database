# Partitioning Performance Report – Airbnb Database

## Partitioning Strategy

- The `bookings` table was partitioned by range on the `start_date` column.
- Created yearly partitions (e.g., `bookings_2023`, `bookings_2024`).

## Performance Testing

Test query:
```sql
SELECT * FROM bookings
WHERE start_date >= '2023-06-01' AND start_date < '2023-07-01';


INSERT INTO bookings SELECT * FROM bookings_old;
