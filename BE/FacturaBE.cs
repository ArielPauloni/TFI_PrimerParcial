using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class FacturaBE
    {
        private int codigoFactura;

        public int CodigoFactura
        {
            get { return codigoFactura; }
            set { codigoFactura = value; }
        }

        private AbonadoBE abonado;

        public AbonadoBE Abonado
        {
            get { return abonado; }
            set { abonado = value; }
        }

        private DateTime? fechaFactura;

        public DateTime? FechaFactura
        {
            get { return fechaFactura; }
            set { fechaFactura = value; }
        }

        private double costoMantenimiento;

        public double CostoMantenimiento
        {
            get { return costoMantenimiento; }
            set { costoMantenimiento = value; }
        }

        private List<LlamadaBE> llamadas;

        public List<LlamadaBE> Llamadas
        {
            get { return llamadas; }
            set { llamadas = value; }
        }

        private double costoTotal;

        public double CostoTotal
        {
            get { return costoTotal; }
            set { costoTotal = value; }
        }
    }
}
