-- 5. Package specification

create or replace package criminal_management as
    -- procedures
    procedure add_station(
        p_station_no number,
        p_station_name varchar2,
        p_contact number,
        p_address varchar2,
        p_policemen_num number,
        p_sho_name varchar2,
        p_prisoners_num number,
        p_pending_cases number
    );
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
    );
    procedure add_fir(
        p_type varchar2,
        p_date_of_fir date,
        p_status varchar2,
        p_location varchar2,
        p_description varchar2,
        p_case_incharge number,
        p_criminal_involved number
    );
   
    procedure add_evidence(
        p_fir_id number,
        p_type varchar2,
        p_description varchar2,
        p_date_collected date,
        p_collected_by number
    );
    procedure add_criminal(
        p_criminal_name varchar2,
        p_father_name varchar2,
        p_age number,
        p_gender varchar2,
        p_contact varchar2,
        p_address varchar2
    );
    
    procedure remove_fir(p_fir_id number);
    procedure update_fir_status(p_fir_id number,
        p_status varchar2);
    procedure remove_criminal(p_criminal_id number);
    procedure update_policeman_rank(
        p_police_id number, p_rank varchar2);
    --functions
    function get_station_info( p_station_no number)
        return varchar2;
    function get_fir_details(p_fir_id number) 
        return varchar2 ;
    
end criminal_management;

