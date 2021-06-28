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

22. 직원의 이름, 부서, 팀을 출력하세요팀은 코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’ 60~100이면 ‘B-TEAM’  110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요.

23. 모든 직원의 이름, 부서이름, 업무명 을 출력하세요.

24. 전체직원의 다음 정보를 조회하세요.
정렬은 입사일(hire_date)의 올림차순(ASC)으로 가장 선임부터 출력이 되도록 하세요.
이름(first_name last_name),  월급(salary),  전화번호(phone_number), 입사일(hire_date) 순서이고,
“이름”, “월급”, “전화번호”, “입사일” 로 컬럼이름을 대체해 보세요.

25. 업무(jobs)별로 업무이름(job_title)과 최고월급(max_salary)을 월급의 내림차순(DESC)로 정렬하세요.

26. 담당 매니저가 배정되어있으나 커미션비율이 없고,
월급이 3000초과인 직원의 이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.

27. 최고월급(max_salary)이 10000 이상인 업무의 이름(job_title)과 최고월급(max_salary)을
최고월급의(max_salary) 내림차순(DESC)로 정렬하여 출력하세요.    

28. 월급이 14000 미만 10000 이상인 직원의 이름(first_name), 월급, 커미션퍼센트를
월급순(내림차순) 출력하세오. 단 커미션퍼센트 가 null 이면 0 으로 나타내시오.

29. 부서번호가 10, 90, 100 인 직원의 이름, 월급, 입사일, 부서번호를 나타내시오.
입사일은 1977-12 와 같이 표시하시오.

30. 이름(first_name)에 S 또는 s 가 들어가는 직원의 이름, 월급을 나타내시오.

31. 전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세오.

32. 정확하지 않지만, 지사가 있을 것으로 예상되는 나라들을 나라이름을 대문자로 출력하고,
올림차순(ASC)으로 정렬해 보세오.

33. 입사일이 03/12/31 일 이전 입사한 직원의 이름, 월급, 전화 번호, 입사일을 출력하세요.
전화번호는 545-343-3433 과 같은 형태로 출력하시오.

34. 매니저가 있는 직원은 몇 명입니까? 아래의 결과가 나오도록 쿼리문을 작성하세요.
컴럼명: haveMngCnt
필드값: 106

35. 직원중에 최고임금(salary)과  최저임금을 “최고임금, “최저임금”프로젝션 타이틀로 함께 출력해 보세요.
두 임금의 차이는 얼마인가요?  “최고임금 – 최저임금”이란 타이틀로 함께 출력해 보세요.

36. 마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
예) 2014년 07월 10일

37. 부서별로 평균임금, 최고임금, 최저임금을 부서아이디(department_id)와 함께 출력합니다.
정렬순서는 부서번호(department_id) 내림차순입니다.

38. 업무(job_id)별로 평균임금, 최고임금, 최저임금을 업무아이디(job_id)와 함께 출력하고,
정렬순서는 최저임금 내림차순, 평균임금(소수점 반올림), 오름차순 순입니다.
(정렬순서는 최소임금 2500 구간일때 확인해볼 것)

39. 가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
예) 2001-01-13 토요일 

40. 평균임금과 최저임금의 차이가 2000 미만인 부서(department_id), 평균임금, 최저임금 그리고 (평균임금 – 최저임금)를
(평균임금 – 최저임금)의 내림차순으로 정렬해서 출력하세요.

41. 업무(JOBS)별로 최고임금과 최저임금의 차이를 출력해보세요.
차이를 확인할 수 있도록 내림차순으로 정렬하세요.

42. 2005년 이후 입사자중 관리자별로 평균급여 최소급여 최대급여를 알아보려고 한다.
출력은 관리자별로 평균급여가 5000이상 중에 평균급여 최소급여 최대급여를 출력합니다.
평균급여의 내림차순으로 정렬하고 평균급여는 소수점 첫째짜리에서 반올림 하여 출력합니다.

43. 아래회사는 보너스 지급을 위해 직원을 입사일 기준으로 나눌려고 합니다.
입사일이 02/12/31일 이전이면 '창립맴버, 03년은 '03년입사’, 04년은 ‘04년입사’
이후입사자는 ‘상장이후입사’ optDate 컬럼의 데이터로 출력하세요.
정렬은 입사일로 오름차순으로 정렬합니다.

44. 직원들의 사번(employee_id), 이름(firt_name), 성(last_name)과 부서명(department_name)을 조회하여
부서이름(department_name) 오름차순, 사번(employee_id) 내림차순 으로 정렬하세요.
(106건)

45. employees 테이블의 job_id는 현재의 업무아이디를 가지고 있습니다.
직원들의 사번(employee_id), 이름(firt_name), 급여(salary), 부서명(department_name), 현재업무(job_title)를
사번(employee_id) 오름차순 으로 정렬하세요.
부서가 없는 Kimberely(사번 178)은 표시하지 않습니다.
(106건)
+ 45-1. 문제 45번 에서 부서가 없는 Kimberely(사번 178)까지 표시해 보세요.
(107건)

46. 도시별로 위치한 부서들을 파악하려고 합니다.
도시아이디, 도시명, 부서명, 부서아이디를 도시아이디(오름차순)로 정렬하여 출력하세요.
부서가 없는 도시는 표시하지 않습니다.
(27건)
+ 46-1. 문제 46번 에서 부서가 없는 도시도 표시합니다. 
(43건)

47. 지역(regions)에 속한 나라들을 지역이름(region_name), 나라이름(country_name)으로 출력하되
지역이름(오름차순), 나라이름(내림차순) 으로 정렬하세요.
(25건)

48. 자신의 매니저보다 채용일(hire_date)이 빠른 사원의
사번(employee_id), 이름(first_name)과 채용일(hire_date), 매니저이름(first_name), 매니저입사일(hire_date)을 조회하세요.
(37건)

49. 나라별로 어떠한 부서들이 위치하고 있는지 파악하려고 합니다.
나라명, 나라아이디, 도시명, 도시아이디, 부서명, 부서아이디를 나라명(오름차순)로 정렬하여 출력하세요.
값이 없는 경우 표시하지 않습니다.
(27건)

50. job_history 테이블은 과거의 담당업무의 데이터를 가지고 있다.
과거의 업무아이디(job_id)가 ‘AC_ACCOUNT’로 근무한 사원의 사번, 이름(풀네임), 업무아이디, 시작일, 종료일을 출력하세요.
이름은 first_name과 last_name을 합쳐 출력합니다.
(2건)

51. 각 부서(department)에 대해서 부서번호(department_id), 부서이름(department_name),
매니저(manager)의 이름(first_name), 위치(locations)한 도시(city), 나라(countries)의 이름(countries_name)
그리고 지역구분(regions)의 이름(resion_name)까지 전부 출력해 보세요.
(11건)

52. 각 사원(employee)에 대해서 사번(employee_id), 이름(first_name),
부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)도 표시합니다.
(106명)

53. 'Den' 보다 급여를 많은 사람의 이름과 급여는?

< Problem Order >
28,  6, 45, 21, 12, 19, 40, 41, 37, 8, 24, 31, 52, 20, 2, 22, 3, 25, 46, 43, 1, 16, 10, 5, 48, 15,
4, 14, 30, 13, 47, 18, 17, 33, 7, 49, 23, 50, 44, 35, 39, 11, 29, 34, 51, 36, 26, 42, 32, 9, 38, 27
*/

-- Q28)
SELECT
    first_name
    || ' ㅎ '
    || last_name                이름,
    salary                      월급,
    nvl(commission_pct, 0)      커미션퍼센트
FROM
    employees
WHERE
        10000 <= salary
    AND salary < 14000
ORDER BY
    salary DESC;

--

-- Q06)
SELECT
    first_name
    || ': '
    || last_name   이름,
    salary         월급
FROM
    employees
WHERE
    salary >= 15000;

--

-- Q45)
SELECT
    employee_id      사번,
    first_name
    || ' - '
    || last_name     이름,
    salary           급여,
    department_name  부서명,
    job_title        현재업무
FROM
    employees    emply,
    jobs         jobs,
    departments  dpmt
WHERE
        emply.job_id = jobs.job_id
    AND emply.department_id = dpmt.department_id
ORDER BY
    emply.employee_id;

-- Q45 - 1)
SELECT
    employee_id      사번,
    first_name
    || ' - '
    || last_name     이름,
    salary           급여,
    department_name  부서명,
    job_title        현재업무
FROM
    employees    emply
    LEFT OUTER JOIN departments  dpmt ON emply.department_id = dpmt.department_id,
    jobs         jobs
WHERE
    emply.job_id = jobs.job_id
ORDER BY
    emply.employee_id;

-- Q45 - 2)
SELECT
    employee_id      사번,
    first_name
    || ' - '
    || last_name     이름,
    salary           급여,
    department_name  부서명,
    job_title        현재업무
FROM
    employees    emply,
    jobs         jobs,
    departments  dpmt
WHERE
        emply.job_id = jobs.job_id
    AND emply.department_id = dpmt.department_id (+)
ORDER BY
    emply.employee_id;

--

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

--

-- Q12)
SELECT
    first_name
    || '_'
    || last_name   이름,
    salary         연봉
FROM
    employees
WHERE
    first_name LIKE '%am%';

--

-- Q19)
SELECT
    first_name
    || ' '
    || last_name   이름,
    salary         급여
FROM
    employees
WHERE
    salary >= 10000
ORDER BY
    salary DESC;

--

-- Q40)
SELECT
    department_id                                      부서,
    trunc(AVG(salary), 3)                              평균임금,
    MIN(salary)                                        최저임금,
    trunc((AVG(salary) - MIN(salary)), 3)              "평균-최저"
FROM
    employees
GROUP BY
    department_id
HAVING
    ( AVG(salary) - MIN(salary) ) < 2000
ORDER BY
    ( AVG(salary) - MIN(salary) ) DESC;

--

-- Q41)
SELECT
    job_id                           업무명,
    MAX(salary) - MIN(salary)        "최고-최저"
FROM
    employees
GROUP BY
    job_id
ORDER BY
    ( MAX(salary) - MIN(salary) ) DESC;

--

-- Q37)
SELECT
    department_id   부서,
    AVG(salary)     평균임금,
    MAX(salary)     최고임금,
    MIN(salary)     최저임금
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id DESC;

--

-- Q08)
SELECT
    first_name
    || '-'
    || last_name   이름,
    salary         연봉
FROM
    employees
WHERE
    first_name = 'Lex';

--

-- Q24)
SELECT
    first_name
    || ' * '
    || last_name   이름,
    salary         월급,
    phone_number   전화번호,
    hire_date      입사일
FROM
    employees
ORDER BY
    hire_date ASC;

--

-- Q31)
SELECT
    department_name 부서이름
FROM
    departments
ORDER BY
    length(department_name) DESC;

--

-- Q52)
SELECT
    emply.employee_id        사번,
    emply.first_name
    || ' - '
    || emply.last_name       이름,
    depmt.department_name    부서명,
    manager.first_name
    || ' - '
    || manager.last_name     매니저이름
FROM
    employees    emply,
    employees    manager,
    departments  depmt
WHERE
        emply.manager_id = manager.employee_id
    AND emply.department_id = depmt.department_id (+);

-- Q52 - 1)
SELECT
    emply.employee_id        사번,
    emply.first_name
    || ' - '
    || emply.last_name       이름,
    depmt.department_name    부서명,
    manager.first_name
    || ' - '
    || manager.last_name     매니저이름
FROM
    employees    manager, employees    emply
    LEFT OUTER JOIN departments  depmt ON emply.department_id = depmt.department_id
WHERE
    emply.manager_id = manager.employee_id;

--

-- Q20)
SELECT
    department_id  부서번호,
    salary         급여,
    first_name
    || '- '
    || last_name   이름
FROM
    employees
ORDER BY
    department_id ASC,
    salary DESC;

--

-- Q02)
SELECT
    first_name    이름,
    last_name     성,
    phone_number  전화번호,
    email         이메일,
    hire_date     입사일
FROM
    employees;

--

-- Q22)
SELECT
    first_name
    || '- '
    || last_name   이름,
    department_id  부서,
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
            '팀 없음'
    END            팀
FROM
    employees;

--

-- Q03)
SELECT
    first_name
    || '; '
    || last_name   이름,
    phone_number   전화번호,
    hire_date      입사일,
    salary         급여
FROM
    employees;

--

-- Q24)
SELECT
    jobs.job_title          업무이름,
    MAX(emply.salary)       최고월급
FROM
    jobs       jobs,
    employees  emply
WHERE
    jobs.job_id = emply.job_id
ORDER BY
    emply.salary DESC;