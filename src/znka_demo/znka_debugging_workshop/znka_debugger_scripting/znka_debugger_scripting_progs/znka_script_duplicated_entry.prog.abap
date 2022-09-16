*&---------------------------------------------------------------------*
*& Report ZNKA_SCRIPT_DUPLICATED_ENTRY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT znka_script_duplicated_entry.

DATA itab TYPE TABLE OF sflight.

SELECT * FROM sflight INTO TABLE itab.

PERFORM adapt.
DELETE FROM zflights.
INSERT zflights FROM TABLE itab.


WRITE 'Ok'.

FORM adapt.
  LOOP AT itab ASSIGNING FIELD-SYMBOL(<ls_line>) WHERE carrid = 'UA'.
    <ls_line>-fldate = sy-datum.

  ENDLOOP.
ENDFORM.
