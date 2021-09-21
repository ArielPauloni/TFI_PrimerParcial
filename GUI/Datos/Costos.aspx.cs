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
    public partial class Costos : System.Web.UI.Page
    {
        private CostoBLL gestorCostos = new CostoBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grvCostos.DataSource = gestorCostos.Listar();
                grvCostos.DataBind();
            }
        }

        protected void grvCostos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvCostos.PageIndex = e.NewPageIndex;
            grvCostos.EditIndex = -1;
            grvCostos.DataSource = gestorCostos.Listar();
            grvCostos.DataBind();
        }

        protected void grvCostos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Setea EditIndex a -1: Cancela modo edición 
            grvCostos.EditIndex = -1;
            grvCostos.DataSource = gestorCostos.Listar();
            grvCostos.DataBind();
        }

        protected void grvCostos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //NewEditIndex se usa para determinar el índice a editar
            grvCostos.EditIndex = e.NewEditIndex;
            grvCostos.DataSource = gestorCostos.Listar();
            grvCostos.DataBind();
        }

        protected void grvCostos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Busco los controles de la grilla para la fila que voy a actualizar
            Label id = grvCostos.Rows[e.RowIndex].FindControl("lbl_CodigoCosto") as Label;
            TextBox txtNuevoCosto = grvCostos.Rows[e.RowIndex].FindControl("txt_Costo") as TextBox;

            if (!string.IsNullOrWhiteSpace(txtNuevoCosto.Text))
            {
                if (double.TryParse(txtNuevoCosto.Text, out double d))
                {
                    CostoBE costo = new CostoBE
                    {
                        CodigoCosto = int.Parse(id.Text),
                        Costo = double.Parse(txtNuevoCosto.Text)
                    };
                    int i = gestorCostos.Actualizar(costo);
                    if (i == 0)
                    {
                        UC_MensajeModal.SetearMensaje("No se pudo actualizar el dato");
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
                    }
                    else
                    {
                        UC_MensajeModal.SetearMensaje("Datos Salvados correctamente");
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
                    }
                }
                else
                {
                    UC_MensajeModal.SetearMensaje("No se pudo grabar. Formato de dato invpalido");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
                }
            }
            else
            {
                UC_MensajeModal.SetearMensaje("No se pudo grabar. Debe completar el dato");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
            }

            grvCostos.EditIndex = -1;
            grvCostos.DataSource = gestorCostos.Listar();
            grvCostos.DataBind();
        }

        protected void grvCostos_RowDataBound(object sender, GridViewRowEventArgs e)
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
            }
        }
    }
}