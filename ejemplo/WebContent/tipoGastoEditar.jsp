
<%@page import="gastos.dto.TipoGastoDTO"%>
<%@page import="gastos.dto.TipoGastoExtraordinarioDTO"%>
<%@page import="gastos.appl.TiposGastosAppl"%>
<%@page import="gastos.dto.TipoGastoMontoFijoDTO"%>
<%@page import="gastos.dto.TipoGastoMontoVariableDTO"%>
<%@page import="gastos.dto.TipoGastoPeriodicoDTO"%><jsp:include page="/WEB-INF/jspf/header.jspf"></jsp:include>
<%@ page language="java" contentType="text/html" import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html" import="edificio.*"%>
<jsp:useBean id="edificios" scope="session" class="beans.EdificiosBean"/>
<jsp:useBean id="tipoGastoBean" scope="session" class="beans.TiposGastosBean"/>
<%
	ArrayList<EdificioDTO> edificiosList = edificios.getEdificios();
	TipoGastoDTO tipoGasto = tipoGastoBean.getTipoGastoUnico();
	java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("dd/MM/yyyy");
%>
<script src="calendario.js" type="text/javascript"></script>
<script type="text/javascript">

	var tipoG="<%=tipoGasto.getTipo()%>";

	function armarFecha(elemento){
		var anio = document.getElementById("anio").value;
		var mes = document.getElementById("mes").value;
		var dia = document.getElementById("dia").value;
		elemento.value=dia+"/"+mes+"/"+anio;
	}
	
	function validar(){
		validado=true;
	
		var codigo = document.getElementById("codigo");
		var descripcion = document.getElementById("descripcion");
		var periodoFijo =	document.getElementById("tgMontoFijo.periodo");
		var periodoVariable =	document.getElementById("tgMontoVariable.periodo");
		var diaLimite = document.getElementById("tgMontoFijo.diaLimite");
		var montoActual = document.getElementById("tgMontoFijo.montoActual");
		var montoPrevision = document.getElementById("tgMontoVariable.montoPrevision");
		var proximoVencimiento=document.getElementById("tgMontoVariable.proximoVencimiento");
		armarFecha(proximoVencimiento);
	
		if(codigo.value==""){ alert("Debe completar el codigo"); validado=false;}
		if(validado==true)if(descripcion.value==""){ alert("Debe completar la descripcion"); validado=false;}

		if(validado==true)if (tipoG=="PMF"){
			if(periodoFijo.value==""){ alert("Debe completar el periodo"); validado=false;}
			if(validado==true){
				if(montoActual.value==""){ alert("Debe completar el monto actual"); validado=false;}
				if(validado==true)if(isNaN(montoActual.value)){ alert("El monto actual debe ser un valor numerico."); validado=false;}
				if(diaLimite.value==""){ alert("Debe completar el dia limite"); validado=false;}
				if(validado==true)if(isNaN(diaLimite.value)||(diaLimite.value<1 && diaLimite.value>31)){ alert("El dia limite debe ser un valor de 1 a 31."); validado=false;}
			}
		}
		if(validado==true)if (tipoG=="PMV"){		
			if(periodoVariable.value==""){ alert("Debe completar el periodo"); validado=false;}
			if(montoPrevision.value==""){ alert("Debe completar el monto previsional"); validado=false;}
			if(validado==true)if(isNaN(montoPrevision.value)){ alert("El monto previsional debe ser un valor numerico"); validado=false;}
			if(validado==true)if(proximoVencimiento.value==""){ alert("Debe completar el proximo Vto"); validado=false;}
			if(validado==true)if(/^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}$/.test(proximoVencimiento.value)==false ){ alert("El formato de fecha del proximo vencimiento deber ser dd/mm/aaaa"); validado=false;}
		}
	if (validado==false) return false;
	document.tipoDeGastoAlta.submit();
	return true;
}

function habilitarInputsMontos(){
	var montoVariable= document.getElementById("montoVariable");
	var montoFijo= document.getElementById("montoFijo");
	document.getElementById("tgMontoVariable.montoPrevision").disabled=(montoVariable.checked==true)?"":"disabled";
	document.getElementById("tgMontoVariable.proximoVencimiento").disabled=(montoVariable.checked==true)? "":"disabled";
	document.getElementById("anio").disabled=(montoVariable.checked==true)? "":"disabled";
	document.getElementById("mes").disabled=(montoVariable.checked==true)? "":"disabled";
	document.getElementById("dia").disabled=(montoVariable.checked==true)? "":"disabled";
	
	document.getElementById("tgMontoFijo.montoActual").disabled=(montoFijo.checked==true)?"":"disabled";
	document.getElementById("tgMontoFijo.diaLimite").disabled=(montoFijo.checked==true)? "":"disabled";

}
function habilitarInputsOrdinario(){
	var extraordinario= document.getElementById("tipoExtraOrdinario");
	document.getElementById("eventual").disabled=(extraordinario.checked==true)?"disabled":"";
	document.getElementById("periodico").disabled=(extraordinario.checked==true)? "disabled":"";
	if (extraordinario.checked==true){
		document.getElementById("tgMontoFijo.periodo").disabled="disabled";
		document.getElementById("tgMontoFijo.edificio.id").disabled="disabled";
		document.getElementById("montoFijo").disabled="disabled";
		document.getElementById("montoVariable").disabled="disabled";
		document.getElementById("tgMontoFijo.montoActual").disabled="disabled";
		document.getElementById("tgMontoVariable.montoPrevision").disabled="disabled";
		document.getElementById("tgMontoFijo.diaLimite").disabled="disabled";
		document.getElementById("tgMontoVariable.proximoVencimiento").disabled="disabled";
		document.getElementById("anio").disabled="disabled";
		document.getElementById("mes").disabled="disabled";
		document.getElementById("dia").disabled="disabled";
	}
}

function habilitarInputsPlazo(){
	var periodico = document.getElementById("periodico");
	document.getElementById("tgMontoFijo.periodo").disabled=(periodico.checked==true)?"":"disabled";
	document.getElementById("tgMontoFijo.edificio.id").disabled=(periodico.checked==true)?"":"disabled";
	document.getElementById("montoFijo").disabled=(periodico.checked==true)?"":"disabled";
	document.getElementById("montoVariable").disabled=(periodico.checked==true)?"":"disabled";
	if(periodico.checked==true){
		document.getElementById("tgMontoFijo.montoActual").disabled="disabled";
		document.getElementById("tgMontoVariable.montoPrevision").disabled="disabled";
		document.getElementById("tgMontoFijo.diaLimite").disabled="disabled";
		document.getElementById("tgMontoVariable.proximoVencimiento").disabled="disabled";
		document.getElementById("mes").disabled="disabled";
		document.getElementById("anio").disabled="disabled";
		document.getElementById("dia").disabled="disabled";
	}	
}
</script>

<div class="contenido">
	<div class="titulo"><h3>Modificaci&oacute;n de Tipo de Gastos</h3></div>
	<div class="cuerpo" align="center">
	<table id="tablaTiposDeGastos" height ="300" cellpadding="0" cellspacing="0" >
	<tr>
		<td width="15"  class="fondo"></td>
		<td width="770" class="fondo" align="left">
			<form class="elegante" id="tipoDeGastoAlta" name="tipoDeGastoAlta" action="TipoDeGastosAction!actualizar">
				<fieldset>
			  		<legend>Modificaci&oacute;n</legend>
				 					 					 		
				 		<table border="0" cellpadding="0" cellspacing="0">
				 			<tr><td colspan="5" height="10"></td></tr>
				 			<tr>
					 			<td width="120" align="right"><label for="codigo">Codigo:</label> </td>
					 			<td colspan="4" >&nbsp;&nbsp;<input type="text" id="codigo" name="codigo" disabled="disabled" value="<%=tipoGasto.getCodigo()%>" /><font color="red">*&nbsp;&nbsp;</font></td>
					 		</tr>
					 		<tr>
					 			<td align="right"><label for="descripcion">Descripci&oacute;n:</label> </td>
					 			<td colspan="4">&nbsp;&nbsp;<input type="text" id="descripcion" name="descripcion" value="<%=tipoGasto.getDescripcion()%>" /><font color="red">*&nbsp;&nbsp;</font></td>
				 			</tr>
				 			<tr><td colspan="5" height="10"></td></tr>
					  		<%if (tipoGasto.getTipo().equals(TipoGastoDTO.tipoPeriodicoMontoFijo)){ %>
					  						  		
					 			<tr>	
						  			<td>&nbsp;&nbsp;<label for="tgMontoFijo.periodo">Per&iacute;odo:</label> </td>
						  			<td><select id="tgMontoFijo.periodo"  name="tgMontoFijo.periodo">
								  			<% 
								  				String seleccionado=((TipoGastoMontoFijoDTO)tipoGasto).getPeriodo();
								  		
								  				for (int i=1;i<=12;i++){				  					
								  				 if(seleccionado.equals(String.valueOf(i))){			  				
								  			%>				  			
								  				<option value="<%=i%>" selected="selected"><%=i%></option>
								  			<%}else {%>
								  				<option value="<%=i%>" ><%=i%></option>
								  			<% }%>
								  			<%} %>
							  			</select>
							  		</td>
						  			<td><label for="tgMontoFijo.edificio.id">Edificio:</label></td>
									<td colspan="2"><select name ="tgMontoFijo.edificio.id" id="tgMontoFijo.edificio.id"  >
						  				<%	int idEdificio =((TipoGastoMontoFijoDTO)tipoGasto).getEdificio().getId();
						  					for (EdificioDTO edif: edificiosList){					  					
						  						if (((TipoGastoMontoFijoDTO)tipoGasto).getEdificio()!=null){ 
								  					if (edif.getId()==idEdificio ){ %> 
														<option value="<%=edif.getId()%>" selected="selected"><%=edif.getNombre()%></option>
										  			<%}else{ %>
										  				<option value="<%=edif.getId()%>"><%=edif.getNombre()%></option>
										  			<%} 
							  					}
							  				}
								  		%>
										</select>
									</td>						
						  		</tr>
						  		<tr><td colspan="5" height="10"></td></tr>
						  		<tr>
						  			<td colspan="4"><span>Monto</span></td>
						  			<td></td>
						  		</tr>
						  		<tr>
						  			<td><label for="tgMontoFijo.montoActual">Monto Actual:</label> </td>
						  			<td><input type="text" id="tgMontoFijo.montoActual" name="tgMontoFijo.montoActual" value="<%=((TipoGastoMontoFijoDTO)tipoGasto).getMontoActual()%>"/></td>
						  			<td><label for="tgMontoFijo.diaLimite">&nbsp;D&iacute;a L&iacute;mite:&nbsp;</label></td> 
						  			<td colspan="2"><input type="text" id="tgMontoFijo.diaLimite" name="tgMontoFijo.diaLimite" value="<%=((TipoGastoMontoFijoDTO)tipoGasto).getDiaLimite()%>"/></td>
						  		</tr>
						  		<tr><td colspan="5" height="10"></td></tr>
					  		
					  		<%}%>
					  		
					  		<%if (tipoGasto.getTipo().equals(TipoGastoDTO.tipoPeriodicoMontoVariable)){ %>
					  						  		
					 			 <tr>	
						  			<td>&nbsp;&nbsp;<label for="tgMontoVariable.periodo">Per&iacute;odo:</label> </td>
						  			<td><select id="tgMontoVariable.periodo"  name="tgMontoVariable.periodo">
								  			<% 
								  				String seleccionado=((TipoGastoMontoVariableDTO)tipoGasto).getPeriodo();
								  			
								  				for (int i=1;i<=12;i++){				  					
								  				 if(seleccionado.equals(String.valueOf(i))){			  				
								  			%>				  			
								  				<option value="<%=i%>" selected="selected"><%=i%></option>
								  			<%}else {%>
								  				<option value="<%=i%>" ><%=i%></option>
								  			<% }%>
								  			<%} %>
							  			</select>
							  		</td>
						  			<td><label for="tgMontoVariable.edificio.id">Edificio:</label></td>
									<td colspan="2"><select name ="tgMontoVariable.edificio.id" id="tgMontoVariable.edificio.id"  >
						  				<%	int idEdificio =((TipoGastoMontoVariableDTO)tipoGasto).getEdificio().getId();
						  					for (EdificioDTO edif: edificiosList){					  					
						  						if (((TipoGastoMontoVariableDTO)tipoGasto).getEdificio()!=null){ 
								  					if (edif.getId()==idEdificio ){ %> 
														<option value="<%=edif.getId()%>" selected="selected"><%=edif.getNombre()%></option>
										  			<%}else{ %>
										  				<option value="<%=edif.getId()%>"><%=edif.getNombre()%></option>
										  			<%} 
							  					}
							  				}
								  		%>
										</select>
									</td>
						  		</tr>
						  		<tr><td colspan="5" height="10"></td></tr>
						  		<tr>
						  			<td colspan="4"><span>Monto</span></td>
						  			<td></td>
						  		</tr>
						  		<tr>
						  			<td><label for="tgMontoVariable.montoPrevision">Monto Previsi&oacute;n:&nbsp;</label></td> 
						  			<td><input type="text" id="tgMontoVariable.montoPrevision" name="tgMontoVariable.montoPrevision" value="<%=((TipoGastoMontoVariableDTO)tipoGasto).getMontoPrevision()%>"/></td>
						  			<td><label for="tgMontoVariable.proximoVencimiento">&nbsp;Prox. Vto:&nbsp;</label></td>
						  			<td colspan="2"> <input type="hidden" id="tgMontoVariable.proximoVencimiento" name="tgMontoVariable.proximoVencimiento"/>
						  				&nbsp;&nbsp;<input type="text" name="dia" maxlength="2" size="2" style="width:22px;" value="<%=((TipoGastoMontoVariableDTO)tipoGasto).getProximoVencimiento().getDate()%>" >
										&nbsp;<input type="text" name="mes" maxlength="2" size="2"  style="width:22px;"  value="<%=((TipoGastoMontoVariableDTO)tipoGasto).getProximoVencimiento().getMonth()+1%>">
										&nbsp;<input type="text" name="anio" maxlength="4" size="4" style="width:32px;" value="<%=((TipoGastoMontoVariableDTO)tipoGasto).getProximoVencimiento().getYear() +1900%>" >
										&nbsp;&nbsp;<a href="JavaScript:doNothing()" onclick="allowPrevious=true;setDateField(tipoDeGastoAlta.dia,document.tipoDeGastoAlta.mes,document.tipoDeGastoAlta.anio);top.newWin = window.open('calendario.jsp','cal','WIDTH=200,HEIGHT=160,TOP=200,LEFT=300')" onMouseOver="javascript: window.status = 'Abrir calendario'; return true;" onMouseOut="window.status=' '; return true;" ><img src="images/calendario.gif" ></img></a>
					  			 			
						  			</td>
						  		</tr>
						  		<tr><td colspan="5" height="10"></td></tr>
					  		
					  		<%}%>
					  		 					  	  		
				  		</table>
				  		<input type="hidden" id="tgExtraordinario.codigo" name="tgExtraordinario.codigo" value="" >
				  		<input type="hidden" id="tgEventual.codigo" name="tgEventual.codigo" value="" >
				  		<input type="hidden" id="tgMontoFijo.codigo" name="tgMontoFijo.codigo" value="" >
				  		<input type="hidden" id="tgMontoVariable.codigo" name="tgMontoVariable.codigo" value="" >
				  		<input type="hidden" id="id" name="id" value="<%=tipoGasto.getId()%>" >
				  		<input type="hidden" id="tipoGasto" name="tipoGasto" value="<%=tipoGasto.getTipo()%>" >
				</fieldset>
					<input type="button" value="Aceptar"  onclick="validar()" >
					<input type="submit" value="Cancelar" name="redirectAction:GetListadoTipoDeGastoAction">
					
			</form>
		</td>
		<td width="15"  class="fondo"></td>
	</tr>
	</table>
	</div>
</div>

<jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>