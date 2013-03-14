USE [model]
GO

/****** Object:  UserDefinedFunction [fn].[DtToString]    Script Date: 06/19/2012 14:49:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [fn].[DtToString](	
	@var Datetime
)
RETURNS VARCHAR(10)
AS
BEGIN
/*
Usage: SELECT [fn].[DateToString]('10/23/2016')
*/


	RETURN CAST( CONVERT(VARCHAR(10), @var, 101) AS  VARCHAR(10))

END



GO

