-- 집계함수
-- AVG() 평균값을 반환 = SUM() / COUNT()
SELECT
    AVG(salary), -- employees 테이블의 모든 급여값의 평균
    SUM(salary) / COUNT(salary) -- 급여값의 평균
FROM
    employees;
-- COUNT() 총 건 수를 반환
SELECT
    COUNT(salary) -- employees 테이블의 모든 급여값의 수(row수 = 직원수)
FROM
    employees;
-- MAX() 최댓값을 반환
SELECT
    MAX(salary) -- employees 테이블의 모든 급여 중 제일 큰 값
FROM
    employees;
-- MIN() 최솟값을 반환
SELECT
    MIN(salary) -- employees 테이블의 모든 급여값 중 제일 작은 값
FROM
    employees;
-- SUM() 합계를 반환
SELECT
    SUM(salary) -- employees 테이블의 모든 급여값의 합
FROM
    employees;

-- COUNT() NULL
SELECT
    COUNT(*), -- NULL 포함 107
    COUNT(commission_pct) -- NULL 제외 35
FROM
    employees;

-- COUNT() WHERE
SELECT
    COUNT(*)
FROM
    employees
WHERE
    salary > 16000;

-- nvl(함수, NULL 대체숫자) = 함수의 NULL값을 숫자로 대체한다.
-- 평균값을 구할 때 NULL값은 포함되지 않으므로 nvl 사용
SELECT
    COUNT(*),
    SUM(salary),
    AVG(salary)
FROM
    employees;

SELECT
    COUNT(*),
    SUM(salary),
    AVG(nvl(salary, 0))
FROM
    employees;


-- 그룹함수 GROUP BY절 = 컴럼값이 같은 행끼리 묶어서 하나로 표시
-- 집계함수와 일반 컬럼은 row으 개수가 달라서 함께 쓸 수 없다.
-- 그룹함수로 해결
SELECT
    -- 오류 = 1개 행 vs 107개 행
    AVG(salary), -- 1개 행
    first_name -- 107개 행
FROM
    employees
GROUP BY -- 해결
    first_name;
-- GROUP BY절 사용시 SELECT절에는 GROUP BY절에서 사용한 컬럼과 그룹함수만 사용 가능
SELECT
    department_id,
    -- job_id 오류
    COUNT(*),
    SUM(salary)
FROM
    employees
GROUP BY
    department_id;
-- 해결
SELECT
    department_id,
    job_id,
    COUNT(*),
    SUM(salary)
FROM
    employees
GROUP BY
    department_id,
    job_id;
-- GROUP BY절에는 WHERE절 사용불가능 --> HAVING 사용
SELECT
    department_id,
    COUNT(*),
    SUM(salary)
FROM
    employees
/* 오류
WHERE
    SUM(salary) > 20000*/
GROUP BY
    department_id
-- 해결
-- HAVING절도 그룹함수와 GROUP BY절에 참여한 컬럼만 사용 가능
HAVING -- GROUP BY절을 쓸때의 조건절
    SUM(salary) > 20000;

-- CASE ~ END 문 --> CASE WHEN 조건 THEN 출력 ELSE 나머지 END 별명
SELECT
    employee_id,
    salary,
    CASE -- 하나의 컴럼을 만듦
        WHEN job_id = 'AC_ACCOUNT'  THEN
            salary + ( salary * 0.1 )
        WHEN job_id = 'SA_REP'      THEN
            salary + ( salary * 0.2 )
        WHEN job_id = 'ST_CLERK'    THEN
            salary + ( salary * 0.3 )
        ELSE
            salary
    END realsalary
FROM
    employees;

-- DECODE문 CASE END 의 조건문이 모두 = 일때만 가능
SELECT
    employee_id,
    salary,
    decode(job_id, 'AC_COUNT', salary +(salary * 0.1), 'SA_REP', salary +(salary * 0.2),
           'ST_CLERK',
           salary +(salary * 0.3),
           salary) realsalary
FROM
    employees;

-- JOIN --> 테이블 JOIN 사용시 주의사항 = 조건절을 명시하지 않으면 두 테이블의 행 X 행을 만큼 전부 출력한다.
-- EQUI JOIN --> NULL값을 제외
SELECT
    first_name,
    em.department_id,
    department_name,
    de.department_id
FROM
    employees    em,
    departments  de
WHERE
    em.department_id = de.department_id;
-- LEFT OUTER JOIN --> 왼쪽 테이블기준 값이 있는 모든행을 표시
SELECT
    e.department_id,
    e.first_name,
    d.department_name
FROM
    employees    e
    LEFT OUTER JOIN departments  d ON e.department_id = d.department_id; -- employees 테이블의 department_id에 값이 있으면 모두 출력
-- RIGHT OUTER JOIN --> (+)
SELECT
    e.department_id,
    e.first_name,
    d.department_name
FROM
    employees    e,
    departments  d
WHERE
    e.department_id = d.department_id (+);

-- RIGHT OUTER JOIN --> 오른쪽 테이블기준 값이 있는 모든행을 표시
SELECT
    e.department_id,
    e.first_name,
    d.department_name
FROM
    employees    e
    RIGHT OUTER JOIN departments  d ON e.department_id = d.department_id; -- departments 테이블의 department_id에 값이 있으면 모두 출력
-- RIGHT OUTER JOIN --> (+)
SELECT
    e.department_id,
    e.first_name,
    d.department_name
FROM
    employees    e,
    departments  d
WHERE
    e.department_id (+) = d.department_id;

-- FULL OUTER JOIN --> LEFT + RIGHT = FULL --> WHERE 절에 맞는 값을 모두 출력
SELECT
    e.department_id,
    e.first_name,
    d.department_name
FROM
    employees e FULL JOIN departments d
    ON e.department_id = d.department_id;

-- SELF JOIN --> 같은 테이블에 PrimaryKey와 ForeignKey가 둘다 있으면서 FK가 PK를 가리킬때 사용
SELECT
    emp.employee_id,
    emp.first_name,
    emp.manager_id,
    man.first_name manager
FROM
    employees emp,
    employees man
WHERE
    -- employee_id = PrimaryKey, manager_id = ForeignKey
    emp.manager_id = man.employee_id;