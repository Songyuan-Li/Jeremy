SET ECHO ON;
SPOOL mh_schema_output.txt;

DROP SEQUENCE "Admissions_ad_date/time_SEQ" ;

DROP SEQUENCE admissions_pat_id_seq ;

DROP SEQUENCE admissions_sp_doc_id_seq ;

DROP SEQUENCE admissions_ad_id_seq ;

DROP SEQUENCE bed_bed_no_seq ;

DROP SEQUENCE bed_ward_code_seq ;

DROP SEQUENCE bed_assignments_ad_id_seq ;

DROP SEQUENCE cost_centre_centre_code_seq ;

DROP SEQUENCE dcotors_doc_id_seq ;

DROP SEQUENCE dcotors_doc_phone_seq ;

DROP SEQUENCE items_required_quantity_seq ;

DROP SEQUENCE items_required_total_item_char ;

DROP SEQUENCE items_required_ad_id_seq ;

DROP SEQUENCE nursing_staff_nurse_id_seq ;

DROP SEQUENCE patient_pat_id_seq ;

DROP SEQUENCE procedures_details_car_doc_id ;

DROP SEQUENCE procedures_details_req_doc_id ;

DROP SEQUENCE procedures_details_pro_code ;

DROP SEQUENCE procedures_details_ad_id_seq ;

DROP SEQUENCE ward_ward_code_seq;

DROP TABLE admissions CASCADE CONSTRAINTS;

DROP TABLE allocation CASCADE CONSTRAINTS;

DROP TABLE bed CASCADE CONSTRAINTS;

DROP TABLE bed_assignments CASCADE CONSTRAINTS;

DROP TABLE cost_centre CASCADE CONSTRAINTS;

DROP TABLE dcotors CASCADE CONSTRAINTS;

DROP TABLE "Doctor's_Specialisation" CASCADE CONSTRAINTS;

DROP TABLE items CASCADE CONSTRAINTS;

DROP TABLE items_required CASCADE CONSTRAINTS;

DROP TABLE nursing_staff CASCADE CONSTRAINTS;

DROP TABLE patient CASCADE CONSTRAINTS;

DROP TABLE procedures CASCADE CONSTRAINTS;

DROP TABLE procedures_details CASCADE CONSTRAINTS;

DROP TABLE specialisation CASCADE CONSTRAINTS;

DROP TABLE ward CASCADE CONSTRAINTS;

CREATE TABLE admissions (
    "ad_date/time"   DATE NOT NULL,
    pat_id           NUMBER(6) NOT NULL,
    sp_doc_id        NUMBER(4) NOT NULL,
    ad_id            NUMBER(15) NOT NULL
);

COMMENT ON COLUMN admissions."ad_date/time" IS
    'the date and time of admission';

COMMENT ON COLUMN admissions.pat_id IS
    'pat_id:patient ID';

COMMENT ON COLUMN admissions.sp_doc_id IS
    'doctor''s ID';

COMMENT ON COLUMN admissions.ad_id IS
    'creat a surrpgate key';

ALTER TABLE admissions ADD CONSTRAINT admissions_pk PRIMARY KEY ( ad_id );

ALTER TABLE admissions ADD CONSTRAINT "unique" UNIQUE ( "ad_date/time",
                                                        pat_id );

CREATE TABLE allocation (
    date_assigned    DATE NOT NULL,
    date_completed   DATE NOT NULL,
    ward_code        NUMBER(4) NOT NULL,
    nurse_id         NUMBER(10) NOT NULL
);

COMMENT ON COLUMN allocation.date_assigned IS
    'the initial date that a nurse is assigned to word in a ward';

COMMENT ON COLUMN allocation.date_completed IS
    'when they finish an allocation';

COMMENT ON COLUMN allocation.ward_code IS
    'code of ward';

COMMENT ON COLUMN allocation.nurse_id IS
    'nurse''s ID';

ALTER TABLE allocation ADD CONSTRAINT allocation_pk PRIMARY KEY ( nurse_id,
                                                                  date_assigned );

CREATE TABLE bed (
    bed_no      CHAR(10 CHAR) NOT NULL,
    bed_phone   NUMBER(15),
    bed_type    VARCHAR2(50 CHAR) NOT NULL,
    ward_code   NUMBER(4) NOT NULL
);

ALTER TABLE bed
    ADD CONSTRAINT choose_type CHECK ( bed_type IN (
        'adjustable',
        'fixed'
    ) );

COMMENT ON COLUMN bed.bed_no IS
    'bed_no:number of bed';

COMMENT ON COLUMN bed.bed_phone IS
    'bed_no:bedside telephone number';

COMMENT ON COLUMN bed.bed_type IS
    'bed type';

COMMENT ON COLUMN bed.ward_code IS
    'code of ward';

ALTER TABLE bed ADD CONSTRAINT bed_pk PRIMARY KEY ( ward_code,
                                                    bed_no );

CREATE TABLE bed_assignments (
    "ass_date/time"   DATE NOT NULL,
    ward_code         NUMBER(4) NOT NULL,
    ad_id             NUMBER(15) NOT NULL,
    bed_no            CHAR(10 CHAR) NOT NULL
);

COMMENT ON COLUMN bed_assignments."ass_date/time" IS
    'ass_date/time:the date and time of assignments';

COMMENT ON COLUMN bed_assignments.ward_code IS
    'code of ward';

COMMENT ON COLUMN bed_assignments.ad_id IS
    'creat a surrpgate key';

COMMENT ON COLUMN bed_assignments.bed_no IS
    'bed_no:number of bed';

ALTER TABLE bed_assignments ADD CONSTRAINT bed_assignments_pk PRIMARY KEY ( ad_id,
                                                                            "ass_date/time" );

CREATE TABLE cost_centre (
    centre_code     NUMBER(10) NOT NULL,
    centre_title    VARCHAR2(50 CHAR) NOT NULL,
    centre_maname   VARCHAR2(50 CHAR) NOT NULL
);

COMMENT ON COLUMN cost_centre.centre_code IS
    'centre code';

COMMENT ON COLUMN cost_centre.centre_title IS
    'title of centre';

COMMENT ON COLUMN cost_centre.centre_maname IS
    'centre managers name';

ALTER TABLE cost_centre ADD CONSTRAINT cost_centre_pk PRIMARY KEY ( centre_code );

CREATE TABLE dcotors (
    doc_id      NUMBER(4) NOT NULL,
    doc_fname   VARCHAR2(50 CHAR) NOT NULL,
    doc_lname   VARCHAR2(50 CHAR) NOT NULL,
    doc_phone   NUMBER(15) NOT NULL
);

COMMENT ON COLUMN dcotors.doc_id IS
    'doctor''s ID';

COMMENT ON COLUMN dcotors.doc_fname IS
    'first name of doctor';

COMMENT ON COLUMN dcotors.doc_lname IS
    'last name of doctor';

COMMENT ON COLUMN dcotors.doc_phone IS
    'phone number of doctors';

ALTER TABLE dcotors ADD CONSTRAINT dcotors_pk PRIMARY KEY ( doc_id );

CREATE TABLE "Doctor's_Specialisation" (
    doc_id     NUMBER(4) NOT NULL,
    spe_name   VARCHAR2(50 CHAR) NOT NULL
);

COMMENT ON COLUMN "Doctor's_Specialisation".doc_id IS
    'doctor''s ID';

COMMENT ON COLUMN "Doctor's_Specialisation".spe_name IS
    'name of specialisation';

ALTER TABLE "Doctor's_Specialisation" ADD CONSTRAINT "Doctor's_Specialisation_PK" PRIMARY KEY ( doc_id,
                                                                                                spe_name );

CREATE TABLE items (
    item_code        VARCHAR2(5 CHAR) NOT NULL,
    item_descr       VARCHAR2(50 CHAR) NOT NULL,
    item_currstock   NUMBER(10) NOT NULL,
    item_price       NUMBER(10, 2) NOT NULL,
    centre_code      NUMBER(10) NOT NULL
);

ALTER TABLE items ADD CONSTRAINT "chk_item price" CHECK ( item_price >= 0 );

COMMENT ON COLUMN items.item_code IS
    'code of item';

COMMENT ON COLUMN items.item_descr IS
    'item description';

COMMENT ON COLUMN items.item_currstock IS
    'the current stock of item';

COMMENT ON COLUMN items.item_price IS
    'item price';

COMMENT ON COLUMN items.centre_code IS
    'centre code';

ALTER TABLE items ADD CONSTRAINT items_pk PRIMARY KEY ( item_code );

CREATE TABLE items_required (
    quantity            NUMBER(5) NOT NULL,
    total_item_charge   NUMBER(10, 2) NOT NULL,
    item_code           VARCHAR2(5 CHAR) NOT NULL,
    "pro_date/time"     DATE NOT NULL,
    ad_id               NUMBER(15) NOT NULL
);

ALTER TABLE items_required ADD CONSTRAINT chk_quantity CHECK ( quantity > 0 );

ALTER TABLE items_required ADD CONSTRAINT chk_itemscharge CHECK ( total_item_charge > 0 );

COMMENT ON COLUMN items_required.quantity IS
    'quantities of the item';

COMMENT ON COLUMN items_required.total_item_charge IS
    'charge of total items';

COMMENT ON COLUMN items_required.item_code IS
    'code of item';

COMMENT ON COLUMN items_required."pro_date/time" IS
    'the date and time of procedures';

COMMENT ON COLUMN items_required.ad_id IS
    'creat a surrpgate key';

ALTER TABLE items_required ADD CONSTRAINT items_required_pk PRIMARY KEY ( item_code,
                                                                          quantity );

CREATE TABLE nursing_staff (
    nurse_id          NUMBER(10) NOT NULL,
    nurse_fname       VARCHAR2(50 CHAR) NOT NULL,
    nurse_lname       VARCHAR2(50 CHAR) NOT NULL,
    nurse_phone       CHAR(10 CHAR) NOT NULL,
    nurse_certifled   VARCHAR2(50 CHAR) NOT NULL
);

ALTER TABLE nursing_staff
    ADD CONSTRAINT judge_certifled CHECK ( nurse_certifled IN (
        'No',
        'Yes'
    ) );

COMMENT ON COLUMN nursing_staff.nurse_id IS
    'nurse''s ID';

COMMENT ON COLUMN nursing_staff.nurse_fname IS
    'first name of nurse';

COMMENT ON COLUMN nursing_staff.nurse_lname IS
    'last name of nurse';

COMMENT ON COLUMN nursing_staff.nurse_phone IS
    'contact number of nurse';

COMMENT ON COLUMN nursing_staff.nurse_certifled IS
    'certifled for work with children';

ALTER TABLE nursing_staff ADD CONSTRAINT nursing_staff_pk PRIMARY KEY ( nurse_id );

CREATE TABLE patient (
    pat_id          NUMBER(6) NOT NULL,
    pat_fname       VARCHAR2(50 CHAR) NOT NULL,
    pat_lname       VARCHAR2(50 CHAR) NOT NULL,
    pat_address     VARCHAR2(50 CHAR) NOT NULL,
    pat_dob         DATE NOT NULL,
    pat_emerphone   NUMBER NOT NULL
);

COMMENT ON COLUMN patient.pat_id IS
    'pat_id:patient ID';

COMMENT ON COLUMN patient.pat_fname IS
    'pat_fname:patient''s first name';

COMMENT ON COLUMN patient.pat_lname IS
    'pat_lname:patient''s last name';

COMMENT ON COLUMN patient.pat_address IS
    'pat_address: patient address';

COMMENT ON COLUMN patient.pat_dob IS
    'pat_dob:patient''s date of birth';

COMMENT ON COLUMN patient.pat_emerphone IS
    'pat_emerphone: patient''s emergency  contact number';

ALTER TABLE patient ADD CONSTRAINT patient_pk PRIMARY KEY ( pat_id );

CREATE TABLE procedures (
    pro_code     NUMBER(10) NOT NULL,
    pro_name     VARCHAR2(50 CHAR) NOT NULL,
    pro_charge   NUMBER(10, 2) NOT NULL
);

COMMENT ON COLUMN procedures.pro_code IS
    'procedure''s code';

COMMENT ON COLUMN procedures.pro_name IS
    'the name of procedure';

COMMENT ON COLUMN procedures.pro_charge IS
    'procedure''s charge';

ALTER TABLE procedures ADD CONSTRAINT procedures_pk PRIMARY KEY ( pro_code );

CREATE TABLE procedures_details (
    "pro_date/time"   DATE NOT NULL,
    car_doc_id        NUMBER(4),
    req_doc_id        NUMBER(4) NOT NULL,
    pro_code          NUMBER(10) NOT NULL,
    ad_id             NUMBER(15) NOT NULL
);

COMMENT ON COLUMN procedures_details."pro_date/time" IS
    'the date and time of procedures';

COMMENT ON COLUMN procedures_details.car_doc_id IS
    'doctor''s ID';

COMMENT ON COLUMN procedures_details.req_doc_id IS
    'doctor''s ID';

COMMENT ON COLUMN procedures_details.pro_code IS
    'procedure''s code';

COMMENT ON COLUMN procedures_details.ad_id IS
    'creat a surrpgate key';

ALTER TABLE procedures_details ADD CONSTRAINT procedures_details_pk PRIMARY KEY ( "pro_date/time",
                                                                                  ad_id );

CREATE TABLE specialisation (
    spe_name VARCHAR2(50 CHAR) NOT NULL
);

COMMENT ON COLUMN specialisation.spe_name IS
    'name of specialisation';

ALTER TABLE specialisation ADD CONSTRAINT specialisation_pk PRIMARY KEY ( spe_name );

CREATE TABLE ward (
    ward_code     NUMBER(4) NOT NULL,
    ward_name     VARCHAR2(50 CHAR) NOT NULL,
    totalno_bed   NUMBER(5) NOT NULL,
    empty_bed     NUMBER(5) NOT NULL
);

COMMENT ON COLUMN ward.ward_code IS
    'code of ward';

COMMENT ON COLUMN ward.ward_name IS
    'ward''s name';

COMMENT ON COLUMN ward.totalno_bed IS
    'total number of beds in each ward';

COMMENT ON COLUMN ward.empty_bed IS
    'the number of currently available beds';

ALTER TABLE ward ADD CONSTRAINT ward_pk PRIMARY KEY ( ward_code );

ALTER TABLE procedures_details
    ADD CONSTRAINT admission_procedure FOREIGN KEY ( ad_id )
        REFERENCES admissions ( ad_id );

ALTER TABLE bed_assignments
    ADD CONSTRAINT admissions_bed_assignments FOREIGN KEY ( ad_id )
        REFERENCES admissions ( ad_id );

ALTER TABLE bed_assignments
    ADD CONSTRAINT bed__bed_assignments FOREIGN KEY ( ward_code,
                                                      bed_no )
        REFERENCES bed ( ward_code,
                         bed_no );

ALTER TABLE procedures_details
    ADD CONSTRAINT carryout_doctor_procedure FOREIGN KEY ( car_doc_id )
        REFERENCES dcotors ( doc_id );

ALTER TABLE items
    ADD CONSTRAINT cost_centre_items FOREIGN KEY ( centre_code )
        REFERENCES cost_centre ( centre_code );

ALTER TABLE admissions
    ADD CONSTRAINT doctor_admission FOREIGN KEY ( sp_doc_id )
        REFERENCES dcotors ( doc_id );

ALTER TABLE "Doctor's_Specialisation"
    ADD CONSTRAINT doctor_doc_spec FOREIGN KEY ( doc_id )
        REFERENCES dcotors ( doc_id );

ALTER TABLE items_required
    ADD CONSTRAINT items_item_required FOREIGN KEY ( item_code )
        REFERENCES items ( item_code );

ALTER TABLE allocation
    ADD CONSTRAINT nurse_allocation FOREIGN KEY ( nurse_id )
        REFERENCES nursing_staff ( nurse_id );

ALTER TABLE admissions
    ADD CONSTRAINT patients_admissions FOREIGN KEY ( pat_id )
        REFERENCES patient ( pat_id );

ALTER TABLE procedures_details
    ADD CONSTRAINT procedures_pro_details FOREIGN KEY ( pro_code )
        REFERENCES procedures ( pro_code );

ALTER TABLE items_required
    ADD CONSTRAINT relation_7 FOREIGN KEY ( "pro_date/time",
                                            ad_id )
        REFERENCES procedures_details ( "pro_date/time",
                                        ad_id );

ALTER TABLE procedures_details
    ADD CONSTRAINT request_doctor_procedure FOREIGN KEY ( req_doc_id )
        REFERENCES dcotors ( doc_id );

ALTER TABLE "Doctor's_Specialisation"
    ADD CONSTRAINT spec_doctor_spec FOREIGN KEY ( spe_name )
        REFERENCES specialisation ( spe_name );

ALTER TABLE allocation
    ADD CONSTRAINT ward_allocation FOREIGN KEY ( ward_code )
        REFERENCES ward ( ward_code );

ALTER TABLE bed
    ADD CONSTRAINT ward_bed FOREIGN KEY ( ward_code )
        REFERENCES ward ( ward_code );

CREATE SEQUENCE "Admissions_ad_date/time_SEQ" START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE admissions_pat_id_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE admissions_sp_doc_id_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE admissions_ad_id_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE bed_bed_no_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE bed_ward_code_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE bed_assignments_ad_id_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE cost_centre_centre_code_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dcotors_doc_id_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE dcotors_doc_phone_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE items_required_quantity_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE items_required_total_item_char START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE items_required_ad_id_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE nursing_staff_nurse_id_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE patient_pat_id_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE procedures_details_car_doc_id START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE procedures_details_req_doc_id START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE procedures_details_pro_code START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE procedures_details_ad_id_seq START WITH 1 NOCACHE ORDER;

CREATE SEQUENCE ward_ward_code_seq START WITH 1 NOCACHE ORDER;



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             0
-- ALTER TABLE                             37
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         20
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
SET ECHO OFF;