/*FROM절 SELECT절*/
--모든 컬럼 조회하기 = *
SELECT
    *
FROM
    employees;

SELECT
    *
FROM
    departments;


--원하는 컬럼만 조회하기
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees;

--예제)
SELECT
    first_name,
    phone_number,
    hire_date,
    salary
FROM
    employees;

SELECT
    first_name,
    last_name,
    phone_number,
    email,
    hire_date
FROM
    employees;

-- 출력할 때 컴럼에 별명 사용하기
SELECT
    -- 보통 as 생략함 (공백, 특수문자, 영어대소문자 구분 == "")
    employee_id  AS "empNo",
    first_name   AS "f-name",
    salary       AS "급 여"
FROM
    employees;
    
-- 예제)
SELECT
    first_name    이름,
    phone_number  전화번호,
    hire_date     입사일,
    salary        급여
FROM
    employees;

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
    
    
-- 연결 연산자(concatenation)로 컬럼들 붙이기
SELECT
    first_name,
    last_name
FROM
    employees;

SELECT
    first_name || last_name
FROM
    employees;

SELECT
    first_name
    || ' '
    || last_name
FROM
    employees;

SELECT
    first_name
    || ' hire date is '
    || hire_date 입사일
FROM
    employees;
    
    
-- 산술연산자 사용하기
SELECT
    first_name,
    salary
FROM
    employees;

SELECT
    first_name
    || ' '
    || last_name   이름,
    salary         월급,
    salary * 12    연봉
FROM
    employees;

SELECT
    first_name
    || ' '
    || last_name           이름,
    salary                 월급,
    salary * 12            연봉,
    ( salary + 300 ) * 12  연봉협상
FROM
    employees;
    
-- 오류 job_id == 문자    
/*SELECT
    job_id * 12
FROM
    employees;*/
    
-- 예제
SELECT
    first_name
    || '-'
    || last_name        성명,
    salary              급여,
    salary * 12         연봉,
    salary * 12 + 5000  연봉2,
    phone_number        전화번호
FROM
    employees;



/*WHERE절*/
SELECT
    first_name 이름
FROM
    employees
WHERE
    department_id = 10;
    
-- 예제
SELECT
    first_name  이름,
    salary      월급
FROM
    employees
WHERE
    salary >= 15000;

SELECT
    first_name  이름,
    hire_date   입사일
FROM
    employees
WHERE
    hire_date >= '07/01/01'; --> / . - 변경 가능

SELECT
    salary 연봉
FROM
    employees
WHERE
    first_name = 'Lex';

-- 연산자 2개 사용
SELECT
    first_name  이름,
    salary      연봉
FROM
    employees
WHERE
    14000 >= salary
    OR salary >= 17000;

SELECT
    first_name  이름,
    hire_date   입사일
FROM
    employees
WHERE
        '04/01/01' <= hire_date
    AND hire_date >= '05/12/31';

-- BETWEEN 으로 사잇값 구하기
SELECT
    first_name  이름,
    salary      연봉
FROM
    employees
WHERE
    salary BETWEEN 14000 AND 17000;

/*SELECT --> BETWEEN 과 같은 표현
    first_name 이름,
    salary 연봉
FROM
    employees
WHERE
    14000 <= salary AND salary <= 17000;*/

-- IN 연산자로 여러 조건 구하기
SELECT
    first_name  이름,
    last_name   성,
    salary      연봉
FROM
    employees
WHERE
    first_name IN ( 'Neena', 'Lex', 'John' );

/*SELECT --> IN과 같은 표현
    first_name  이름,
    last_name   성,
    salary      연봉
FROM
    employees
WHERE
    first_name = 'Neena'
    OR first_name = 'Lex'
    OR first_name = 'John';*/

SELECT
    first_name  이름,
    salary      연봉
FROM
    employees
WHERE
    salary IN ( 2100, 3100, 4100, 5100 );
    
/*SELECT --> IN과 같은 표현
    first_name  이름,
    salary      연봉
FROM
    employees
WHERE
    salary = 2100
    OR salary = 3100
    OR salary = 4100
    OR salary = 5100;*/
    
-- LIKE 연산자로 비슷한것들 모두 찾기(% = 임의의 길이 문자열(공백 가능), _ = 한글자 길이)
SELECT
    first_name
    || '_'
    || last_name,
    salary 연봉
FROM
    employees
WHERE
    first_name LIKE '_____l';

SELECT
    first_name  이름,
    salary      연봉
FROM
    employees
WHERE
    first_name LIKE '%am%'; -- 이름에 am을 포함

SELECT
    first_name  이름,
    salary      연봉
FROM
    employees
WHERE
    first_name LIKE '_a%'; -- 이름의 두 번째 글자가 a

SELECT
    first_name 이름
FROM
    employees
WHERE
    first_name LIKE '___a%'; -- 이름의 네 번째 글자가 a

SELECT
    first_name 이름
FROM
    employees
WHERE
    first_name LIKE '__a_' -- 이름이 네글자 중이 뒤에서 두 번째 글자가 a
    -- first_name LIKE '____' 이름이 네글자
    -- AND first_name LIKE '%a_'; 이면서 뒤에서 두 번째 글자가 a