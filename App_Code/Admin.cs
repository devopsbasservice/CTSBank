using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

/// <summary>
/// Summary description for Admin
/// </summary>
public class Admin
{
    public int Id;
    public string Name;
    public string Email;
    public string Pass;

    public Admin(int Id, string Name, string Email, string Pass)
    {
        // TODO: Complete member initialization
        this.Id = Id;
        this.Name = Name;
        this.Email = Email;
        this.Pass = Pass;
    }

    public static Admin GetAll_DataByEmail(string email)
    {
        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using(SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("SELECT id, name, email, password FROM admin WHERE email='"+ email +"'");
            SqlComm.CommandText = query;
            SqlDataReader reader = SqlComm.ExecuteReader();
            Admin adminDataByEmail = null;

            while(reader.Read())
            {
                int Id = reader.GetInt32(0);
                string Name = reader.GetString(1);
                string Email = reader.GetString(2);
                string Pass = reader.GetString(3);

                adminDataByEmail = new Admin(Id, Name, Email, Pass);
            }
            return adminDataByEmail;
        }
    }

    public static Admin GetAll_DataById(int id)
    {
        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("SELECT id, name, email, password FROM admin WHERE id='" + id + "'");
            SqlComm.CommandText = query;
            SqlDataReader reader = SqlComm.ExecuteReader();
            Admin adminDataByEmail = null;

            while (reader.Read())
            {
                int Id = reader.GetInt32(0);
                string Name = reader.GetString(1);
                string Email = reader.GetString(2);
                string Pass = reader.GetString(3);

                adminDataByEmail = new Admin(Id, Name, Email, Pass);
            }
            return adminDataByEmail;
        }
    }
}