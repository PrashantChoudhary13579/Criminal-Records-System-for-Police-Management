-- 1. Create the tables

create table station (
    station_no number primary key,
    station_name varchar2(50) not null,
    contact number(10),
    address varchar2(100),
    policemen_num number,
    sho_name varchar2(20),
    prisoners_num number,
    pending_cases number
);
INSERT INTO Station VALUES (121, 'Central Station', '9876543210', '123 Main Street, City A', 50, 'Ramesh', 20, 5);
INSERT INTO Station VALUES(131, 'North Point', '8765432109', '456 Elm Street, City B', 35, 'Suresh', 15, 8);
INSERT INTO Station VALUES(141, 'South End', '7654321098', '789 Oak Avenue, City C', 40, 'Mahesh', 10, 3);
INSERT INTO Station VALUES(151, 'East Side', '6543210987', '321 Pine Blvd, City D', 45, 'Rajesh', 25, 6);
INSERT INTO Station VALUES(161, 'West Zone', '5432109876', '654 Cedar Lane, City E', 30, 'Naresh',12,4);


create table police_man (
    police_id number primary key,
    police_name varchar2(25) not null,
    contact number(10),
    father_name varchar2(25),
    date_of_birth date,
    gender varchar2(10),
    rank varchar2(50),
    address varchar2(100),
    station_no number,  
    constraint fk_station_no foreign key (station_no) references station(station_no)
);

INSERT INTO Police_Man VALUES (31,'Naman',9876543210,'Narendra',TO_DATE('1985-03-15', 'YYYY-MM-DD'),'Male','Constable','sector 1',121);
INSERT INTO Police_Man VALUES (32,'Aman',9897543210,'Arendra',TO_DATE('1985-03-17', 'YYYY-MM-DD'),'Male','Inspector','sector 2',131);
INSERT INTO Police_Man VALUES (33,'Raman',9816543210,'Rajendra',TO_DATE('1985-05-11', 'YYYY-MM-DD'),'Male','ASI','sector 3',141);
INSERT INTO Police_Man VALUES (34,'Taman',9800543210,'Tilak',TO_DATE('1985-01-13', 'YYYY-MM-DD'),'Male','Head Constable','sector 4',151);
INSERT INTO Police_Man VALUES (35,'Aditya',9116543210,'Shivam',TO_DATE('1985-03-21', 'YYYY-MM-DD'),'Male','SI','sector 5',161);
INSERT INTO Police_Man VALUES (36,'Simran',9877543210,'Aman',TO_DATE('1985-03-19', 'YYYY-MM-DD'),'Female','DSP','sector 6',131);

select * from Police_Man ;

create table criminal (
    criminal_id number primary key,
    criminal_name varchar2(100) not null,
    father_name varchar2(100),
    age number,
    gender varchar2(10),
    contact varchar2(15),
    address varchar2(255)
);
INSERT INTO criminal VALUES (seq_criminal_id.nextval,'Vikas','Manoj ',34,'Male', 9876543211,'sector 4');
INSERT INTO criminal VALUES (seq_criminal_id.nextval,'kaushal','arvind',34,'Male', 9871143211,'sector 15');
INSERT INTO criminal VALUES (seq_criminal_id.nextval,'aditya','rakesh',34,'Male', 9876223211,'sector 17');
INSERT INTO criminal VALUES (seq_criminal_id.nextval,'nishant','mhaendra',34,'Male', 9336543211,'sector 22');
INSERT INTO criminal VALUES (seq_criminal_id.nextval,'akshit','hitesh',34,'Male', 9876443211,'sector 7');
INSERT INTO criminal VALUES (seq_criminal_id.nextval,'Pranav','sahil',34,'Male', 9876555211,'sector 63');
select * from criminal;
INSERT INTO criminal VALUES (seq_criminal_id.nextval,'bhavesh','kartik',34,'Male', 9877743211,'sector 25');
INSERT INTO criminal VALUES (seq_criminal_id.nextval,'rauank','Manoj ',34,'Male', 9166543211,'sector 32');
INSERT INTO criminal VALUES (seq_criminal_id.nextval,'rajat','pareen',34,'Male', 9866143211,'sector 37');
INSERT INTO criminal VALUES (seq_criminal_id.nextval,'aditya','prithul',34,'Male', 1176223211,'sector 17');
INSERT INTO criminal VALUES (seq_criminal_id.nextval,'sam','pipito',34,'Male', 9336543211,'sector 18');
INSERT INTO criminal VALUES (seq_criminal_id.nextval,'show','nikhil',34,'Male', 9879943211,'sector 5');
INSERT INTO criminal VALUES (seq_criminal_id.nextval,'max','sahil',34,'Male', 9876577211,'sector 6');



create table fir (
    fir_id number primary key,
    type varchar2(50),
    date_of_fir date,
    status varchar2(50),
    location varchar2(100),
    description varchar2(255),
    case_incharge number, 
    criminal_involved number, 
    constraint fk_case_incharge foreign key (case_incharge) references police_man(police_id),
    constraint fk_criminal_involved foreign key (criminal_involved) references criminal(criminal_id)
);
INSERT INTO fir VALUES (seq_fir_id.nextval,'Burglary',TO_DATE('2024-11-01', 'YYYY-MM-DD'),'Pending','sector 4','Theft reported with loss of valuable items.',32,10);
INSERT INTO fir VALUES (seq_fir_id.nextval,'theft',TO_DATE('2024-11-01', 'YYYY-MM-DD'),'ongoing','sector 11','Theft reported with loss of valuable items.',36,11);
INSERT INTO fir VALUES (seq_fir_id.nextval,'murder',TO_DATE('2024-11-01', 'YYYY-MM-DD'),'solved','sector 19','Theft reported with loss of valuable items.',34,12);
INSERT INTO fir VALUES (seq_fir_id.nextval,'fight',TO_DATE('2024-11-01', 'YYYY-MM-DD'),'ongoing','sector 44','Theft reported with loss of valuable items.',31,13);
INSERT INTO fir VALUES (seq_fir_id.nextval,'molastation',TO_DATE('2024-11-01', 'YYYY-MM-DD'),'ongoing','sector 81','Theft reported with loss of valuable items.',33,14);

INSERT INTO fir VALUES (seq_fir_id.nextval,'theft',TO_DATE('2024-11-01', 'YYYY-MM-DD'),'solved','sector 71','Theft reported with loss of valuable items.',35,15);
INSERT INTO fir VALUES (seq_fir_id.nextval,'robery',TO_DATE('2024-11-01', 'YYYY-MM-DD'),'Pending','sector 47','Theft reported with loss of valuable items.',32,16);
INSERT INTO fir VALUES (seq_fir_id.nextval,'murder',TO_DATE('2024-11-01', 'YYYY-MM-DD'),'Pending','sector 33','Theft reported with loss of valuable items.',34,17);
INSERT INTO fir VALUES (seq_fir_id.nextval,'kidnaping',TO_DATE('2024-11-01', 'YYYY-MM-DD'),'arrested','sector 66','Theft reported with loss of valuable items.',36,18);
INSERT INTO fir VALUES (seq_fir_id.nextval,'harasment',TO_DATE('2024-11-01', 'YYYY-MM-DD'),'closed','sector 77','Theft reported with loss of valuable items.',31,19);
INSERT INTO fir VALUES (seq_fir_id.nextval,'theft',TO_DATE('2024-11-01', 'YYYY-MM-DD'),'closed','sector 54','Theft reported with loss of valuable items.',33,20);
INSERT INTO fir VALUES (seq_fir_id.nextval,'theft',TO_DATE('2024-11-01', 'YYYY-MM-DD'),'closed','sector 29','Theft reported with loss of valuable items.',35,21);
INSERT INTO fir VALUES (seq_fir_id.nextval,'murder',TO_DATE('2024-11-01', 'YYYY-MM-DD'),'Pending','sector 31','Theft reported with loss of valuable items.',32,22);

select * from fir;

create table evidence (
    evidence_id number primary key,
    fir_id number,  
    type varchar2(50),
    description varchar2(255),
    date_collected date,
    collected_by number,  
    constraint fk_fir_id foreign key (fir_id) references fir(fir_id),
    constraint fk_collected_by foreign key (collected_by) references police_man(police_id)
);
INSERT INTO Evidence VALUES (seq_evidence_id.nextval,100,'Fingerprint','Fingerprint found at the crime scene.',TO_DATE('2024-11-10', 'YYYY-MM-DD'),31);
INSERT INTO Evidence VALUES (seq_evidence_id.nextval,101,'photo','Fingerprint found at the crime scene.',TO_DATE('2024-11-10', 'YYYY-MM-DD'),32);
INSERT INTO Evidence VALUES (seq_evidence_id.nextval,102,'video','Fingerprint found at the crime scene.',TO_DATE('2024-11-10', 'YYYY-MM-DD'),33);
INSERT INTO Evidence VALUES (seq_evidence_id.nextval,103,'weapon','Fingerprint found at the crime scene.',TO_DATE('2024-11-10', 'YYYY-MM-DD'),34);
INSERT INTO Evidence VALUES (seq_evidence_id.nextval,104,'people','Fingerprint found at the crime scene.',TO_DATE('2024-11-10', 'YYYY-MM-DD'),35);
INSERT INTO Evidence VALUES (seq_evidence_id.nextval,120,'fingerprint','Fingerprint found at the crime scene.',TO_DATE('2024-11-10', 'YYYY-MM-DD'),36);
INSERT INTO Evidence VALUES (seq_evidence_id.nextval,121,'blood sample','Fingerprint found at the crime scene.',TO_DATE('2024-11-10', 'YYYY-MM-DD'),31);
select * from Evidence;
INSERT INTO Evidence VALUES (seq_evidence_id.nextval,122,'photo','Fingerprint found at the crime scene.',TO_DATE('2024-11-10', 'YYYY-MM-DD'),32);
INSERT INTO Evidence VALUES (seq_evidence_id.nextval,123,'audio','Fingerprint found at the crime scene.',TO_DATE('2024-11-10', 'YYYY-MM-DD'),33);
INSERT INTO Evidence VALUES (seq_evidence_id.nextval,124,'call recording','Fingerprint found at the crime scene.',TO_DATE('2024-11-10', 'YYYY-MM-DD'),34);
INSERT INTO Evidence VALUES (seq_evidence_id.nextval,125,'phot','Fingerprint found at the crime scene.',TO_DATE('2024-11-10', 'YYYY-MM-DD'),35);
