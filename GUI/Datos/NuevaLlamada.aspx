<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevaLlamada.aspx.cs" Inherits="GUI.Datos.NuevaLlamada" MasterPageFile="~/Site.Master"%>

<%@ Register Src="~/User_Controls/UC_MensajeModal.ascx" TagPrefix="uc1" TagName="UC_MensajeModal" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="container">
        <div class="form-row">
            <div class="form-group col-md-6">
                <asp:Label ID="lblAbonado" runat="server" Text="Abonado:"></asp:Label>
                <asp:DropDownList ID="ddlAbonados" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAbonados_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="form-group col-md-6">
                <asp:Label ID="lblTipoServicio" runat="server" Text="Linea Destino:"></asp:Label>
                <asp:DropDownList ID="ddlLineaDestino" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <asp:Label ID="lblFecha" runat="server" Text="Fecha de llamada:"></asp:Label>
                <asp:TextBox ID="txtFechaLlamada" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
                <asp:Label ID="lblDuracionLlamada" runat="server" Text="Duración (En minutos) de la llamada:"></asp:Label>
                <asp:TextBox ID="txtMinutosDuracion" runat="server" CssClass="form-control"  TextMode="Number"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <asp:Button ID="btnGrabar" CssClass="btn btn-primary " runat="server" Text="Grabar" OnClick="btnGrabar_Click" />
            <asp:Button ID="btnCancelar" CssClass="btn btn-secondary" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
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