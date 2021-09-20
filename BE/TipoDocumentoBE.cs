using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class TipoDocumentoBE
    {
        private int codigoTipoDocumento;

        public int CodigoTipoDocumento
        {
            get { return codigoTipoDocumento; }
            set { codigoTipoDocumento = value; }
        }

        private string descripcionTipoDocumento;

        public string DescripcionTipoDocumento
        {
            get { return descripcionTipoDocumento; }
            set { descripcionTipoDocumento = value; }
        }
    }
}
