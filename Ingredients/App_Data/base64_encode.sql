USE [model]
GO

/****** Object:  UserDefinedFunction [fn].[base64_encode]    Script Date: 06/15/2012 15:34:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [fn].[base64_encode] 
(@data VARBINARY(max)) 
RETURNS VARCHAR(max)

WITH SCHEMABINDING, RETURNS NULL ON NULL INPUT

BEGIN

RETURN (

SELECT [text()] = @data 
FOR XML PATH('')

) 
END
GO

