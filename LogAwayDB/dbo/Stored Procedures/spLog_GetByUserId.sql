CREATE PROCEDURE [dbo].[spLog_GetByUserId]
	@UserId int
AS
begin

	set nocount on;

	select [Id], [LogDate], [LogEntry], [UserId]
	from dbo.[Log]
	where UserId = @UserId;

end
