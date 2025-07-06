-- INNER JOIN: Bookings and Users
SELECT bookings.id AS booking_id,
  bookings.property_id,
  bookings.start_date,
  bookings.end_date,
  users.id AS user_id,
  users.name AS user_name,
  users.email
FROM bookings
  INNER JOIN users ON bookings.user_id = users.id;
-- LEFT JOIN: Properties and Reviews (with ORDER BY)
SELECT properties.id AS property_id,
  properties.name AS property_name,
  reviews.id AS review_id,
  reviews.rating,
  reviews.comment
FROM properties
  LEFT JOIN reviews ON properties.id = reviews.property_id
ORDER BY properties.id;
-- FULL OUTER JOIN (simulated using UNION for MySQL)
SELECT users.id AS user_id,
  users.name,
  bookings.id AS booking_id,
  bookings.property_id,
  bookings.start_date
FROM users
  LEFT JOIN bookings ON users.id = bookings.user_id
UNION
SELECT users.id AS user_id,
  users.name,
  bookings.id AS booking_id,
  bookings.property_id,
  bookings.start_date
FROM users
  RIGHT JOIN bookings ON users.id = bookings.user_id;