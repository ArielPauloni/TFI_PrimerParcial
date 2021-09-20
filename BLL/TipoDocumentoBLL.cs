using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using BE;

namespace BLL
{
    public class TipoDocumentoBLL
    {
        public List<TipoDocumentoBE> Listar()
        {
            TipoDocumentoMapper m = new TipoDocumentoMapper();
            return m.ListarTipoDocumentos();
        }
    }
}
