*<SCRIPT:PERSISTENT>
REPORT  rstpda_script_template.

*<SCRIPT:HEADER>
*<SCRIPTNAME>ZNKA_ITAB_1_SCRIPT</SCRIPTNAME>
*<SCRIPT_CLASS>LCL_DEBUGGER_SCRIPT</SCRIPT_CLASS>
*<SCRIPT_COMMENT>Debugger Skript: Default Template</SCRIPT_COMMENT>
*<WP_REACHED>X</WP_REACHED>

*</SCRIPT:HEADER>

*<SCRIPT:PRESETTINGS>
*<WP>
*<VARNAME>ITAB</VARNAME>
*<VAR_SCOPE_TYPE>10 </VAR_SCOPE_TYPE>
*<FLAGACTIVE>X</FLAGACTIVE>
*<PROGRAM>ZNKA_SCRIPT_DEMO_ITAB_1</PROGRAM>
*</WP>

*</SCRIPT:PRESETTINGS>

*<SCRIPT:SCRIPT_CLASS>
*---------------------------------------------------------------------*
*       CLASS lcl_debugger_script DEFINITION
*---------------------------------------------------------------------*
*
*---------------------------------------------------------------------*
CLASS lcl_debugger_script DEFINITION INHERITING FROM  cl_tpda_script_class_super  .

  PUBLIC SECTION.
    METHODS: prologue  REDEFINITION,
      init    REDEFINITION,
      script  REDEFINITION,
      end     REDEFINITION.
    DATA: gv_saved_count TYPE sy-tabix.
ENDCLASS.                    "lcl_debugger_script DEFINITION
*---------------------------------------------------------------------*
*       CLASS lcl_debugger_script IMPLEMENTATION
*---------------------------------------------------------------------*
*
*---------------------------------------------------------------------*
CLASS lcl_debugger_script IMPLEMENTATION.
  METHOD prologue.
*** generate abap_source (source handler for ABAP)
    super->prologue( ).
  ENDMETHOD.                    "prolog

  METHOD init.
*** insert your initialization code here
  ENDMETHOD.                    "init
  METHOD script.

    DATA: lo_descr TYPE REF TO cl_tpda_script_tabledescr,
          lv_count TYPE sy-tabix.

    lo_descr ?= cl_tpda_script_data_descr=>factory( 'ITAB' ).
    lv_count = lo_descr->linecnt( ).

    IF lv_count < gv_saved_count.
      me->break( ).
      CALL METHOD cl_tpda_script_messages=>dynp_message
        EXPORTING
          message_type   = 'E'
          message_class  = 'S'
          message_number = '01'
          message_par1   = 'Разъехались строки'
*         message_par2   =
*         message_par3   =
*         message_par4   =
        .

    ENDIF.

    gv_saved_count = lv_count.


  ENDMETHOD.                    "script
  METHOD end.
*** insert your code which shall be executed at the end of the scripting (before trace is saved)
*** here

  ENDMETHOD.                    "end
ENDCLASS.                    "lcl_debugger_script IMPLEMENTATION
*</SCRIPT:SCRIPT_CLASS>

*</SCRIPT:PERSISTENT>
