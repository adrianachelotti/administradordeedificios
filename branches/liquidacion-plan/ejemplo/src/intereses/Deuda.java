package intereses;

import java.util.Date;

public interface Deuda {

	/**
	 * @return Monto de la deuda.
	 */
	double getMonto();

	/**
	 * @return Tasa de interes por a�o.
	 */
	double getTasa();

	Date getFecha();

}
