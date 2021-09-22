using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BE;
using BLL;

namespace GUI.Datos
{
    public partial class Abonados : System.Web.UI.Page
    {
        private AbonadoBLL gestorAbonados = new AbonadoBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grvAbonados.DataSource = gestorAbonados.Listar();
                grvAbonados.DataBind();
            }
        }

        protected void btnNuevaPersona_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Datos/Personas.aspx");
        }

        protected void btnNuevoAbonado_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Datos/NuevoAbonado.aspx");
        }

        protected void grvAbonados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvAbonados.PageIndex = e.NewPageIndex;
            grvAbonados.EditIndex = -1;
            grvAbonados.DataSource = gestorAbonados.Listar();
            grvAbonados.DataBind();
        }
    }
}