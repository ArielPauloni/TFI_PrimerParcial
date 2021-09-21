using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class LlamadaBE
    {
        private int codigoLlamada;

        public int CodigoLlamada
        {
            get { return codigoLlamada; }
            set { codigoLlamada = value; }
        }

        private AbonadoBE abonado;

        public AbonadoBE Abonado
        {
            get { return abonado; }
            set { abonado = value; }
        }

        private LineaBE linea;

        public LineaBE Linea
        {
            get { return linea; }
            set { linea = value; }
        }

        private DateTime? fechaLlamada;

        public DateTime? FechaLlamada
        {
            get { return fechaLlamada; }
            set { fechaLlamada = value; }
        }

        private short minutosDuracion;

        public short MinutosDuracion
        {
            get { return minutosDuracion; }
            set { minutosDuracion = value; }
        }
    }
}
