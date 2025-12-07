-- Create users table if it doesn't exist
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL
);

-- Insert default admin user
INSERT INTO users (username, password, role)
VALUES ('admin', 'admin123', 'ADMIN')
ON CONFLICT (username) DO NOTHING;
