<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Abonados.aspx.cs" Inherits="GUI.Datos.Abonados" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="form-group col-md-12">
        <asp:GridView ID="grvAbonados" runat="server" AllowSorting="True" Caption="Abonados"
            AutoGenerateColumns="False" AllowPaging="True" PageSize="10" EnableTheming="True" OnPageIndexChanging="grvAbonados_PageIndexChanging">
            <AlternatingRowStyle BackColor="#CCFFFF" />
            <Columns>
                <asp:BoundField DataField="Persona" HeaderText="Persona">
                    <HeaderStyle CssClass="th" />
                </asp:BoundField>
                <asp:BoundField DataField="Linea" HeaderText="Linea">
                    <HeaderStyle CssClass="th" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>
    <hr />
    <asp:Button ID="btnNuevoAbonado" CssClass="btn btn-primary" runat="server" Text="Nuevo Abonado" OnClick="btnNuevoAbonado_Click" />
    <hr />
    <asp:Button ID="btnNuevaPersona" CssClass="btn btn-primary" runat="server" Text="Nueva Persona" OnClick="btnNuevaPersona_Click" />
    <br />
</asp:Content>
