-- Q01)
SELECT
    COUNT(manager_id) "haveMngCnt"
FROM
    employees;


-- Q02)
SELECT
    MAX(salary)                      최고임금,
    MIN(salary)                      최저임금,
    MAX(salary) - MIN(salary)        "최고임금 - 최저임금"
FROM
    employees;


-- Q03)
SELECT
    to_char(MAX(hire_date), 'yyyy"년" mm"월" dd"일"') "마지막 신입사원"
FROM
    employees;


-- Q04)
SELECT
    department_id                             부서번호,
    MAX(salary)                               최고임금,
    MIN(salary)                               최저임금,
    round(AVG(nvl(salary, 0)), 3)             평균임금
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id DESC;


-- Q05)
SELECT
    job_id          업무,
    MAX(salary)     최고임금,
    MIN(salary)     최저임금,
    AVG(salary)     평균임금
FROM
    employees
GROUP BY
    job_id
ORDER BY
    MIN(salary) DESC,
    round(AVG(salary), 1) ASC;


-- Q06)
SELECT
    to_char(MIN(hire_date), 'yyyy-mm-dd') "최장기근속자 입사일"
FROM
    employees;


-- Q07)
SELECT
    department_id                                      부서,
    round(AVG(salary), 3)                              평균임금,
    MIN(salary)                                        최저임금,
    ( round(AVG(salary), 3) - MIN(salary) )            "평균-최저"
FROM
    employees
GROUP BY
    department_id
HAVING
    ( AVG(salary) - MIN(salary) ) < 2000
ORDER BY
    ( AVG(salary) - MIN(salary) ) DESC;


-- Q08)
SELECT
    job_id                               업무,
    MAX(salary)                          최고임금,
    MIN(salary)                          최저임금,
    ( MAX(salary) - MIN(salary) )        "최고-최저"
FROM
    employees
GROUP BY
    job_id
ORDER BY
    ( MAX(salary) - MIN(salary) ) DESC;


-- Q09)
SELECT
    manager_id                    관리자,
    round(AVG(salary), 1)         평균급여,
    MIN(salary)                   최소급여,
    MAX(salary)                   최대급여
FROM
    employees
GROUP BY
    manager_id,
    hire_date
HAVING hire_date > '05 / 01 / 01'
       AND AVG(salary) >= 5000
ORDER BY
    AVG(salary) DESC;


-- Q10)
SELECT
    hire_date  입사일,
    CASE
        WHEN hire_date <= '02/12/31' THEN
            '창립멤버'
        WHEN '02/12/31' < hire_date
             AND hire_date <= '03/12/31' THEN
            '03년입사'
        WHEN '03/12/31' < hire_date
             AND hire_date <= '04/12/31' THEN
            '04년입사'
        ELSE
            '상장이후입사'
    END        입사일기준
FROM
    employees
ORDER BY
    hire_date ASC;