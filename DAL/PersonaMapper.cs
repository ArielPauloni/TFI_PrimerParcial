using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using BE;

namespace DAL
{
    public class PersonaMapper
    {
        public int Insertar(PersonaBE persona)
        {
            AccesoSQL AccesoSQL = new AccesoSQL();
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(AccesoSQL.CrearParametroStr("Apellido", persona.Apellido));
            parametros.Add(AccesoSQL.CrearParametroStr("Nombre", persona.Nombre));
            parametros.Add(AccesoSQL.CrearParametroInt("TipoDocumento", persona.TipoDocumento.CodigoTipoDocumento));
            parametros.Add(AccesoSQL.CrearParametroStr("NroDocumento", persona.NroDocumento));
            return AccesoSQL.Escribir("pr_Insertar_Persona", parametros);
        }

        public List<PersonaBE> Listar()
        {
            List<PersonaBE> listaPersonas = new List<PersonaBE>();
            AccesoSQL AccesoSQL = new AccesoSQL();
            DataTable tabla = AccesoSQL.Leer("pr_Listar_Personas", null);
            if (tabla != null)
            {
                foreach (DataRow fila in tabla.Rows)
                {
                    TipoDocumentoBE TipoDoc = new TipoDocumentoBE();
                    TipoDoc.CodigoTipoDocumento = int.Parse(fila["CodigoTipoDocumento"].ToString());
                    TipoDoc.DescripcionTipoDocumento = fila["DescripcionTipoDocumento"].ToString();

                    PersonaBE persona = new PersonaBE();
                    persona.CodigoPersona = int.Parse(fila["CodigoPersona"].ToString());
                    persona.Apellido = fila["Apellido"].ToString();
                    persona.Nombre = fila["Nombre"].ToString();
                    persona.NroDocumento = fila["NroDocumento"].ToString();
                    persona.TipoDocumento = TipoDoc;

                    listaPersonas.Add(persona);
                }
            }
            return listaPersonas;
        }
    }
}
