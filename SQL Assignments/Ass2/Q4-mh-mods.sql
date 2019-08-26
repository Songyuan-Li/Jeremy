/* FIT9132 2019 S1 Assignment 2 Q4 ANSWERS
   Student Name:Songyuan Li
    Student ID:29439205

   Comments to your marker:
   
*/
/* (i)*/
ALTER TABLE item ADD reorder_level NUMBER(3, 0);

UPDATE item
SET
    reorder_level = item_stock / 2;

CREATE OR REPLACE TRIGGER add_reorder_level BEFORE
    INSERT ON item
    FOR EACH ROW
BEGIN
    :new.reorder_level := :new.item_stock / 2;
END;
/

--- test trigger
insert into item values('QQ001', '123', 100, 12.00, 'CC004',22);

/* (ii)*/
create table doc_procedure(
    doctor_id  NUMBER(4) NOT NULL,
    adprc_no  NUMBER(7) NOT NULL,
    position_   VARCHAR2(50) NOT NULL check(position_='Leader'or position_='Ancillary')
);
alter table doc_procedure add constraint doc_procedure_pk primary key (doctor_id, adprc_no); 
alter table doc_procedure add constraint doc_procedure2 foreign key (adprc_no) references adm_prc(adprc_no);
alter table doc_procedure add constraint doc_procedure1 foreign key (doctor_id) references doctor(doctor_id);
insert into doc_procedure(doctor_id, adprc_no,position_) select perform_dr_id, adprc_no, 'Leader' from adm_prc where perform_dr_id is not NULL;

create or replace trigger leader_warning
before insert on doc_procedure
for each row
declare doctor_id1 NUMBER(4,0);
begin
    if :new.position_ = 'Leader' then
    select doctor_id into doctor_id1 from doc_procedure where position_ = 'Leader' and adprc_no = :new.adprc_no ;
    end if;
    if doctor_id1 is not NULL
    then raise_application_error(-20000, 'A procedure just can have one leader only');
    end if;
end;
/

commit;

--- Test trigger
insert into doc_procedure values(1028,10002,'Leader');
