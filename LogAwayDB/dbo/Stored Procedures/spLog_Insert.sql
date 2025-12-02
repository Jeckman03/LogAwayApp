CREATE PROCEDURE [dbo].[spLog_Insert]
	@LogDate datetime2(7),
	@LogEntry nvarchar(300),
	@UserId int,
	@Id int output

AS

begin

	set nocount on;

	insert into dbo.[Log](LogDate, LogEntry, UserId)
	values (@LogDate, @LogEntry, @UserId);

	set @Id = SCOPE_IDENTITY();

end
