<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Llamadas.aspx.cs" Inherits="GUI.Datos.Llamadas" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="form-group col-md-12">
        <button runat="server" id="btnMostrarFiltros" class="btn btn-primary fa fa-filter" onserverclick="btnMostrarFiltros_Click">
            Filtros
        </button>
    </div>
    <div id="divFiltros" runat="server" class="form-group col-md-12 bg-info" visible="false">
        <div class="form-group col-md-3">
            <asp:Label ID="lblAbonado" runat="server" Text="Abonado: "></asp:Label>
            <asp:DropDownList ID="ddlAbonados" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group col-md-3">
            <asp:Label ID="lblFechaDesde" runat="server" Text="Fecha Desde: "></asp:Label>
            <asp:TextBox ID="txtFechaDesde" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>
        <div class="form-group col-md-3">
            <asp:Label ID="lblFechaHasta" runat="server" Text="Fecha Hasta: "></asp:Label>
           <asp:TextBox ID="txtFechaHasta" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>
        <div class="form-group col-md-3">
            <br />
            <button id="btnFiltrar" runat="server" class="btn btn-info btn-sm fa fa-filter" title="Filtrar" onserverclick="btnFiltrar_Click"></button>
            <button id="btnLimpiarFiltros" runat="server" class="btn btn-info btn-sm fa fa-undo" title="Limpiar Filtros" onserverclick="btnLimpiarFiltros_Click"></button>
        </div>
    </div>
    <br />
    <div class="form-group col-md-12">
        <asp:GridView ID="grvLlamadas" runat="server" AllowSorting="True" Caption="Llamadas"
            AutoGenerateColumns="False" AllowPaging="True" PageSize="10" EnableTheming="True" OnPageIndexChanging="grvLlamadas_PageIndexChanging">
            <AlternatingRowStyle BackColor="#CCFFFF" />
            <Columns>
                <asp:BoundField DataField="Abonado" HeaderText="Abonado">
                    <HeaderStyle CssClass="th" />
                </asp:BoundField>
                <asp:BoundField DataField="LineaDestino" HeaderText="Línea Destino">
                    <HeaderStyle CssClass="th" />
                </asp:BoundField>
                <asp:BoundField DataField="FechaLlamada" HeaderText="Fecha de Llamada" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}">
                    <HeaderStyle CssClass="th" />
                </asp:BoundField>
                <asp:BoundField DataField="MinutosDuracion" HeaderText="Duración (en minutos)" ItemStyle-HorizontalAlign="Center">
                    <HeaderStyle CssClass="th" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>
    <hr />
    <div class="form-group col-md-12">
        <br />
        <asp:Button ID="btnNuevaLlamada" CssClass="btn btn-primary" runat="server" Text="Nueva llamada" OnClick="btnNuevaLlamada_Click" />
    </div>

    <script>
    $(document).ready(function(){
         $('.datepicker-field').datepicker();        
    });
</script>
</asp:Content>
