
-- Sql

create table users  (
  
    user_id  serial PRIMARY KEY ,
    name VARCHAR (100) not NULL,
    email VARCHAR(150) unique not null,
    role varchar(20) check(role in ('Admin' , 'Customer')) NOT NULL,
    password VARCHAR(255) not NULL, 
    phone_number VARCHAR(20)
);


create table vehicles (
  
    vehicle_number  serial PRIMARY KEY ,
    vehicle_name VARCHAR (100) not NULL,
    type varchar(20) check(type in ('car' , 'bike' , 'truck')) NOT NULL,
    model varchar(100) ,
    registration_number VARCHAR(20) unique not null,
    rental_price numeric(10 , 2) not null,
    availability_status varchar(20) check (availability_status in ('available' , 'rented' , 'maintanance'))
    not null
);

create table bookings (
  booking_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  vehicle_number INT NOT NULL,
  CONSTRAINT fk_user foreign key(user_id) references users(user_id),
  CONSTRAINT fk_vehicle foreign key(vehicle_number) references vehicles(vehicle_number),
  start_date date not null , 
  end_date date not null ,
  booking_status varchar(50) check (booking_status in ('pending' , 'completed', 'cancelled')) not null , 
  total_cost numeric (10 , 2) not null

);

-- insert values
INSERT INTO users (name, email, role, password, phone_number) VALUES
('Adnan', 'adnan@gmail.com', 'Customer', '123456', '01711111111'),
('Rahim', 'rahim@gmail.com', 'Customer', '123456', '01822222222'),
('kader', 'admin@gmail.com', 'Admin', 'admin123', '01933333333');


INSERT INTO vehicles 
(vehicle_name, type, model, registration_number, rental_price, availability_status) 
VALUES
('Toyota Corolla', 'car', '2020', 'DHA-1234', 3000, 'available'),
('Honda Bike', 'bike', '2022', 'DHA-5678', 800, 'available'),
('Tata Truck', 'truck', '2019', 'DHA-9999', 5000, 'maintanance');

INSERT INTO bookings 
(user_id, vehicle_number, start_date, end_date, booking_status, total_cost) 
VALUES
(1, 1, '2026-01-01', '2026-01-03', 'completed', 6000),
(2, 2, '2026-01-05', '2026-01-06', 'pending', 800);



--query 1 (join)
SELECT 
    b.booking_id,
    u.name AS customer_name,
    v.vehicle_name,
    b.start_date,
    b.end_date,
    b.booking_status,
    b.total_cost
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles v ON b.vehicle_number = v.vehicle_number;


--query 2 (EXISTS)

select * from vehicles v where not exists (
  select 1 
  from bookings b where b.vehicle_number = v.vehicle_number
)

--query 3 (where)
select * from vehicles where type = 'car' and availability_status = 'available'

-- query 4: GROUP BY and HAVING

select v.vehicle_number, v.vehicle_name, count(b.booking_id) as total_bookings 
from vehicles v join bookings b on v.vehicle_number = b.vehicle_number
group by v.vehicle_number , v.vehicle_name
having count(b.booking_id) > 2