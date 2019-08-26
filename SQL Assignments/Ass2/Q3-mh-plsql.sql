/* FIT9132 2019 S1 Assignment 2 Q3 ANSWERS
   Student Name:Songyuan Li
    Student ID:29439205

   Comments to your marker:
   
*/

/* (i)*/
CREATE OR REPLACE TRIGGER item_changed BEFORE
    UPDATE OF item_code ON item
    FOR EACH ROW
BEGIN
    UPDATE item_treatment
    SET
        item_code = :new.item_code
    WHERE
        item_code = :old.item_code;

END;
/

---Test trigger
UPDATE item
SET
    item_code = knr56
WHERE
    item_code = kn056;

/* (ii)*/
CREATE OR REPLACE TRIGGER prevent_name_null BEFORE
    INSERT ON patient
    FOR EACH ROW
BEGIN
    IF :new.patient_fname IS NULL AND :new.patient_lname IS NULL THEN
        raise_application_error(-20000, 'The name can not be empty');
    END IF;
END;
/
--- Test trigger
INSERT INTO patient VALUES (100022,NULL,NULL,'100 monash road',TO_DATE('10/May/1996', 'dd/Mon/yyyy'),'1324343422');

/* (iii)*/
CREATE OR REPLACE TRIGGER auto_adjust_stock AFTER
    INSERT ON item_treatment
    FOR EACH ROW
BEGIN
    UPDATE item
    SET
        item_stock = item_stock - :new.it_qty_used
    WHERE
        item_code = :new.item_code;

END;
/

commit;
--- Test trigger

INSERT INTO ITEM_TREATMENT VALUES (10016, 'AN002', 1, 182.33);







