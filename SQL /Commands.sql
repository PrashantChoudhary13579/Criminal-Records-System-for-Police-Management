-- Multiple commands for execution of each and every functions and procedures.
--Inserting police station, policeman, criminals.
declare
    v_station station%ROWTYPE;
begin
    v_station.station_no := :station_no;
    v_station.station_name := :station_name;
    v_station.contact := :contact;
    v_station.address := :address;
    v_station.policemen_num := :policemen_num;
    v_station.sho_name := :sho_name;
    v_station.prisoners_num := :prisoners_num;
    v_station.pending_cases := :pending_cases;

    insert into station (
        station_no, station_name, contact, address, 
        policemen_num, sho_name, prisoners_num, pending_cases
    ) values (
        v_station.station_no, v_station.station_name, v_station.contact, v_station.address,
        v_station.policemen_num, v_station.sho_name, v_station.prisoners_num, v_station.pending_cases
    );

end;
select * from station;
/
declare
    v_police_man police_man%ROWTYPE;
begin
    v_police_man.police_id := :police_man_id;
    v_police_man.police_name := :police_name;
    v_police_man.contact := to_number(:contact);
    v_police_man.father_name := :father_name;
    v_police_man.date_of_birth := to_date(:date_of_birth, 'YYYY-MM-DD');
    v_police_man.gender := :gender;
    v_police_man.rank := :rank;
    v_police_man.address := :address;
    v_police_man.station_no := :station_no;

    insert into police_man (
        police_id, police_name, contact, father_name, date_of_birth,  
        gender, rank, address, station_no
    ) values (
        v_police_man.police_id, v_police_man.police_name, v_police_man.contact, 
        v_police_man.father_name, v_police_man.date_of_birth, 
        v_police_man.gender, v_police_man.rank, v_police_man.address, v_police_man.station_no);
end;


declare
    v_criminal criminal%ROWTYPE;
begin
    v_criminal.criminal_id := seq_criminal_id.nextval;
    v_criminal.criminal_name := :criminal_name;
    v_criminal.father_name := :father_name;
    v_criminal.age := :age;
    v_criminal.gender := :gender;
    v_criminal.contact := :contact;
    v_criminal.address := :address;

    insert into criminal (
        criminal_id, criminal_name, father_name, age, gender, contact, address
    ) values (
        v_criminal.criminal_id, v_criminal.criminal_name, v_criminal.father_name, v_criminal.age, 
        v_criminal.gender, v_criminal.contact, v_criminal.address
    );

end;

-- Writing the FIR
declare
    v_fir fir%ROWTYPE;
begin
    v_fir.fir_id := seq_fir_id.nextval;
    v_fir.type := :type;
    v_fir.date_of_fir := to_date(:date_of_fir, 'YYYY-MM-DD');
    v_fir.status := :status;
    v_fir.location := :location;
    v_fir.description := :description;
    v_fir.case_incharge := :case_incharge;
    v_fir.criminal_involved := :criminal_involved;

    insert into fir (
        fir_id, type, date_of_fir, status, location, 
        description, case_incharge, criminal_involved
    ) values (
        v_fir.fir_id, v_fir.type, v_fir.date_of_fir, v_fir.status, v_fir.location, 
        v_fir.description, v_fir.case_incharge, v_fir.criminal_involved
    );

end;

--Inserting the evidences found

declare
    v_evidence evidence%ROWTYPE;
begin
    v_evidence.evidence_id := seq_evidence_id.nextval;
    v_evidence.fir_id := :fir_id;
    v_evidence.type := :type;
    v_evidence.description := :description;
    v_evidence.date_collected := to_date(:date_collected, 'YYYY-MM-DD');
    v_evidence.collected_by := :collected_by;

    insert into evidence (
        evidence_id, fir_id, type, description, date_collected, collected_by
    ) values (
        v_evidence.evidence_id, v_evidence.fir_id, v_evidence.type, v_evidence.description, 
        v_evidence.date_collected, v_evidence.collected_by
    );

end;

-- Removing FIR

declare
    v_fir_id fir.fir_id%TYPE;
begin
    v_fir_id := :fir_id;

    delete from fir where fir_id = v_fir_id;

    htp.p('FIR removed successfully.');
end;

--FIR status updation
declare
    v_fir_id fir.fir_id%TYPE;
    v_status fir.status%TYPE;
begin
    v_fir_id := :fir_id;
    v_status := :status;

    update fir set status = v_status where fir_id = v_fir_id;

    htp.p('FIR status updated successfully.');
end;

-- Removing the criminal
declare 
    v_criminal_id criminal.criminal_id%TYPE;
begin
    v_criminal_id : = :criminal_id;
    delete from criminal where criminal_id = v_criminal_id;
    htp.p('Criminal has removed ');
end;


-- Removing the police 
declare
    v_police_man_id police_man.police_id%TYPE;
begin
    v_police_man_id := :police_id;

    delete from police_man where police_id = v_police_man_id;

    htp.p('Police man removed successfully.');
end;
/

-- Updating the policeman rank
declare
    v_police_man_id police_man.police_id%TYPE;
    v_new_rank police_man.rank%TYPE;
begin
    v_police_man_id := :police_id;
    v_new_rank := :new_rank;

    update police_man set rank = v_new_rank where police_id = v_police_man_id;

    htp.p('Police rank updated successfully.');
end;

-- Getting Station information
declare
    v_station_info varchar2(100);
begin
    v_station_info := criminal_management.get_station_info(121);
    dbms_output.put_line('Station Info : ' || v_station_info);
end;

--  Getting FIR Details
declare 
    v_fir_info varchar2(100);
begin
    v_fir_info := criminal_management.get_fir_details(101);
    dbms_output.put_line('Fir Info: '||v_fir_info);
end;
