using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class TipoServicioBE
    {
        private int codigoTipoServicio;

        public int CodigoTipoServicio
        {
            get { return codigoTipoServicio; }
            set { codigoTipoServicio = value; }
        }

        private string descripcionTipoServicio;

        public string DescripcionTipoServicio
        {
            get { return descripcionTipoServicio; }
            set { descripcionTipoServicio = value; }
        }

        public override string ToString()
        {
            return DescripcionTipoServicio;
        }
    }
}
