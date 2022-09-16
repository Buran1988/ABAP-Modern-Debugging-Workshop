*<SCRIPT:PERSISTENT>
REPORT  rstpda_script_template.

*<SCRIPT:HEADER>
*<SCRIPTNAME>ZNKA_FIELD_SYMBOL_1_SCRIPT</SCRIPTNAME>
*<SCRIPT_CLASS>LCL_DEBUGGER_SCRIPT</SCRIPT_CLASS>
*<SCRIPT_COMMENT>Отслеживание филд-символа</SCRIPT_COMMENT>
*<BP_REACHED>X</BP_REACHED>

*</SCRIPT:HEADER>

*<SCRIPT:PRESETTINGS>

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
    DATA gv_max_weight TYPE f VALUE 40.
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

****************************************************************
*Interface (CLASS = CL_TPDA_SCRIPT_DATA_DESCR / METHOD = GET_SIMPLE_VALUE )
*Importing
*        REFERENCE( P_VAR_NAME ) TYPE TPDA_VAR_NAME
*Returning
*        VALUE( P_VAR_VALUE ) TYPE TPDA_VAR_VALUE
****************************************************************

*TRY.
    CALL METHOD cl_tpda_script_data_descr=>get_simple_value
      EXPORTING
        p_var_name  = '<LS_LINE>-LUGGWEIGHT'
      RECEIVING
        p_var_value = DATA(lv_luggage_weight).
*  CATCH cx_tpda_varname.
*  CATCH cx_tpda_script_no_simple_type.
*ENDTRY.

*PASSNAME
    CHECK CONV f( lv_luggage_weight ) > gv_max_weight.

*CATCH cx_tpda_varname.
*CATCH cx_tpda_script_no_simple_type.
****************************************************************
*Interface (CLASS = IF_TPDA_SCRIPT_TRACE_WRITE / METHOD = ADD_CUSTOM_INFO )
*Importing
*        REFERENCE( P_TRACE_ENTRY ) TYPE TPDA_TRACE_CUSTOM
****************************************************************

    CALL METHOD trace->add_custom_info
      EXPORTING
        p_trace_entry = VALUE #( value = |Вес багажа: { lv_luggage_weight }| ).
    CLEAR lv_luggage_weight.
    me->break( ).

  ENDMETHOD.                    "script
  METHOD end.
*** insert your code which shall be executed at the end of the scripting (before trace is saved)
*** here

  ENDMETHOD.                    "end
ENDCLASS.                    "lcl_debugger_script IMPLEMENTATION
*</SCRIPT:SCRIPT_CLASS>

*</SCRIPT:PERSISTENT>
