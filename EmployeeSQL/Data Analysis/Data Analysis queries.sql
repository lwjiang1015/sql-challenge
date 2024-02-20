--Data Analysis

--1. list the employee number, last name, first name, sex, and salary of each employee

--select the data from the employee table and salary table

select employees.emp_no , employees.last_name, employees.first_name, 
       employees.sex, salaries.salary
from employees
inner join salaries on employees.emp_no = salaries.emp_no ;

--2. list the first name, last name, and hire date for the employees who were hired in 1986.

select first_name, last_name, hire_date
from employees
where hire_date like '%1986%' 
;

--3. list the manager of each department along with their department number, department name, employee number, last nmae, and first name

select titles.title, dept_manager.dept_no, departments.dept_name, dept_manager.emp_no , 
	employees.last_name, employees.first_name
from employees
left join titles on employees.emp_title_id = titles.title_id
right join dept_manager on dept_manager.emp_no = employees.emp_no 
left join departments on dept_manager.dept_no = departments.dept_no ;

--4. list the department number for each employee along with that employee's employee number, last name, 
   --first name, and department name

select dept_emp.dept_no, departments.dept_name, dept_emp.emp_no , employees.last_name, employees.first_name
from employees
left join dept_emp on employees.emp_no = dept_emp.emp_no
left join departments on dept_emp.dept_no = departments.dept_no ;

--5. List the first name, last name, and sex of each employee whose firt name is Hercules 
   --and show last nmae begins with the letter B
   
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%' 
;

--6. List each employee in the Sales department, including their employee number, last name, 
   --and first name

select departments.dept_name, employees.emp_no , employees.last_name, employees.first_name
from employees
left join dept_emp on employees.emp_no = dept_emp.emp_no
right join departments on dept_emp.dept_no = departments.dept_no 
where departments.dept_name = 'Sales'
;

--7. List each employee in the Sales and Development departments, including their employee number, 
   --last name, first name, and department name

select departments.dept_name, employees.emp_no , employees.last_name, employees.first_name
from employees
left join dept_emp on employees.emp_no = dept_emp.emp_no
right join departments on dept_emp.dept_no = departments.dept_no 
where departments.dept_name = 'Sales' or departments.dept_name = 'Development'
;

--8. List the frequency counts, in descending order, of all the employee last names 
   --(that is, how many employess share each last name)

select employees.last_name, count(employees.last_name)
from employees
group by employees.last_name
order by employees.last_name desc ;
