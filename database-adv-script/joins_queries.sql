-- INNER JOIN: Get all bookings and the users who made them
SELECT bookings.id AS booking_id,
  bookings.property_id,
  bookings.start_date,
  bookings.end_date,
  users.id AS user_id,
  users.name AS user_name,
  users.email
FROM bookings
  INNER JOIN users ON bookings.user_id = users.id;

-- LEFT JOIN: Get all properties and their reviews (if any)
SELECT properties.id AS property_id,
  properties.name AS property_name,
  reviews.id AS review_id,
  reviews.rating,
  reviews.comment
FROM properties
  LEFT JOIN reviews ON properties.id = reviews.property_id;

-- FULL OUTER JOIN simulation using UNION
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