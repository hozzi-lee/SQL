-- Q01)
SELECT
    emp.employee_id        사번,
    emp.first_name         이름,
    emp.last_name          성,
    dep.department_name    부서명
FROM
    employees    emp,
    departments  dep
WHERE
    emp.department_id = dep.department_id
ORDER BY
    dep.department_name ASC,
    emp.employee_id DESC;

--

-- Q02)
SELECT
    emp.employee_id        사번,
    emp.first_name
    || '-'
    || emp.last_name       이름,
    emp.salary             급여,
    dep.department_name    부서명,
    jobs.job_title         현재업무
FROM
    employees    emp,
    departments  dep,
    jobs         jobs
WHERE
        emp.department_id = dep.department_id
    AND emp.job_id = jobs.job_id
ORDER BY
    emp.employee_id ASC;

-- Q02_1)
SELECT
    emp.employee_id        사번,
    emp.first_name
    || '-'
    || emp.last_name       이름,
    emp.salary             급여,
    dep.department_name    부서명,
    jobs.job_title         현재업무
FROM
    employees    emp,
    departments  dep,
    jobs         jobs
WHERE
        emp.department_id = dep.department_id (+)
    AND emp.job_id = jobs.job_id
ORDER BY
    emp.employee_id ASC;

-- Q02_2)
SELECT
    emp.employee_id        사번,
    emp.first_name
    || '-'
    || emp.last_name       이름,
    emp.salary             급여,
    dep.department_name    부서명,
    jobs.job_title         현재업무
FROM
    employees    emp
    LEFT OUTER JOIN departments  dep ON emp.department_id = dep.department_id,
    jobs         jobs
WHERE
    emp.job_id = jobs.job_id
ORDER BY
    emp.employee_id ASC;

--

-- Q03)
SELECT
    loca.location_id       도시아이디,
    loca.city              도시명,
    dep.department_name    부서이를,
    dep.department_id      부서아이디
FROM
    locations    loca,
    departments  dep
WHERE
    loca.location_id = dep.location_id
ORDER BY
    loca.location_id ASC;

-- Q03_1)
SELECT
    loca.location_id       도시아이디,
    loca.city              도시명,
    dep.department_name    부서이를,
    dep.department_id      부서아이디
FROM
    locations    loca
    LEFT OUTER JOIN departments  dep ON loca.location_id = dep.location_id
ORDER BY
    loca.location_id ASC;

-- Q03_2)
SELECT
    loca.location_id       도시아이디,
    loca.city              도시명,
    dep.department_name    부서이를,
    dep.department_id      부서아이디
FROM
    locations    loca,
    departments  dep
WHERE
    loca.location_id = dep.location_id (+)
ORDER BY
    loca.location_id ASC;

--

-- Q04)
SELECT
    ctry.country_name    나라이름,
    rgo.region_name      지역이름
FROM
    countries  ctry,
    regions    rgo
WHERE
    ctry.region_id = rgo.region_id
ORDER BY
    rgo.region_name ASC,
    ctry.country_name DESC;

--

-- Q05)
SELECT
    emp.employee_id          사번,
    emp.first_name
    || '-'
    || emp.last_name         이름,
    emp.hire_date            채용일,
    manager.first_name
    || '-'
    || manager.last_name     매니저이름,
    manager.hire_date        "매니저의 채용일"
FROM
    employees  emp,
    employees  manager
WHERE
        emp.manager_id = manager.employee_id
    AND emp.hire_date < manager.hire_date;

--

-- Q06)
SELECT
    ctry.country_name       나라명,
    ctry.country_id         나라아이디,
    lct.city                도시명,
    lct.location_id         도시아이디,
    dpmt.department_name    부서명,
    dpmt.department_id      부서아이디
FROM
    countries    ctry,
    locations    lct,
    departments  dpmt
WHERE
        ctry.country_id = lct.country_id
    AND lct.location_id = dpmt.location_id
ORDER BY
    ctry.country_name ASC;

--

-- Q07)
SELECT
    eply.employee_id      사번,
    eply.first_name
    || '-'
    || eply.last_name     이름,
    eply.job_id           업무아이디,
    jhty.start_date       시작일,
    jhty.end_date         종료일
FROM
    employees    eply,
    job_history  jhty
WHERE
        eply.job_id = jhty.job_id
    AND jhty.job_id = 'AC_ACCOUNT';

--

-- Q08)
SELECT
    dpmt.department_id      부서번호,
    dpmt.department_name    부서이름,
    eply.first_name
    || '-'
    || eply.last_name       이름,
    lct.city                위치한도시,
    ctry.country_name       나라이름,
    rgo.region_name         지역이름
FROM
    employees    eply,
    departments  dpmt,
    locations    lct,
    countries    ctry,
    regions      rgo
WHERE
        eply.employee_id = dpmt.manager_id
    AND dpmt.location_id = lct.location_id
    AND lct.country_id = ctry.country_id
    AND ctry.region_id = rgo.region_id;

--

-- Q09)
SELECT
    eply.employee_id         사번,
    eply.first_name
    || '-'
    || eply.last_name        사원이름,
    dpmt.department_name     부서명,
    manager.first_name
    || '-'
    || manager.last_name     매니저이름
FROM
    employees    eply,
    employees    manager,
    departments  dpmt
WHERE
        eply.manager_id = manager.employee_id
    AND eply.department_id = dpmt.department_id (+);

-- Q09_1)
SELECT
    eply.employee_id         사번,
    eply.first_name
    || '-'
    || eply.last_name        사원이름,
    dpmt.department_name     부서명,
    manager.first_name
    || '-'
    || manager.last_name     매니저이름
FROM
    employees    manager, employees    eply
    LEFT OUTER JOIN departments  dpmt ON eply.department_id = dpmt.department_id
WHERE
    eply.manager_id = manager.employee_id;