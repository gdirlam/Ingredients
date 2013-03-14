CREATE function [fn].[CurrencyToString](
	@value as int
) 
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @retval VARCHAR(100)

	SET @retval = CONVERT( MONEY, @value )  
	SET @retval = CONVERT( VARCHAR(100), @retval ) 

	RETURN @retval

END 
