package usuarios.dto;

import java.io.Serializable;

import javax.persistence.*;

@SuppressWarnings("serial")
@Entity
@Table(name="PERFIL")
public class PerfilDTO implements Serializable{

	public static String ADMINISTRADOR="Administrador";
	public static String RESPONSABLE_GASTOS="Responsable de Gastos";
	public static String RESPONSABLE_COBROS="Responsable de Cobros";
	public static String RESPONSABLE_EDIFICIO="Responsable de Edificio";
	
	private int id;
	private String descripcion;
	
	@Id
	@GeneratedValue
	@Column(name="ID",unique=true,nullable=false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="DESCRIPCION",nullable=false)
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	@Override
	public String toString() {
		return "Perfil: "+ getId() + " - " +getDescripcion();
	}
	

}
