-- =========================
-- P1: Database Schema Design
-- =========================

-- Drop tables if already exist (to avoid errors while re-running)
DROP TABLE IF EXISTS Show;
DROP TABLE IF EXISTS Screen;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Theatre;

-- =========================
-- Create Tables
-- =========================

CREATE TABLE Theatre (
    theatre_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Screen (
    screen_id INT PRIMARY KEY AUTO_INCREMENT,
    theatre_id INT,
    screen_name VARCHAR(50),
    total_seats INT,
    FOREIGN KEY (theatre_id) REFERENCES Theatre(theatre_id)
);

CREATE TABLE Movie (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    language VARCHAR(50),
    duration_minutes INT
);

CREATE TABLE Show (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    screen_id INT,
    show_date DATE,
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (screen_id) REFERENCES Screen(screen_id)
);

-- =========================
-- Sample Data
-- =========================

INSERT INTO Theatre (name, location) VALUES 
('PVR Nexus', 'Chennai');

INSERT INTO Screen (theatre_id, screen_name, total_seats) VALUES
(1, 'Screen 1', 150),
(1, 'Screen 2', 120);

INSERT INTO Movie (title, language, duration_minutes) VALUES
('Dasara', 'Telugu', 150),
('Youth', 'Tamil', 140),
('Kara', 'Tamil', 135);

INSERT INTO Show (movie_id, screen_id, show_date, start_time, end_time) VALUES
(1, 1, '2026-04-25', '12:15:00', '14:45:00'),
(2, 1, '2026-04-25', '16:10:00', '18:30:00'),
(2, 1, '2026-04-25', '20:20:00', '22:40:00'),
(3, 2, '2026-04-25', '13:15:00', '15:30:00');
