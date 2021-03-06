USE [Casino]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25/11/2021 04:32:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_User]    Script Date: 25/11/2021 04:32:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Delete_User]
	-- Add the parameters for the stored procedure here
	@UserName varchar(50)
AS
BEGIN

Delete [dbo].[User]
where UserName=@UserName
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_User]    Script Date: 25/11/2021 04:32:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Insert_User]
	-- Add the parameters for the stored procedure here
	@UserName varchar(50),
	@Password varchar(50),
	@FirstName varchar(50),
	@LastName varchar(50)
AS
BEGIN

INSERT INTO [dbo].[User]
           ([Username]
           ,[Password]
           ,[FirstName]
           ,[LastName])
     VALUES
           (@Username
           ,@Password
           ,@FirstName
           ,@LastName)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Save_User]    Script Date: 25/11/2021 04:32:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Save_User] 
	-- Add the parameters for the stored procedure here
	@UserName varchar(50),
	@Password varchar(50),
	@FirstName varchar(50),
	@LastName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	-- SET NOCOUNT ON;

    -- Insert statements for procedure here
	if Exists(SELECT * FROM dbo.[User] where Username = @UserName)
		exec sp_Update_User @UserName, @Password, @FirstName, @LastName
	else
		exec sp_Insert_User @UserName, @Password, @FirstName, @LastName
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Select_User]    Script Date: 25/11/2021 04:32:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Select_User]
	-- Add the parameters for the stored procedure here
	@UserName varchar(50),
	@Password varchar(50),
	@FirstName varchar(50),
	@LastName varchar(50)
AS
BEGIN

select * from [dbo].[User]
where UserName like '%' + @UserName + '%' or @UserName=''
    or Password like  '%' + @Password + '%' or @Password=''
	or FirstName like  '%' + @FirstName + '%' or @FirstName=''
	or LastName like  '%' + @LastName + '%' or @LastName=''

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Update_User]    Script Date: 25/11/2021 04:32:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Update_User]
	-- Add the parameters for the stored procedure here
	@UserName varchar(50),
	@Password varchar(50),
	@FirstName varchar(50),
	@LastName varchar(50)
AS
BEGIN

Update [dbo].[User] set Password=@Password, FirstName=@FirstName, LastName=@LastName
where UserName=@UserName
END
GO
