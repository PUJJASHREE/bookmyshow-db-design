# bookmyshow-db-design
Database design for BookMyShow-like system

# BookMyShow Database Design
## Problem Statement
Design a system where for a given theatre and selected date, we can view all movies and their show timings.
## P1 - Database Design

### 1. Entities and Attributes

#### Theatre
- theatre_id (Primary Key)
- name
- location

#### Screen
- screen_id (Primary Key)
- theatre_id (Foreign Key)
- screen_name
- total_seats

#### Movie
- movie_id (Primary Key)
- title
- language
- duration_minutes

#### Show
- show_id (Primary Key)
- movie_id (Foreign Key)
- screen_id (Foreign Key)
- show_date
- start_time
- end_time

#### Seat (Optional)
- seat_id (Primary Key)
- screen_id (Foreign Key)
- seat_number
- seat_type

### 2. Table Creation

- CREATE TABLE Theatre (
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

### 3. Add Sample Data

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
(3, 2, '2026-04-25', '13:15:00', '15:30:00');

### 4. Add Normalization

### Normalization

- 1NF: All attributes contain atomic values (no repeating groups)
- 2NF: No partial dependency (all columns depend on full primary key)
- 3NF: No transitive dependency (non-key attributes depend only on primary key)
- BCNF: Every determinant is a candidate key


“P1 Completed”
