CREATE PROCEDURE [dbo].[spUser_Insert]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@StartDate datetime2(7),
	@Id int output

AS
begin

	set nocount on;

	insert into dbo.[User](FirstName, LastName, StartDate)
	values (@FirstName, @LastName, @StartDate);
	
	set @Id = SCOPE_IDENTITY();

end
