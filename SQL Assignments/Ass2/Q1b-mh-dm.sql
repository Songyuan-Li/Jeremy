/* FIT9132 2019 S1 Assignment 2 Q1-Part B ANSWERS
   Student Name:Somgyuan Li
    Student ID:29439205

   Comments to your marker:
   
*/

/* (i)*/
DROP SEQUENCE pat_seq;

DROP SEQUENCE adm_seq;

DROP SEQUENCE adm_prc_seq;

CREATE SEQUENCE pat_seq START WITH 200000 INCREMENT BY 10;

CREATE SEQUENCE adm_seq START WITH 200000 INCREMENT BY 10;

CREATE SEQUENCE adm_prc_seq START WITH 200000 INCREMENT BY 10;

/* (ii)*/

INSERT INTO patient VALUES (
    pat_seq.NEXTVAL,
    'Peter',
    'Xiue',
    '14 Narrow Lane Caulfield',
    TO_DATE('1/Oct/1981', 'dd/mon/yyyy'),
    '0123456789'
);

INSERT INTO admission VALUES (
    adm_seq.NEXTVAL,
    TO_DATE('16/May/2019 10:00', 'dd/mon/yyyy HH24:MI'),
    NULL,
    pat_seq.CURRVAL,
    (
        SELECT
            doctor_id
        FROM
            doctor
        WHERE
            upper(doctor_fname) = upper('SAWYER')
            AND upper(doctor_lname) = upper('HAISELL')
    )
);

/* (iii)*/

UPDATE doctor_speciality
SET
    spec_code = (
        SELECT
            spec_code
        FROM
            speciality
        WHERE
            spec_description = 'Vascular surgery'
    )
WHERE
    doctor_id = (
        SELECT
            doctor_id
        FROM
            doctor
        WHERE
            lower(doctor_fname) = 'decca'
            AND lower(doctor_lname) = 'blankhorn'
    )
    AND spec_code = (
        SELECT
            spec_code
        FROM
            speciality
        WHERE
            spec_description = 'Thoracic surgery'
    );
      
/* (iv)*/
DELETE FROM doctor_speciality
WHERE
    spec_code = (
        SELECT
            spec_code
        FROM
            speciality
        WHERE
            spec_description = 'Medical genetics'
    );

DELETE FROM speciality
WHERE
    spec_description = 'Medical genetics';

commit;


