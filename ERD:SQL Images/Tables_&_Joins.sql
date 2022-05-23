CREATE TABLE public."car_size" (
	ID INT NOT NULL,
	Mass real NOT NULL,
	CO2 real NOT NULL,
	W real NOT NULL,
	SteeringAxle real NOT NULL,
	OtherAxle real NOT NULL,
	EngineCapacity real NOT NULL,
	EnginePower real NOT NULL,
	PRIMARY KEY (ID)
	);
	
	SELECT * FROM public."car_size";
	SELECT * FROM public."car_category"
	SELECT * FROM public."co2_levels"
	
	
	CREATE TABLE public."car_category" (
	IDs INT NOT NULL,
	Mk VARCHAR(50) NOT NULL,
	Category_Type_Approved VARCHAR(50) NOT NULL,
	Category_Registered VARCHAR(50) NOT NULL,
	FT VARCHAR(50) NOT NULL,
	FM VARCHAR(50) NOT NULL,
	FOREIGN KEY (IDs) REFERENCES car_size (ID),
	PRIMARY KEY (IDs)	
	);
	
SELECT  cc.ids,
		cc.mk,
		cc.category_type_approved,
		cc.category_registered,
		cc.ft,
		cc.fm,
        s.mass,
        s.co2,
        s.w,
        s.steeringaxle,
        s.otheraxle,
        s.enginecapacity,
		s.enginepower
INTO public."co2_levels"
FROM car_category AS cc
FULL OUTER JOIN car_size AS s
ON (s.id = cc.ids);