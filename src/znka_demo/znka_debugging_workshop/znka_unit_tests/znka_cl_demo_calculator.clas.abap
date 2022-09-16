class ZNKA_CL_DEMO_CALCULATOR definition
  public
  final
  create public .

public section.

  methods ADD
    importing
      !A type F
      !B type F
    returning
      value(RESULT) type F .
  methods DIVIDE
    importing
      !A type F
      !B type F
    returning
      value(RESULT) type F
    raising
      CX_SY_ZERODIVIDE .
protected section.
private section.
ENDCLASS.



CLASS ZNKA_CL_DEMO_CALCULATOR IMPLEMENTATION.


  method ADD.
    result = a + b.

  endmethod.


  METHOD divide.

    IF b = 0.
      RAISE EXCEPTION TYPE cx_sy_zerodivide.

    ENDIF.

    result = a / b.
  ENDMETHOD.
ENDCLASS.
