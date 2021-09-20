using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class PaisBE
    {
        private int codigoPais;

        public int CodigoPais
        {
            get { return codigoPais; }
            set { codigoPais = value; }
        }

        private string paisDescripcion;

        public string PaisDescripcion
        {
            get { return paisDescripcion; }
            set { paisDescripcion = value; }
        }

        private string prefijoPais;

        public string PrefijoPais
        {
            get { return prefijoPais; }
            set { prefijoPais = value; }
        }
    }
}
