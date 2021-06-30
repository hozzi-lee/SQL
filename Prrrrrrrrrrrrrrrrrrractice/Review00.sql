-- 모든 컬럼 조회하기
SELECT -- SELECT 절
    * -- 모든 컬럼
FROM -- FROM 절
    employees; -- employees 테이블

SELECT
    *
FROM
    departments; -- departments 테이블

-- 원하는 컬럼만 조회하기
SELECT
    employee_id, -- 콤마(,)로 구분
    first_name,
    last_name
FROM
    employees;

-- 출력할 때 컴럼에 별명 사용하기
SELECT
    employee_id   AS empno, -- 컬럼명 as 별명(대소문자 구분 없이 대문자로 출력됨EMPNO)
    hire_date     hd, -- as 생략 가능
    phone_number  "phoneNum", -- 대소문자 구분수 쌍따옴표("") 사용
    first_name    "f-name", -- _를 제외한 특수문자 사용시 쌍따옴표("") 사용
    salary        "연 봉" -- 공백 입력시 쌍따옴표("") 사용
FROM
    employees;

-- 연결 연산자(||)로 컬럼들 붙이기
SELECT
    first_name
    || ' hire date is ' -- 연결연산자(||) 사이에 문자입력가능 --> 작은따옴표(')를 제외한 모든 문자 입력 가능(공백포함)
    || hire_date 별명 -- 별명은 마지막 컬럼 뒤에 작성
FROM
    employees;

-- 산술 연산자(+, -, *, /) 사용하기 - 컬럼값이 연산이 가능한 숫자인 경우에만 사용 가능
SELECT
    first_name,
    salary * 12,
    hire_date, -- * 12 = 오류
    ( salary + 300 ) * 12
FROM
    employees;

-- 비교연산자(=, !=, >, <, >=, <=) 사용하기
SELECT
    first_name
FROM
    employees
WHERE -- WHERE 절(조건절)
    department_id = 10; -- 부서번호가 10인 SELECT 절의 컬럼값 출력

-- 조건이 2개 이상일때 한번에 조회하기
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    -- AND 연산자 - 두 조건 모두 만족 해야 한다.
        salary >= 14000 -- 14000 <= salary <= 17000 과 같다. 하지만 왼쪽식은 오류.
    AND salary <= 17000; -- BETWEEN 14000 AND 17000; 가능하지만 연산이 느림.

SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    -- IN 연산자
    first_name IN ( 'Neena', 'Lex', 'John' ); -- first_name이 Neena, Lex, John인 사람들 출력
    -- first_name = 'Neena' OR first_name = 'Lex' OR first_name = 'John'; 과 같다.

-- LIKE 연산자로 비슷하 문자 찾기
SELECT
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    -- %: 임의의 길이의 문자열(공백 가능), _: 한 글자인 문자
    first_name LIKE 'L%' -- first_name의 첫 글자가 L인 값
    OR first_name LIKE '____i' -- first_name의 글자수가 5개이면서 5번째 글자가 i인 값
    OR first_name LIKE '%v%' -- first_name의 중간에 v가 포함된 값
    OR first_name LIKE '__e%' -- first_name의 3번째 글자가 e인 값
    OR first_name LIKE '%r'; -- first_name의 끝 글자가 r인 값

-- NULL인 field값 출력하기
SELECT
    first_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    -- commission_pct가 NULL인 값 출력
    commission_pct IS NULL -- commission_pct = NULL 로 작성하지 않는다 = 오류
    -- commission_pct가 NULL이 아닌 값 출력
    OR commission_pct IS NOT NULL; -- commission_pct != NULL 로 작성하지 않는다 = 오류

-- ORDER BY 절을 사용하여 정렬하기(ASC: 오름차순, DESC: 내림차순)
SELECT
    first_name,
    salary,
    hire_date
FROM
    employees
-- WHERE절은 FROM절과 ORDER BY절 사이에 쓴다.
ORDER BY
    salary ASC, -- salary값을 기준으로 모든 컬럼을 오름차순(작은수에서 큰수로)으로 정렬
    hire_date ASC; -- 정렬조건이 2개 이상일 경우 순서대로 정렬을 적용한다.

-- 단일행 함수_문자함수
-- CONCAT(컬럼(문자열)1, 컬럼(문자열)2) = 컬럼(문자열) 결합. 연결연산자처럼 컬럼값 사이에 문자 추가 불가능.
SELECT
    CONCAT(first_name, last_name) 콘캣1,
    CONCAT(email, job_id),
    CONCAT(salary, hire_date),
    CONCAT(first_name, salary),
    CONCAT('abcd', 'bbdd') -- abcdbbdd
FROM
    employees;
-- INITCAP(컬럼(문자열)) = 첫 글자만 대문자로 출력
SELECT
    INITCAP(email),
    INITCAP('abcde') -- Abcde
FROM
    employees;
-- LOWER(컬럼(문자열)) = 컬럼(문자열)를 소문자로 출력
SELECT
    LOWER(job_id),
    LOWER('ASDGG') -- asdgg
FROM
    employees;
-- UPPER(컬럼(문자열)) = 컬럼(문자열)를 대문자로 출력
SELECT
    UPPER(first_name
    || ') '
    || last_name),
    UPPER('abcdefg') -- ABCDEFG
FROM
    employees;
-- LPAD(컬럼(문자열), 문자길이, 채울문자) = 컬럼(문자열)의 왼쪽 채움, 문자길이 = 기존문자열 + 추가될 문자열
SELECT
    LPAD(email, 10, '*'),
    LPAD('ABCD', 10, 'o') -- ooooooABCD
FROM
    employees;
-- RPAD(컬럼(문자열), 문자길이, 채울문자) = 컬럼(문자열)의 오른쪽 채움, 문자길이 = 기존문자열 + 추가될 문자열
SELECT
    RPAD(email, 10, '*'),
    RPAD('ABCD', 10, 'o') -- ABCDoooooo
FROM
    employees;
-- LTRIM(컬럼(문자열), D문자) = 컬럼(문자열)에서 왼쪽에있는 D문자 제거
SELECT
    LTRIM('asdasd', 'as'), -- dasd
    LTRIM(first_name, 'a')
FROM
    employees;
-- RTRIM(컬럼(문자열), D문자) = 컬럼(문자열)에서 오른쪽에있는 D문자 제거
SELECT
    RTRIM('asdasdasd', 'sd'), -- asdasda
    RTRIM(first_name, 'd')
FROM
    employees;
-- CHR(숫자) = ASCII값의 문자 출력
SELECT
    CHR(65),-- A
    CHR(97) -- a
FROM
    dual;
-- REPLACE(컬럼(문자열), 문자열1, 문자열2) = 컬럼(문자열)속 문자열1을 문자열2로 변환
SELECT
    REPLACE('이호진', '호', '이'), -- 이이진
    REPLACE(first_name, 'a', '짠')
FROM
    employees;
-- SUBSTR(컬럼(문자열), x번째부터, y길이만큼) = 컬럼(문자열)에서 x번째부터 y길이만큼의 문자 출력
SELECT
    SUBSTR(first_name, 3, 3),
    SUBSTR('123456789', 3, 3) -- 345
FROM
    employees;
-- TRANSLATE(컬럼(문자열), from, to) = 컬럼(문자열)에서 from 문자열의 각 문자를 to문자열의 각 문자로 변환
SELECT
    TRANSLATE('ABCDEFG', 'CD', 'asddfg') -- 이럴바엔 REPLACE를 쓰지...
FROM
    dual;
-- ASCII(문자) = ASCII값 반환 --> 문자열일 경우 첫 글자에 해당하는 ASCII값 반환
SELECT
    ASCII('%A'), -- 37
    ASCII('A%'), -- 65
    ASCII(first_name)
FROM
    employees;
-- LENGTH(문자열) = 문자열의 길이 반환
SELECT
    LENGTH(first_name),
    LENGTH('asdasd') -- 6
FROM
    employees;

-- 단일행 함수_숫자함수
-- ABS(숫자) = 절대값
SELECT
    ABS(-123), -- 123
    ABS(-999) -- 999
FROM
    dual;
-- CEIL(숫자) = 숫자보다 크거나 같은 최소 정수
SELECT
    CEIL(-2.34), -- -2
    CEIL(-1.99), -- -1
    CEIL(1.99) -- 2
FROM
    dual;
-- FLOOR(숫자) = 숫자보다 작거나 같은 최대 정수
SELECT
    FLOOR(-2.4), -- -3
    FLOOR(-1.99), -- -2
    FLOOR(1.99) -- 1
FROM
    dual;
-- MOD(숫자1, 숫자2) = 숫자1/숫자2 의 나머지
SELECT
    MOD(123, 12), -- 3
    MOD(13, 2) -- 1
FROM
    dual;
-- POWER(숫자1, 숫자2) = 숫자1의 숫자2 승
SELECT
    POWER(12, 2), -- 144
    POWER(2, 4) -- 16
FROM
    dual;
-- ROUND(숫자1, 숫자2) = 숫자1의 소수점 아래 숫자2자리까지 반올림
SELECT
    ROUND(123.45678, 2), -- 123.46
    ROUND(123.45678, 0), -- 123
    ROUND(123.45678, -2), -- 100
    ROUND(153.45678, -2) -- 200
FROM
    dual;
-- TRUNC(숫자1, 숫자2) = 숫자1의 소수점 아래 숫자2자리까지 버림
SELECT
    TRUNC(123.45678, 2), -- 123.45
    TRUNC(123.45678, 0), -- 123
    TRUNC(123.45678, -2), -- 100
    TRUNC(153.45678, -2) -- 100
FROM
    dual;
-- SIGN(숫자1) = 부호(1, 0, -1)
SELECT
    SIGN(-20), -- -1
    SIGN(0), -- 0
    SIGN(20) -- 1
FROM
    dual;