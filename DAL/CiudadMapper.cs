using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace DAL
{
    public class CiudadMapper
    {
        public List<CiudadBE> ListarCiudades(PaisBE pais)
        {
            List<CiudadBE> listaCiudades = new List<CiudadBE>();
            AccesoSQL AccesoSQL = new AccesoSQL();
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(AccesoSQL.CrearParametroInt("CodigoPais", pais.CodigoPais));
            DataTable tabla = AccesoSQL.Leer("pr_Listar_CiudadPorPais", parametros);
            if (tabla != null)
            {
                foreach (DataRow fila in tabla.Rows)
                {
                    CiudadBE ciudad = new CiudadBE();
                    ciudad.CodigoCiudad = int.Parse(fila["CodigoCiudad"].ToString());
                    ciudad.CiudadDescripcion = fila["DescripcionCiudad"].ToString();
                    ciudad.PrefijoCiudad = fila["PrefijoCiudad"].ToString();
                    PaisBE paisCiudad = new PaisBE();
                    paisCiudad.CodigoPais = int.Parse(fila["CodigoPais"].ToString());
                    paisCiudad.PaisDescripcion = fila["DescripcionPais"].ToString();
                    paisCiudad.PrefijoPais = fila["PrefijoPais"].ToString();
                    ciudad.Pais = paisCiudad;
                    listaCiudades.Add(ciudad);
                }
            }
            return listaCiudades;
        }
    }
}
