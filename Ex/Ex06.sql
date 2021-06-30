/*
Data Control Language In Oracle.system
*/
-- 계정 생성: CREATE USER (id) IDENTIFIED BY (password)
CREATE USER webdb IDENTIFIED BY 1234;

-- 비밀번호 변경: ALTER USER (수정할 유저 아이디) IDENTIFIED BY (새로운 비밀번호)
CREATE USER webdb IDENTIFIED BY webdb;

-- 접속 권한 부여: GRANT (name), (name) TO (유저 아이디)
GRANT resource, connect TO webdb;

-- 계정 삭제: DROP USER (id) cascade;
DROP USER webdb cascade;

-- // --

/*
Data Definition Language
*/
CREATE TABLE books ( -- TABLE 이름
    -- column이름    column의row자료형
    book_id   NUMBER(5),
    title     VARCHAR(50),
    author    VARCHAR(10),
    pub_date  DATE
);

-- ADD column
ALTER TABLE books ADD (pubs VARCHAR2(50)); -- column이름    column의row자료형

-- MODIFY column
ALTER TABLE books MODIFY (title VARCHAR2(100)); -- column이름    변경될column의row자료형

-- RENAME COLUMN
ALTER TABLE books RENAME COLUMN title TO subject; -- 변경전column이름 TO 변경후column이름

-- DROP(삭제) column
ALTER TABLE books DROP (author);

-- RENAME table
RENAME books TO article;

-- DROP TABLE
DROP TABLE article;

-- PK & NOT NULL setting + FK setting
CREATE TABLE author (
    author_id NUMBER(10),
    author_name VARCHAR2(100) NOT NULL,
    author_desc VARCHAR2(500),
    primary key(author_id)
);
RENAME author TO authors;

-- + --

CREATE TABLE books ( book_id NUMBER(10), title VARCHAR(100) NOT NULL, pubs VARCHAR(100), pub_date DATE, author_id NUMBER(
10), primary key(book_id),
constraint book_fk FOREIGN KEY(author_id)
    REFERENCES authors(author_id)
);

-- // --

/*
Data Manipulation Language
*/
-- 묵시적 INSERT - column 개수 만큼 값 입력
-- INSERT INTO 테이블명
-- VALUES new row(1번column값, 2번column값, 3번column값, ... )
INSERT INTO authors VALUES (
    1,
    '박경리',
    '토지 작가'
);

SELECT
    *
FROM
    authors;

-- 명시적 INSERT - 명시된 column에 대한 값만 입력
-- INSERT INTO 테이블명(1번column명, 2번column명, 3번column명, ... )
-- VALUES new row(1번column값, 2번column값, 3번column값, ... )
INSERT INTO authors (
    author_id,
    author_name
) VALUES (
    2,
    '이문열'
);

-- UPDATE
UPDATE authors
SET
    author_name = '기안84',
    author_desc = '웹툰 작가'
WHERE
    author_id = 1;

SELECT
    *
FROM
    authors;
-- WHERE절 연산자 --> 조건에 해당하는 모든 row의 값을 UPDATE
UPDATE authors
SET
    author_name = '이호진'
WHERE
    author_id <= 2;
-- WHERE절 없음 --> 모든 row의 값이 UPDATE
UPDATE authors
SET
    author_name = '강풀',
    author_desc = '인기 작가';

-- DELETE --> WHERE절에 해당하는 row 삭제
-- WHERE절이 없으면 모든 row 데이터 삭제..................
DELETE FROM authors
WHERE
    author_id = 1;

SELECT
    *
FROM
    authors;

DELETE FROM authors;

INSERT INTO authors VALUES (
    1,
    '박경리',
    '토지 작가'
);

COMMIT;

INSERT INTO authors VALUES (
    2,
    '기안84',
    '웹툰 작가'
);

INSERT INTO authors VALUES (
    3,
    '이문열',
    '인기 작가'
);

UPDATE authors
SET
    author_desc = '나혼자산다 출연'
WHERE
    author_id = 2;

DELETE FROM authors
WHERE
    author_id = 1;

SELECT
    *
FROM
    authors;

ROLLBACK;

INSERT INTO authors VALUES (
    4,
    '이호진',
    '학생'
);

CREATE SEQUENCE sqc_author_id INCREMENT BY 1 START WITH 1 NOCACHE; -- NOCACHE = 시퀀스가 실행 될 때마다 숫자가 생성 / NOCACHE가 없을경우 일정 숫자를 생성 후 시퀀스 실행될 때 지정

DELETE FROM authors;

COMMIT;

INSERT INTO authors VALUES (
    sqc_author_id.NEXTVAL,
    '기안84',
    '웹툰작가'
);

SELECT
    *
FROM
    authors;

INSERT INTO authors VALUES (
    sqc_author_id.NEXTVAL,
    '이문열',
    '작가'
);

INSERT INTO authors VALUES (
    sqc_author_id.NEXTVAL,
    '박경리',
    '작가'
);

sqc_author_id.nextval;

SELECT
    *
FROM
    user_sequences;

SELECT
    sqc_author_id.CURRVAL
FROM
    dual;

SELECT
    sqc_author_id.NEXTVAL -- NEXTVAL을 SELECT으로 확인하면 해당 시퀀스가 증감됨
FROM
    dual;

INSERT INTO authors VALUES (
    sqc_author_id.NEXTVAL,
    '이호진',
    '남자'
);

-- DROP(삭제) SEQUENCE
DROP SEQUENCE sqc_author_id;

SELECT
    *
FROM
    user_sequences;