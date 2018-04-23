DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  stock_level INT,
  genre VARCHAR(255),
  year INT,
  artwork VARCHAR(255),
  cost_price DECIMAL(4,2),
  store_price DECIMAL(4,2),
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE
);
