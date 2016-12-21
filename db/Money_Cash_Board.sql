DROP TABLE transaction;

CREATE TABLE transaction (
  id serial4 primary key,
  merchant_name varchar(255),
  value float,
  category varchar(255),
  t_date_year integer,
  t_date_month integer,
  t_date_day integer,
  t_date date
);