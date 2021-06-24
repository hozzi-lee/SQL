-- Q01)
SELECT
    first_name
    || ' '
    || last_name   이름,
    salary         월급,
    phone_number   전화번호,
    hire_date      입사일
FROM
    employees
ORDER BY
    hire_date ASC;


-- Q02)
SELECT
    job_title   업무이름,
    max_salary  최고월급
FROM
    jobs
ORDER BY
    max_salary DESC;


-- Q03)
SELECT
    first_name      이름,
    manager_id      매니저아이디,
    commission_pct  "커미션 비율",
    salary          월급
FROM
    employees
WHERE
    manager_id IS NOT NULL
    AND commission_pct IS NULL
    AND salary > 3000;


-- Q04)
SELECT
    job_title   업무이름,
    max_salary  최고월급
FROM
    jobs
WHERE
    max_salary >= 10000
ORDER BY
    max_salary DESC;


-- Q05)
SELECT
    first_name                  이름,
    salary                      월급,
    nvl(commission_pct, 0)      "커미션 비율"
FROM
    employees
WHERE
        10000 <= salary
    AND salary > 14000
ORDER BY
    salary DESC;


-- Q06)
SELECT
    first_name                            이름,
    salary                                월급,
    to_char(hire_date, 'yyyy-mm-dd')      입사일,
    department_id                         부서번호
FROM
    employees
WHERE
    department_id IN ( 10, 90, 100 );


-- Q07)
SELECT
    first_name  이름,
    salary      월급
FROM
    employees
WHERE
    first_name LIKE '%S%'
    OR first_name LIKE '%s%';


-- Q08)
SELECT
    department_name 부서이름
FROM
    departments
ORDER BY
    length(department_name) DESC;


-- Q09)
SELECT
    upper(country_name) 나라이름
FROM
    countries
WHERE
    region_id IS NOT NULL
ORDER BY
    country_name ASC;


-- Q10)
SELECT
    first_name 이름,
    salary 월급,
    replace(phone_number, '.', '-') 전화번호,
    hire_date 입사일
FROM
    employees
WHERE
    hire_date < '03/12/31';