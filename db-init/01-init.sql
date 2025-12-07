-- Create users table if it doesn't exist
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL
);

-- Insert default admin user with BCrypt hashed password
INSERT INTO users (username, password, role)
VALUES ('admin', '$2a$10$7Z6KGa.MS9tb9MGi9JvM3eRFbcu3tbP.mHhC3bR2OkZCtdtg.z1bK', 'ADMIN')
ON CONFLICT (username) DO NOTHING;
