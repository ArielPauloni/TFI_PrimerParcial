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
    public partial class Llamadas : System.Web.UI.Page
    {
        private AbonadoBLL gestorAbonados = new AbonadoBLL();
        private LlamadaBLL gestorLlamadas = new LlamadaBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<AbonadoBE> abonados = gestorAbonados.Listar();
                var abonadoQuery = abonados.Select(a => new { NroAbonado = a.NroAbonado, DisplayText = a.ToString() });

                ddlAbonados.DataSource = abonadoQuery;
                ddlAbonados.DataValueField = "NroAbonado";
                ddlAbonados.DataTextField = "DisplayText";
                ddlAbonados.DataBind();
                ddlAbonados.Items.Insert(0, "Seleccione Abonado");

                grvLlamadas.DataSource = gestorLlamadas.Listar();
                grvLlamadas.DataBind();
            }
        }

        protected void btnNuevaLlamada_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Datos/NuevaLlamada.aspx");
        }

        #region Filtros
        protected void btnMostrarFiltros_Click(object sender, EventArgs e)
        {
            if (divFiltros.Visible)
            {
                btnMostrarFiltros.Attributes.Add("title", "Mostrar Filtros");
                divFiltros.Visible = false;
                LimpiarFiltros();
            }
            else
            {
                btnMostrarFiltros.Attributes.Add("title", "Ocultar Filtros");
                divFiltros.Visible = true;
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            grvLlamadas.PageIndex = 0;
            grvLlamadas.EditIndex = -1;
            DateTime? fDesde = default(DateTime?);
            DateTime? fHasta = default(DateTime?);
            if (!string.IsNullOrWhiteSpace(txtFechaDesde.Text)) { fDesde = DateTime.ParseExact(txtFechaDesde.Text, "yyyy-MM-dd", null); }
            if (!string.IsNullOrWhiteSpace(txtFechaHasta.Text)) { fHasta = DateTime.ParseExact(txtFechaHasta.Text, "yyyy-MM-dd", null); }

            AbonadoBE abonado = new AbonadoBE();
            if (ddlAbonados.SelectedIndex > 0) { abonado.NroAbonado = short.Parse(ddlAbonados.SelectedItem.Value); }
            else { abonado.NroAbonado = 0; }
            grvLlamadas.DataSource = gestorLlamadas.ListarPorAbonadoMasFecha(abonado, fDesde, fHasta);
            grvLlamadas.DataBind();
        }

        protected void btnLimpiarFiltros_Click(object sender, EventArgs e)
        {
            LimpiarFiltros();
        }

        private void LimpiarFiltros()
        {
            grvLlamadas.PageIndex = 0;
            grvLlamadas.EditIndex = -1;
            txtFechaDesde.Text = string.Empty;
            txtFechaHasta.Text = string.Empty;
            ddlAbonados.SelectedIndex = 0;
            grvLlamadas.DataSource = gestorLlamadas.Listar();
            grvLlamadas.DataBind();
        }
        #endregion

        protected void grvLlamadas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvLlamadas.PageIndex = e.NewPageIndex;
            grvLlamadas.EditIndex = -1;
            grvLlamadas.DataSource = gestorLlamadas.Listar();
            grvLlamadas.DataBind();
        }
    }
}