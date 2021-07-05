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
    ( department_id, salary ) IN ( -- IN을 사용하는 컬럼값은 SubQuery의 SELECT 값과 같아야 한다.
        SELECT -- 부서별로 MAX salary값
            department_id,
            MAX(salary)
        FROM
            employees
        GROUP BY
            department_id
    );

-- ANY (OR)
SELECT
    first_name,
    salary
FROM
    employees
WHERE -- ANY = SubQuery 값들을 OR 연산 한 값과 같다 --> 따라서 최솟값
    salary > ANY ( --> ANY삭제
        SELECT
            salary --> MIN(salary)
        FROM
            employees
        WHERE
            department_id = 110
    );

-- ALL (AND)
SELECT
    first_name,
    salary
FROM
    employees
WHERE -- ALL = SubQuery 값들을 AND 연산 한 값과 같다 --> 따라서 최댓값
    salary > ALL ( --> ALL삭제
        SELECT
            salary --> MIN(salary)
        FROM
            employees
        WHERE
            department_id = 110
    );

-- SubQuery비교 --> 조건절, 테이블조인
-- WHERE절에서 비교
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    ( department_id, salary ) IN ( -- IN을 사용하는 컬럼값은 SubQuery의 SELECT 값과 같아야 한다.
        SELECT -- 부서별로 MAX salary값
            department_id,
            MAX(salary)
        FROM
            employees
        GROUP BY
            department_id
    );
-- FROM절에서 비교
SELECT
    em.department_id,
    em.employee_id,
    em.first_name,
    em.salary
FROM
    employees  em,
    (
        SELECT
            department_id,
            MAX(salary) salary
        FROM
            employees
        GROUP BY
            department_id
    )          emsub
WHERE
        em.department_id = emsub.department_id
    AND em.salary = emsub.salary;

-- ROWNUM = 결과에 가상으로 부여되는 일련번호컬럼
-- SubQuery없이 ROWNUM 생성 후 ORDER BY = ROWNUM이 생성된 후 정렬되기 때문에 ROWNUM의 사용의미가 없어진다
SELECT
    ROWNUM,
    first_name,
    salary
FROM
    employees
ORDER BY
    salary DESC;
-- 정렬된 테이블을 FROM절에 SubQuery --> ROWNUM이 없는 테이블에대한 WHERE절 이기 때문에 WHERE절에 맞는 값이 없다.
SELECT
    ROWNUM,
    first_name,
    salary
FROM (
    SELECT
        first_name,
        salary
    FROm
        employees
    ORDER BY
        salary DESC
    )
WHERE -- ROWNUM이 적용되기 전에 조건절 발생 = 조건에 맞는값 없음.
    ROWNUM >= 5;
-- 정렬한 테이블을 ROWNUM 적용후 다시 테이블화 하고 ROWNUM 출력
SELECT
    num,
    first_name,
    salary
FROM
    ( SELECT -- 정렬된 값에 ROWNUM적용 후 SubQuery
        ROWNUM num,
        first_name,
        salary
    FROM ( SELECT -- 정렬된 값을 SubQuery
        first_name,
        salary
    FROM employees
    ORDER BY
        salary DESC
    )
    )
WHERE -- 정렬된 ROWNUM에 대한 WHERE절
    num >= 11
    AND num <= 20;