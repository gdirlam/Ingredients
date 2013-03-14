USE [model]
GO

/****** Object:  UserDefinedFunction [fn].[Split]    Script Date: 06/15/2012 15:16:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [fn].[Split](
        @prmArray as  varchar(MAX),
        @seperator as  char(1)
)
RETURNS @elements TABLE (
		rowId INT IDENTITY (1,1) PRIMARY KEY
        , element varchar(255)
)
AS
BEGIN

DECLARE @i int,  @iLast int
SET @i = 1
SET @iLast = 0

WHILE @i < LEN(@prmArray)
BEGIN
        If SUBSTRING( @prmArray, @i, 1 ) = @seperator
        BEGIN
                INSERT INTO @elements
                        SELECT RTRIM( LTRIM( REPLACE( SUBSTRING( @prmArray, @iLast, @i - @iLast ), @seperator, '' ) ) )
                SET @iLast = @i
        END

SET @i = @i + 1
END
        IF @i <> 1
                SET @iLast = @iLast
                INSERT INTO @elements
                SELECT RTRIM( LTRIM( REPLACE( SUBSTRING( @prmArray, @iLast, LEN(@prmArray) - @iLast + 1 ), @seperator, '' ) ) )
   RETURN
END



GO

