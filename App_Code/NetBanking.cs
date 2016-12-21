using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for NetBanking
/// </summary>
public class NetBanking
{
    public int NB_Id;
    public int NBC_Id;
    public DateTime NB_reqData;
    public string NB_status;
    public int NB_Id_2;
    public int NB_Cid;
    public string NB_Pass;
    public DateTime NB_reqDate;
    public string NB_Status;

    public NetBanking(int NB_Id, int NBC_Id, DateTime NB_reqData, string NB_status)
    {
        // TODO: Complete member initialization
        this.NB_Id = NB_Id;
        this.NBC_Id = NBC_Id;
        this.NB_reqData = NB_reqData;
        this.NB_status = NB_status;
    }

    public NetBanking(int NB_Id_2, int NB_Cid, string NB_Pass, DateTime NB_reqDate, string NB_Status)
    {
        // TODO: Complete member initialization
        this.NB_Id_2 = NB_Id_2;
        this.NB_Cid = NB_Cid;
        this.NB_Pass = NB_Pass;
        this.NB_reqDate = NB_reqDate;
        this.NB_Status = NB_Status;
    }
    
    public static ArrayList GetAll_NBReqs()
    {
        ArrayList NBReqsList = new ArrayList();

        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("SELECT * FROM net_banking WHERE nb_status = '0' ORDER BY nb_id DESC");
            SqlComm.CommandText = query;
            SqlDataReader reader = SqlComm.ExecuteReader();

            while (reader.Read())
            {
                int NB_Id = reader.GetInt32(0);
                int NBC_Id = reader.GetInt32(1);
                DateTime NB_reqData = reader.GetDateTime(3);
                string NB_status = reader.GetString(4);

                NetBanking NBReqs = new NetBanking(NB_Id, NBC_Id, NB_reqData, NB_status);
                NBReqsList.Add(NBReqs);
            }
            return NBReqsList;
        }
    }

    public static ArrayList GetFull_NBReqs()
    {
        ArrayList NBFullReqsList = new ArrayList();

        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("SELECT * FROM net_banking ORDER BY nb_id DESC");
            SqlComm.CommandText = query;
            SqlDataReader reader = SqlComm.ExecuteReader();

            while (reader.Read())
            {
                int NB_Id = reader.GetInt32(0);
                int NBC_Id = reader.GetInt32(1);
                DateTime NB_reqData = reader.GetDateTime(3);
                string NB_status = reader.GetString(4);

                NetBanking NBReqs = new NetBanking(NB_Id, NBC_Id, NB_reqData, NB_status);
                NBFullReqsList.Add(NBReqs);
            }
            return NBFullReqsList;
        }
    }

    public static NetBanking NBData_ByCustId(int CustId)
    {
        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("SELECT * FROM net_banking WHERE nb_cid='" + CustId + "'");
            SqlComm.CommandText = query;
            SqlDataReader reader = SqlComm.ExecuteReader();
            NetBanking NBDataByCustId = null;

            while (reader.Read())
            {
                int NB_Id_2 = reader.GetInt32(0);
                int NB_Cid = reader.GetInt32(1);
                string NB_Pass = reader.GetString(2);
                DateTime NB_reqDate = reader.GetDateTime(3);
                string NB_Status = reader.GetString(4);

                NBDataByCustId = new NetBanking(NB_Id_2, NB_Cid, NB_Pass, NB_reqDate, NB_Status);

            }
            return NBDataByCustId;
        }
    }
}