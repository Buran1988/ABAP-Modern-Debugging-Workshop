*<SCRIPT:PERSISTENT>
REPORT  rstpda_script_template.

*<SCRIPT:HEADER>
*<SCRIPTNAME>ZNKA_SELECT_1_SCRIPT</SCRIPTNAME>
*<SCRIPT_CLASS>LCL_DEBUGGER_SCRIPT</SCRIPT_CLASS>
*<SCRIPT_COMMENT>Проверка select-ов</SCRIPT_COMMENT>
*<BP_REACHED>X</BP_REACHED>

*</SCRIPT:HEADER>

*<SCRIPT:PRESETTINGS>
*<BP>
*<FLAGACTIVE>X</FLAGACTIVE>
*<KIND>1 </KIND>
*<STATEMENTSTA>SELECT</STATEMENTSTA>
*</BP>

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

    CALL METHOD trace->add_src_info.


****************************************************************
*Interface (CLASS = IF_TPDA_SCRIPT_TRACE_WRITE / METHOD = ADD_CUSTOM_INFO )
*Importing
*        REFERENCE( P_TRACE_ENTRY ) TYPE TPDA_TRACE_CUSTOM
****************************************************************
    DATA ls_trace_entry TYPE tpda_trace_custom.
    ls_trace_entry-value = 'Произошла выборка из БД'.
    CALL METHOD trace->add_custom_info
      EXPORTING
        p_trace_entry = ls_trace_entry.


  ENDMETHOD.                    "script
  METHOD end.
*** insert your code which shall be executed at the end of the scripting (before trace is saved)
*** here

  ENDMETHOD.                    "end
ENDCLASS.                    "lcl_debugger_script IMPLEMENTATION
*</SCRIPT:SCRIPT_CLASS>

*</SCRIPT:PERSISTENT>
