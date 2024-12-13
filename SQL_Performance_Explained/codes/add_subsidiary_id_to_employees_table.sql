ALTER TABLE employees ADD subsidiary_id INT NOT NULL;

UPDATE employees
SET subsidiary_id = FLOOR(RAND() * 9) + 1;

CREATE INDEX index_subsidiary_id ON employees (subsidiary_id);
