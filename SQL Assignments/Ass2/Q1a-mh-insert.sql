/* FIT9132 2019 S1 Assignment 2 Q1-Part A ANSWERS
   Student Name:Songyuan Li
    Student ID:29439205

   Comments to your marker:
   
*/
INSERT INTO patient VALUES (100001,'Lee','Jeremy','100 monash road',TO_DATE('10/May/1996', 'dd/Mon/yyyy'),'1324343422');
INSERT INTO patient VALUES (100002,'Shi','Victor','123 monash road',TO_DATE('01/May/1995', 'dd/Mon/yyyy'),'8732895523');
INSERT INTO patient VALUES (100003,'Wong','Robin','101 monash road',TO_DATE('09/Jan/1995', 'dd/Mon/yyyy'),'3839859284');
INSERT INTO patient VALUES (100004,'Wong','Jason','102 monash road',TO_DATE('23/Jan/1995', 'dd/Mon/yyyy'),'3297423749');
INSERT INTO patient VALUES (100005,'Yang','Hoy','132 monash road',TO_DATE('22/Dec/1993', 'dd/Mon/yyyy'),'7234623744');
INSERT INTO patient VALUES (100006,'Gu','Steven','103 monash roda',TO_DATE('18/Jun/1993', 'dd/Mon/yyyy'),'3249834323');
INSERT INTO patient VALUES (100007,'Curry','Stephen','234 monash road',TO_DATE('28/Apr/1985', 'dd/Mon/yyyy'),'3483474928');
INSERT INTO patient VALUES (100008,'Thompson','Clay','235 monash road',TO_DATE('08/Apr/1986', 'dd/Mon/yyyy'),'4586309303');
INSERT INTO patient VALUES (100009,'Green','Dream','288 monash road',TO_DATE('27/Nov/1985', 'dd/Mon/yyyy'),'0492293743');
INSERT INTO patient VALUES (100010,'Durant','Kevin','299 monash road',TO_DATE('13/Sep/1984', 'dd/Mon/yyyy'),'7329833942');

INSERT INTO admission VALUES (100001,TO_DATE('02/Jan/2019 09:30', 'dd/Mon/yyyy HH24:MI'),TO_DATE('04/Jan/2019 18:30', 'dd/Mon/yyyy HH24:MI'),100001,1069);
INSERT INTO admission VALUES (100002,TO_DATE('10/Feb/2019 10:15', 'dd/Mon/yyyy HH24:MI'),TO_DATE('15/Feb/2019 20:20', 'dd/Mon/yyyy HH24:MI'),100001,1005);
INSERT INTO admission VALUES (100003,TO_DATE('03/Jan/2019 21:10', 'dd/Mon/yyyy HH24:MI'),NULL,100002,1033);
INSERT INTO admission VALUES (100004,TO_DATE('10/Jan/2019 15:40', 'dd/Mon/yyyy HH24:MI'),TO_DATE('10/Feb/2019 19:20', 'dd/Mon/yyyy HH24:MI'),100003,1099);
INSERT INTO admission VALUES (100005,TO_DATE('26/Feb/2019 12:00', 'dd/Mon/yyyy HH24:MI'),TO_DATE('15/Mar/2019 17:40', 'dd/Mon/yyyy HH24:MI'),100003,1298);
INSERT INTO admission VALUES (100006,TO_DATE('14/Mar/2019 14:20', 'dd/Mon/yyyy HH24:MI'),TO_DATE('27/Mar/2019 05:30', 'dd/Mon/yyyy HH24:MI'),100004,7900);
INSERT INTO admission VALUES (100007,TO_DATE('05/Jan/2019 13:10', 'dd/Mon/yyyy HH24:MI'),TO_DATE('09/Jan/2019 20:10', 'dd/Mon/yyyy HH24:MI'),100005,1005);
INSERT INTO admission VALUES (100008,TO_DATE('20/Apr/2019 10:00', 'dd/Mon/yyyy HH24:MI'),TO_DATE('28/Apr/2019 23:00', 'dd/Mon/yyyy HH24:MI'),100003,1033);
INSERT INTO admission VALUES (100009,TO_DATE('10/Apr/2019 14:00', 'dd/Mon/yyyy HH24:MI'),NULL,100006,1084);
INSERT INTO admission VALUES (100010,TO_DATE('17/Jan/2019 12:40', 'dd/Mon/yyyy HH24:MI'),NULL,100007,1064);
INSERT INTO admission VALUES (100011,TO_DATE('11/May/2019 13:10', 'dd/Mon/yyyy HH24:MI'),TO_DATE('20/May/2019 17:20', 'dd/Mon/yyyy HH24:MI'),100008,1060);
INSERT INTO admission VALUES (100012,TO_DATE('14/Mar/2019 09:30', 'dd/Mon/yyyy HH24:MI'),TO_DATE('23/Mar/2019 09:10', 'dd/Mon/yyyy HH24:MI'),100009,7890);
INSERT INTO admission VALUES (100013,TO_DATE('04/Apr/2019 11:10', 'dd/Mon/yyyy HH24:MI'),TO_DATE('09/Apr/2019 22:20', 'dd/Mon/yyyy HH24:MI'),100009,2459);
INSERT INTO admission VALUES (100014,TO_DATE('01/May/2019 03:30', 'dd/Mon/yyyy HH24:MI'),TO_DATE('20/May/2019 20:30', 'dd/Mon/yyyy HH24:MI'),100009,1028);
INSERT INTO admission VALUES (100015,TO_DATE('20/May/2019 23:10', 'dd/Mon/yyyy HH24:MI'),NULL,100010,1056);
INSERT INTO ADM_PRC VALUES (10001,TO_DATE('03/Jan/2019 12:00', 'dd/Mon/yyyy HH24:MI'), 73.76, 160.33, 100001, 15509, 1061, NULL);
INSERT INTO ADM_PRC VALUES (10002,TO_DATE('11/Feb/2019 13:20', 'dd/Mon/yyyy HH24:MI'), 189.22, 46.22, 100002, 15511, 1005, 1048); 
INSERT INTO ADM_PRC VALUES (10003,TO_DATE('12/Feb/2019 15:30', 'dd/Mon/yyyy HH24:MI'), 75.22, 10.22, 100002, 33335,2459, NULL);
INSERT INTO ADM_PRC VALUES (10004,TO_DATE('04/Jan/2019 17:30', 'dd/Mon/yyyy HH24:MI'), 81.65, 62.04, 100003, 15510, 1099, 1298);
INSERT INTO ADM_PRC VALUES (10005,TO_DATE('03/Mar/2019 11:10', 'dd/Mon/yyyy HH24:MI'), 247.54, 5.16, 100003, 43556, 7900, 1005);
INSERT INTO ADM_PRC VALUES (10006,TO_DATE('04/Apr/2019 10:10', 'dd/Mon/yyyy HH24:MI'), 68.99, 4.50, 100003, 71432, 1033, NULL);
INSERT INTO ADM_PRC VALUES (10007,TO_DATE('10/May/2019 12:10', 'dd/Mon/yyyy HH24:MI'), 75.99, 5.60, 100014, 15509, 1064, 1069);
INSERT INTO ADM_PRC VALUES (10008,TO_DATE('12/Jan/2019 13:50', 'dd/Mon/yyyy HH24:MI'), 352.11, 31.84, 100004, 43111, 1033, 1028);
INSERT INTO ADM_PRC VALUES (10009,TO_DATE('01/Mar/2019 20:30', 'dd/Mon/yyyy HH24:MI'), 405.32, 110.15, 100005, 43112, 1012, NULL);
INSERT INTO ADM_PRC VALUES (10010,TO_DATE('22/May/2019 12:10', 'dd/Mon/yyyy HH24:MI'), 74.43, 30.20, 100015, 71432, 1027, NULL);
INSERT INTO ADM_PRC VALUES (10011,TO_DATE('03/Mar/2019 15:55', 'dd/Mon/yyyy HH24:MI'), 263.43, 7.20, 100006, 54132, 1048, 1060);
INSERT INTO ADM_PRC VALUES (10012,TO_DATE('20/Mar/2019 11:20', 'dd/Mon/yyyy HH24:MI'), 37.43, 0.90, 100006, 40100, 1298, 1005);
INSERT INTO ADM_PRC VALUES (10013,TO_DATE('07/Jan/2019 10:30', 'dd/Mon/yyyy HH24:MI'), 249.32, 6.90, 100007, 43556, 7900, NULL);
INSERT INTO ADM_PRC VALUES (10014,TO_DATE('21/Apr/2019 22:10', 'dd/Mon/yyyy HH24:MI'), 56.43, 9.00, 100008, 33335, 1018, 1027);
INSERT INTO ADM_PRC VALUES (10015,TO_DATE('15/Apr/2019 12:55', 'dd/Mon/yyyy HH24:MI'), 112.34, 14.28, 100009, 43114, 1084, NULL);
INSERT INTO ADM_PRC VALUES (10016,TO_DATE('25/Apr/2019 13:20', 'dd/Mon/yyyy HH24:MI'), 178.23, 5.60, 100009, 15511, 1033, 1298);
INSERT INTO ADM_PRC VALUES (10017,TO_DATE('12/May/2019 18:30', 'dd/Mon/yyyy HH24:MI'), 56.43, 365.48, 100010, 32266, 7890, 1033);
INSERT INTO ADM_PRC VALUES (10018,TO_DATE('12/May/2019 14:20', 'dd/Mon/yyyy HH24:MI'), 121.23, 124.08, 100011, 43114, 1060, 1005);
INSERT INTO ADM_PRC VALUES (10019,TO_DATE('21/Mar/2019 09:30', 'dd/Mon/yyyy HH24:MI'), 66.66, 162.40, 100012, 71432, 1298, NULL);
INSERT INTO ADM_PRC VALUES (10020,TO_DATE('07/Apr/2019 10:20', 'dd/Mon/yyyy HH24:MI'), 334.43, 9.00, 100013, 43112, 1012, NULL);

INSERT INTO ITEM_TREATMENT VALUES (10001, 'AN002', 1, 182.33);
INSERT INTO ITEM_TREATMENT VALUES (10002, 'SS006', 3, 45.30);
INSERT INTO ITEM_TREATMENT VALUES (10002, 'PS318', 2, 9.52);
INSERT INTO ITEM_TREATMENT VALUES (10003, 'CF050', 2, 62.04);
INSERT INTO ITEM_TREATMENT VALUES (10003, 'TE001', 3, 5.16);
INSERT INTO ITEM_TREATMENT VALUES (10003, 'CA002', 2, 4.50);
INSERT INTO ITEM_TREATMENT VALUES (10004, 'CE010', 8, 31.84);
INSERT INTO ITEM_TREATMENT VALUES (10005, 'EA030', 1, 110.15);
INSERT INTO ITEM_TREATMENT VALUES (10006, 'ST252', 10, 7.20);
INSERT INTO ITEM_TREATMENT VALUES (10006, 'TN010', 2, 0.90);
INSERT INTO ITEM_TREATMENT VALUES (10007, 'NE001', 2, 6.90);
INSERT INTO ITEM_TREATMENT VALUES (10008, 'CA002', 4, 9.00);
INSERT INTO ITEM_TREATMENT VALUES (10009, 'PS318', 3, 14.28);
INSERT INTO ITEM_TREATMENT VALUES (10009, 'AT258', 5, 5.60);
INSERT INTO ITEM_TREATMENT VALUES (10010, 'BI500', 1, 365.48);
INSERT INTO ITEM_TREATMENT VALUES (10011, 'CF050', 2, 124.08);
INSERT INTO ITEM_TREATMENT VALUES (10012, 'AP050', 2, 162.40);
INSERT INTO ITEM_TREATMENT VALUES (10013, 'TN010', 20, 9.00);
INSERT INTO ITEM_TREATMENT VALUES (10014, 'AT258', 5, 5.60);
INSERT INTO ITEM_TREATMENT VALUES (10015, 'SS006', 2, 30.20);
commit;
