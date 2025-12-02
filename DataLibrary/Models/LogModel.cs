namespace DataLibrary.Models
{
    public class LogModel
    {
        public int Id { get; set; }
        public DateTime LogDate { get; set; }
        public string LogEntry { get; set; }
        public int UserId { get; set; }
    }
}
