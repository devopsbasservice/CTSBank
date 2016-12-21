using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Connection
/// </summary>
public class Connection
{
    private static SqlConnection con;
    private static SqlCommand com;
    public static string connectionString = ConfigurationManager.ConnectionStrings["BankDBConnectionString"].ToString();

    static Connection()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["BankDBConnectionString"].ToString();
        con = new SqlConnection(connectionString);
        com = new SqlCommand("", con);
    }

    public string GetConnString()
    {
        return connectionString;
    }
}