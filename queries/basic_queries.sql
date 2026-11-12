CREATE TABLE Worker (
                        WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        FIRST_NAME CHAR(25),
                        LAST_NAME CHAR(25),
                        SALARY INT(15),
                        JOINING_DATE DATE,
                        DEPARTMENT CHAR(25)
);

INSERT INTO Worker
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
                                                                         (001, 'Monika', 'Arora', 100000, '14-02-20', 'HR'),
                                                                         (002, 'Niharika', 'Verma', 80000, '14-06-11', 'Admin'),
                                                                         (003, 'Vishal', 'Singhal', 300000, '14-02-20', 'HR'),
                                                                         (004, 'Amitabh', 'Singh', 500000, '14-02-20', 'Admin'),
                                                                         (005, 'Vivek', 'Bhati', 500000, '14-06-11', 'Admin'),
                                                                         (006, 'Vipul', 'Diwan', 200000, '14-06-11', 'Account'),
                                                                         (007, 'Satish', 'Kumar', 75000, '14-01-20', 'Account'),
                                                                         (008, 'Geetika', 'Chauhan', 90000, '14-04-11', 'Admin');

CREATE TABLE Bonus (
                       WORKER_REF_ID INT,
                       BONUS_AMOUNT INT(10),
                       BONUS_DATE DATE,
                       FOREIGN KEY (WORKER_REF_ID)
                           REFERENCES Worker(WORKER_ID)
                           ON DELETE CASCADE
);

INSERT INTO Bonus
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
                                              (001, 5000, '16-02-20'),
                                              (002, 3000, '16-06-11'),
                                              (003, 4000, '16-02-20'),
                                              (001, 4500, '16-02-20'),
                                              (002, 3500, '16-06-11');
CREATE TABLE Title (
                       WORKER_REF_ID INT,
                       WORKER_TITLE CHAR(25),
                       AFFECTED_FROM DATE,
                       FOREIGN KEY (WORKER_REF_ID)
                           REFERENCES Worker(WORKER_ID)
                           ON DELETE CASCADE
);

INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
                                                 (001, 'Manager', '2016-02-20'),
                                                 (002, 'Executive', '2016-06-11'),
                                                 (008, 'Executive', '2016-06-11'),
                                                 (005, 'Manager', '2016-06-11'),
                                                 (004, 'Asst. Manager', '2016-06-11'),
                                                 (007, 'Executive', '2016-06-11'),
                                                 (006, 'Lead', '2016-06-11'),
                                                 (003, 'Lead', '2016-06-11');

-- Write an SQL query to display the details of employees who belong to the HR department

select WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT
from worker
where department = 'HR';

-- Write an SQL query to display the first name, last name, and salary of employees whose salary is greater than 100000.

select FIRST_NAME, LAST_NAME, SALARY
from worker
where salary > 100000;

-- Write an SQL query to display employees whose department is either Admin or Account.

select WORKER_ID, FIRST_NAME, DEPARTMENT
from worker
where department in ('Admin','Account');

-- Write an SQL query to display employees whose salary is between 75000 and 300000.

select WORKER_ID, FIRST_NAME, DEPARTMENT, SALARY
from worker
where salary between 75000 and 300000;

-- Write an SQL query to display all employee details in ascending order of their salary.

select WORKER_ID, FIRST_NAME, DEPARTMENT, SALARY
from worker
order by salary;

-- Write an SQL query to display employee details in descending order of their joining date.

select WORKER_ID, FIRST_NAME, DEPARTMENT, JOINING_DATE
from worker
order by JOINING_DATE desc;

-- Write an SQL query to display employees in ascending order of department and descending order of salary.

SELECT *
FROM worker
ORDER BY department asc, salary desc;

-- Write an SQL query to find the total number of employees in each department.

select department,count(department) as total_emp
from worker
group by department;

-- Write an SQL query to find the average salary of employees in each department.

select department,avg(salary) as average
from worker
group by department;

-- Write an SQL query to find the maximum salary in each department.

select department,max(salary) as maximum_salary
from worker
group by department;

-- Write an SQL query to display departments having more than 2 employees using the HAVING clause.

select department,count(department) as total_emp
from worker
group by department
having total_emp > 2;

-- Write an SQL query to display employees whose salary is greater than the average salary of all employees.

select worker_id, first_name, salary
from worker
where salary > (
    select avg(salary) from worker
);

-- Write an SQL query to display employees who belong to the same department as Monika.

select worker_id, first_name
from worker
where department = (
    select department from worker where first_name = 'Monika'
);

-- Write an SQL query to display employees who have received a bonus using a subquery.

select worker_id, first_name
from worker
where worker_id in (
    select WORKER_REF_ID from bonus
);

-- Write an SQL query to display employees whose salary is greater than the salary of Niharika.

select *
from worker
where salary > (
    select salary from worker where first_name = 'Niharika'
);

-- Write an SQL query using INNER JOIN to display employee first name, last name, and their bonus amount.

select w.first_name,w.last_name,b.bonus_amount
from worker w
         inner join bonus b
                    on w.worker_id = b.worker_ref_id;

-- Write an SQL query using LEFT JOIN to display all employees along with their bonus amounts, including employees who have not received any bonus.

select w.first_name,w.last_name,b.bonus_amount
from worker w
         left join bonus b
                   on w.worker_id = b.worker_ref_id;

-- Write an SQL query using INNER JOIN to display employee names and their respective job titles.

select w.first_name,w.last_name,t.worker_title
from worker w
         inner join title t
                    on w.worker_id = t.worker_ref_id;

-- Write an SQL query using JOIN to display employee names, departments, and bonus amounts for employees who have received bonuses.

select w.first_name,w.last_name,w.department,b.bonus_amount
from worker w
         inner join bonus b
                    on w.worker_id = b.worker_ref_id;

-- Write an SQL query using JOIN to display employee names, salaries, and job titles of employees whose job title is Manager.

select w.first_name,w.last_name,w.salary,t.worker_title
from worker w
         inner join title t
                    on w.worker_id = t.worker_ref_id
where t.worker_title = 'Manager';
