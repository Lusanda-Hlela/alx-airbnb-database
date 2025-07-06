-- Users Table
CREATE TABLE IF NOT EXISTS users (
  user_id UUID PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20),
  role VARCHAR(10) CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Properties Table
CREATE TABLE IF NOT EXISTS properties (
  property_id UUID PRIMARY KEY,
  host_id UUID REFERENCES users(user_id),
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  location VARCHAR(255) NOT NULL,
  pricepernight DECIMAL NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Bookings Table
CREATE TABLE IF NOT EXISTS bookings (
  booking_id UUID PRIMARY KEY,
  property_id UUID REFERENCES properties(property_id),
  user_id UUID REFERENCES users(user_id),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL NOT NULL,
  status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Payments Table
CREATE TABLE IF NOT EXISTS payments (
  payment_id UUID PRIMARY KEY,
  booking_id UUID REFERENCES bookings(booking_id),
  amount DECIMAL NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method VARCHAR(20) CHECK (
    payment_method IN ('credit_card', 'paypal', 'stripe')
  ) NOT NULL
);
-- Reviews Table
CREATE TABLE IF NOT EXISTS reviews (
  review_id UUID PRIMARY KEY,
  property_id UUID REFERENCES properties(property_id),
  user_id UUID REFERENCES users(user_id),
  rating INTEGER CHECK (
    rating BETWEEN 1 AND 5
  ) NOT NULL,
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Messages Table
CREATE TABLE IF NOT EXISTS messages (
  message_id UUID PRIMARY KEY,
  sender_id UUID REFERENCES users(user_id),
  recipient_id UUID REFERENCES users(user_id),
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_properties_property_id ON properties(property_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);