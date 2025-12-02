CREATE PROCEDURE [dbo].[spUser_Update]
	@Id int,
	@FirstName nvarchar(50),
	@LastName nvarchar(50)

AS
begin

	set nocount on;

	update dbo.[User]
	set FirstName = @FirstName, LastName = @LastName
	where Id = @Id;

end
