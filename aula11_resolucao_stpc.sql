USE hr;

-- 1.
-- Quais os empregados (primeiro nome e último nome) que recebem um salário superior ao empregado cujo id é 163
SELECT first_name, last_name 
FROM employees 
WHERE salary > 
( SELECT salary  
FROM employees 
WHERE employee_id=163
);


-- Quais os empregados (primeiro nome, último nome, salário e departamento id) que recebem salário igual ao salário mínimo de algum departamento.
SELECT first_name, last_name, salary, department_id  
FROM employees  
WHERE salary IN  
( SELECT MIN(salary)  
FROM employees  
GROUP BY department_id 
);


-- Quais os empregados (id, primeiro nome, último nome) dos empregados que ganham acima do salário médio
SELECT employee_id, first_name,last_name  
FROM employees  
WHERE salary >  
( SELECT AVG(salary)  
FROM employees 
);


-- Quais os empregados (primeiro nome, departamento id, job id e nome do departamento) dos empregados que trabalham no departamento Finance.
SELECT 
	e.first_name, 
	e.job_id, 
	(SELECT DEPARTMENT_ID FROM departments d2 where d2.DEPARTMENT_ID = e.DEPARTMENT_ID) DPT_ID, 
	(SELECT DEPARTMENT_NAME FROM departments d2 where d2.DEPARTMENT_ID = e.DEPARTMENT_ID) DPT_NAME
FROM employees e 
WHERE e.DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM departments d2 where d2.DEPARTMENT_NAME = 'Finance');


-- Quais os empregados cujo salário está acima da média mas abaixo de 10000.
SELECT *  
FROM employees  
WHERE salary >  
( SELECT AVG(salary)  
FROM employees 
) AND SALARY < 10000;


-- Quais os empregados que não trabalham nos departamentos dos managers cujo id é entre 100 e 200.
SELECT * 
FROM employees 
WHERE department_id NOT IN 
(SELECT department_id 
FROM departments 
WHERE manager_id BETWEEN 100 AND 200);


-- Quais os empregados que recebem o segundo salário mais elevado.
SELECT * 
FROM employees 
WHERE employee_id IN 
(SELECT employee_id 
FROM employees  
WHERE salary = 
(SELECT MAX(salary) 
FROM employees 
WHERE salary < 
(SELECT MAX(salary) 
FROM employees)));


-- Quais os empregados (id primeiro nome e salario) que recebem acima da média e trabalham no mesmo departamento onde algum nome empregado contenha a letra 'J'.
-- após TPC


-- Quais os empregados (primeiro nome) que trabalham nos departamentos de United Kingdom.
-- após TPC


-- Quais os empregados (primeiro nome, último nome, salário e job id) que recebem acima da média de salários para a sua função.
-- após TPC


