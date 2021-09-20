using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BE;

namespace GUI.Datos
{
    public partial class Lineas : System.Web.UI.Page
    {
        private LineaBLL gestorLinea = new LineaBLL();
        private TipoServicioBLL gestorTipoServicio = new TipoServicioBLL();
        private CiudadBLL gestorCiudad = new CiudadBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EnlazarGrillaLinea();
            }
        }

        private void EnlazarGrillaLinea()
        {
            grvLinea.DataSource = gestorLinea.Listar();
            grvLinea.DataBind();
            grvLinea.Columns[1].Visible = false;
            grvLinea.Columns[2].Visible = false;
        }

        protected void grvLinea_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvLinea.PageIndex = e.NewPageIndex;
            grvLinea.EditIndex = -1;
            EnlazarGrillaLinea();
        }

        protected void grvLinea_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Setea EditIndex a -1: Cancela modo edición 
            grvLinea.EditIndex = -1;
            EnlazarGrillaLinea();
        }

        protected void grvLinea_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //NewEditIndex se usa para determinar el índice a editar
            grvLinea.EditIndex = e.NewEditIndex;
            EnlazarGrillaLinea();
        }

        protected void grvLinea_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Busco los controles de la grilla para la fila que voy a actualizar
            Label id = grvLinea.Rows[e.RowIndex].FindControl("lbl_CodLinea") as Label;
            TextBox txtNuevoNroLinea = grvLinea.Rows[e.RowIndex].FindControl("txt_NroLinea") as TextBox;
            DropDownList ddlTipoServicio = grvLinea.Rows[e.RowIndex].FindControl("ddl_TipoServicio") as DropDownList;
            DropDownList ddlCiudad = grvLinea.Rows[e.RowIndex].FindControl("ddl_Ciudades") as DropDownList;

            if (!string.IsNullOrWhiteSpace(txtNuevoNroLinea.Text))
            {
                CiudadBE ciudad = new CiudadBE();
                ciudad.CodigoCiudad = int.Parse(ddlCiudad.SelectedValue);
                TipoServicioBE tipoServ = new TipoServicioBE();
                tipoServ.CodigoTipoServicio = int.Parse(ddlTipoServicio.SelectedValue);

                LineaBE linea = new LineaBE();
                linea.CodigoLinea = int.Parse(id.Text);
                linea.NroLinea = txtNuevoNroLinea.Text;
                linea.Ciudad = ciudad;
                linea.TipoServicio = tipoServ;

                int i = gestorLinea.ActualizarLinea(linea);
                if (i == 0)
                {
                    UC_MensajeModal.SetearMensaje("No se pudo actulizar el dato");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
                }
                else
                {
                    UC_MensajeModal.SetearMensaje("Datos Salvados correctamente");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
                }
            }
            grvLinea.EditIndex = -1;
            EnlazarGrillaLinea();
        }

        protected void grvLinea_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton controlEdit = (LinkButton)e.Row.FindControl("btn_Edit");
                if (controlEdit != null) { controlEdit.ToolTip = "Editar"; }

                LinkButton controlUpdate = (LinkButton)e.Row.FindControl("btn_Update");
                if (controlUpdate != null)
                { controlUpdate.ToolTip = "Confirmar"; }

                LinkButton controlUndo = (LinkButton)e.Row.FindControl("btn_Undo");
                if (controlUndo != null)
                { controlUndo.ToolTip = "Deshacer"; }

                if ((e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
                {
                    DropDownList ddlCiudad = (e.Row.FindControl("ddl_Ciudades") as DropDownList);
                    PaisBE pais = new PaisBE();
                    pais.CodigoPais = ((LineaBE)e.Row.DataItem).Ciudad.Pais.CodigoPais;
                    ddlCiudad.DataSource = gestorCiudad.ListarCiudadesPorPais(pais);
                    ddlCiudad.DataTextField = "CiudadDescripcion";
                    ddlCiudad.DataValueField = "CodigoCiudad";
                    ddlCiudad.DataBind();
                    ddlCiudad.SelectedValue = ((LineaBE)e.Row.DataItem).Ciudad.CodigoCiudad.ToString();

                    DropDownList ddlTipoServicio = (e.Row.FindControl("ddl_TipoServicio") as DropDownList);
                    ddlTipoServicio.DataSource = gestorTipoServicio.Listar();
                    ddlTipoServicio.DataTextField = "DescripcionTipoServicio";
                    ddlTipoServicio.DataValueField = "CodigoTipoServicio";
                    ddlTipoServicio.DataBind();
                    ddlTipoServicio.SelectedValue = ((LineaBE)e.Row.DataItem).TipoServicio.CodigoTipoServicio.ToString();
                }
            }
        }

        protected void btnCrearNuevaLinea_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Datos/NuevaLinea.aspx");
        }
    }
}