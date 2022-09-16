REPORT znka_script_field_symbol_1.

DATA: ltd_tab     TYPE TABLE OF sbook,
      lv_deadline TYPE datum.

SELECT * FROM sbook INTO TABLE ltd_tab.

lv_deadline = '20220503'.

LOOP AT ltd_tab ASSIGNING FIELD-SYMBOL(<ls_line>).
  IF <ls_line>-order_date > lv_deadline.
    <ls_line>-cancelled = 'X'.
  ENDIF.

ENDLOOP.

WRITE 'Готово!'.
