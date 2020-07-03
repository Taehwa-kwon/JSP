--------------------------------------------------------
--  파일이 생성됨 - 금요일-7월-03-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_STUDENTS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "JDBCTEST"."PKG_STUDENTS" 
AS 

  --0.주소를 가져오는 프로시저 (이렇게 프로시저를 가져오는 이유는 아래에 각각의 프로시저를 한꺼번에 묶기 위함이며, 이렇게 하는순간 다른 사람들이 아래의 프로시저를사용하는 경우 삽된다.)
  PROCEDURE PROC_SEL_ADDR(
    IN_ADDR IN VARCHAR2,
    IN_LVL IN VARCHAR2, --NUMBER로 할 필요없다. 이유는 자바에서 넘어오면 DB에서는 텍스트로 받아오기 때문에.
    O_CUR OUT SYS_REFCURSOR
  );
  --1.학생 학과를 가져오는 프로시저
    PROCEDURE PROC_SEL_DEPT(
    IN_DEPT IN VARCHAR2,
    IN_LVL IN VARCHAR2, --NUMBER로 할 필요없다. 이유는 자바에서 넘어오면 DB에서는 텍스트로 받아오기 때문에.
    O_CUR OUT SYS_REFCURSOR
  );
  
  --2.학생리스트에 추가하는 프로시저
    PROCEDURE PROC_SAVE_STUDENT (
        IN_STU_NAME IN VARCHAR2,
        IN_STU_TEL IN VARCHAR2,
        IN_STU_ADDR IN VARCHAR2,
        IN_STU_ADDR_GRP IN VARCHAR2,
        IN_STU_ADDR2 IN VARCHAR2,
        IN_STU_DEPT_GRP IN VARCHAR2,
        IN_STU_DEPT IN VARCHAR2
    );
  
  --3.학생리스트 가져오기 ; 
  PROCEDURE PROC_SEL_STUDENTS (
    IN_SEL_SEARCH IN VARCHAR2,
    IN_TXT_SEARCH IN VARCHAR2,
    O_CUR           OUT     SYS_REFCURSOR
  );
  
  --4.학생 삭제 프로시저;
  PROCEDURE PROC_DEL_STUDENTS(
        IN_STU_IDS IN  VARCHAR2
  );
  
  /* 이런방식으로 하면 만약 5개를 삭제했을떄 4번쨰 에서 오류가 나면 트랜잭션에 문제가 발생해서 IN을 사용한다.
  PROCEDURE PROC_DEL_STUDENT(
    IN_STU_ID IN VARCHAR2
  )
  AS
  BEGIN
    SELECT * FROM STUDENTS_TBL
    WHERE STU_ID = IN_STU_ID   
  END
  ;
  
  
  */

  
/*
  --1.등록할때 18개 광역시 도를 가지고 가는 프로시저
  PROCEDURE PROC_SEL_SIDO (
    O_CUR OUT SYS_REFCURSOR
  );
  
  --2. 등록시 시구군을 가지고 가는 프로시져
  PROCEDURE PROC_SEL_GUGUN(
    IN_SIDO IN VARCHAR2,
    O_CUR OUT SYS_REFCURSOR
  );
  --3.등록시 동을 가지고 가는 프로시져
  PROCEDURE PROC_SEL_DONG(
    IN_DONG IN VARCHAR2,
    O_CUR OUT SYS_REFCURSOR
  );
  
*/  

 --5.학생 한명 가져오기
 PROCEDURE PROC_SEL_STUDENT(
    IN_STU_ID IN VARCHAR2,
    O_CUR OUT SYS_REFCURSOR
 );
  
  

END PKG_STUDENTS;

/
