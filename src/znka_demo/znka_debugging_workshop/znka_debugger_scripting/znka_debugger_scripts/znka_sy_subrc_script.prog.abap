*<SCRIPT:PERSISTENT>
REPORT  rstpda_script_template.

*<SCRIPT:HEADER>
*<SCRIPTNAME>ZNKA_SY_SUBRC_SCRIPT</SCRIPTNAME>
*<SCRIPT_CLASS>LCL_DEBUGGER_SCRIPT</SCRIPT_CLASS>
*<SCRIPT_COMMENT>Проверка полномочий</SCRIPT_COMMENT>
*<BP_REACHED>X</BP_REACHED>

*</SCRIPT:HEADER>

*<SCRIPT:PRESETTINGS>
*<BP>
*<FLAGACTIVE>X</FLAGACTIVE>
*<KIND>1 </KIND>
*<STATEMENTSTA>AUTHORITY-CHECK</STATEMENTSTA>
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
    BREAK-POINT.

    CALL METHOD trace->add_src_info.

*************************************************
* debugger commands (p_command):
* Step into(F5)   -> CL_TPDA_SCRIPT_DEBUGGER_CTRL=>DEBUG_STEP_INTO
* Execute(F6)     -> CL_TPDA_SCRIPT_DEBUGGER_CTRL=>DEBUG_STEP_OVER
* Return(F7)      -> CL_TPDA_SCRIPT_DEBUGGER_CTRL=>DEBUG_STEP_OUT
* Continue(F8)    -> CL_TPDA_SCRIPT_DEBUGGER_CTRL=>DEBUG_CONTINUE
*************************************************
****************************************************************
*Interface (CLASS = CL_TPDA_SCRIPT_DEBUGGER_CTRL / METHOD = DEBUG_STEP )
*Importing
*        REFERENCE( P_COMMAND ) TYPE I
****************************************************************

*TRY.
    CALL METHOD debugger_controller->debug_step
      EXPORTING
        p_command = cl_tpda_script_debugger_ctrl=>debug_step_over.
*  CATCH cx_tpda_scr_rtctrl_status.
*  CATCH cx_tpda_scr_rtctrl.
*ENDTRY.

****************************************************************
*Interface (CLASS = CL_TPDA_SCRIPT_DATA_DESCR / METHOD = CHANGE_VALUE )
*Importing
*        REFERENCE( P_NEW_VALUE ) TYPE STRING
*        REFERENCE( P_OFFSET ) TYPE I
*        REFERENCE( P_LENGTH ) TYPE I
*        REFERENCE( P_VARNAME ) TYPE STRING
****************************************************************

*TRY.
    CALL METHOD cl_tpda_script_data_descr=>change_value
      EXPORTING
        p_new_value = '0'
*       p_offset    = -1
*       p_length    = -1
        p_varname   = 'SY-SUBRC'.
*  CATCH cx_tpda_varname.
*  CATCH cx_tpda_scr_auth.
*ENDTRY.


  ENDMETHOD.                    "script
  METHOD end.
*** insert your code which shall be executed at the end of the scripting (before trace is saved)
*** here

  ENDMETHOD.                    "end
ENDCLASS.                    "lcl_debugger_script IMPLEMENTATION
*</SCRIPT:SCRIPT_CLASS>

*</SCRIPT:PERSISTENT>
