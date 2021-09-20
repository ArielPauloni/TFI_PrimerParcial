using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class CiudadBE
    {
        private int codigoCiudad;

        public int CodigoCiudad
        {
            get { return codigoCiudad; }
            set { codigoCiudad = value; }
        }

        private string ciudadDescripcion;

        public string CiudadDescripcion
        {
            get { return ciudadDescripcion; }
            set { ciudadDescripcion = value; }
        }

        private PaisBE pais;

        public PaisBE Pais
        {
            get { return pais; }
            set { pais = value; }
        }

        private string prefijoCiudad;

        public string PrefijoCiudad
        {
            get { return prefijoCiudad; }
            set { prefijoCiudad = value; }
        }

        public override string ToString()
        {
            return CiudadDescripcion + " (" + pais.PaisDescripcion + ")";
        }
    }
}
