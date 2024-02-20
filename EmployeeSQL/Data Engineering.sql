CREATE TABLE departments (
    dept_no varchar(50)      NOT NULL ,
    dept_name varchar(100)   NOT NULL ,
    PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
    emp_no int            NOT NULL ,
    dept_no varchar(50)   NOT NULL ,
    PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no varchar(50)   NOT NULL ,
    emp_no  int           NOT NULL ,
    PRIMARY KEY (dept_no,emp_no) ,
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE employees (
    emp_no integer            NOT NULL,
    emp_title_id varchar(50)  NOT NULL,
    birth_date varchar(20)    NOT NULL,
    first_name varchar(50)    NOT NULL,
    last_name varchar(50)     NOT NULL,
    sex varchar(10)           NOT NULL,
    hire_date varchar(20)     NOT NULL,
    PRIMARY KEY (emp_no)
);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id 
FOREIGN KEY(emp_title_id) REFERENCES titles (title_id);

CREATE TABLE salaries (
    emp_no integer   NOT NULL,
    salary integer   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE titles (
    title_id varchar(20)  NOT NULL,
    title varchar(50)     NOT NULL,
    PRIMARY KEY (title_id)
);

--select * from titles ;
