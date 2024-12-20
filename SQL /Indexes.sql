--4. Indexes 

CREATE INDEX idx_station_sho ON station (station_name, sho_name);
CREATE INDEX idx_police_rank ON police_man (rank);
CREATE INDEX idx_criminal_name ON criminal (criminal_name);
CREATE INDEX idx_fir_status ON fir (status);
