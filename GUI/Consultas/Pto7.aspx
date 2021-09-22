<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pto7.aspx.cs" Inherits="GUI.Consultas.Pto7" MasterPageFile="~/Site.Master" %>

<%@ Register Src="~/User_Controls/UC_MensajeModal.ascx" TagPrefix="uc1" TagName="UC_MensajeModal" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center;">
        <br />
        <br />
        <asp:Label ID="lblPto7" runat="server" Text="Obtener porcentaje de llamadas por tipo general y por cliente." Font-Bold="true"></asp:Label>
        <br />
        <br />
    </div>
    <div class="container">
        <div class="form-row">
            <div class="form-group col-md-12">
                <asp:Label ID="lblAbonado" runat="server" Text="Abonado:"></asp:Label>
                <asp:DropDownList ID="ddlAbonados" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <asp:Button ID="btnConsultar" CssClass="btn btn-primary fa fa-search" runat="server" Text=" Consultar Por Abonado" OnClick="btnConsultar_Click" />
        </div>
    </div>
    <div class="container">
        <%--<div class="form-row">
            <div class="form-group col-md-12">
                <asp:Label ID="lblTipoLlamada" runat="server" Text="Tipo llamada:"></asp:Label>
                <asp:DropDownList ID="ddlTipoLlamada" runat="server" CssClass="form-control">
                    <asp:ListItem>Nacional</asp:ListItem>
                    <asp:ListItem>Internacional</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>--%>

        <div class="form-group">
            <asp:Button ID="btnConsultarPorTipo" CssClass="btn btn-primary fa fa-search" runat="server" Text=" Consultar Por Tipo" OnClick="btnConsultar2_Click" />
        </div>
    </div>

    <div class="modal fade" id="MensajeModal" tabindex="-1" role="dialog" aria-labelledby="MensajeModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <asp:UpdatePanel runat="server" ID="UpPanelDialog" UpdateMode="Conditional">
                <ContentTemplate>
                    <uc1:UC_MensajeModal runat="server" ID="UC_MensajeModal" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <script type="text/javascript">
        function mostrarMensaje() {
            $('#MensajeModal').modal({ backdrop: 'static', keyboard: false, toggle: true });
        }
    </script>

</asp:Content>
