
-- PROJECT: HEALTHCARE DATA QUALITY & ANALYTICS
-- SAMPLE DATA - SYNTHETIC RECORDS
-- DATABASE: PostgreSQL

-- 1. PROVIDERS
INSERT INTO providers (provider_id, provider_name, specialty) VALUES
(1, 'North Medical Center', 'Cardiology'),
(2, 'Westside Clinic', 'Primary Care'),
(3, 'Central Diagnostic Lab', 'Laboratory'),
(4, 'Sunrise Hospital', 'Emergency Medicine'),
(5, 'Green Valley Clinic', 'Orthopedics');

-- 2. MEMBERS
INSERT INTO members
(member_id, first_name, last_name, date_of_birth, registration_date)
VALUES
(1, 'John', 'Miller', '1985-04-12', '2024-01-10'),
(2, 'Sarah', 'Johnson', '1990-08-21', '2024-02-15'),
(3, 'Michael', 'Brown', '1978-11-03', '2024-03-20'),
(4, 'Emily', 'Davis', '2000-06-17', '2024-04-05'),
(5, 'David', 'Wilson', '1965-09-30', '2024-05-11'),
(6, 'John', 'Miller', '1985-04-12', '2024-01-10'),
(7, 'Olivia', 'Taylor', '1995-02-14', '2024-06-01'),
(8, 'James', 'Anderson', '1982-12-09', '2024-06-15'),
(9, 'Sophia', 'Thomas', '1972-07-25', '2024-07-01'),
(10, 'William', 'Moore', '1988-03-19', '2024-07-20');

-- 3. COVERAGE
INSERT INTO coverage
(coverage_id, member_id, start_date, end_date, coverage_status)
VALUES
(1, 1, '2024-01-01', NULL, 'ACTIVE'),
(2, 2, '2024-02-01', NULL, 'ACTIVE'),
(3, 3, '2024-03-01', '2024-12-31', 'INACTIVE'),
(4, 4, '2024-04-01', NULL, 'ACTIVE'),
(5, 5, '2024-05-01', '2024-10-31', 'INACTIVE'),
(6, 6, '2024-01-01', NULL, 'ACTIVE'),
(7, 7, '2024-06-01', NULL, 'ACTIVE'),
(8, 8, '2024-06-01', '2024-08-31', 'INACTIVE'),
(9, 9, '2024-07-01', NULL, 'ACTIVE'),
(10, 10, '2024-07-01', NULL, 'ACTIVE');

-- 4. CLAIMS
INSERT INTO claims
(claim_id, member_id, provider_id, service_date, claim_amount)
VALUES
(1001, 1, 1, '2024-08-10', 250.00),
(1002, 2, 2, '2024-08-12', 180.00),
(1003, 3, 3, '2025-02-10', 320.00),
(1004, 4, 4, '2024-08-15', 500.00),
(1005, 5, 5, '2024-11-15', 450.00),
(1006, 6, 1, '2024-08-10', 250.00),
(1007, 7, 2, '2024-09-01', 120.00),
(1008, 8, 3, '2024-09-10', 300.00),
(1009, 9, 4, '2024-09-15', 220.00),
(1010, 10, 5, '2024-09-20', 400.00);

-- 5. PAYMENTS
INSERT INTO payments
(payment_id, claim_id, payment_date, payment_amount, payment_status)
VALUES
(1, 1001, '2024-08-20', 250.00, 'PAID'),
(2, 1002, '2024-08-25', 180.00, 'PAID'),
(3, 1003, '2025-02-20', 300.00, 'PAID'),
(4, 1004, '2024-08-30', 500.00, 'PAID'),
(5, 1005, '2024-11-25', 450.00, 'PAID'),
(6, 1006, '2024-08-20', 250.00, 'PAID'),
(7, 1007, NULL, 0.00, 'PENDING'),
(8, 1008, '2024-09-20', 350.00, 'PAID'),
(9, 1009, NULL, 0.00, 'DENIED'),
(10, 1010, '2024-09-30', 400.00, 'PAID');
