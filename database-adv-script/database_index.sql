-- Create index on users.id (usually already PRIMARY KEY, but shown for completeness)
CREATE INDEX IF NOT EXISTS idx_users_id ON users(id);
-- Create index on bookings.user_id (used in joins)
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
-- Create index on bookings.property_id (used in joins and grouping)
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
-- Create index on bookings.start_date (useful for range filters or partitioning)
CREATE INDEX IF NOT EXISTS idx_bookings_start_date ON bookings(start_date);
-- Create index on reviews.property_id (used in joins)
CREATE INDEX IF NOT EXISTS idx_reviews_property_id ON reviews(property_id);
-- Create index on properties.id (commonly joined, possibly primary key)
CREATE INDEX IF NOT EXISTS idx_properties_id ON properties(id);