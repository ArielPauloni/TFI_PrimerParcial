using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace DAL
{
    public class TipoDocumentoMapper
    {
        public List<TipoDocumentoBE> ListarTipoDocumentos()
        {
            List<TipoDocumentoBE> listaTipoDocumentos = new List<TipoDocumentoBE>();
            AccesoSQL AccesoSQL = new AccesoSQL();
            DataTable tabla = AccesoSQL.Leer("pr_Listar_TipoDocumento", null);
            if (tabla != null)
            {
                foreach (DataRow fila in tabla.Rows)
                {
                    TipoDocumentoBE tipoDocumento = new TipoDocumentoBE();
                    tipoDocumento.CodigoTipoDocumento = int.Parse(fila["CodigoTipoDocumento"].ToString());
                    tipoDocumento.DescripcionTipoDocumento = fila["DescripcionTipoDocumento"].ToString();
                    listaTipoDocumentos.Add(tipoDocumento);
                }
            }
            return listaTipoDocumentos;
        }
    }
}
