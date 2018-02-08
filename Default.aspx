<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="panel panel-primary" runat="server" id="DivPsscOne">
        <div class="panel-heading">
            <h3 class="panel-title"></h3>
            <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
        </div>
        <div class="panel-body">

            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-2">Code Badge :</div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtnumbadge" runat="server"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnumbadge"
                        ErrorMessage=""><img src="IMG/iconAlert/Alert-icon.png" /></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtnumbadge"
                        ValidationExpression="^[0-9]{4}$" ErrorMessage="" Display="Dynamic">
                        <img src="IMG/iconAlert/Alert-icon.png" />
                    </asp:RegularExpressionValidator>

                </div>
                <div class="col-md-3">
                    <asp:Button ID="btn_badge" runat="server" Text="Suivant"
                        OnClick="btn_badge_Click" CssClass="btn btn-primary"></asp:Button>
                </div>

            </div>



        </div>
    </div>




    <div class="panel panel-primary" runat="server" id="DivPassttow" visible="false">
        <div class="panel-heading">
            <h3 class="panel-title">Votre Conso</h3>
            <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
        </div>
        <div class="panel-body">

            <div class="row">
                <div class="col-md-2">
                    Type Conso : 
                </div>
                <div class="col-md-2">
                    <telerik:RadDropDownList ID="RadDropDownListTypeConso" runat="server"
                        Skin="Metro" DataTextField="LibelleConso"
                        DataValueField="IdTypeConso" AppendDataBoundItems="true">
                        <Items>
                            <telerik:DropDownListItem Text="---  choisir ---" Value=" 0" />
                        </Items>
                    </telerik:RadDropDownList>
                </div>
                <div class="col-md-2">Qt Sucre :</div>
                <div class="col-md-2">
                    <telerik:RadDropDownList ID="RadDropDownListSucre" runat="server"
                        Skin="Metro" DataTextField="QT_Sucre"
                        DataValueField="IdSucre" AppendDataBoundItems="true">
                        <Items>
                            <telerik:DropDownListItem Text="---  choisir ---" Value="0" />
                        </Items>
                    </telerik:RadDropDownList>
                </div>

                <div class="col-md-2">Mug :</div>
                <div class="col-md-2">
                    <telerik:RadDropDownList ID="RadDropDownListMug" runat="server"
                        Skin="Metro" DataTextField="LibelleMag"
                        DataValueField="IdMag" AppendDataBoundItems="true">
                        <Items>
                            <telerik:DropDownListItem Text="---  choisir ---" Value="0" />
                        </Items>
                    </telerik:RadDropDownList>
                </div>
            </div>
            <br />
            <br />
            <center>

                    <asp:Button ID="btnValider" runat="server" Text="Valider" CssClass="btn btn-primary"
                        OnClick="btnValider_Click" />
             </center>
        </div>
    </div>





    <div class="panel panel-primary" runat="server" id="DivHistorique" visible="false">
        <div class="panel-heading">
            <h3 class="panel-title">historique</h3>
            <span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
        </div>
        <div class="panel-body"></div>
        <telerik:RadGrid ID="GridHisto" runat="server" PageSize="10" PagerStyle-ShowPagerText="false"
            Skin="Silk" SelectedItemStyle-Font-Bold="true"
            ShowFooter="True" AllowPaging="True" AutoGenerateColumns="false"
       OnItemCommand="GridHisto_ItemCommand"      Culture="fr-FR">
            <MasterTableView CommandItemDisplay="None" NoMasterRecordsText="Liste Vide"
                DataKeyNames="IdMag,IdSucre,IdTypeConso">
                <Columns>
                    <telerik:GridBoundColumn DataField="LibelleMag" DataType="System.String"
                         HeaderText="Mug" ItemStyle-HorizontalAlign="Center" />

                     <telerik:GridBoundColumn DataField="LibelleConso" DataType="System.String"
                         HeaderText="Conso" ItemStyle-HorizontalAlign="Center" />

                     <telerik:GridBoundColumn DataField="QT_Sucre" DataType="System.Int16"
                         HeaderText="QT Sucre" ItemStyle-HorizontalAlign="Center" />

                      <telerik:GridButtonColumn CommandName="reg" UniqueName="reg" 
                          ImageUrl="../IMG/blacks/16x16/round_plus.png"
                                    ItemStyle-Width="2px" ButtonType="ImageButton"
                           ItemStyle-HorizontalAlign="Center" Text="Réglement">
                                </telerik:GridButtonColumn>
                </Columns>
            </MasterTableView>

        </telerik:RadGrid>
    </div>




</asp:Content>

