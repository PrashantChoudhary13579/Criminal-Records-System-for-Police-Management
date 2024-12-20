
--Viewing police information
CREATE VIEW view_police_details AS
SELECT  pm.police_id, pm.police_name, pm.rank, pm.station_no,
    st.station_name AS station_name,  st.address AS station_address
FROM police_man pm
JOIN station st  
ON pm.station_no = st.station_no;

-- Viewing Evidence 
CREATE VIEW view_evidence_details AS
SELECT  e.evidence_id, e.type AS evidence_type, e.description,
    e.date_collected, pm.police_name AS collected_by, f.fir_id AS related_fir
FROM  evidence e
JOIN  police_man pm  ON  e.collected_by = pm.police_id
JOIN  fir f   ON e.fir_id = f.fir_id;

select *from view_evidence_details;
