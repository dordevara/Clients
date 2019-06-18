# Clients

Bank Corp Ltd  Wealth Management and Investment Services

Project Requirements:
A customer can have many accounts and an account can be secured by many securities. A customer can be associated to another customer in the bank e.g. a Property Development company may be associated with a Surveying company. 
Associations can be two-way. For example -  Company A is the Surveyor of Company B  and Company B has Surveyor Company A.
A customer cannot be associated to another customer more than once under the same Association Type.

Key Entities List given:
1.	Customers 
2.	Accounts 
3.	Securities 
4.	Associations 

Data Updates Requirement: 
1.	Bank Corp needs the ability to create a new Customer and Association (from the newly created customer to another customer) via a parameterised Stored Procedure. 
2.	They want the ability to delete a customer and foreign key records associated with this Customer via a parameterised Stored Procedure. 

Reference Data Requirement: 
Accounts, Securities and Associations can be of several types. They do not want many tables to store each of these types. They want you to come up with a generic way to store all reference data in the database. 

Management Information Reporting:
A single view on all their clients and the touch points between them – an SQL View which will return the association details between all clients (both sides of the relationship! 

Deleted Reference Data View 
The company also want visibility of what Reference Data has been deleted. They want to be able to query a SQL View which shows all reference data which has been deleted. 
