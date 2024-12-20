
-- 2. Create sequences for auto-incrementing IDs

create sequence seq_fir_id 
start with 100 
increment by 1
minvalue 1
nocycle;

create sequence seq_criminal_id
start with 10 
increment by 1
minvalue 10
nocycle
nocache;

create sequence seq_evidence_id 
start with 1 
increment by 1
minvalue 1 
maxvalue 100
nocycle
nocache;
