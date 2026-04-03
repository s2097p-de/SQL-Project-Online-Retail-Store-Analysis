INSERT INTO customers VALUES
(1, 'Rahul', 'Delhi', '2023-01-10'),
(2, 'Anita', 'Mumbai', '2023-02-15'),
(3, 'Raj', 'Kolkata', '2023-03-20');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 70000),
(102, 'Phone', 'Electronics', 30000),
(103, 'Shoes', 'Fashion', 2000);

INSERT INTO orders VALUES
(1001, 1, '2023-04-01'),
(1002, 2, '2023-04-03'),
(1003, 1, '2023-04-05');

INSERT INTO order_details VALUES
(1001, 101, 1),
(1001, 103, 2),
(1002, 102, 1),
(1003, 103, 3);

UPDATE orders SET risk_score = 0.8 WHERE order_id = 1001;
UPDATE orders SET risk_score = 0.5 WHERE order_id = 1002;
UPDATE orders SET risk_score = 0.3 WHERE order_id = 1003;
