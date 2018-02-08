using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class _Default : System.Web.UI.Page
{
    DataClassesDataContext dba = new DataClassesDataContext();
    private static string NumBagde;
    private static int? SucreID;
    private static int? MugID;
    private static int? TypeConso;


    private static List<TypeConso> tc = new List<TypeConso>();
    private static List<Sucre> sc = new List<Sucre>();
    private static List<Mag> Mag_ = new List<Mag>();
    private static List<Client> _Client = new List<Client>();



    private static ServiceReference1.WebService1SoapClient Get = new ServiceReference1.WebService1SoapClient();
    private static ServiceReference1.WebService1SoapClient set = new ServiceReference1.WebService1SoapClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tc.Clear();
            sc.Clear();
            Mag_.Clear();
            _Client.Clear();
            tc = dba.TypeConso.ToList();
            sc = dba.Sucre.ToList();
            Mag_ = dba.Mag.ToList();

            RadDropDownListTypeConso.DataSource = tc;
            RadDropDownListTypeConso.DataBind();

            RadDropDownListSucre.DataSource = sc;
            RadDropDownListSucre.DataBind();

            RadDropDownListMug.DataSource = Mag_;
            RadDropDownListMug.DataBind();
        }
    }

    protected void btn_badge_Click(object sender, EventArgs e)
    {
        //try
        //{
            NumBagde = (txtnumbadge.Text.Trim());
            var result = Get.client(NumBagde);
            foreach (var c in result)
            {
                Client clt = new Client
                {
                    IdMag = (Int32)c.IdMag,
                    IdSucre = (Int32)c.IdSucre,
                    IdTypeConso = (Int32)c.IdTypeConso,
                    LibelleConso = (from _result in dba.TypeConso
                                    where _result.IdTypeConso == (Int32)c.IdTypeConso
                                    select _result.LibelleConso).Last(),
                    LibelleMag = (from _result1 in dba.Mag
                                  where _result1.IdMag == (Int32)c.IdMag
                                  select _result1.LibelleMag).ToString(),

                    QT_Sucre = (from _result in dba.Sucre
                                where _result.IdSucre == (Int32)c.IdSucre
                                select _result.QT_Sucre).ToString(),


                };

                _Client.Add(clt);
            }


            GridHisto.DataSource = _Client;
            GridHisto.DataBind();
            DivPsscOne.Visible = false;
            DivPassttow.Visible = true;
            DivHistorique.Visible = true;


        //}
        //catch { }
        // test webapi
    }


    protected void btnValider_Click(object sender, EventArgs e)
    {
        //try
        //{
            SucreID = Convert.ToInt32(RadDropDownListSucre.SelectedValue);
            MugID = Convert.ToInt32(RadDropDownListMug.SelectedValue);
            TypeConso = Convert.ToInt32(RadDropDownListTypeConso.SelectedValue);
             Add((Int32)SucreID, (Int32)MugID,(Int32) TypeConso, NumBagde);
            //if ((!SucreID.Equals(0)) || (!MugID.Equals(0)) || (!TypeConso.Equals(0)))

        //{
        //    // send  webapi

        //    set.AddConso(NumBagde, (Int32)SucreID, (Int32)MugID, (Int32)TypeConso);
        //}
        //}
        //catch (Exception ex) { Response.Write(ex.Message); }
        //finally { Server.Transfer(Request.RawUrl); }

    }

    protected void GridHisto_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "reg")
        {
            #region Consom
            try
            {
                MugID = Convert.ToInt32(((GridDataItem)e.Item).GetDataKeyValue("IdMag"));
                TypeConso = Convert.ToInt32(((GridDataItem)e.Item).GetDataKeyValue("TypeConso"));
                SucreID = Convert.ToInt32(((GridDataItem)e.Item).GetDataKeyValue("SucreID"));
                set.AddConso(NumBagde, (Int16)SucreID, (Int16) MugID, (Int16)TypeConso);
            }
            catch { }


            #endregion
        }
    }

    public bool Add(int _SucreID,int _MugID, int _TypeConso, string _NumBagde)
    {
        if ((!SucreID.Equals(0)) || (!MugID.Equals(0)) || (!TypeConso.Equals(0)))

        {
            // send  webapi

            set.AddConso(_NumBagde, (Int32)_SucreID, (Int32)_MugID, (Int32)_TypeConso);
        }
        return true;
    }
}