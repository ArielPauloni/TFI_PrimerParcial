﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pto4.aspx.cs" Inherits="GUI.Consultas.Pto4"  MasterPageFile="~/Site.Master" %>

<%@ Register Src="~/User_Controls/UC_MensajeModal.ascx" TagPrefix="uc1" TagName="UC_MensajeModal" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center;">
        <br />
        <br />
        <asp:Label ID="lblPto4" runat="server" Text="Obtener los cargos del mes de un cliente" Font-Bold="true"></asp:Label>
        <br />
        <br />
    </div>
    <div class="container">
        <div class="form-row">
            <div class="form-group col-md-6">
                <asp:Label ID="lblAbonado" runat="server" Text="Abonado:"></asp:Label>
                <asp:DropDownList ID="ddlAbonados" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="form-group col-md-3">
                <asp:Label ID="lblAnio" runat="server" Text="Año:"></asp:Label>
                <asp:DropDownList ID="ddlAnio" CssClass="form-control" runat="server">
                    <asp:ListItem>2020</asp:ListItem>
                    <asp:ListItem>2021</asp:ListItem>
                    <asp:ListItem>2022</asp:ListItem>
                    <asp:ListItem>2023</asp:ListItem>
                    <asp:ListItem>2024</asp:ListItem>
                    <asp:ListItem>2025</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group col-md-3">
                <asp:Label ID="lblMEs" runat="server" Text="Mes:"></asp:Label>
                <asp:DropDownList ID="ddlMes" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
        </div>
        
        <div class="form-group">
            <asp:Button ID="btnBuscar" CssClass="btn btn-primary fa fa-search" runat="server" Text=" Buscar" OnClick="btnBuscarar_Click" />
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