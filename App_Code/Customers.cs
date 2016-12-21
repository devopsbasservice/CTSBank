using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Customers
/// </summary>
public class Customers
{
    public int Cust_Id;
    public string Cust_Name;
    public string Cust_Gender;
    public string Cust_Mobile;
    public string Cust_status;
    public int Cust_Id_2;
    public string Cust_Name_2;
    public string Cust_Gender_2;
    public string Cust_State;
    public string Cust_City;
    public string Cust_Pin;
    public string Cust_Email;
    public string Cust_Mobile_2;
    public string Cust_NetBank;
    public string Cust_status_2;
    public DateTime Cust_reqDate;
    public int Cust_AcNo;
    public string Cust_AcType;
    public decimal Cust_AcBlnc;
    public DateTime Cust_AcAprvDate;

    public Customers()
    {
        // TODO: Complete member initialization
    }

    public Customers(int Cust_Id, string Cust_Name, string Cust_Gender, string Cust_Mobile, string Cust_status)
    {
        // TODO: Complete member initialization
        this.Cust_Id = Cust_Id;
        this.Cust_Name = Cust_Name;
        this.Cust_Gender = Cust_Gender;
        this.Cust_Mobile = Cust_Mobile;
        this.Cust_status = Cust_status;
    }

    public Customers(int Cust_Id_2, string Cust_Name_2, string Cust_Gender_2, string Cust_State, string Cust_City, string Cust_Pin, string Cust_Email, string Cust_Mobile_2, string Cust_NetBank, string Cust_status_2, DateTime Cust_reqDate, int Cust_AcNo, string Cust_AcType, decimal Cust_AcBlnc, DateTime Cust_AcAprvDate)
    {
        // TODO: Complete member initialization
        this.Cust_Id_2 = Cust_Id_2;
        this.Cust_Name_2 = Cust_Name_2;
        this.Cust_Gender_2 = Cust_Gender_2;
        this.Cust_State = Cust_State;
        this.Cust_City = Cust_City;
        this.Cust_Pin = Cust_Pin;
        this.Cust_Email = Cust_Email;
        this.Cust_Mobile_2 = Cust_Mobile_2;
        this.Cust_NetBank = Cust_NetBank;
        this.Cust_status_2 = Cust_status_2;
        this.Cust_reqDate = Cust_reqDate;
        this.Cust_AcNo = Cust_AcNo;
        this.Cust_AcType = Cust_AcType;
        this.Cust_AcBlnc = Cust_AcBlnc;
        this.Cust_AcAprvDate = Cust_AcAprvDate;
    }
    
    public static ArrayList GetAll_CustByStatus()
    {
        ArrayList CustListByStatus = new ArrayList();

        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("SELECT * FROM cust_details WHERE c_status = '0' ORDER BY c_id DESC");
            SqlComm.CommandText = query;
            SqlDataReader reader = SqlComm.ExecuteReader();

            while (reader.Read())
            {
                int Cust_Id = reader.GetInt32(0);
                string Cust_Name = reader.GetString(1);
                string Cust_Gender = reader.GetString(2);
                string Cust_Mobile = reader.GetString(7);
                string Cust_status = reader.GetString(9);

                Customers AllCustByStatus = new Customers(Cust_Id, Cust_Name, Cust_Gender, Cust_Mobile, Cust_status);
                CustListByStatus.Add(AllCustByStatus);
            }
            return CustListByStatus;
        }
    }

    public static ArrayList GetAll_Cust()
    {
        ArrayList AllCustList = new ArrayList();

        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("SELECT * FROM cust_details ORDER BY c_id DESC");
            SqlComm.CommandText = query;
            SqlDataReader reader = SqlComm.ExecuteReader();

            while (reader.Read())
            {
                int Cust_Id = reader.GetInt32(0);
                string Cust_Name = reader.GetString(1);
                string Cust_Gender = reader.GetString(2);
                string Cust_Mobile = reader.GetString(7);
                string Cust_status = reader.GetString(9);

                Customers AllCustByStatus = new Customers(Cust_Id, Cust_Name, Cust_Gender, Cust_Mobile, Cust_status);
                AllCustList.Add(AllCustByStatus);
            }
            return AllCustList;
        }
    }

    public bool ChckCustById(int CustId)
    {
        bool value;

        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("SELECT COUNT(*) FROM cust_details WHERE c_id='"+ CustId +"'");
            SqlComm.CommandText = query;
            int result = (int)SqlComm.ExecuteScalar();

            if (result != 1)
            {
                value = false;
            }
            else
            {
                value = true;
            }
        }
        return value;
    }

    public bool ChckCustNetBankingById(int CustId)
    {
        bool value;

        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("SELECT COUNT(*) FROM net_banking WHERE nb_cid='" + CustId + "'");
            SqlComm.CommandText = query;
            int result = (int)SqlComm.ExecuteScalar();

            if (result != 1)
            {
                value = false;
            }
            else
            {
                value = true;
            }
        }
        return value;
    }

    public bool ChckCustNBStById(int CustId)
    {
        bool value;

        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("SELECT COUNT(*) FROM net_banking WHERE nb_status=1 AND nb_cid='" + CustId + "'");
            SqlComm.CommandText = query;
            int result = (int)SqlComm.ExecuteScalar();

            if (result != 1)
            {
                value = false;
            }
            else
            {
                value = true;
            }
        }
        return value;
    }

    public static Customers GetCust_DataById(int CustId)
    {
        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("SELECT c_id, c_name, c_gender, c_state, c_city, c_pin, c_email, c_mobNo, c_net_banking, c_status, c_date, ac_no, ac_type, ac_blnc, ac_date FROM cust_details JOIN account ON ac_cid=c_id WHERE c_status=1 AND c_id='" + CustId + "'");
            SqlComm.CommandText = query;
            SqlDataReader reader = SqlComm.ExecuteReader();
            Customers GetCustDataById = null;

            while (reader.Read())
            {
                int Cust_Id_2 = reader.GetInt32(0);
                string Cust_Name_2 = reader.GetString(1);
                string Cust_Gender_2 = reader.GetString(2);
                string Cust_State = reader.GetString(3);
                string Cust_City = reader.GetString(4);
                string Cust_Pin = reader.GetString(5);
                string Cust_Email = reader.GetString(6);
                string Cust_Mobile_2 = reader.GetString(7);
                string Cust_NetBank = reader.GetString(8);
                string Cust_status_2 = reader.GetString(9);
                DateTime Cust_reqDate = reader.GetDateTime(10);
                int Cust_AcNo = reader.GetInt32(11);
                string Cust_AcType = reader.GetString(12);
                decimal Cust_AcBlnc = reader.GetDecimal(13);
                DateTime Cust_AcAprvDate = reader.GetDateTime(14);

                GetCustDataById = new Customers(Cust_Id_2, Cust_Name_2, Cust_Gender_2, Cust_State, Cust_City, Cust_Pin, Cust_Email, Cust_Mobile_2, Cust_NetBank, Cust_status_2, Cust_reqDate, Cust_AcNo, Cust_AcType, Cust_AcBlnc, Cust_AcAprvDate);

            }
            return GetCustDataById;
        }
    }

    public static Customers GetLight_DataById(int CustId)
    {
        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("SELECT * FROM cust_details WHERE c_id='" + CustId + "'");
            SqlComm.CommandText = query;
            SqlDataReader reader = SqlComm.ExecuteReader();
            Customers GetCustLightDataById = null;

            while (reader.Read())
            {
                int Cust_Id = reader.GetInt32(0);
                string Cust_Name = reader.GetString(1);
                string Cust_Gender = reader.GetString(2);
                string Cust_Mobile = reader.GetString(7);
                string Cust_status = reader.GetString(9);

                GetCustLightDataById = new Customers(Cust_Id, Cust_Name, Cust_Gender, Cust_Mobile, Cust_status);
                
            }
            return GetCustLightDataById;
        }
    }
}