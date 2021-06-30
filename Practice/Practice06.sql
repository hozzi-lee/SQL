/* Oracle.system.webdb 계정 생성
-- 계정 생성
CREATE USER webdb IDENTIFIED BY webdb;

-- 접속 권한 부여
GRANT resource, connect TO webdb;
*/

-- CREATE authors TABLE
CREATE TABLE authors (
    author_id    NUMBER(10),
    author_name  VARCHAR2(100) NOT NULL,
    author_desc  VARCHAR2(100),
    PRIMARY KEY ( author_id )
);

-- CREATE SEQUENCE for authors TABLE
CREATE SEQUENCE sqc_author_id INCREMENT BY 1 START WITH 1 NOCACHE;

-- authors ROW 값 저장 - 6
INSERT INTO authors VALUES (
    sqc_author_id.NEXTVAL,
    '김문열',
    '경북 양양'
);

INSERT INTO authors VALUES (
    sqc_author_id.NEXTVAL,
    '박경리',
    '경상남도 통영'
);

INSERT INTO authors VALUES (
    sqc_author_id.NEXTVAL,
    '유시민',
    '17대 국회의원'
);

INSERT INTO authors VALUES (
    sqc_author_id.NEXTVAL,
    '기안84',
    '기안동에서 산 84년생'
);

INSERT INTO authors VALUES (
    sqc_author_id.NEXTVAL,
    '강풀',
    '온라인 만화가 1세대'
);

INSERT INTO authors VALUES (
    sqc_author_id.NEXTVAL,
    '김영하',
    '알쓸신잡'
);

-- 김문열 --> 이문열 UPDATE
UPDATE authors
SET
    author_name = '이문열'
WHERE
    author_id = 1;

-- SEQUENCE.CURRVAL(현재 시퀀스 값) 확인
SELECT
    sqc_author_id.CURRVAL
FROM
    dual;

-- authors TABLE 모든 정보 확인
SELECT
    *
FROM
    authors;


-- CREATE books TABLE
CREATE TABLE books (
    book_id    NUMBER(10),
    title      VARCHAR2(200) NOT NULL,
    pubs       VARCHAR2(100),
    pub_date   DATE,
    author_id  NUMBER(10),
    PRIMARY KEY ( book_id ),
    CONSTRAINT book_fk FOREIGN KEY ( author_id )
        REFERENCES authors ( author_id )
);

-- CREATE SEQUENCE for books TABLE
CREATE SEQUENCE sqc_book_id INCREMENT BY 1 START WITH 1 NOCACHE;

-- books ROW 값 저장 - 8
INSERT INTO books VALUES (
    sqc_book_id.NEXTVAL,
    '우리들의 일그러진 영웅',
    '다림',
    '1998-02-22',
    (
        SELECT
            author_id
        FROM
            authors
        WHERE
            author_name = '이문열'
    )
);

INSERT INTO books VALUES (
    sqc_book_id.NEXTVAL,
    '삼국지',
    '민음사',
    '2002-03-01',
    (
        SELECT
            author_id
        FROM
            authors
        WHERE
            author_name = '이문열'
    )
);

INSERT INTO books VALUES (
    sqc_book_id.NEXTVAL,
    '토지',
    '마로니에북스',
    '2012-08-15',
    (
        SELECT
            author_id
        FROM
            authors
        WHERE
            author_name = '박경리'
    )
);

INSERT INTO books VALUES (
    sqc_book_id.NEXTVAL,
    '유시민의 글쓰기 특강',
    '생각의 길',
    '2015-04-01',
    (
        SELECT
            author_id
        FROM
            authors
        WHERE
            author_name = '유시민'
    )
);

INSERT INTO books VALUES (
    sqc_book_id.NEXTVAL,
    '패션왕',
    '중앙북스(books)',
    '2012-02-22',
    (
        SELECT
            author_id
        FROM
            authors
        WHERE
            author_name = '기안84'
    )
);

INSERT INTO books VALUES (
    sqc_book_id.NEXTVAL,
    '순정만화',
    '재미주의',
    '2011-08-03',
    (
        SELECT
            author_id
        FROM
            authors
        WHERE
            author_name = '강풀'
    )
);

INSERT INTO books VALUES (
    sqc_book_id.NEXTVAL,
    '오직두사람',
    '문학동네',
    '2017-05-04',
    (
        SELECT
            author_id
        FROM
            authors
        WHERE
            author_name = '김영하'
    )
);

INSERT INTO books VALUES (
    sqc_book_id.NEXTVAL,
    '26년',
    '재미주의',
    '2012-02-04',
    (
        SELECT
            author_id
        FROM
            authors
        WHERE
            author_name = '강풀'
    )
);

-- books TABLE SEQUENCE 확인
SELECT
    sqc_book_id.CURRVAL
FROM
    dual;

-- books TABLE 확인
SELECT
    *
FROM
    books;

-- books, authors EQUI JOIN
SELECT
    bok.book_id         책코드번호,
    bok.title           책제목,
    bok.pubs            출판사,
    bok.pub_date        출판일,
    bok.author_id       "책의 작가코드",
    atho.author_id      작가코드번호,
    atho.author_name    작가이름,
    atho.author_desc    작가정보
FROM
    books    bok,
    authors  atho
WHERE
    bok.author_id = atho.author_id;

-- 강풀의 author_desc 정보 수정
UPDATE authors
SET
    author_desc = '서울특별시'
WHERE
    author_id = 5;

-- 수정된 정보 확인
SELECT
    bok.book_id         책코드번호,
    bok.title           책제목,
    bok.pubs            출판사,
    bok.pub_date        출판일,
    bok.author_id       "책의 작가코드",
    atho.author_id      작가코드번호,
    atho.author_name    작가이름,
    atho.author_desc    작가정보
FROM
    books    bok,
    authors  atho
WHERE
    bok.author_id = atho.author_id;


-- 삭제(초기화) 코드
DROP SEQUENCE sqc_book_id;

DROP SEQUENCE sqc_author_id;

DROP TABLE books;

DROP TABLE authors;