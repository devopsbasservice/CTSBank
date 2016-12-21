using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for General
/// </summary>
public class General
{
	public General()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public string GenerateCode()
    {
        string CodeLength = "10";
        string NewCode = "";
        string AllowedChars = "1,2,3,4,5,6,7,8,9,0";
        char[] sep = { ',' };
        string[] arr = AllowedChars.Split(sep);

        string CodeString = "";
        string temp = "";
        Random rand = new Random();
        for (int i = 0; i < Convert.ToInt32(CodeLength); i++)
        {
            temp = arr[rand.Next(0, arr.Length)];
            CodeString += temp;
            NewCode = CodeString;
        }
        return NewCode;
    }
}