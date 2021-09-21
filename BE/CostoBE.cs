using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class CostoBE
    {
        private int codigoCosto;

        public int CodigoCosto
        {
            get { return codigoCosto; }
            set { codigoCosto = value; }
        }

        private TipoServicioBE servicioOrigen;

        public TipoServicioBE ServicioOrigen
        {
            get { return servicioOrigen; }
            set { servicioOrigen = value; }
        }

        private TipoServicioBE servicioDestino;

        public TipoServicioBE ServicioDestino
        {
            get { return servicioDestino; }
            set { servicioDestino = value; }
        }

        private Boolean mismaEmpresa;

        public Boolean MismaEmpresa
        {
            get { return mismaEmpresa; }
            set { mismaEmpresa = value; }
        }

        private Boolean esNacional;

        public Boolean EsNacional
        {
            get { return esNacional; }
            set { esNacional = value; }
        }

        private Boolean incluyeRoaming;

        public Boolean IncluyeRoaming
        {
            get { return incluyeRoaming; }
            set { incluyeRoaming = value; }
        }

        private double costo;

        public double Costo
        {
            get { return costo; }
            set { costo = value; }
        }

    }
}
