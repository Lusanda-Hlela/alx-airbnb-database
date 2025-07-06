-- Create indexes to optimize query performance
-- Indexes on frequently joined or filtered columns
CREATE INDEX IF NOT EXISTS idx_users_id ON users(id);
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_start_date ON bookings(start_date);
CREATE INDEX IF NOT EXISTS idx_reviews_property_id ON reviews(property_id);
CREATE INDEX IF NOT EXISTS idx_properties_id ON properties(id);
-- Analyze performance of a join query before/after indexing
EXPLAIN ANALYZE
SELECT users.name,
  COUNT(bookings.id) AS total_bookings
FROM users
  JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id;