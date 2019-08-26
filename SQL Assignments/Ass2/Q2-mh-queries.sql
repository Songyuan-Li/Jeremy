/* FIT9132 2019 S1 Assignment 2 Q2 ANSWERS
   Student Name:Songyuan Li
    Student ID:29439205

   Comments to your marker:
   
*/

/* (i)*/
SELECT
    doctor_title   AS "doctor title",
    doctor_fname   AS "first name",
    doctor_lname   AS "last name",
    doctor_phone   AS "contact phone number"
FROM
    doctor              d
    JOIN doctor_speciality   ds ON d.doctor_id = ds.doctor_id
    JOIN speciality          sp ON ds.spec_code = sp.spec_code
WHERE
    spec_description = 'Orthopedic surgery'
ORDER BY
    "last name",
    "first name";

/* (ii)*/
SELECT
    item_code AS "item code",
    item_description AS "item description",
    item_stock AS "item stock",
    cc_title AS "cost centre title"
FROM
    item         i
    JOIN costcentre   c ON i.cc_code = c.cc_code
WHERE
    item_stock > 50
    AND lower(item_description) LIKE '%disposable%'
ORDER BY
    "item code";
/* (iii)*/
SELECT
    p.patient_id,
    patient_fname
    || ' '
    || patient_lname AS "Patient Name",
    TO_CHAR(adm_date_time, 'dd/Mon/yyyy HH24:MI') AS admdatetime,
    doctor_title
    || ' '
    || doctor_fname
    || ' '
    || doctor_lname AS "Doctor Name"
FROM
    patient     p
    JOIN admission   ad ON p.patient_id = ad.patient_id
    JOIN doctor      d ON d.doctor_id = ad.doctor_id
WHERE
    TO_CHAR(adm_date_time, 'dd/Mon/yyyy') = '14/Mar/2019'
ORDER BY
    admdatetime;

/* (iv)*/
SELECT
    proc_code          AS "procedure code",
    proc_name          AS "procedure name",
    proc_description   AS "procedure description",
    TO_CHAR(proc_std_cost, '$990.99') AS "procedure standard cost"
FROM
    procedure
WHERE
    proc_std_cost < (
        SELECT
            AVG(proc_std_cost)
        FROM
            procedure
    )
ORDER BY
    proc_std_cost DESC;

/* (v)*/
SELECT
    ad.patient_id,
    patient_fname,
    patient_lname,
    patient_dob,
    COUNT(ad.patient_id) AS numberadmissions
FROM
    patient     p
    JOIN admission   ad ON p.patient_id = ad.patient_id
GROUP BY
    ad.patient_id,
    patient_fname,
    patient_lname,
    patient_dob
HAVING
    COUNT(ad.patient_id) > 2
ORDER BY
    COUNT(ad.patient_id);
  
/* (vi)*/
SELECT
    adm_no,
    ad.patient_id,
    patient_fname,
    patient_lname,
    TO_CHAR(floor(adm_discharge - adm_date_time), '99')
    || 'days'
    || TO_CHAR(round(mod(adm_discharge - adm_date_time, 1) * 24,1), '990.9')
    || 'hrs' AS staylength
FROM
    patient     p
    JOIN admission   ad ON p.patient_id = ad.patient_id
WHERE
    adm_discharge - adm_date_time > (
        SELECT
            AVG(adm_discharge - adm_date_time)
        FROM
            admission
    );
    
/* (vii)*/
SELECT
    proc_code,
    proc_name,
    proc_description,
    proc_time,
    TO_CHAR(proc_std_cost -(
        SELECT
            AVG(adprc_pat_cost)
        FROM
            adm_prc ad1
        WHERE
            proc_code = ad1.proc_code
    ), '990.99') AS "Procedure Price Differential"
FROM
    procedure
WHERE 
    proc_code IN
( SELECT
    proc_code
FROM
    adm_prc
)
ORDER BY
    proc_name;
    
/* (viii)*/
SELECT
    pro.proc_code,
    proc_name,
    nvl(i.item_code, '---'),
    nvl(item_description, '---'),
    nvl(TO_CHAR(MAX(it_qty_used)), '---') AS max_qty_used
FROM
    procedure        pro
    JOIN adm_prc          adp ON pro.proc_code = adp.proc_code
    LEFT JOIN item_treatment   it ON adp.adprc_no = it.adprc_no
    LEFT JOIN item             i ON it.item_code = i.item_code
GROUP BY
    pro.proc_code,
    proc_name,
    i.item_code,
    item_description
ORDER BY
    pro.proc_name;


commit;




