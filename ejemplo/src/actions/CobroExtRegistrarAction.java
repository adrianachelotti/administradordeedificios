package actions;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import permisos.AdministradorDePermisos;
import utilidades.HibernateUtil;

import com.opensymphony.xwork2.ActionSupport;

import expensas.appl.ExpensaAppl;
import expensas.appl.ExpensasCobroAppl;
import expensas.dto.ExpensaCobroDTO;
import expensas.dto.ExpensaDTO;
import gastos.exception.GastoExistenteException;

@SuppressWarnings("serial")
public class CobroExtRegistrarAction extends ActionSupport  {
	
	private int id;
	private Date fecha;
	private String comprobante;
	private int expensa_id;
	private boolean consolidado;
	private int responsablecobro_id;
	private int idPropiedad;
	private double montoPago;
	private int idEdificio;
	
	public void setIdPropiedad(int idPropiedad) {
		this.idPropiedad = idPropiedad;
	}
	
	public int getIdPropiedad() {
		return this.idPropiedad;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setComprobante(String comprobante) {
		this.comprobante = comprobante;
	}
	public String getComprobante() {
		return comprobante;
	}
	public void setExpensa_id(int expensa_id) {
		this.expensa_id = expensa_id;
	}
	public int getExpensa_id() {
		return expensa_id;
	}
	public void setConsolidado(boolean consolidado) {
		this.consolidado = consolidado;
	}
	public boolean isConsolidado() {
		return consolidado;
	}
	public void setResponsablecobro_id(int responsablecobro_id) {
		this.responsablecobro_id = responsablecobro_id;
	}
	public int getResponsablecobro_id() {
		return responsablecobro_id;
	}
	
	private boolean existenciaCobro(int expId) {
		Session session = HibernateUtil.getSession();
		ExpensasCobroAppl expAppl = new ExpensasCobroAppl(session);
		List<ExpensaCobroDTO> cobros = expAppl.getCobroPorIdExpensas(expId);
		if (cobros.isEmpty()) {
			return false;
		}
		return true;
	}
	
	public String mostrarFormulario() {
		ExpensaAppl expAppl = new ExpensaAppl(); 
		SessionFactory factory = HibernateUtil.getSessionFactory();	
		List<ExpensaDTO> expensas = expAppl.getExpensaExtActivaPorIdProp(factory, this.idPropiedad );
		if (expensas.isEmpty()) {
			addActionError("No se encontro ninguna expensa para cobrar");
			return "error";
		}
		ExpensaDTO exp = expensas.get(0);
		if (existenciaCobro(exp.getId()) || exp.getMonto() == 0) {
			addActionError("Ya existe un cobro para esa expensa o su monto es 0");
			return "error";
		}
		return "mostrar";
	}
	
	public String execute() {
		ExpensaAppl expAppl = new ExpensaAppl();
		SessionFactory factory = HibernateUtil.getSessionFactory();	
		List<ExpensaDTO> expensas = expAppl.getExpensaExtActivaPorIdProp(factory, this.idPropiedad );
		if (expensas.isEmpty()) {
			return "error";
		}
		
		//tomo el primero que es el activo
		ExpensaDTO exp = expensas.get(0);
		if (existenciaCobro(exp.getId())) {
			return "error";
		}
		ExpensaCobroDTO cobro = new ExpensaCobroDTO();
		cobro.setLiquidacion(exp);
		cobro.setComprobante(comprobante);
		cobro.setConsolidado(false);
		cobro.setFecha(fecha);
		cobro.setMontoPago(montoPago);
		cobro.setResponsableCobro(AdministradorDePermisos.getInstancia().getUsuario());
		
		ExpensasCobroAppl cobroAppl = new ExpensasCobroAppl();
		try {
			cobroAppl.addCobroExpensas(cobro);
		} catch (GastoExistenteException e) {
			System.out.println(e);
			addActionError("Erro al cargar la expensa");
			return "error";
		}
		return SUCCESS;
	}

	public void setMontoPago(double montoPago) {
		this.montoPago = montoPago;
	}

	public double getMontoPago() {
		return montoPago;
	}

	public void setIdEdificio(int idEdificio) {
		this.idEdificio = idEdificio;
	}

	public int getIdEdificio() {
		return idEdificio;
	}

}
