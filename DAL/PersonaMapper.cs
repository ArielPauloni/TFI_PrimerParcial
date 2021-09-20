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
    }
}
