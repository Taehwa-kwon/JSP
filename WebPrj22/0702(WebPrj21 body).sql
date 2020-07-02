--------------------------------------------------------
--  파일이 생성됨 - 목요일-7월-02-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body PKG_STUDENTS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "JDBCTEST"."PKG_STUDENTS" AS

    --0.학생의 주소를 가져오는 것 
    PROCEDURE PROC_SEL_ADDR (
    IN_ADDR IN VARCHAR2, --COM_ID 를 말하고 
    IN_LVL IN VARCHAR2, --NUMBER로 할 필요없다. 이유는 자바에서 넘어오면 DB에서는 텍스트로 받아오기 때문에.
    O_CUR OUT SYS_REFCURSOR
  )
    AS
    
    BEGIN
    
    OPEN O_CUR FOR
    SELECT COM_ID, GRP_ID, COM_VAL FROM COMMONS_TBL
   
    WHERE GRP_ID = 'GRP001' AND COM_LVL=IN_LVL
    AND PARENT_ID LIKE '%' || IN_ADDR ||'%'
    ORDER BY COM_ID ASC;
    
    END PROC_SEL_ADDR;
    
     --1.학생 학과를 가져오는 프로시저
    PROCEDURE PROC_SEL_DEPT(
    IN_DEPT IN VARCHAR2,
    IN_LVL IN VARCHAR2, --NUMBER로 할 필요없다. 이유는 자바에서 넘어오면 DB에서는 텍스트로 받아오기 때문에.
    O_CUR OUT SYS_REFCURSOR
  )
  
  AS
  
  BEGIN
  
    OPEN O_CUR FOR
    SELECT COM_ID, GRP_ID, COM_VAL FROM COMMONS_TBL
    WHERE GRP_ID = 'GRP002' AND COM_LVL=IN_LVL
    AND PARENT_ID LIKE '%' || IN_DEPT ||'%'
    ORDER BY COM_ID ASC;
  
     END PROC_SEL_DEPT
     ;  
     
     
     
     --2.학생리스트에 추가하는 프로시저
    PROCEDURE PROC_SAVE_STUDENT (
        IN_STU_NAME IN VARCHAR2,
        IN_STU_TEL IN VARCHAR2,
        IN_STU_ADDR IN VARCHAR2,
        IN_STU_ADDR_GRP IN VARCHAR2,
        IN_STU_ADDR2 IN VARCHAR2,
        IN_STU_DEPT_GRP IN VARCHAR2,
        IN_STU_DEPT IN VARCHAR2
    )
    AS
        V_STU_ID CHAR(6);
        
        
    BEGIN
        --1.STU_ID를 구해야 한다.
        SELECT 
            'STU' || TRIM(TO_CHAR(TO_NUMBER(SUBSTR(NVL(MAX(STU_ID),'STU000'),4))+1,'000'))
            INTO V_STU_ID
        FROM STUDENTS_TBL
        ;
        
        --2.SAVE 
       INSERT INTO STUDENTS_TBL
    (
        STU_ID
        ,STU_NAME
        ,STU_TEL
        ,STU_ADDR
        ,STU_ADDR_GRP
        ,STU_ADDR2
        ,STU_DEPT_GRP
        ,STU_DEPT
    )
    VALUES
    (
        V_STU_ID
        ,IN_STU_NAME
        ,IN_STU_TEL
        ,IN_STU_ADDR
        ,IN_STU_ADDR_GRP
        ,IN_STU_ADDR2
        ,IN_STU_DEPT_GRP
        ,IN_STU_DEPT    
    );
            
        
    END 
    PROC_SAVE_STUDENT;
    
    --3.학생리스트 가져오기
PROCEDURE PROC_SEL_STUDENTS(
  IN_SEL_SEARCH IN VARCHAR2,
    IN_TXT_SEARCH IN VARCHAR2,
    O_CUR           OUT     SYS_REFCURSOR
  ) AS
  BEGIN
    OPEN O_CUR FOR
    
     SELECT 
      STU_ID, STU_NAME, STU_TEL, STU_ADDR, STU_DEPT
      ,COMID1 --최상위 경남, COM0000
      ,COMID2 --나머지 최상위
      ,COMID3 
      ,COMID4 --동
     FROM
        (
    SELECT T1.STU_ID, T1.STU_NAME, T1.STU_TEL
        , DECODE(T5.COM_VAL, 'ROOT', '', T5.COM_VAL) || ' ' || T4.COM_VAL || ' ' || T3.COM_VAL 
        || ' ' || T2.COM_VAL AS STU_ADDR -- 경남 
        , T7.COM_VAL || ' '|| T6.COM_VAL AS STU_DEPT
        ,T5.COM_ID AS COMID1 
        ,T4.COM_ID AS COMID2
        ,T3.COM_ID AS COMID3
        ,T2.COM_ID AS COMID4
    FROM   STUDENTS_TBL T1, COMMONS_TBL T2, COMMONS_TBL T3
        , COMMONS_TBL T4, COMMONS_TBL T5
        , COMMONS_TBL T6, COMMONS_TBL T7
    WHERE  T1.STU_ADDR = T2.COM_ID AND T1.STU_ADDR_GRP = T2.GRP_ID AND T2.GRP_ID = 'GRP001'
    AND   T2.PARENT_ID = T3.COM_ID AND T3.GRP_ID = 'GRP001'
    AND   T3.PARENT_ID = T4.COM_ID AND T4.GRP_ID = 'GRP001'
    AND   T4.PARENT_ID = T5.COM_ID AND T5.GRP_ID = 'GRP001'
    AND  T1.STU_DEPT  = T6.COM_ID AND T1.STU_DEPT_GRP = T6.GRP_ID AND T6.GRP_ID = 'GRP002'
    AND  T6.PARENT_ID = T7.COM_ID AND T7.GRP_ID = 'GRP002'
    )
    where stu_name like '%'|| IN_TXT_SEARCH ||'%'
    OR	  stu_addr  like '%'|| IN_TXT_SEARCH ||'%'
    OR	  stu_dept  like '%'|| IN_TXT_SEARCH ||'%'
    ;
    
  END PROC_SEL_STUDENTS;


/*    
--WHERE GRP_ID = 'GRP001' AND COM_LVL=IN_LVL  --문제는 SIDO 에서 IN_LVL에 1을 주면 AND PARENT_ID = IN_ADDR 이 
--AND PARENT_ID = IN_ADDR

--  PROCEDURE PROC_SEL_SIDO (
--   O_CUR OUT SYS_REFCURSOR --커서의 타입과 출력 
--  ) 
--  AS
 
--  BEGIN
--    OPEN O_CUR FOR --커서를 오픈시키고 
--    SELECT COM_ID, GRP_ID, COM_VAL FROM COMMONS_TBL
--    WHERE GRP_ID = 'GRP001' AND COM_LVL=1
 --   ORDER BY COM_ID ASC;

--  END PROC_SEL_SIDO;

-- PROCEDURE PROC_SEL_GUGUN(
 --   IN_SIDO IN VARCHAR2,
 --   O_CUR OUT SYS_REFCURSOR
  --) AS
 -- BEGIN
  --  OPEN O_CUR FOR
  --  SELECT COM_ID, GRP_ID, COM_VAL FROM COMMONS_TBL
  --  WHERE GRP_ID = 'GRP001' AND COM_LVL= 2
  --  AND PARENT_ID = IN_SIDO
   -- ORDER BY COM_ID ASC;
    
    
  
 -- END PROC_SEL_GUGUN;

--  PROCEDURE PROC_SEL_DONG(
 --   IN_DONG IN VARCHAR2,
  --  O_CUR OUT SYS_REFCURSOR
  --) AS
  --BEGIN
   -- OPEN O_CUR FOR
    --SELECT COM_ID, GRP_ID, COM_VAL FROM COMMONS_TBL
    --WHERE GRP_ID = 'GRP001' AND COM_LVL= 3
    --AND PARENT_ID = IN_DONG
    --ORDER BY COM_ID ASC;
   
--  END PROC_SEL_DONG;
*/
END PKG_STUDENTS;

/
