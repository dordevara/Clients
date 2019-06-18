/************************ Deleted Reference Data View ***************************/
/*The company also want visibility of what Reference Data has been deleted. 
They want to be able to query a SQL View which shows all reference data which has been deleted. 
*/
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vwReferenceDeleted]
AS
SELECT * FROM ReferenceDeleted

GO
EXEC sp_addextendedproperty N'MS_Description', N'Deleted
Reference Data View for visibility of what Reference Data has been deleted', 'SCHEMA', N'dbo', 'VIEW', N'vwReferenceDeleted', NULL, NULL
GO
