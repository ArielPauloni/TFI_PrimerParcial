<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lineas.aspx.cs" Inherits="GUI.Datos.Lineas" MasterPageFile="~/Site.Master" %>

<%@ Register Src="~/User_Controls/UC_MensajeModal.ascx" TagPrefix="uc1" TagName="UC_MensajeModal" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div class="form-group col-md-12">
        <asp:GridView ID="grvLinea" runat="server" AllowSorting="True" Caption="Lineas"
            AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="NroLinea" PageSize="10" EnableTheming="True"
            OnPageIndexChanging="grvLinea_PageIndexChanging" OnRowCancelingEdit="grvLinea_RowCancelingEdit"
            OnRowEditing="grvLinea_RowEditing" OnRowUpdating="grvLinea_RowUpdating" OnRowDataBound="grvLinea_RowDataBound">
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
                <asp:TemplateField HeaderText="CodPais">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Pais" runat="server" Text='<%#Eval("Ciudad.Pais.CodigoPais") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CodLinea">
                    <ItemTemplate>
                        <asp:Label ID="lbl_CodLinea" runat="server" Text='<%#Eval("CodigoLinea") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="lbl_NroLinea" runat="server" Text='<%#Eval("NroLinea") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_NroLinea" runat="server" Text='<%#Eval("NroLinea") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TipoServicio">
                    <ItemTemplate>
                        <asp:Label ID="lbl_TipoServicio" runat="server" Text='<%#Eval("TipoServicio") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddl_TipoServicio" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ciudad">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Ciudad" runat="server" Text='<%#Eval("Ciudad") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddl_Ciudades" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <div class="form-group col-md-12">
        <br />
        <asp:Button ID="btnCrearNuevaLinea" CssClass="btn btn-primary" runat="server" Text="Crear Nueva Linea" OnClick="btnCrearNuevaLinea_Click" />
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
