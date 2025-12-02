CREATE PROCEDURE [dbo].[spLog_Delete]
	@Id int

AS
begin

	set nocount on;

	delete 
	from dbo.[Log]
	where Id = @Id;

end
