
<%@page import="gastos.dto.TipoGastoDTO"%>
<%@page import="edificio.EdificioDTO"%><jsp:include page="/WEB-INF/jspf/header.jspf"></jsp:include>
<%@ page language="java" contentType="text/html" import="java.util.List"%>
<%@ page language="java" contentType="text/html" import="gastos.*"%>
<jsp:useBean id="tiposGastos" scope="session" class="beans.TiposGastosBean"/>
<jsp:useBean id="edificioBean" scope="session" class="beans.EdificiosBean"/>
<%
	List<TipoGastoDTO> tiposGastosList = tiposGastos.getTiposGastos();
	int edificio = edificioBean.getIdEdificio();
%>

<script type="text/javascript">

	function validar(){
		validado=true;
		<%--var nombre = document.getElementById("user.nombre");
		var user = document.getElementById("user.usuario");
		var apellido = document.getElementById("user.apellido");
		var dni = document.getElementById("user.dni");
		var contrasena = document.getElementById("user.password");
		if(nombre.value==""){ alert("Debe completar el nombre"); validado=false;}
		if(validado==true)if(apellido.value==""){ alert("Debe completar el apellido"); validado=false;}
		if(validado==true)if(user.value==""){ alert("Debe completar el nombre de usuario"); validado=false;}
		if(validado==true)if(dni.value==""){ alert("Debe completar el dni"); validado=false;}
		if(validado==true)if(isNaN(dni.value)){ alert("El dni debe ser un valor numerico"); validado=false;}
		if(validado==true)if(contrasena.value==""){ alert("Debe completar la contrasena");validado=false;}
		
		if (validado==false)return false;--%>
		document.gastoAlta.submit();
		return true;
	}
	
	function habilitarInputsGastos(){
		var previsional= document.getElementById("previsional");
		var real= document.getElementById("real");
		document.getElementById("gastoPrevision.anio").disabled=(previsional.checked==true)?"":"disabled";
		document.getElementById("gastoPrevision.mes").disabled=(previsional.checked==true)? "":"disabled";
		document.getElementById("gastoReal.razonSocial").disabled=(real.checked==true)?"":"disabled";
	}
	
	

</script>

<table  cellpadding="0" cellspacing="0" >
<tr>
	<td width="5"  class="borde"></td>
	<td width="800" class="borde" align="center"> <span id="header"><h>Gastos</h></span></td>
	<td width="5" class="borde"></td>
</tr>
</table>
<table id="tablaGasto" height ="300" cellpadding="0" cellspacing="0" >
<tr>
	<td width="5"  class="borde"></td>
	<td width="15"  class="fondo"></td>
	<td width="770" class="fondo" align="left">
		<form class="elegante" id="gastoAlta" name="gastoAlta" action="GastosAction">
			<fieldset>
		  		<legend>Alta en el servicio</legend>
			 		<table border="0" cellpadding="0" cellspacing="0">
			 			<tr><td colspan="6" height="10"></td></tr>
			 			<tr>
							<td></td>			 			
				 			<td width="120" align="right"><label for="tipoGasto.id">Tipo de Gasto:</label> </td>
				 			<td colspan="3">&nbsp;&nbsp;<select id="tipoGasto.id" name="tipoGasto.id" />
				 				<%for (TipoGastoDTO tg: tiposGastosList){ %> 
									<option value="<%=tg.getId() %>"><%=tg.getDescripcion()%></option>
						  		<%} %>
				 				</select>
				 			</td>
				 		</tr>
			 			<tr>
			 				<td width="120"><label for="nroFolio" >Nro Folio :</label> </td>
				 			<td><input type="text" id="nroFolio" name="nroFolio" size="9"></input></td>				 			
				 			<td width="120" align="right"><label for="monto" >Monto:</label> </td>
				 			<td >&nbsp;&nbsp;<input type="text" id="monto" name="monto" size="9" /></td>
				 			<td width="120" align="right"><label for="detalle">Detalle:</label> </td>
				 			<td  >&nbsp;&nbsp;<input type="text" id="detalle" name="detalle" /></td>
			 			</tr>
			 			
			 			<tr><td colspan="6" height="10"></td></tr>
				  		
			 			<tr>
			 				<td></td>		
				 			<td><label for="previsional"></label><input type="radio" id="previsional" name="tipo" value="previsional" onclick="habilitarInputsGastos()"/>Previsional</td>
				 			<td align="right"><label for="gastoPrevision.anio">Anio:&nbsp;</label> </td>
				  			<td><input type="text" id="gastoPrevision.anio" name="gastoPrevision.anio" disabled="disabled"/></td>
				  			<td align="right" width="150"><label for="gastoPrevision.mes">&nbsp;Mes:&nbsp;</label></td> 
				  			<td><input type="text" id="gastoPrevision.mes" name="gastoPrevision.mes" disabled="disabled"/></td>
				 		</tr>
				 		<tr>
				 			<td></td>		
				 			<td><label for="real"></label><input type="radio" id="real" name="tipo" value="real" onclick="habilitarInputsGastos()"/>Real &nbsp;</td>
				 			<td align="right"><label for="gastoReal.razonSocial">Razon Social:&nbsp;</label> </td>
				  			<td><input type="text" id="gastoReal.razonSocial" name="gastoReal.razonSocial" disabled="disabled"/></td>
				  			<td colspan="2"></td>
				 		</tr>	
				 		
				  		<tr><td colspan="6" height="10"></td></tr>
						  	
			  		</table>
			  		<input type="hidden" id="idEdificio" name="idEdificio" value="<%=edificio%>" >
			  	
			</fieldset>
				<input type="button" value="Aceptar"  onclick="validar()" >
				<input type="submit" value="Cancelar" name="redirectAction:EdificioGastosListarAction">
		</form>
	</td>
	<td width="15"  class="fondo"></td>
	<td width="5" class="borde"></td>
</tr>



</table>
<jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>