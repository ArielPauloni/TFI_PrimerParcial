using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class LineaBE
    {
        private int codigoLinea;

        public int CodigoLinea
        {
            get { return codigoLinea; }
            set { codigoLinea = value; }
        }

        private string nroLinea;

        public string NroLinea
        {
            get { return nroLinea; }
            set { nroLinea = value; }
        }

        private TipoServicioBE tipoServicio;

        public TipoServicioBE TipoServicio
        {
            get { return tipoServicio; }
            set { tipoServicio = value; }
        }

        private CiudadBE ciudad;

        public CiudadBE Ciudad
        {
            get { return ciudad; }
            set { ciudad = value; }
        }

        private string prefijoLinea;

        public string PrefijoLinea
        {
            get { return prefijoLinea; }
            set { prefijoLinea = value; }
        }

        public override string ToString()
        {
            return PrefijoLinea + "-" + NroLinea;
        }
    }
}
