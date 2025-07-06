-- Total number of bookings made by each user
SELECT users.id AS user_id,
  users.name,
  COUNT(bookings.id) AS total_bookings
FROM users
  JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id,
  users.name;
-- Rank properties by number of bookings
SELECT property_id,
  COUNT(*) AS total_bookings,
  RANK() OVER (
    ORDER BY COUNT(*) DESC
  ) AS booking_rank
FROM bookings
GROUP BY property_id;