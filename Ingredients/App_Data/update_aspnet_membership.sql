use WB_CustomerPortalData 

Declare @uid as uniqueidentifier 
--set @uid = '9109258D-279B-488F-81A1-4FB43FFCD4CC'
--set @uid = '41A9F516-89B6-4C5B-A1B1-7BE5547E5BCE'
--set @uid = '2448C36B-17B5-460E-926F-966CF9122B4E'
--set @uid = 'C44F910E-F0C4-49E3-A232-EF2E3C4646E5'
--set @uid = '1A588C68-92FE-448A-A9E6-1633B897BC50'
--set @uid = '4EA96BE4-79B0-4290-8C44-AA2666749CC1'
--set @uid = '2F0ABEEC-4B95-4761-BC39-B8A17C66E6EB'
--set @uid = '58B2CD1C-7B48-41A4-923F-6CCD73BA3244'
--set @uid = '95F6A0E2-124E-4534-BD09-62BA3D1AF8A3'
--set @uid = '0FB14A39-86DC-4967-B2B4-B1BA33FC0844'
--set @uid = '155F311D-AFD4-490F-B1EE-056D9B833388'
--set @uid = '3A3BDA62-B643-4C15-A392-F2EE310464DF'
--set @uid = '35CBC947-4D8F-41AE-B256-2F232296DD8D'
--set @uid = '7BCA5200-1540-427E-ADBF-1AC66DBE5152'
--set @uid = 'BB799AB0-F129-4EEA-A2AC-A609AD8DC77E'
--set @uid = '85B69BEC-0AA7-4C50-94B4-611819CE3F20'
--set @uid = '2CEBFD80-3C29-434F-A4F4-269674CD1C05'
--set @uid = '6F9EBC7E-FC8B-4641-9C29-9D6472EB7113'

--select * from dbo.aspnet_Membership where UserId =@uid 
--select * from dbo.aspnet_Users where UserId = @uid 
select @uid = UserId   from dbo.aspnet_Users where UserName = 'APB177565'
	DECLARE @BCBSDEUser varchar(30)
	DECLARE @PIN varchar(30)
	
       DECLARE @UnencodedSalt uniqueidentifier
       DECLARE @SaltedPassword nvarchar(128)
       DECLARE @ClearTextPassword nvarchar(128)
       
       DECLARE @SaltedAnswer nvarchar(128)
       DECLARE @PasswordSalt nvarchar(128)

	DECLARE @utcNow DATETIME
	SET @utcNow = getutcdate()
SET @PIN = 'bcbsde123'

SET @UnencodedSalt = NEWID()
SET @PasswordSalt = fn.base64_encode(@UnencodedSalt)
SET @ClearTextPassword = @PIN 
SET @SaltedPassword = fn.base64_encode( 
          HASHBYTES ('SHA1', CAST( @UnencodedSalt  as varbinary(MAX) ) 
                                     + CAST( @ClearTextPassword AS varbinary(MAX) )
                              )
                       )
update dbo.aspnet_Membership  set password = @SaltedPassword, PasswordSalt = @PasswordSalt
where UserId = @uid 

select * from dbo.aspnet_Membership where UserId =@uid 
select * from dbo.aspnet_Users where UserId = @uid 


