class ZNKA_CL_DEMO_POPUP definition
  public
  final
  create public .

public section.

  class-methods SHOW_SILLY_MESSAGE .
protected section.
private section.
ENDCLASS.



CLASS ZNKA_CL_DEMO_POPUP IMPLEMENTATION.


  method SHOW_SILLY_MESSAGE.
    call FUNCTION 'POPUP_TO_CONFIRM'
      EXPORTING
        titlebar              = 'Опа!'
*        diagnose_object       = space
        text_question         = 'Тут всё неправильно!'
*        text_button_1         = text-001
*        icon_button_1         = space
*        text_button_2         = text-002
*        icon_button_2         = space
*        default_button        = '1'
*        display_cancel_button = 'X'
*        userdefined_f1_help   = space
*        start_column          = 25
*        start_row             = 6
*        popup_type            =
*        iv_quickinfo_button_1 = space
*        iv_quickinfo_button_2 = space
*      IMPORTING
*        answer                =
*      TABLES
*        parameter             =
*      EXCEPTIONS
*        text_not_found        = 1
*        others                = 2
      .
    IF SY-SUBRC <> 0.
*     MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*       WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
  endmethod.
ENDCLASS.
