/*
EQUI JOIN 복습
WHERE 절을 추가하지 않으면 각 TABLE 의 ROW 를 곱한 만큼의 행을 출력함
Ex) 107행 * 27행 = 2889행

그러므로 중복 컴럼에 대한 WHERE 절 추가
Ex) table명.department_id(Primary Key) = table명.department_id(Foreign Key)

또한 WHERE 절로 인해서 NULL 값은 제외 후 출력됨
*/

SELECT
    emp.employee_id      "emp.직원번호",
    emp.first_name       "emp.이름",
    dep.department_id    "dep.부서번호",
    emp.department_id    "emp.부서번호"
FROM
    employees    emp,
    departments  dep
WHERE
    emp.department_id = dep.department_id;


-- 예제)
SELECT
    emp.first_name         이름,
    dep.department_name    부서이름,
    jobs.job_title         업무이름,
    jobs.job_id            업무번호
FROM
    employees    emp,
    departments  dep,
    jobs         jobs
WHERE
        emp.department_id = dep.department_id
    AND emp.job_id = jobs.job_id;


/*
OUTER JOIN --> NULL 값 포함 출력
*/

-- LEFT OUTER JOIN
SELECT
    emp.department_id      "emp.부서번호",
    emp.first_name         "emp.이름",
    dep.department_id      "dep.부서번호",
    dep.department_name    "dep.부서이름"
FROM
    employees    emp
    LEFT OUTER JOIN departments  dep ON emp.department_id = dep.department_id;

-- Oracle 에 Datebase 가 있을 때 Oracle 에서 만든 문법 = LEFT OUTER JOIN
SELECT
    emp.department_id      "emp.부서번호",
    emp.first_name         "emp.이름",
    dep.department_id      "dep.부서번호",
    dep.department_name    "dep.부서이름"
FROM
    employees    emp,
    departments  dep
WHERE
    emp.department_id = dep.department_id (+);


-- RIGHT OUTER JOIN
SELECT
    emp.department_id      "emp.부서번호",
    emp.first_name         "emp.이름",
    dep.department_id      "dep.부서번호",
    dep.department_name    "dep.부서이름"
FROM
    employees    emp
    RIGHT OUTER JOIN departments  dep ON emp.department_id = dep.department_id;

-- Oracle 에 Datebase 가 있을 때 Oracle 에서 만든 문법 = RIGHT OUTER JOIN
SELECT
    emp.department_id      "emp.부서번호",
    emp.first_name         "emp.이름",
    dep.department_id      "dep.부서번호",
    dep.department_name    "dep.부서이름"
FROM
    employees    emp,
    departments  dep
WHERE
    emp.department_id (+) = dep.department_id;


-- RIGHT OUTER JOIN --> TABLE 의 위치를 바꾸면 LEFT OUTER JOIN
SELECT
    emp.department_id      "emp.부서번호",
    emp.first_name         "emp.이름",
    dep.department_id      "dep.부서번호",
    dep.department_name    "dep.부서이름"
FROM
    departments  dep
    LEFT OUTER JOIN employees    emp ON emp.department_id = dep.department_id;

SELECT
    emp.department_id      "emp.부서번호",
    emp.first_name         "emp.이름",
    dep.department_id      "dep.부서번호",
    dep.department_name    "dep.부서이름"
FROM
    employees    emp,
    departments  dep
WHERE
    dep.department_id = emp.department_id (+);


-- FULL OUTER JOIN
SELECT
    emp.department_id      "emp.부서번호",
    emp.first_name         "emp.이름",
    dep.department_id      "dep.부서번호",
    dep.department_name    "dep.부서이름"
FROM
    employees    emp
    FULL OUTER JOIN departments  dep ON emp.department_id = dep.department_id;


-- SELF JOIN
SELECT
    emp.employee_id         사원번호,
    emp.first_name          사원이름,
    emp.manager_id          "사원의 매니저 번호",
    emp.phone_number        "사원의 전화번호",
    manager.employee_id     "매니저의 사원번호",
    manager.first_name      매니저이름,
    manager.manager_id      "매니저의 매니저 번호",
    manager.phone_number    "매니저의 전화번호"
FROM
    employees  emp,
    employees  manager
WHERE
    emp.manager_id = manager.employee_id
ORDER BY
    manager.employee_id ASC,
    emp.employee_id ASC;



/*
SubQuery
*/

-- Den의 정보 출력하여 급여 알아보기
SELECT
    salary      급여,
    first_name  이름
FROM
    employees
WHERE
    first_name = 'Den';

-- Den 의 급여(11000) 보다 많은 사람 구하기
SELECT
    salary      급여,
    first_name  이름
FROM
    employees
WHERE
    salary > 11000;

-- 11000을 first_name = 'Den' 의 salary 로 대체하기
    --> 급여가 Den 보다 많은 사람 출력
SELECT
    first_name
    || '-'
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