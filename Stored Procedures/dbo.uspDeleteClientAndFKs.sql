SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/* delete a customer and foreign key records associated with this customer via a parameterised Stored Procedure. */
/* create a stored procedure to delete client and FKs associated with it*/

CREATE PROCEDURE [dbo].[uspDeleteClientAndFKs]
@ClientId INT 
AS 
DELETE FROM Accounts WHERE ClientId = @ClientId
DELETE FROM Associations WHERE Client1 = @ClientId
DELETE FROM Clients WHERE ClientId = @ClientId

GO
EXEC sp_addextendedproperty N'MS_Description', N'delete a client and all its foreign keys ', 'SCHEMA', N'dbo', 'PROCEDURE', N'uspDeleteClientAndFKs', NULL, NULL
GO
