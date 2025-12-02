using Dapper;
using DataLibrary.Db;
using DataLibrary.Models;
using System.Data;

namespace DataLibrary.Data
{
    public class UserData
    {
        private readonly IDataAccess _dataAccess;
        private readonly ConnectionStringData _connectionString;

        public UserData(IDataAccess dataAccess, ConnectionStringData connectionString)
        {
            _dataAccess = dataAccess;
            _connectionString = connectionString;
        }

        public async Task<int> CreateUser(UserModel user)
        {
            DynamicParameters p = new DynamicParameters();

            p.Add("FirstName", user.FirstName);
            p.Add("LastName", user.LastName);
            p.Add("StartDate", user.StartDate);
            p.Add("Id", DbType.Int32, direction: ParameterDirection.Output);

            await _dataAccess.SaveData("dbo.spUser_Insert",
                                       p,
                                       _connectionString.SqlConnectionName);

            return p.Get<int>("Id");
        }

        public Task<int> UpdateUser(UserModel user)
        {
            return _dataAccess.SaveData("dbo.spUser_Update",
                                        new { Id = user.Id, FirstName = user.FirstName, LastName = user.LastName },
                                        _connectionString.SqlConnectionName);
        }

        public Task<int> DeleteUser(int userId)
        {
            return _dataAccess.SaveData("dbo.spUser_Delete",
                                        new { Id = userId },
                                        _connectionString.SqlConnectionName);
        }

        public async Task<UserModel> GetUserById(int userId)
        {
            var recs = await _dataAccess.LoadData<UserModel, dynamic>("spUserGetById",
                                                                      new { Id = userId },
                                                                      _connectionString.SqlConnectionName);

            return recs.FirstOrDefault();
        }
    }
}

