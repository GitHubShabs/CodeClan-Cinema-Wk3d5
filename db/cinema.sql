DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS films;

CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  directors_name VARCHAR(255)
);

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  customer_name VARCHAR(255),
  film_id INT4 REFERENCES films(id)
);
