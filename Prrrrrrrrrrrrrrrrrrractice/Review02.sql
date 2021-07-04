/*
SubQuery = 하나의 SQL 질의문 속에 다른 SQL 질의문이 포함되어 있는 형태
*/

-- SubQuery의 결과가 한개의 행(row)인 경우 연산자( =, <, >, <=, >=, <>(같지않다) ) 사용
-- 'Den' 보다 급여를 많이 받는 사람과 급여는?
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary > (
        SELECT -- 'Den'의 급여를 구하는 Query문 = 11000
            salary
        FROM
            employees
        WHERE
            first_name = 'Den'
    );

-- 급여를 가장 적게 받는 사람의 이름, 급여, 사번은?
SELECT
    first_name,
    salary,
    employee_id
FROM
    employees
WHERE
    salary = (
        SELECT -- MIN 함수의 값은 SELECT 절에서만 값이 나오기 때문에 MIN(salary)를 WHERE절에 직접 쓸 수 없다.
            MIN(salary)
        FROM
            employees
    );

-- SubQuery의 결과가 여러개의 행(row)인 경우 연산자( ANY, ALL, IN ) 사용
-- IN 연산자는 = 와 같다
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary IN ( -- employees에서 급여가 8300, 12008인 직원 출력 = salary IN (8300, 12008)
        SELECT -- 부서번호가 110인 직원들의 급여 8300, 12008
            salary
        FROM
            employees
        WHERE
            department_id = 110
        );
-- 각 부서별로 최고급여를 받는 사원
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    (department_id, salary) IN ( -- IN 앞의 컬럼값은 SubQuery의 SELECT 값과 같아야 한다.
        SELECT -- 부서별로 MAX salary값
            department_id,
            MAX(salary)
        FROM
            employees
        GROUP BY
            department_id
        );
/*
SubQuery = 하나의 SQL 질의문 속에 다른 SQL 질의문이 포함되어 있는 형태
*/

-- SubQuery의 결과가 한개의 행(row)인 경우 연산자( =, <, >, <=, >=, <>(같지않다) ) 사용
-- 'Den' 보다 급여를 많이 받는 사람과 급여는?
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary > (
        SELECT -- 'Den'의 급여를 구하는 Query문 = 11000
            salary
        FROM
            employees
        WHERE
            first_name = 'Den'
    );

-- 급여를 가장 적게 받는 사람의 이름, 급여, 사번은?
SELECT
    first_name,
    salary,
    employee_id
FROM
    employees
WHERE
    salary = (
        SELECT -- MIN 함수의 값은 SELECT 절에서만 값이 나오기 때문에 MIN(salary)를 WHERE절에 직접 쓸 수 없다.
            MIN(salary)
        FROM
            employees
    );

-- SubQuery의 결과가 여러개의 행(row)인 경우 연산자( ANY, ALL, IN ) 사용
-- IN 연산자는 = 와 같다
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary IN ( -- employees에서 급여가 8300, 12008인 직원 출력 = salary IN (8300, 12008)
        SELECT -- 부서번호가 110인 직원들의 급여 8300, 12008
            salary
        FROM
            employees
        WHERE
            department_id = 110
        );
-- 각 부서별로 최고급여를 받는 사원
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    (department_id, salary) IN ( -- IN 앞의 컬럼값은 SubQuery의 SELECT 값과 같아야 한다.
        SELECT -- 부서별로 MAX salary값
            department_id,
            MAX(salary)
        FROM
            employees
        GROUP BY
            department_id
        );

        ... ing ...