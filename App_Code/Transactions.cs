using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Transactions
/// </summary>
public class Transactions
{
    public int Tr_Id;
    public int Tr_CustId;
    public string Tr_Nartn;
    public string Tr_ChqRefNo;
    public string Tr_WithdAmt;
    public string Tr_DpoAmt;
    public decimal Tr_Blnc;
    public DateTime Tr_Data;

	public Transactions()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public Transactions(int Tr_Id, int Tr_CustId, string Tr_Nartn, string Tr_ChqRefNo, string Tr_WithdAmt, string Tr_DpoAmt, decimal Tr_Blnc, DateTime Tr_Data)
    {
        // TODO: Complete member initialization
        this.Tr_Id = Tr_Id;
        this.Tr_CustId = Tr_CustId;
        this.Tr_Nartn = Tr_Nartn;
        this.Tr_ChqRefNo = Tr_ChqRefNo;
        this.Tr_WithdAmt = Tr_WithdAmt;
        this.Tr_DpoAmt = Tr_DpoAmt;
        this.Tr_Blnc = Tr_Blnc;
        this.Tr_Data = Tr_Data;
    }

    public static ArrayList GetAllTrns_ByCustId(int CustId)
    {
        ArrayList TransList = new ArrayList();

        Connection con = new Connection();
        string strConnString = con.GetConnString();
        using (SqlConnection SqlCon = new SqlConnection(strConnString))
        {
            SqlCommand SqlComm = new SqlCommand("", SqlCon);
            SqlCon.Open();

            string query = string.Format("SELECT * FROM transactions WHERE t_cid='" + CustId + "' ORDER BY t_id DESC");
            SqlComm.CommandText = query;
            SqlDataReader reader = SqlComm.ExecuteReader();
            Transactions trns = null;

            while (reader.Read())
            {
                int Tr_Id = reader.GetInt32(0);
                int Tr_CustId = reader.GetInt32(1);
                string Tr_Nartn = reader.GetString(2);
                string Tr_ChqRefNo = reader.GetString(3);
                string Tr_WithdAmt = reader.IsDBNull(4) ? null : reader.GetString(4);
                string Tr_DpoAmt = reader.IsDBNull(5) ? null : reader.GetString(5);
                decimal Tr_Blnc = reader.GetDecimal(6);
                DateTime Tr_Data = reader.GetDateTime(7);

                trns = new Transactions(Tr_Id, Tr_CustId, Tr_Nartn, Tr_ChqRefNo, Tr_WithdAmt, Tr_DpoAmt, Tr_Blnc, Tr_Data);
                TransList.Add(trns);
            }
            return TransList;
        }
    }
}