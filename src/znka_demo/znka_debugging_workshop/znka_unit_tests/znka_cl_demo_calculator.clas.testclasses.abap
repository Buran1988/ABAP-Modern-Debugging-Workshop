*"* use this source file for your ABAP unit test classes
*class ltc_calculator DEFINITION CREATE PUBLIC FOR TESTING
*  DURATION SHORT
*  RISK LEVEL HARMLESS.
*
*  PUBLIC SECTION.
*  METHOD: add .
*
*ENDCLASS.

CLASS ltc_Calculator DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
.
*?﻿<asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">
*?<asx:values>
*?<TESTCLASS_OPTIONS>
*?<TEST_CLASS>ltc_Calculator
*?</TEST_CLASS>
*?<TEST_MEMBER>f_Cut
*?</TEST_MEMBER>
*?<OBJECT_UNDER_TEST>ZNKA_CL_DEMO_CALCULATOR
*?</OBJECT_UNDER_TEST>
*?<OBJECT_IS_LOCAL/>
*?<GENERATE_FIXTURE>X
*?</GENERATE_FIXTURE>
*?<GENERATE_CLASS_FIXTURE>X
*?</GENERATE_CLASS_FIXTURE>
*?<GENERATE_INVOCATION>X
*?</GENERATE_INVOCATION>
*?<GENERATE_ASSERT_EQUAL>X
*?</GENERATE_ASSERT_EQUAL>
*?</TESTCLASS_OPTIONS>
*?</asx:values>
*?</asx:abap>
  PRIVATE SECTION.
    DATA:
      f_Cut TYPE REF TO znka_Cl_Demo_Calculator.  "class under test

    CLASS-METHODS: class_Setup.
    CLASS-METHODS: class_Teardown.
    METHODS: setup.
    METHODS: teardown.
    METHODS: add FOR TESTING.
    METHODS: divide FOR TESTING,
      divide_by_zero FOR TESTING.
ENDCLASS.       "ltc_Calculator


CLASS ltc_Calculator IMPLEMENTATION.

  METHOD class_Setup.


  ENDMETHOD.


  METHOD class_Teardown.



  ENDMETHOD.


  METHOD setup.


    CREATE OBJECT f_Cut.
  ENDMETHOD.


  METHOD teardown.



  ENDMETHOD.


  METHOD add.

    DATA a TYPE f.
    DATA b TYPE f.
    DATA result TYPE f.

    result = f_Cut->add(
        a = 3
        b = 4 ).

    cl_Abap_Unit_Assert=>assert_Equals(
      act   = result
      exp   = 7          "<--- please adapt expected value
      msg   = 'Ошибка при сложении'
*     level =
    ).
  ENDMETHOD.


  METHOD divide.

    DATA a TYPE f.
    DATA b TYPE f.
    DATA result TYPE f.

    result = f_Cut->divide(
        a = 6
        b = 3 ).

    cl_Abap_Unit_Assert=>assert_Equals(
      act   = result
      exp   = 2          "<--- please adapt expected value
     msg   = 'Ошибка при делении'
*     level =
    ).


  ENDMETHOD.

  METHOD divide_by_zero.

    DATA a TYPE f.
    DATA b TYPE f.
    DATA result TYPE f.

    TRY.
        result = f_Cut->divide(
            a = 6
            b = 0 ).
      CATCH cx_sy_zerodivide INTO DATA(lx_zerodivide).

    ENDTRY.


    cl_Abap_Unit_Assert=>assert_not_initial(
      EXPORTING
        act              = lx_zerodivide
        msg              = 'Не получено исключение cx_sy_zerodivide'
    ).


  ENDMETHOD.


ENDCLASS.
