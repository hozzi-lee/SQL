-- Q01)
SELECT
    COUNT(*) -- SubQuery의 행 개수 값
FROM
    employees
WHERE
    salary < (
        SELECT
            AVG(salary)
        FROM
            employees
    );


-- Q02)
SELECT
    em.employee_id    직원번호,
    em.first_name     이름,
    em.salary         급여,
    emg.avgsal        평균급여,
    emg.maxsal        최대급여
FROM
    employees  em,
    (
        SELECT
            round(AVG(salary), 3)         avgsal,
            MAX(salary)                   maxsal
        FROM
            employees
    )          emg
WHERE
        salary >= (
            SELECT
                AVG(salary) -- 1개 행
            FROM
                employees
        )
    AND salary <= (
        SELECT
            MAX(salary) -- 1개 행
        FROM
            employees
    )
ORDER BY
    salary ASC;


-- Q03)
SELECT
    location_id     도시아이디,
    street_address  거리명,
    postal_code     우편번호,
    city            도시명,
    state_province  주,
    country_id      나라아이디
FROM
    locations
WHERE
    location_id = (
        SELECT
            location_id
        FROM
            departments
        WHERE
            department_id = (
                SELECT
                    department_id
                FROM
                    employees
                WHERE
                        first_name = 'Steven'
                    AND last_name = 'King'
            )
    );


-- Q04)
SELECT
    employee_id  사번,
    first_name   이름,
    salary       급여
FROM
    employees
WHERE
    salary < ANY ( -- job_id가 'ST_MAN' 인
        SELECT
            salary
        FROM
            employees
        WHERE
            job_id = 'ST_MAN'
    )
ORDER BY
    salary DESC;


-- Q05 - 1)
SELECT
    employee_id    직원번호,
    first_name     이름,
    salary         급여,
    department_id  부서번호
FROM
    employees
WHERE
    ( department_id, salary ) IN (
        SELECT
            department_id, MAX(salary)
        FROM
            employees
        GROUP BY
            department_id
    )
ORDER BY
    salary DESC;
-- Q05 - 2)
SELECT
    emply00.employee_id      직원번호,
    emply00.first_name       이름,
    emply00.salary           급여,
    emply00.department_id    부서번호
FROM
    employees  emply00,
    (
        SELECT
            department_id,
            MAX(salary) maxs
        FROM
            employees
        GROUP BY
            department_id
    )          emply01
WHERE
        emply00.department_id = emply01.department_id
    AND emply00.salary = emply01.maxs
ORDER BY
    salary DESC;


-- Q06)
SELECT
    jobs2.job_title    업무명,
    jobs1.sumsalary    "연봉 총합"
FROM
    jobs  jobs2,
    (
        SELECT
            jobs.job_id,
            SUM(salary) sumsalary
        FROM
            employees  emply,
            jobs       jobs
        GROUP BY
            jobs.job_id
        HAVING
            emply.job_id = jobs.job_id
        ORDER BY
            sumsalary DESC
    )     jobs1
WHERE
    jobs1.job_id = jobs2.job_id;


-- Q07)
SELECT
    emply01.employee_id    직원번호,
    emply01.first_name     이름,
    emply01.salary         급여
FROM
    employees  emply01,
    (
        SELECT
            department_id,
            AVG(salary) avgsalary
        FROM
            employees
        GROUP BY
            department_id
    )          emply02
WHERE
        emply01.department_id = emply02.department_id
    AND emply01.salary > emply02.avgsalary;


-- Q08)
SELECT
    rn,
    employee_id  사번,
    first_name   이름,
    salary       급여,
    hire_date    입사일
FROM
    (
        SELECT
            ROWNUM rn,
            employee_id,
            first_name,
            salary,
            hire_date
        FROM
            (
                SELECT
                    employee_id,
                    first_name,
                    salary,
                    hire_date
                FROM
                    employees
                ORDER BY
                    hire_date ASC
            )
    )
WHERE
        11 <= rn
    AND rn <= 15;