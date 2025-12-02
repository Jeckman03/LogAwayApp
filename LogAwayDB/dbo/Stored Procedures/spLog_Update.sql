CREATE PROCEDURE [dbo].[spLog_Update]
	@Id int,
	@LogDate datetime2(7),
	@LogEntry nvarchar(300)

AS
begin
	
	set nocount on;
	
	update dbo.[Log]
	set LogDate = @LogDate, LogEntry = @LogEntry
	where Id = @Id;

end
