SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Roxana Butenco
-- Create date: 14/06/2019
-- Description:	Create a new customer and a new Association with an existing customer
-- =============================================
CREATE PROCEDURE [dbo].[uspCreateNewCustomer]
	-- Add the parameters for the stored procedure here
(  
	@FName VARCHAR(20),
	@LName VARCHAR(20),
	@DateOfBirth DATE,
	@CompanyName VARCHAR(50),
	@City VARCHAR(20),
	@Country VARCHAR(20),
	@PhoneNo VARCHAR(10),
	@Client2 INT,
	@AssocRefId INT,
	@ClientRefId INT
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Clients	(ClientRefId, FName, LName, DateOfBirth, CompanyName, City, Country, PhoneNo) 
		VALUES			(@ClientRefId, @FName, @LName, @DateOfBirth, @CompanyName, @City, @Country, @PhoneNo)  
	DECLARE		@ClientId INT = @@IDENTITY  
	INSERT INTO Associations (Client1, AssocRefId, Client2) 
		VALUES			(@ClientId, @AssocRefId, @Client2) 
END

GO
EXEC sp_addextendedproperty N'MS_Description', N'create a new Customer and a new Association from the newly created customer to another existing customer ', 'SCHEMA', N'dbo', 'PROCEDURE', N'uspCreateNewCustomer', NULL, NULL
GO
