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
    public partial class NuevoAbonado : System.Web.UI.Page
    {
        private PersonaBLL gestorPersona = new PersonaBLL();
        private LineaBLL gestorLinea = new LineaBLL();
        private AbonadoBLL gestorAbonado = new AbonadoBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<PersonaBE> personas = gestorPersona.Listar();
                var personaQuery = personas.Select(p => new { CodigoPersona = p.CodigoPersona, DisplayText = p.ToString() });

                ddlPesonas.DataSource = personaQuery;
                ddlPesonas.DataValueField = "CodigoPersona";
                ddlPesonas.DataTextField = "DisplayText";
                ddlPesonas.DataBind();

                List<LineaBE> lineas = gestorLinea.ListarSinTitular();
                var lineaQuery = lineas.Select(p => new { CodigoLinea = p.CodigoLinea, DisplayText = p.ToString() });

                ddlLineas.DataSource = lineaQuery;
                ddlLineas.DataValueField = "CodigoLinea";
                ddlLineas.DataTextField = "DisplayText";
                ddlLineas.DataBind();
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Datos/Abonados.aspx");
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            PersonaBE persona = new PersonaBE
            {
                CodigoPersona = short.Parse(ddlPesonas.SelectedItem.Value)
            };
            LineaBE linea = new LineaBE()
            {
                CodigoLinea = int.Parse(ddlLineas.SelectedItem.Value)
            };
            AbonadoBE abonado = new AbonadoBE();
            abonado.Persona = persona;
            abonado.Linea = linea;
            if (gestorAbonado.Insertar(abonado) > 0)
            {
                UC_MensajeModal.SetearMensaje("Datos Salvados correctamente");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
            }
            else
            {
                UC_MensajeModal.SetearMensaje("No se pudieron grabar correctamente los datos");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
            }
            LimpiarDatos();
        }

        private void LimpiarDatos()
        {
            List<LineaBE> lineas = gestorLinea.ListarSinTitular();
            var lineaQuery = lineas.Select(p => new { CodigoLinea = p.CodigoLinea, DisplayText = p.ToString() });

            ddlLineas.DataSource = lineaQuery;
            ddlLineas.DataValueField = "CodigoLinea";
            ddlLineas.DataTextField = "DisplayText";
            ddlLineas.DataBind();
        }
    }
}