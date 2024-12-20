-- 3. Create triggers for notifications

create or replace trigger trg_add_fir
after insert on fir
begin
    dbms_output.put_line('fir added successfully.');
end;

create or replace trigger trg_add_criminal
after insert on criminal
begin
    dbms_output.put_line('criminal added successfully.');
end;

create or replace trigger trg_add_police_man
after insert on police_man
begin
    dbms_output.put_line('policeman added successfully.');
end;
