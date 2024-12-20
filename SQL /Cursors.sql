--Implicit Cursor for getting the criminal records 
BEGIN
   
    FOR criminal_record IN (SELECT criminal_id, criminal_name, father_name, age, 
    gender, contact, address FROM criminal)
    LOOP
      
        DBMS_OUTPUT.PUT_LINE('Criminal ID: ' || criminal_record.criminal_id);
        DBMS_OUTPUT.PUT_LINE('Name: ' || criminal_record.criminal_name);
        DBMS_OUTPUT.PUT_LINE('Father Name: ' || criminal_record.father_name);
        DBMS_OUTPUT.PUT_LINE('Age: ' || criminal_record.age);
        DBMS_OUTPUT.PUT_LINE('Gender: ' || criminal_record.gender);
        DBMS_OUTPUT.PUT_LINE('Contact: ' || criminal_record.contact);
        DBMS_OUTPUT.PUT_LINE('Address: ' || criminal_record.address);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
END;

--Explicit Cursor
DECLARE
   
    CURSOR criminal_cursor IS
        SELECT criminal_id, criminal_name, father_name, age, gender, contact, address
        FROM criminal;

    v_criminal_id criminal.criminal_id%TYPE;
    v_criminal_name criminal.criminal_name%TYPE;
    v_father_name criminal.father_name%TYPE;
    v_age criminal.age%TYPE;
    v_gender criminal.gender%TYPE;
    v_contact criminal.contact%TYPE;
    v_address criminal.address%TYPE;
BEGIN
    OPEN criminal_cursor;
    LOOP
        FETCH criminal_cursor INTO v_criminal_id, v_criminal_name, v_father_name, 
                                  v_age, v_gender, v_contact, v_address;

        EXIT WHEN criminal_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Criminal ID: ' || v_criminal_id);
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_criminal_name);
        DBMS_OUTPUT.PUT_LINE('Father Name: ' || v_father_name);
        DBMS_OUTPUT.PUT_LINE('Age: ' || v_age);
        DBMS_OUTPUT.PUT_LINE('Gender: ' || v_gender);
        DBMS_OUTPUT.PUT_LINE('Contact: ' || v_contact);
        DBMS_OUTPUT.PUT_LINE('Address: ' || v_address);
        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;
    CLOSE criminal_cursor;
END;
