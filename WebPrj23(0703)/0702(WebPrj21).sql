--------------------------------------------------------
--  ������ ������ - �����-7��-02-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package PKG_STUDENTS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "JDBCTEST"."PKG_STUDENTS" 
AS 

  --0.�ּҸ� �������� ���ν��� (�̷��� ���ν����� �������� ������ �Ʒ��� ������ ���ν����� �Ѳ����� ���� �����̸�, �̷��� �ϴ¼��� �ٸ� ������� �Ʒ��� ���ν���������ϴ� ��� ��ȴ�.)
  PROCEDURE PROC_SEL_ADDR(
    IN_ADDR IN VARCHAR2,
    IN_LVL IN VARCHAR2, --NUMBER�� �� �ʿ����. ������ �ڹٿ��� �Ѿ���� DB������ �ؽ�Ʈ�� �޾ƿ��� ������.
    O_CUR OUT SYS_REFCURSOR
  );
  --1.�л� �а��� �������� ���ν���
    PROCEDURE PROC_SEL_DEPT(
    IN_DEPT IN VARCHAR2,
    IN_LVL IN VARCHAR2, --NUMBER�� �� �ʿ����. ������ �ڹٿ��� �Ѿ���� DB������ �ؽ�Ʈ�� �޾ƿ��� ������.
    O_CUR OUT SYS_REFCURSOR
  );
  
  --2.�л�����Ʈ�� �߰��ϴ� ���ν���
    PROCEDURE PROC_SAVE_STUDENT (
        IN_STU_NAME IN VARCHAR2,
        IN_STU_TEL IN VARCHAR2,
        IN_STU_ADDR IN VARCHAR2,
        IN_STU_ADDR_GRP IN VARCHAR2,
        IN_STU_ADDR2 IN VARCHAR2,
        IN_STU_DEPT_GRP IN VARCHAR2,
        IN_STU_DEPT IN VARCHAR2
    );
  
  --3.�л�����Ʈ �������� ; 
  PROCEDURE PROC_SEL_STUDENTS
  (
    IN_SEL_SEARCH IN VARCHAR2,
    IN_TXT_SEARCH IN VARCHAR2,
    O_CUR           OUT     SYS_REFCURSOR
  );

    
  
/*
  --1.����Ҷ� 18�� ������ ���� ������ ���� ���ν���
  PROCEDURE PROC_SEL_SIDO (
    O_CUR OUT SYS_REFCURSOR
  );
  
  --2. ��Ͻ� �ñ����� ������ ���� ���ν���
  PROCEDURE PROC_SEL_GUGUN(
    IN_SIDO IN VARCHAR2,
    O_CUR OUT SYS_REFCURSOR
  );
  --3.��Ͻ� ���� ������ ���� ���ν���
  PROCEDURE PROC_SEL_DONG(
    IN_DONG IN VARCHAR2,
    O_CUR OUT SYS_REFCURSOR
  );
  
*/  
  
  

END PKG_STUDENTS;

/
