using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class PersonaBE
    {
        private string apellido;

        public string Apellido
        {
            get { return apellido; }
            set { apellido = value; }
        }

        private string nombre;

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        private TipoDocumentoBE tipoDocumento;

        public TipoDocumentoBE TipoDocumento
        {
            get { return tipoDocumento; }
            set { tipoDocumento = value; }
        }

        private string nroDocumento;

        public string NroDocumento
        {
            get { return nroDocumento; }
            set { nroDocumento = value; }
        }

        public override string ToString()
        {
            return Apellido + ", " + Nombre + " (" + TipoDocumento.DescripcionTipoDocumento + "-" + NroDocumento + ")";
        }
    }
}
