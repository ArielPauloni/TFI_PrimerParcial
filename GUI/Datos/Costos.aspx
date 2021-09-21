<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Costos.aspx.cs" Inherits="GUI.Datos.Costos" MasterPageFile="~/Site.Master" %>

<%@ Register Src="~/User_Controls/UC_MensajeModal.ascx" TagPrefix="uc1" TagName="UC_MensajeModal" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center;">
        <br />
        <br />
        <asp:Label ID="lblCostos" runat="server" Text="Registro de costos" Font-Bold="true"></asp:Label>
        <br />
        <br />
    </div>
    <div class="form-group col-md-12">
        <asp:GridView ID="grvCostos" runat="server" AllowSorting="True" Caption="Costos"
            AutoGenerateColumns="False" AllowPaging="True" PageSize="20" EnableTheming="True"
            OnPageIndexChanging="grvCostos_PageIndexChanging" OnRowCancelingEdit="grvCostos_RowCancelingEdit"
            OnRowEditing="grvCostos_RowEditing" OnRowUpdating="grvCostos_RowUpdating" OnRowDataBound="grvCostos_RowDataBound">
            <AlternatingRowStyle BackColor="#CCFFFF" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="btn_Edit" class="btn btn-mini" CommandName="Edit"><i class="fa fa-edit" aria-hidden="true"></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton runat="server" ID="btn_Update" class="btn btn-mini" CommandName="Update"><i class="fa fa-check" aria-hidden="true"></i>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" ID="btn_Undo" class="btn btn-mini" CommandName="Cancel"><i class="fa fa-undo" aria-hidden="true"></i>
                        </asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CodigoCosto" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lbl_CodigoCosto" runat="server" Text='<%#Eval("CodigoCosto") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="CodigoCosto" HeaderText="CodigoCosto" Visible="false">
                    <HeaderStyle CssClass="th" />
                </asp:BoundField>--%>
                <asp:BoundField DataField="ServicioOrigen" ReadOnly="true" HeaderText="Servicio Origen">
                    <HeaderStyle CssClass="th" />
                </asp:BoundField>
                <asp:BoundField DataField="ServicioDestino" ReadOnly="true" HeaderText="Servicio Destino">
                    <HeaderStyle CssClass="th" />
                </asp:BoundField>
                <asp:CheckBoxField DataField="MismaEmpresa" ReadOnly="true" HeaderText="¿Es de Misma Empresa?">
                    <HeaderStyle CssClass="th" />
                </asp:CheckBoxField>
                <asp:CheckBoxField DataField="EsNacional" ReadOnly="true" HeaderText="¿Es Nacional?">
                    <HeaderStyle CssClass="th" />
                </asp:CheckBoxField>
                <asp:CheckBoxField DataField="IncluyeRoaming" ReadOnly="true" HeaderText="¿Requiere Roaming?">
                    <HeaderStyle CssClass="th" />
                </asp:CheckBoxField>
                <asp:TemplateField HeaderText="Costo">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Costo" runat="server" Text='<%#Eval("Costo") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Costo" runat="server" Text='<%#Eval("Costo") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="Costo" HeaderText="Costo">
                    <HeaderStyle CssClass="th" />
                </asp:BoundField>--%>
            </Columns>
        </asp:GridView>
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
