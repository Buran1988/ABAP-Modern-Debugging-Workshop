*&---------------------------------------------------------------------*
*& Report ZNKA_SCRIPT_DEMO_ITAB_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT znka_script_demo_itab_1.
TYPES: table_type TYPE STANDARD TABLE OF syst WITH DEFAULT KEY.

DEFINE x.
  IF sy-tabix = 68 AND trick IS INITIAL.
    DELETE ctd_itab INDEX 42.
    trick = 'X'.
  ENDIF.

END-OF-DEFINITION.
*
*
*
*
*
*
*
*
*
*
*
*
*
*
* Большой кусок кода
*
*
*
*
*
*
*
*
*
*
*
*
*
*

CLASS lcl_data_manager DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS: do_some_complex_check CHANGING ctd_itab TYPE table_type.
  PRIVATE SECTION.
    CLASS-DATA: trick(1) TYPE c.
ENDCLASS.

CLASS lcl_data_manager IMPLEMENTATION.

  METHOD do_some_complex_check.

    LOOP AT ctd_itab ASSIGNING FIELD-SYMBOL(<ls_line>).
      <ls_line>-uzeit = sy-uzeit. x.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.



*
*
*
*
*
*
*
*
*
*
*
*
*
*
* Большой кусок кода
*
*
*
*
*
*
*
*
*
*
*
*
*
*


START-OF-SELECTION.

data: count TYPE i,
      itab TYPE table_type.

WRITE 'Поехали...'.

DO 100 TIMES.
  append syst to itab.
  lcl_data_manager=>do_some_complex_check(
    CHANGING
      ctd_itab = itab
  ).

ENDDO.

count = lines( itab ).
write: / |В таблице { count } строк|.
