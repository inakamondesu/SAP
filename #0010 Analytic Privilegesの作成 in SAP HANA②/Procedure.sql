PROCEDURE "Y_SCHEMA"."Training::AUTH_PROCEDURE" (OUT OUT_FILTER VARCHAR(50))
	LANGUAGE SQLSCRIPT
	SQL SECURITY DEFINER
	--DEFAULT SCHEMA <default_schema_name>
	READ SQL DATA AS
	V_FILTER VARCHAR(10)
	CURSOR V_CURSOR FOR SELECT "SALESORG" FROM "Y_SCHEMA"."USR_AUTH" WHERE "USERID" = SESSION_USER;
BEGIN
	OPEN V_CURSOR;
	FETCH V_CURSOR INTO V_FILTER;
	OUT_FILTER := 'SALESORG = ' || ''''||"V_FILTER" || '''';
	CLOSE V_CURSOR;
END;
