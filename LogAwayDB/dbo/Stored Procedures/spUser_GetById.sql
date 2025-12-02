CREATE PROCEDURE [dbo].[spUser_GetById]
	@Id int
AS
begin

	set nocount on;

	select [Id], [FirstName], [LastName], [StartDate]
	from dbo.[User]
	where Id = @Id

end	
