import com.opensymphony.xwork2.ActionSupport;


public class Principal extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String username;
	
	private String contrase�a;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getContrase�a() {
		return contrase�a;
	}

	public void setContrase�a(String contrase�a) {
		this.contrase�a = contrase�a;
	}
	public String execute() {  
	 
		if (this.username.equals("Adriana")) return "error";
	    return SUCCESS;  
	}  
		
}
