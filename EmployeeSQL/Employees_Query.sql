 

-- question 1 List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
left join salaries as s 
on e.emp_no = s.emp_no
order by e.emp_no 

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
from departments as d 
join department_managers as dm
on d.dept_no = dm.dept_no 
join employees as e
on dm.emp_no = e.emp_no 

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select d.dept_no, d.dept_name, de.emp_no, e.first_name, e.last_name
from departments as d
join department_employees as de
on d.dept_no = de.dept_no 
join employees as e
on de.emp_no = e.emp_no 

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.


select first_name, last_name, sex
from employees 
where first_name = 'Hercules' and last_name like 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name

select d.dept_name, e.first_name, e.last_name, e.emp_no
from employees as e , departments as d 
where dept_name = 'Sales'

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
select d.dept_name, e.first_name, e.last_name, e.emp_no
from employees as e , departments as d 
where dept_name = 'Sales' or dept_name = 'Development'
 
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

select last_name, count (last_name) last_name_count
from employees 
group by last_name 
order by last_name desc
