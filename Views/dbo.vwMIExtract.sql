SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vwMIExtract]
--WITH SCHEMABINDING
AS

select temp.*,C2.Fname as a,
CONCAT (temp.FName,' ',temp.LName,' ',temp.CompanyName,' ', + '  is   ' + temp.RefDescription + '  for  '+ C2.FName,' ', C2.LName,' ', C2.CompanyName) as FirstGradeAssociation,
CONCAT (C2.FName,' ',C2.LName,' ',C2.CompanyName,' ', + '  has   ' + temp.RefDescription + ' ', '  ', temp.FName,' ', temp.LName,' ', temp.CompanyName) as SecondGradeAssociation
 from (
SELECT

		A.AssocId,
		A.Client1,
		C.Fname,
		C.LName,
		C.CompanyName,
		A.AssocRefId,
		R.RefDescription,
		A.Client2

FROM	dbo.Associations A
		inner join dbo.Clients C
			on 
				A.Client1 = C.ClientId 
				
		 inner join	dbo.Reference R
			on 
				A.AssocRefId = R.RefId

				)
				as
				temp
				 inner join  Clients C2  on C2.ClientId=temp.Client2


WITH CHECK OPTION
GO
