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
    public partial class NuevaLinea : System.Web.UI.Page
    {
        private TipoServicioBLL gestorTipoServicio = new TipoServicioBLL();
        private PaisBLL gestorPais = new PaisBLL();
        private CiudadBLL gestorCiudad = new CiudadBLL();
        private LineaBLL gestorLinea = new LineaBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlTipoServicio.DataSource = gestorTipoServicio.Listar();
                ddlTipoServicio.DataTextField = "DescripcionTipoServicio";
                ddlTipoServicio.DataValueField = "CodigoTipoServicio";
                ddlTipoServicio.DataBind();

                ddlPais.DataSource = gestorPais.Listar();
                ddlPais.DataTextField = "PaisDescripcion";
                ddlPais.DataValueField = "CodigoPais";
                ddlPais.DataBind();

                PaisBE pais = new PaisBE();
                pais.CodigoPais = 11;
                pais.PaisDescripcion = "Argentina";

                ddlPais.SelectedValue = pais.CodigoPais.ToString();

                ddlCiudad.DataSource = gestorCiudad.ListarCiudadesPorPais(pais);
                ddlCiudad.DataTextField = "CiudadDescripcion";
                ddlCiudad.DataValueField = "CodigoCiudad";
                ddlCiudad.DataBind();
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Datos/Lineas.aspx");
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            if ((!string.IsNullOrWhiteSpace(txtNroLinea.Text)) || (ddlCiudad.SelectedIndex > -1))
            {
                TipoServicioBE tipoServ = new TipoServicioBE
                {
                    DescripcionTipoServicio = ddlTipoServicio.SelectedItem.Text.ToString(),
                    CodigoTipoServicio = short.Parse(ddlTipoServicio.SelectedItem.Value)
                };
                PaisBE pais = new PaisBE()
                {
                    PaisDescripcion = ddlPais.SelectedItem.Text.ToString(),
                    CodigoPais = int.Parse(ddlPais.SelectedItem.Value)
                };
                CiudadBE ciudad = new CiudadBE()
                {
                    CiudadDescripcion = ddlCiudad.SelectedItem.Text.ToString(),
                    CodigoCiudad = int.Parse(ddlCiudad.SelectedItem.Value),
                    Pais = pais
                };
                LineaBE linea = new LineaBE
                {
                    NroLinea = txtNroLinea.Text.Trim(),
                    TipoServicio = tipoServ,
                    Ciudad = ciudad
                };
                if (gestorLinea.Insertar(linea) > 0)
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
            else
            {
                UC_MensajeModal.SetearMensaje("Falta completar algún dato");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "mostrarMensaje()", true);
            }
        }

        private void LimpiarDatos()
        {
            txtNroLinea.Text = string.Empty;
            PaisBE pais = new PaisBE();
            pais.CodigoPais = 11;
            pais.PaisDescripcion = "Argentina";

            ddlPais.SelectedValue = pais.CodigoPais.ToString();
        }

        protected void ddlPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            PaisBE pais = new PaisBE()
            {
                PaisDescripcion = ddlPais.SelectedItem.Text.ToString(),
                CodigoPais = int.Parse(ddlPais.SelectedItem.Value)
            };

            ddlCiudad.DataSource = gestorCiudad.ListarCiudadesPorPais(pais);
            ddlCiudad.DataTextField = "CiudadDescripcion";
            ddlCiudad.DataValueField = "CodigoCiudad";
            ddlCiudad.DataBind();
        }
    }
}