# Database Normalization - AirBnB Clone

This document explains the normalization process applied to the AirBnB database design, ensuring the schema is in **Third Normal Form (3NF)**.

---

## 1. First Normal Form (1NF)

**Goal:** Ensure that all fields contain atomic (indivisible) values.

### ✅ Applied:
- All attributes (e.g., names, emails, ratings) contain atomic data types like `VARCHAR`, `INTEGER`, `DATE`.
- No repeating groups or arrays are present.
- Example: `phone_number` is a single value, not a list.

---

## 2. Second Normal Form (2NF)

**Goal:** Ensure all non-primary key attributes are fully dependent on the primary key.

### ✅ Applied:
- Each table has a single-column Primary Key (e.g., `user_id`, `booking_id`).
- There are no composite primary keys.
- All fields in each table depend solely on their own PK.
- Example: In `Booking`, `total_price`, `start_date`, `status` all depend on `booking_id`.

---

## 3. Third Normal Form (3NF)

**Goal:** Ensure no transitive dependencies exist (i.e., no non-key attribute depends on another non-key attribute).

### ✅ Applied:
- No field in any table indirectly depends on another non-key attribute.
- Foreign keys like `host_id`, `user_id`, `property_id` link appropriately across entities without introducing transitive dependencies.
- Example: In `Property`, `location` and `price_per_night` depend directly on `property_id` — not on `host_id`.

---

## Conclusion

After reviewing all entities and attributes in the ERD, the database design adheres to:
- ✅ 1NF: All fields are atomic.
- ✅ 2NF: Full functional dependency on PKs.
- ✅ 3NF: No transitive dependencies.

Thus, the schema is fully normalized to **Third Normal Form (3NF)** and ready for implementation.
