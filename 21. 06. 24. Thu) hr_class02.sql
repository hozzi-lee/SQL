SELECT
    first_name  이름,
    salary      연봉,
    commission_pct,
    salary * commission_pct
FROM
    employees
WHERE
    salary BETWEEN 13000 AND 15000;

/*NULL*/
SELECT
    first_name  이름,
    salary      연봉,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NULL;

SELECT
    first_name  이름,
    salary      연봉,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

-- Ex)
SELECT
    first_name  이름,
    salary      연봉,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

SELECT
    first_name 이름
FROM
    employees
WHERE
    manager_id IS NULL
    AND commission_pct IS NULL;


/*ORDER BY 정렬*/
SELECT
    first_name  이름,
    salary      연봉
FROM
    employees
ORDER BY
    salary DESC; -- 내림차순

SELECT
    first_name  이름,
    salary      연봉
FROM
    employees
ORDER BY
    salary ASC; -- 오름차순 ASC 생략 가능

SELECT
    first_name  이름,
    salary      연봉
FROM
    employees
ORDER BY
    salary ASC, -- 1순위 정렬기준
    first_name ASC; -- 2순위 정렬기준

SELECT
    first_name  이름,
    salary      연봉
FROM
    employees
WHERE
    salary >= 9000
ORDER BY
    salary DESC;
    
-- Ex01)
SELECT
    department_id  부서번호,
    salary         급여,
    first_name     이름
FROM
    employees
ORDER BY
    department_id ASC;
    
-- Ex02)
SELECT
    first_name  이름,
    salary      급여
FROM
    employees
WHERE
    salary >= 10000
ORDER BY
    salary DESC;
    
-- Ex03)
SELECT
    department_id  부서번호,
    salary         급여,
    first_name     이름
FROM
    employees
ORDER BY
    department_id ASC,
    salary DESC;


/*단일행 함수*/
/*문자함수*/
-- initcap
SELECT
    email              메일,
    initcap(email)     "메일_첫 글자 대문자", -- initcap 첫 글자 대문자
    department_id      부서번호
FROM
    employees
WHERE
    department_id = 100;

-- 가상테이블 dual
SELECT
    initcap('asdasd')
FROM
    dual;

-- lower, upper
SELECT
    first_name            이름,
    lower(first_name)     이름_소문자, -- lower 소문자로
    upper(first_name)     이름_대문자, -- upper 대문자로
    department_id         부서번호
FROM
    employees
WHERE
    department_id = 100;

-- substr(컴럼명 or '문자열', 시작번호, 출력개수)
SELECT
    substr('asdfghj', 3, 3)
FROM
    dual;

SELECT
    first_name                       이름,
    substr(first_name, 1, 3)         "이름_1 - 3", -- substr(컬럼명, 시작번호, 출력개수)
    substr(first_name, - 4, 2)       "이름_-4 - 2"
FROM
    employees
WHERE
    department_id = 100;

-- lpad, rpad(컬럼명 or '문자열', 전체글자수, '삽입문자')
SELECT
    first_name 이름,
    lpad(first_name, 10, '*'), -- first_name을 10자리로 만들고 왼쪽빈칸에 *로 채운다
    rpad(first_name, 12, '#*') -- first_name을 12자리로 만들고 오른쪽빈칸에 #와*로 채운다
FROM
    employees;

-- replace(컬럼명 or '문자열', '문자1', '문자2')
SELECT
    first_name 이름,
    replace(first_name, 'a', '*') -- first_name에 포함된 a문자를 *로 바꾼다
FROM
    employees;

SELECT
    first_name 이름,
    substr(first_name, 2, 3),
    replace(first_name, substr(first_name, 2, 3), '***') -- first_name에서 2번째 글자부터 3글자를 ***로 바꾼다
FROM
    employees;
 
 /*숫자함수*/
 -- round(소수, 소수점표시개수(반올림))
SELECT
    round(123.345, 2)          AS r01, -- 123.345에서 소수점 2번째 자리까지 출력 3번째 자리에서 반올림
    round(123.546, 0)          r02,
    round(123.546, - 1)        "r03"
FROM
    dual;

-- trunc(소수, 소수점표시개수(내림))
SELECT
    trunc(123.456, 2), -- 123.456에서 소수점 2번째 자리까지 출력 3번째 자리에서 내림(버린다)
    trunc(123.756, 0),
    trunc(123.756, - 1)
FROM
    dual;

-- abs() 절대값
SELECT
    abs(- 123) -- -123의 절대값 123출력
FROM
    dual;

/*날짜함수*/
-- sysdate 시스템 날짜 표시
SELECT
    sysdate
FROM
    dual;

-- months_between(d1, d2) d1과 d2사이의 개월 수 계산
SELECT
    sysdate, -- 시스템날짜(현재날짜)
    hire_date, -- 입사일
    months_between(sysdate, hire_date) -- 시스템날짜(현재날짜)와 입사일 사이의 개월수를 소수점을 버리고 표시
FROM
    employees
WHERE
    department_id = 110;

SELECT
    sysdate, -- 시스템날짜(현재날짜)
    hire_date, -- 입사일
    trunc(months_between(sysdate, hire_date), 0) -- 시스템날짜(현재날짜)와 입사일 사이의 개월수를 소수점을 버리고 표시
FROM
    employees
WHERE
    department_id = 110;


/*변환함수*/
-- to_char(값이 숫자인 컬럼명 or '문자열', 포맷'숫자 or 날짜') --> 값이 숫자인 컬럼명('문자열')을 포맷형식 문자열로 변경

-- NUMBER --> String --> 포맷이 변환되는 값보다 자릿수가 커야함
SELECT
    first_name 이름,
    salary * 12,
    to_char((salary * 12), '$999,999.99')
FROM
    employees
WHERE
    department_id = 110;

SELECT
    to_char(9876, '99999'),
    to_char(9876, '099999'),
    to_char(9876, '$99999'),
    to_char(9876, '9999.99'),
    to_char(987654321, '999,999,999')
FROM
    dual;

-- DATE --> String
SELECT
    sysdate,
    to_char(sysdate, 'yy. mm. dd.')                                연월일,
    to_char(sysdate, 'yy"년" mm"월" dd"일"')                          연월일,
    to_char(sysdate, 'yy. mm. dd. hh24:mm:ss')                     "연월일 시분초",
    to_char(sysdate, 'yy"년" mm"월" dd"일" hh24"시" mm"분" ss"초"')      "연월일 시분초",
    to_char(sysdate, 'yyyy')                                       연도4자,
    to_char(sysdate, 'yy')                                         연도2자,
    to_char(sysdate, 'mm')                                         월_숫자,
    to_char(sysdate, 'mon')                                        월_문자,
    to_char(sysdate, 'month')                                      월_문자,
    to_char(sysdate, 'dd')                                         일,
    to_char(sysdate, 'day')                                        요일,
    to_char(sysdate, 'ddth')                                       n번째날,
    to_char(sysdate, 'hh')                                         시,
    to_char(sysdate, 'hh24')                                       "시(24시)",
    to_char(sysdate, 'mi')                                         분,
    to_char(sysdate, 'ss')                                         초
FROM
    dual;

-- nvl(컬럼명, 컬럼값이 NULL일때 표시할 숫자('문자열')), nvl2(컬럼명,컴럼값이 NULL이 아닐때 표시할 숫자('문자열), 컬럼값이 NULL일때 표시할 숫자('문자열'))
SELECT
    first_name                         이름,
    commission_pct                     수당,
    nvl(commission_pct, 0)             "nvl",
    nvl2(commission_pct, 100, 0)       "nvl2",
    nvl2(commission_pct, '값있음', '널')
FROM
    employees;

-- 그룹함수 avg = 평균값
SELECT
    '평균연봉',
    AVG(salary)
FROM
    employees;