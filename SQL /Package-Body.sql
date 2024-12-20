-- 6. Package body

create or replace package body criminal_management as

    procedure add_station(
        p_station_no number,
        p_station_name varchar2,
        p_contact number,
        p_address varchar2,
        p_policemen_num number,
        p_sho_name varchar2,
        p_prisoners_num number,
        p_pending_cases number
    ) as
    begin
        insert into station values (
            p_station_no, p_station_name, p_contact, p_address,
            p_policemen_num, p_sho_name, p_prisoners_num, p_pending_cases
        );
    end;

     procedure add_policeman(
        p_police_id number,
        p_police_name varchar2,
        p_contact number,
        p_father_name varchar2,
        p_date_of_birth date,
        p_gender varchar2,
        p_rank varchar2,
        p_address varchar2,
        p_station_no number
    ) 
    as
    begin
        insert into police_man values (
            p_police_id, p_police_name, p_contact, p_father_name,
            p_date_of_birth, p_gender, p_rank, p_address, p_station_no
        );
    end;

    procedure add_fir(
        p_type varchar2,
        p_date_of_fir date,
        p_status varchar2,
        p_location varchar2,
        p_description varchar2,
        p_case_incharge number,
        p_criminal_involved number
    ) as
        v_fir_id number;
    begin
        v_fir_id := seq_fir_id.nextval;
        insert into fir values (
            v_fir_id, p_type, p_date_of_fir, p_status, p_location,
            p_description, p_case_incharge, p_criminal_involved
        );
    end;

     procedure add_criminal(
        p_criminal_name varchar2,
        p_father_name varchar2,
        p_age number,
        p_gender varchar2,
        p_contact varchar2,
        p_address varchar2
    ) as
        v_criminal_id number;
    begin
        v_criminal_id := seq_criminal_id.nextval;
        insert into criminal values (
            v_criminal_id, p_criminal_name, p_father_name, 
            p_age, p_gender, p_contact, p_address
        );
    end;

    
    procedure add_evidence(
        p_fir_id number,
        p_type varchar2,
        p_description varchar2,
        p_date_collected date,
        p_collected_by number
    ) as
        v_evidence_id number;
    begin
        v_evidence_id := seq_evidence_id.nextval;
        insert into evidence values (
            v_evidence_id, p_fir_id, p_type, p_description, 
            p_date_collected, p_collected_by
        );
    end;

    procedure remove_fir(p_fir_id number) as
    begin
        delete from fir where fir_id = p_fir_id;
    end;

    procedure update_fir_status(p_fir_id number, p_status varchar2) as
    begin
        update fir set status = p_status where fir_id = p_fir_id;
    end;

    procedure remove_criminal(p_criminal_id number) as
    begin
        delete from criminal where criminal_id = p_criminal_id;
    end;

    procedure update_policeman_rank(p_police_id number, p_rank varchar2) as
    begin
        update police_man set rank = p_rank where police_id = p_police_id;
    end;
    -- functions 
    function get_station_info(p_station_no number) return varchar2 is 
        v_station_info varchar2(100);
    begin
        select 'Station Name: '|| station_name || ', SHO: '||sho_name
        into v_station_info from station
        where station_no = p_station_no;
        return v_station_info;
    end get_station_info;

    function get_fir_details(p_fir_id number) return varchar2 is 
        v_fir_info varchar2(100);
    begin
        select 'Type : '|| type || ', Status : '||status||', Location: '||location
        into v_fir_info  from fir where fir_id = p_fir_id;
        return v_fir_info;
    end get_fir_details;
    
end criminal_management;
/
