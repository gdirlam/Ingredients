USE [model]
GO

/****** Object:  UserDefinedFunction [fn].[base64_decode]    Script Date: 06/15/2012 15:34:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [fn].[base64_decode] 
(@base64_text VARCHAR(max)) 
RETURNS VARBINARY(max)

WITH SCHEMABINDING, RETURNS NULL ON NULL INPUT

BEGIN

DECLARE @x XML; SET @x = @base64_text 
RETURN @x.value('(/)[1]', 'VARBINARY(max)')

END
GO

