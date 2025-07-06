# Optimization Report – Airbnb Database

This report documents the optimization of a complex SQL query joining bookings, users, properties, and payments.

## Initial Query

The original query retrieves all bookings along with their user, property, and payment details. It joins four tables and selects all relevant columns.

**Issues:**
- Selected too many columns (some unused)
- No ordering or filtering, leading to full scans
- Joins may perform poorly without indexes

## EXPLAIN ANALYZE Output (Before Indexing)

The execution plan showed:
- Sequential scans on large tables
- Nested loops on joins
- Higher execution time (especially for bookings > 10K)

## Optimized Query

**Improvements:**
- Selected only relevant columns
- Added aliasing for readability
- Ordered by `start_date`
- Ensured indexes on `bookings.user_id`, `bookings.property_id`, `payments.booking_id`

**EXPLAIN ANALYZE Output (After Optimization):**
- Hash joins used
- Index scans where available
- Reduced total cost and execution time

## Conclusion

Optimizing query performance involves selecting only what’s needed, avoiding unnecessary joins, and ensuring indexed paths are used for joining/filtering.

## Files

- `perfomance.sql`: Contains original and optimized queries
- `optimization_report.md`: This documentation
