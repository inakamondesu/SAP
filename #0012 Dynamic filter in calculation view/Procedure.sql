PROCEDURE "Y_SCHEMA"."Training::DYNAMIC_FILTER_PROCEDURE" (OUT FILTER NVARCHAR(8))
	LANGUAGE SQLSCRIPT
	SQL SECURITY INVOKER
	DEFAULT SCHEMA "Y_SCHEMA"
	READ SQL DATA AS
	L_YEAR NVARCHAR(4); /*Last Year*/
	C_YEAR NVARCHAR(4); /*Current Year*/

BEGIN
	L_YEAR := LEFT(TO_CHAR(ADD_YEARS(CURRENT_DATE,-1)),4);
	C_YEAR := LEFT(TO_CHAR(CURRENT_DATE),4);
	FILTER := "L_YEAR" || "C_YEAR";
END;
