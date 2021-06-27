/*
1. 사원의 이름과 전화번호, 입사일, 연봉을 출력하세요.

2. 사원의 이름과 성, 급여, 전화번호, 이메일, 입사일을 출력하세요.

3. 사원의 이름과 전화번호, 입사일, 급여로 표시되도록 출력하세요.

4. 사원의 사원번호, 이름, 성, 급여, 전화번호, 이메일, 입사일로 표시되도록 출력하세요.

5. 전체직원의 정보를 다음과 같이 출력하세요.
    성명: 이름-성
	급여
	연봉( 급여 * 12 )
	연봉2( 급여 * 12 + 5,000 )
	전화번호

6. 연봉이 15,000 이상인 사원들의 이름과 월급을 출력하세요.

7. 07/01/01 이후에 입사한 사원들의 이름과 입사일을 출력하세요.

8. 이름이 Lex인 직원의 연봉을 출력하세요.

9. 연봉이 14,000 이하이거나 17,000 이상인 사원의 이름과 연봉을 출력하세요.

10. 입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요.

11. 연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오.

12. 이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요.

13. 이름의 두 번째 글자가 a 인 사원의 이름과 연봉을 출력하세요.

14. 이름의 네 번째 글자가 a 인 사원의 이름을 출력하세요.

15. 이름이 4글자인 사원 중 끝에서 두 번째 글자가 a 인 사원의 이름을 출력하세요.

16. 커미션비율이 있는 사원의 이름과 연봉, 커미션비율을 출력하세요.

17. 담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요.

18. 부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요.

19. 금여가 10,000 이상인 직원의 이름, 급여를 급여가 큰 직원부터 출력하세요.

20. 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호, 급여, 이름을 출력하세요.

21. 연봉의 합계가 20,000 이상인 부서의 부서 번호와, 인원수, 급여합계를 출력하세요.

22. 직원의 이름, 부서, 팀을 출력하세요.
    팀은 코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’
    60~100이면 ‘B-TEAM’
    110~150이면 ‘C-TEAM’
    나머지는 ‘팀없음’ 으로 출력하세요.

23. 모든 직원의 이름, 부서이름, 업무명 을 출력하세요.
--------------------------------------------------------
Question Number Order
19, 14, 2, 5, 4, 23, 11, 3, 22, 21, 7, 12, 6, 20, 13, 8, 17, 18, 9, 15, 10, 16, 1
*/

-- Q's All Information
SELECT
    *
FROM
    employees,
    departments;


-- Q19)
SELECT
    first_name
    || '-'
    || last_name   이름,
    salary         급여
FROM
    employees
WHERE
    salary >= 10000
ORDER BY
    salary DESC;


-- Q14)
SELECT
    first_name
    || '-'
    || last_name 이름
FROM
    employees
WHERE
    first_name LIKE '___a%';


-- Q02)
SELECT
    first_name
    || '-'
    || last_name   "이름과 성",
    salary         급여,
    phone_number   전화번호,
    email          이메일,
    hire_date      입사일
FROM
    employees;


-- Q05)
SELECT
    first_name
    || '-'
    || last_name            성명,
    salary                  급여,
    ( salary * 12 )         연봉,
    ( salary * 12 ) + 5000  연봉2,
    phone_number            전화번호
FROM
    employees;


-- Q04
SELECT
    employee_id   사원번호,
    first_name    이름,
    last_name     성,
    salary        급여,
    phone_number  전화번호,
    email         이메일,
    hire_date     입사일
FROM
    employees;


-- Q23) + Table Nickname Practice
SELECT
    em.first_name
    || '-'
    || em.last_name       이름,
    de.department_name    부서이름,
    em.job_id             업무명
FROM
    employees    em,
    departments  de;


-- Q11)
SELECT
    first_name
    || '-'
    || last_name   이름,
    salary         연봉
FROM
    employees
WHERE
    salary IN ( 2100, 3100, 4100, 5100 );


-- Q03)
SELECT
    first_name
    || '+'
    || last_name   이름,
    phone_number   전화번호,
    hire_date      입사일,
    salary         급여
FROM
    employees;


-- Q22)
SELECT
    first_name
    || '+'
    || last_name   이름,
    department_id  부서코드,
    CASE
        WHEN 10 <= department_id
             AND department_id <= 50 THEN
            'A-TEAM'
        WHEN 60 <= department_id
             AND department_id <= 100 THEN
            'B-TEAM'
        WHEN 110 <= department_id
             AND department_id <= 150 THEN
            'C-TEAM'
        ELSE
            '팀없음'
    END            팀이름
FROM
    employees;


-- Q21)
SELECT
    department_id            부서번호,
    COUNT(department_id)     인원수,
    SUM(salary)              급여합계
FROM
    employees
GROUP BY
    department_id
HAVING
    SUM(salary) >= 20000;


-- Q07)
SELECT
    first_name
    || '+'
    || last_name   이름,
    hire_date      입사일
FROM
    employees
WHERE
    hire_date >= '07/01/01';


-- Q12)
SELECT
    first_name
    || '+'
    || last_name   이름,
    salary         연봉
FROM
    employees
WHERE
    first_name LIKE '%am%';


-- Q06)
SELECT
    first_name
    || '+'
    || last_name                   이름,
    trunc((salary / 12), 3)        월급
FROM
    employees
WHERE
    salary >= 15000;


-- Q20)
SELECT
    department_id  부서번호,
    salary         급여,
    first_name
    || '^'
    || last_name   이름
FROM
    employees
ORDER BY
    department_id ASC,
    salary DESC;


-- Q13)
SELECT
    first_name
    || ';'
    || last_name   이름,
    salary         연봉
FROM
    employees
WHERE
    first_name LIKE '_a%';


-- Q08)
SELECT
    salary 연봉
FROM
    employees
WHERE
    first_name LIKE 'Lex';


-- Q17)
SELECT
    first_name
    || '*'
    || last_name 이름
FROM
    employees
WHERE
    manager_id IS NULL
    AND commission_pct IS NULL;


-- Q18)
SELECT
    department_id  부서번호,
    salary         급여,
    first_name
    || '#'
    || last_name   이름
FROM
    employees
ORDER BY
    department_id ASC;


-- Q09)
SELECT
    first_name
    || '!'
    || last_name   이름,
    salary         연봉
FROM
    employees
WHERE
    salary <= 14000
    OR salary >= 17000;


-- Q15)
SELECT
    first_name
    || '$'
    || last_name 이름
FROM
    employees
WHERE
    first_name LIKE '__a_';


-- Q10)
SELECT
    first_name
    || '@'
    || last_name   이름,
    hire_date      입사일
FROM
    employees
WHERE
        '04/01/01' <= hire_date
    AND hire_date <= '05/12/31';


-- Q16)
SELECT
    first_name
    || '%'
    || last_name    이름,
    salary          연봉,
    commission_pct  커미션비율
FROM
    employees
WHERE
    commission_pct IS NOT NULL;


-- Q01)
SELECT
    first_name
    || ') ('
    || last_name   이름,
    phone_number   전화번호,
    hire_date      입사일,
    salary         연봉
FROM
    employees;