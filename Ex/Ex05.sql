/*
 = EQUI JOIN --> NULL 제외
 = OUTER JOIN(LEFT / RIGHT / FULL) --> NULL 포함
 = SELF JOIN
*/

-- SELF JOIN
SELECT
    emply.employee_id    사번,
    emply.first_name     이름,
    emply.manager_id     매니저번호,
    emply.first_name     매니저이름
FROM
    employees  emply,
    employees  manager
WHERE
    emply.manager_id = manager.employee_id (+);

-- subQuery
SELECT
    salary
FROM
    employees
WHERE
    first_name = 'Den';
-- 대입
SELECT
    first_name
    || ') '
    || last_name   이름,
    salary         급여
FROM
    employees
WHERE
    salary > (
        SELECT
            salary
        FROM
            employees
        WHERE
            first_name = 'Den'
    );

/*
subQuery 단일행(subQuery 결과의 row 가 1개인 경우)
*/

-- 예제) 급여를 가장 적게 받는 사람의 이름, 급여, 사원번호
-- 1. 급여를 가장 적게 받는 사람의 급여 --> 2100
SELECT
    MIN(salary)
FROM
    employees;
-- 2. 2100을 받는 사람의 이름, 급여, 사원번호
SELECT
    first_name   이름,
    salary       급여,
    employee_id  사원번호
FROM
    employees
WHERE
    salary = 2100;
-- 3. 1번과 2번을 조합
SELECT
    first_name   이름,
    salary       급여,
    employee_id  사원번호
FROM
    employees
WHERE
    salary = (
        SELECT
            MIN(salary)
        FROM
            employees
    );

-- 예제) 평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요.
-- subQuery
SELECT
    first_name
    || ') '
    || last_name   이름,
    salary         급여
FROM
    employees
WHERE
    salary < (
        SELECT
            AVG(salary)
        FROM
            employees
    );
-- subQueryDiv - 1)
SELECT
    AVG(salary)
FROM
    employees;
-- subQueryDiv - 2)
SELECT
    first_name
    || ') '
    || last_name   이름,
    salary         급여
FROM
    employees
WHERE
    salary < 6461.831;

--

/*
subQuery 다중행 (subQuery 결과의 row 가 여러개인 경우)
*/

-- 예제) 부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요.
-- subQuery
SELECT
    employee_id  사번,
    first_name   이름,
    salary       급여
FROM
    employees
WHERE
    salary IN (
        SELECT
            salary
        FROM
            employees
        WHERE
            department_id = 110
    );
-- subQueryDiv - 1)
SELECT
    salary
FROM
    employees
WHERE
    department_id = 110;
-- subQueryDiv - 2)
SELECT
    employee_id  사번,
    first_name   이름,
    salary       급여
FROM
    employees
WHERE
    salary = 12008
    OR salary = 8300; --> salary IN (12008, 8300);

-- 예제) 각 부서별로 최고급여를 받는 사원을 출력하세요.
-- subQuery
SELECT
    department_id  부서,
    first_name
    || ') '
    || last_name   이름,
    salary         급여
FROM
    employees
WHERE
    ( nvl(department_id, 0), salary ) IN (
        SELECT
            nvl(department_id, 0), MAX(salary)
        FROM
            employees
        GROUP BY
            department_id
    );
-- subQueryDiv - 1)
SELECT
    department_id   부서,
    MAX(salary)     최고급여
FROM
    employees
GROUP BY
    department_id;
-- subQueryDiv - 2)
SELECT
    department_id  부서,
    first_name
    || ') '
    || last_name   이름,
    salary         급여
FROM
    employees
WHERE
        department_id = 100
    AND salary = 12008
    OR department_id = 30
    AND salary = 11000
    OR department_id IS NULL
    AND salary = 7000
    OR department_id = 90
    AND salary = 24000
    OR department_id = 20
    AND salary = 13000
    OR department_id = 70
    AND salary = 10000
    OR department_id = 110
    AND salary = 12008
    OR department_id = 50
    AND salary = 8200
    OR department_id = 80
    AND salary = 14000
    OR department_id = 40
    AND salary = 6500
    OR department_id = 60
    AND salary = 9000
    OR department_id = 10
    AND salary = 4400;

-- 예제) 부서번호가 110인 직원의 최소급여보다 큰 모든 직원의 사번, 이름, 급여를 출력하세요.
-- sbuQuery
SELECT
    employee_id    사번,
    first_name
    || ') '
    || last_name   이름,
    salary         급여
FROM
    employees
WHERE
    salary > ANY ( -- ANY 빼고 SELECT 절에 salary --> MIN(salary) 대체 가능
        SELECT
            salary -- MIN(salary)
        FROM
            employees
        WHERE
            department_id = 110
    );
-- sbuQueryDiv - 1)
SELECT
    salary
FROM
    employees
WHERE
    department_id = 110;
-- sbuQueryDiv - 2)
SELECT
    employee_id    사번,
    first_name
    || ') '
    || last_name   이름,
    salary         급여
FROM
    employees
WHERE
    salary > 8300
    OR salary > 12008; --> 결국 salary > 8300(MIN(salary)) 으로 통일됨

-- 예제) 부서번호가 110인 직원의 최소급여보다 큰 모든 직원의 사번, 이름, 급여를 출력하세요.
-- sbuQuery
SELECT
    employee_id    사번,
    first_name
    || ') '
    || last_name   이름,
    salary         급여
FROM
    employees
WHERE
    salary > ALL ( -- ALL 빼고 SELECT 절에 salary --> MAX(salary) 대체 가능
        SELECT
            salary -- MAX(salary)
        FROM
            employees
        WHERE
            department_id = 110
    );
-- sbuQueryDiv - 1)
SELECT
    salary
FROM
    employees
WHERE
    department_id = 110;
-- sbuQueryDiv - 2)
SELECT
    employee_id    사번,
    first_name
    || ') '
    || last_name   이름,
    salary         급여
FROM
    employees
WHERE
        salary > 8300
    AND salary > 12008; --> 결국 salary > 12008(MAX(salary)) 으로 통일됨


-- 예제) 각 부서별로 최고급여를 받는 사원을 출력하세요.
-- subQuery(조건절_WHERE 비교 = 기존방법)
SELECT
    department_id  부서,
    first_name
    || ') '
    || last_name   이름,
    salary         급여
FROM
    employees
WHERE
    ( nvl(department_id, 0), salary ) IN (
        SELECT
            nvl(department_id, 0), MAX(salary)
        FROM
            employees
        GROUP BY
            department_id
    );
-- subQuery(테이블_FROM 비교)
SELECT
    emply.department_id    부서,
    emply.first_name
    || ') '
    || emply.last_name     이름,
    emply.salary           급여
FROM
    employees  emply,
    (
        SELECT
            department_id,
            MAX(salary) mxsalary
        FROM
            employees
        GROUP BY
            department_id
    )          stable
WHERE
        emply.department_id = stable.department_id
    AND emply.salary = stable.mxsalary;
-- subQueryDiv - 1)
SELECT
    department_id   부서,
    MAX(salary)     급여
FROM
    employees
GROUP BY
    department_id;
-- subQueryDiv - 2)
SELECT
    department_id  부서,
    first_name
    || ') '
    || last_name   이름,
    salary         급여
FROM
    employees
WHERE
        department_id = 100
    AND salary = 12008
    OR department_id = 30
    AND salary = 11000
    OR department_id IS NULL
    AND salary = 7000
    OR department_id = 90
    AND salary = 24000
    OR department_id = 20
    AND salary = 13000
    OR department_id = 70
    AND salary = 10000
    OR department_id = 110
    AND salary = 12008
    OR department_id = 50
    AND salary = 8200
    OR department_id = 80
    AND salary = 14000
    OR department_id = 40
    AND salary = 6500
    OR department_id = 60
    AND salary = 9000
    OR department_id = 10
    AND salary = 4400;

--

/*
ROWNUM
*/

-- 예제)급여를 가장 많이 받는 5명의 직원의 이름을 출력하세요.
-- fail --> ROWNUM 이 먼저 적용된 후 정렬이 된다. ROWNUM 이 섞임.
SELECT
    ROWNUM,
    employee_id    사번,
    first_name
    || ') '
    || last_name   이름,
    salary         급여
FROM
    employees
WHERE
        ROWNUM >= 1
    AND ROWNUM <= 5
ORDER BY
    salary DESC;

-- 정렬 후 ROWNUM 적용 --> 정렬된 테이블을 FROM 절에 subQuery --> ROWNUM 을 1부터만 출력가능(2이상 안됨)
SELECT
    ROWNUM,
    "orderTable"."ex-00"    사번,
    "orderTable".ex00
    || ') '
    || ex01                 이름,
    salary                  급여
FROM
    (
        SELECT
            employee_id  "ex-00",
            first_name   ex00,
            last_name    ex01,
            salary
        FROM
            employees
        ORDER BY
            salary DESC
    ) "orderTable" --> 대소문자 구분 없이는 ""제외 가능
WHERE
        1 <= ROWNUM
    AND ROWNUM <= 5; -- ROWNUM 을 2부터 출력하면 결과값 없음.

-- 정렬하고 ROWNUM 이 적용된 테이블을 FROM 절에 subQuery
SELECT
    rwnmtable.rwnm             구분,
    rwnmtable.employee_id      사번,
    rwnmtable.first_name
    || ') '
    || rwnmtable.last_name     이름,
    salary                     급여
FROM
    (
        SELECT
            ROWNUM rwnm,
            ordertable.employee_id,
            ordertable.first_name,
            ordertable.last_name,
            ordertable.salary
        FROM
            (
                SELECT
                    employee_id,
                    first_name,
                    last_name,
                    salary
                FROM
                    employees
                ORDER BY
                    salary DESC
            ) ordertable
    ) rwnmtable
WHERE
    rwnm IN ( 3, 4, 5, 6, 8,
              10, 11, 29, 30, 55,
              62, 99 )
    AND 2 <= rwnm
    AND rwnm <= 15; -- 여러가지 확인


-- 예제) 07년에 입사한 직원중 급여가 많은 직원중 3~7 번째의 이름, 급여, 입사일을 출력하세요.
SELECT
    rwnmtable.rwnm,
    rwnmtable.first_name
    || ') '
    || rwnmtable.last_name     이름,
    rwnmtable.salary           급여,
    rwnmtable.hire_date        입사일
FROM
    (
        SELECT
            ROWNUM rwnm,
            ordertable.first_name,
            ordertable.last_name,
            ordertable.salary,
            ordertable.hire_date
        FROM
            (
                SELECT
                    first_name,
                    last_name,
                    salary,
                    hire_date
                FROM
                    employees
                WHERE
                        '07/01/01' <= hire_date
                    AND hire_date <= '07/12/31'
                ORDER BY
                    salary DESC
            ) ordertable
    ) rwnmtable
WHERE
    rwnm IN ( 3, 4, 5, 6, 7 );