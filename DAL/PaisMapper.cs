using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace DAL
{
    public class PaisMapper
    {
        public List<PaisBE> ListarPaises()
        {
            List<PaisBE> listaPaises = new List<PaisBE>();
            AccesoSQL AccesoSQL = new AccesoSQL();
            DataTable tabla = AccesoSQL.Leer("pr_Listar_Paises", null);
            if (tabla != null)
            {
                foreach (DataRow fila in tabla.Rows)
                {
                    PaisBE pais = new PaisBE();
                    pais.CodigoPais = int.Parse(fila["CodigoPais"].ToString());
                    pais.PaisDescripcion = fila["DescripcionPais"].ToString();
                    pais.PrefijoPais = fila["PrefijoPais"].ToString();
                    listaPaises.Add(pais);
                }
            }
            return listaPaises;
        }
    }
}
