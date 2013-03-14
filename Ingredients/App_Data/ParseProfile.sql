USE [model]
GO

/****** Object:  UserDefinedFunction [fn].[aspnet_profile]    Script Date: 06/15/2012 11:44:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER FUNCTION [fn].[aspnet_profile](	
	@PropertyNames as VARCHAR(MAX)
	, @PropertyName as VARCHAR(MAX)
	, @PropertyValues as VARCHAR(MAX)
)
RETURNS VARCHAR(MAX)
AS
BEGIN

	DECLARE @retval AS VARCHAR(MAX)
	SET @retval= ''
	IF  CHARINDEX (@PropertyName, @PropertyNames ) >0
	BEGIN

		declare @PropertyNameStringStart as INT , @PropertyNameStringEnd as INT 
		declare @PropertyStart as varchar(10) , @PropertyEnd as varchar(10)

		SET @PropertyNameStringStart = CHARINDEX(@PropertyName, @PropertyNames)+LEN(@PropertyName)+2
		SET @PropertyStart = SUBSTRING( @PropertyNames, @PropertyNameStringStart, ( CHARINDEX(':', @PropertyNames, @PropertyNameStringStart+1) - @PropertyNameStringStart ) )
		SET @PropertyStart = REPLACE( @PropertyStart, ':', '') 


		SET @PropertyNameStringEnd =  @PropertyNameStringStart+LEN(@PropertyStart)+2

		SET @PropertyEnd = SUBSTRING( @PropertyNames, @PropertyNameStringEnd, ( CHARINDEX(':', @PropertyNames, @PropertyNameStringEnd+1) - @PropertyNameStringEnd )  )
		SET @PropertyEnd = REPLACE( @PropertyEnd, ':', '') 

	--	SELECT @PropertyStart,@PropertyEnd
		SET @retval = SUBSTRING( @PropertyValues, CONVERT( INT, @PropertyStart)+1, CONVERT( INT, @PropertyEnd ) )
	END 	
	RETURN @retval

END






GO


