
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
		var folio = document.getElementById("nroFolio");
		var monto = document.getElementById("monto");
		var detalle = document.getElementById("detalle");
		var previsional= document.getElementById("previsional");
		var real= document.getElementById("real");
		var anio = document.getElementById("gastoPrevision.anio");
		var mes = document.getElementById("gastoPrevision.mes");
		var razon = document.getElementById("gastoReal.razonSocial");
		var nroFactura = document.getElementById("gastoReal.numeroFacturaPago");
		var fecha = document.getElementById("gastoReal.fechaPago");
		var forma = document.getElementById("gastoReal.formaPago");
	
		
		if(folio.value==""){ alert("Debe completar el nroFolio"); validado=false;}
		if(validado==true) if(isNaN(folio.value)){ alert("El nroFolio debe ser un valor numerico"); validado=false;}
		if(validado==true)if(monto.value==""){ alert("Debe completar el monto"); validado=false;}
		if(validado==true)if(isNaN(monto.value)){ alert("El monto debe ser un valor numerico"); validado=false;}
		if(validado==true)if(detalle.value==""){ alert("Debe completar el detalle"); validado=false;}
		if(validado==true) if (previsional.checked==true){
			if(anio.value==""){ alert("Debe completar el a�o"); validado=false;}
			if(validado==true)if(isNaN(anio.value)){ alert("El a�o debe ser un valor numerico"); validado=false;}
			if(validado==true) if(mes.value==""){ alert("Debe completar el mes"); validado=false;}
			if(validado==true)if(isNaN(mes.value)){ alert("El mes debe ser un valor numerico"); validado=false;}
		}
		if(validado==true) if (real.checked==true){
			if(razon.value==""){ alert("Debe completar la razon social"); validado=false;}
			if(validado==true)if(fecha.value==""){ alert("Debe completar la fecha de pago"); validado=false;}
			if(validado==true)if(/^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}$/.test(fecha.value)==false ){ alert("El formato de fecha de pago deber ser dd/mm/aaaa"); validado=false;}
			if(validado==true)if(nroFactura.value==""){ alert("Debe completar el numero de factura"); validado=false;}
			if(validado==true)if(isNaN(nroFactura.value)){ alert("El numero de factura debe ser un valor numerico"); validado=false;}
			if(validado==true)if(forma.value==""){ alert("Debe completar la forma de pago"); validado=false;}
		}
	
		if (validado==false)return false;
		document.gastoAlta.submit();
		return true;
	}
	
	function habilitarInputsGastos(){
		var previsional= document.getElementById("previsional");
		var real= document.getElementById("real");
		document.getElementById("gastoPrevision.anio").disabled=(previsional.checked==true)?"":"disabled";
		document.getElementById("gastoPrevision.mes").disabled=(previsional.checked==true)? "":"disabled";
		document.getElementById("gastoReal.razonSocial").disabled=(real.checked==true)?"":"disabled";
		document.getElementById("gastoReal.numeroFacturaPago").disabled=(real.checked==true)?"":"disabled";
		document.getElementById("gastoReal.fechaPago").disabled=(real.checked==true)? "":"disabled";
		document.getElementById("gastoReal.formaPago").disabled=(real.checked==true)?"":"disabled";
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
				 			<td><label for="previsional"></label><input type="radio" id="previsional" name="tipo" value="previsional" onclick="habilitarInputsGastos()" checked="checked"/>Previsional</td>
				 			<td align="right"><label for="gastoPrevision.anio">Anio:&nbsp;</label> </td>
				  			<td><input type="text" id="gastoPrevision.anio" name="gastoPrevision.anio" /></td>
				  			<td align="right" width="150"><label for="gastoPrevision.mes">&nbsp;Mes:&nbsp;</label></td> 
				  			<td><input type="text" id="gastoPrevision.mes" name="gastoPrevision.mes" /></td>
				 		</tr>
				 		
				 		<tr>
				 			<td></td>		
				 			<td><label for="real"></label><input type="radio" id="real" name="tipo" value="real" onclick="habilitarInputsGastos()"/>Real &nbsp;</td>
				 			<td align="right"><label for="gastoReal.razonSocial">Razon Social:&nbsp;</label> </td>
				  			<td><input type="text" id="gastoReal.razonSocial" name="gastoReal.razonSocial" disabled="disabled"/></td>
				  			<td colspan="2"></td>
				 		</tr>	
				 		
				  		<tr><td colspan="6" height="10"></td></tr>
						 
				  		<tr>
				  			<td> <span>Pago</span></td>	<td colspan="4"></td>
				  		</tr>
				  		<tr>	
				  			<td align="right" ><label for="gastoReal.fechaPago">Fecha:&nbsp;</label>  </td>
				  			<td colspan="4"><input type="text" id="gastoReal.fechaPago" name="gastoReal.fechaPago" disabled="disabled" /></td>
				  		</tr>
				  		<tr>	
				  			<td align="right" ><label for="gastoReal.numeroFacturaPago" ></label>  Nro Factura:&nbsp;</td>
				  			<td colspan="4"><input type="text" id="gastoReal.numeroFacturaPago" name="gastoReal.numeroFacturaPago" disabled="disabled" /></td>
				  		</tr>
				  		<tr>	
				  			<td align="right"><label for="gastoReal.formaPago"></label>  Forma:&nbsp;</td>
				  			<td colspan="4"><input type="text" id="gastoReal.formaPago" name="gastoReal.formaPago" disabled="disabled"/></td>
				  		</tr>			  		
			  	  		 	
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