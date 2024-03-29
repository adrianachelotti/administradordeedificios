<jsp:include page="/WEB-INF/jspf/header.jspf"></jsp:include>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html" import="java.util.*"%>
<%@ page language="java" contentType="text/html" import="edificio.*"%>
<%@ page language="java" contentType="text/html" import="utilidades.*"%>
<%@ page language="java" contentType="text/html" import="org.hibernate.*"%>
<%
	EdificioAppl edifAppl = new EdificioAppl();
	SessionFactory factory = HibernateUtil.getSessionFactory();	
	int id = Integer.parseInt(request.getParameter("id"));
	EdificioDTO edificio = edifAppl.getEdificio(factory,id);
%>

<script type="text/javascript">

function habilita(){
	var punitorio= document.getElementById("punitorio");
	var afecha= document.getElementById("afecha");
	
	document.getElementById("dia_segundo_vto").disabled=(afecha.checked==true)?"":"disabled";
	document.getElementById("dia_segundo_vto").disabled=(punitorio.checked==true)?"":"disabled";
}

function validar(thisform) {
	validado=true;
	var nombre = document.getElementById("nombre");
	var calle = document.getElementById("calle");
	var numero = document.getElementById("numero");
	var localidad = document.getElementById("localidad");
	var encargado_nombre = document.getElementById("encargado_nombre");
	var encargado_telefono = document.getElementById("encargado_telefono");
	var encargado_piso = document.getElementById("encargado_piso");
	var encargado_depto = document.getElementById("encargado_depto");
	var tasa_anual = document.getElementById("tasa_anual");
	var dia_primer_vto = document.getElementById("dia_primer_vto");
	var dia_segundo_vto = document.getElementById("dia_segundo_vto");

	var punitorio= document.getElementById("punitorio");
	var afecha= document.getElementById("afecha");
	var diferido= document.getElementById("diferido");
	
	if(nombre.value=="") { 
		alert("Debe completar el nombre"); 
		validado=false;
	} 
	if(calle.value=="" && validado == true) { 
		alert("Debe completar la calle"); 
		validado=false;
	}
	if( (numero.value=="" || isNaN(numero.value)) && validado == true) { 
		alert("Debe completar el numero"); 
		validado=false;
	}
	if(localidad.value=="" && validado == true) { 
		alert("Debe completar la localidad"); 
		validado=false;
	}
	if(encargado_nombre.value=="" && validado == true) { 
		alert("Debe completar el nombre del encargado"); 
		validado=false;
	}
	if(encargado_telefono.value=="" && validado == true) { 
		alert("Debe completar el telefono del encargado"); 
		validado=false;
	}
	if( (encargado_piso.value=="" || isNaN(encargado_piso.value)) && validado == true ) { 
		alert("El piso debe ser un numero"); 
		validado=false;
	}
	if(encargado_depto.value=="" && validado == true) { 
		alert("Debe completar el depto del encargado"); 
		validado=false;
	}
	if(isNaN(tasa_anual.value) && validado == true ) { 
		alert("Debe completar el monto de la tasa anual y debe ser un numero"); 
		validado=false;
	}
	if((isNaN(dia_primer_vto.value) || (parseInt(dia_primer_vto.value) < 1) || (parseInt(dia_primer_vto.value) > 15)) && validado == true ) { 
		alert("El primer vencimiento debe ser menor que 15"); 
		validado=false;
	} 
	if((dia_segundo_vto.value!="") && (isNaN(dia_segundo_vto.value)|| (parseInt(dia_segundo_vto.value) < 0) || ( parseInt(dia_segundo_vto.value) > 15)) && validado == true ) { 
		alert("El segundo vencimiento debe ser menor que 15"); 
		validado=false;
	} 
	if ((punitorio.checked==true) && (dia_segundo_vto.value=="") && validado == true ) {
		alert("Si es punitorio debe completar el dia del segundo vto"); 
		validado=false;
	}
	if ((parseInt(dia_primer_vto.value) > parseInt(dia_segundo_vto.value)) && (validado == true) && (punitorio.checked==true)){
		alert("El segundo vto debe ser posterior al primero"); 
		validado=false;
	}
	if (validado==true) {
		document.modifEdificio.submit();
	}
	return validado;
}

</script>
<table  cellpadding="0" cellspacing="0" >
<tr>
	<td width="5"  class="borde"></td>
	<td width="800" class="borde" align="center"><h3 id="header">Edificios</h3></td>
	<td width="5" class="borde"></td>
</tr>
</table>
<table id="tablaGastoGrales" height ="300" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="5"  class="borde"></td>
	<td width="15"  class="fondo"></td>
	<td width="770" class="fondo" align="left">
		<form class="elegante" name="modifEdificio" id="modifEdificio" action="EdificioModifAction">
			<fieldset>
		  		<legend>Modificar de Edificios</legend>
			 		<table  border="0" cellpadding="0" cellspacing="0" border="2">
			 			<tr><td colspan="8" height="10"></td></tr>
			 			<tr>
			 				<td align="right"><label for="nombre">Nombre:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="nombre" name="nombre" value="<%=edificio.getNombre() %>" readonly size="15"/></td>	
				 			<td>&nbsp;&nbsp;<input type="text" style="display: none;" id="id" name="id" value="<%=edificio.getId() %>" readonly size="15"/></td>	
				 			<td>&nbsp;&nbsp;<input type="text" style="display: none;" id="fdoOdinario" name="fdoOdinario" value="<%=edificio.getFondo_ordinario() %>" readonly size="15"/></td>
				 			<td>&nbsp;&nbsp;<input type="text" style="display: none;" id="fdoextraordinario" name="fdoextraordinario" value="<%=edificio.getFondo_extraordinario() %>" readonly size="15"/></td>
				 		</tr>
				 		<tr><td  colspan="8" height="3"></td></tr>
				 		<tr><td  colspan="8">Domicilio<font color="red">*&nbsp;&nbsp;</font></td>	</tr>
				 		<tr>	
				 			<td align="right"><label for="calle">Calle:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="calle" name="calle" value="<%=edificio.getCalle() %>" size="15"/></td>
				 			<td align="right"><label for="numero">Nro:</label> </td>
				 			<td >&nbsp;&nbsp;<input type="text" id="numero" name="numero" value="<%=edificio.getNumero() %>" size="2"/></td>
				 			<td align="right"><label for="localidad">Localidad:</label> </td>
				 			<td colspan="3">&nbsp;&nbsp;<input type="text" id="localidad" name="localidad" value="<%=edificio.getLocalidad() %>" size="15" /></td>
			 			</tr>
			 			<tr><td colspan="8" height="10"></td></tr>
				 		<tr><td colspan="8">Encargado<font color="red"> *&nbsp;&nbsp;</font></td></tr>
			 			<tr>	
				 			<td align="right"><label for="encargado_nombre">Nombre:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="encargado_nombre" name="encargado_nombre" value="<%=edificio.getEncargado_nombre() %>" size="15"/></td>
				 			<td align="right" ><label for="encargado_telefono">Tel:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="encargado_telefono" name="encargado_telefono" value="<%=edificio.getEncargado_telefono() %>" size="9"/></td>
				 			<td align="right" ><label for="encargado_piso">Piso</label> &nbsp;&nbsp;
				 			<input type="text" id="encargado_piso" name="encargado_piso" value="<%=edificio.getEncargado_piso() %>" size="2"/></td>
				 			<td align="right" ><label for="encargado_depto">Departamento</label> &nbsp;&nbsp;
				 			<input type="text" id="encargado_depto" name="encargado_depto" value="<%=edificio.getEncargado_depto() %>" size="2"/></td>
			 			</tr>			
			 			<tr><td colspan="8" height="10"></td></tr>	  		
			 			<tr>
				 			<td><label for="apto_profesional">Apto Profesional</label></td>
				 			<%String checkProfesional =edificio.getApto_profesional()?"checked":""; %>
				 			 <td colspan="7">&nbsp;&nbsp;<input type="checkbox" value="true" id="apto_profesional" name="apto_profesional" <%=checkProfesional%> /></td>
				 		</tr>				 		
				  		<tr><td colspan="8" height="10"></td></tr>  		
				  		<tr><td class="borderline" colspan="8" height="10"></td></tr>
				  		<tr>	
				  			<td align="right" ><label for="formaliq_exp">Forma Liq.:&nbsp;</label>  </td>
				  			<td colspan="7">&nbsp;&nbsp;
				  				<select  id="formaliq_exp" name="formaliq_exp">
				  				<%if (edificio.getForma_liq_exp().equalsIgnoreCase("FIJO")){ %> 
				  					<option selected="selected">FIJO</option>
				  					<option>PRORRATEO</option>
				  				<%}else{ %>
				  					<option >FIJO</option>
				  					<option selected="selected">PRORRATEO</option>
				  				<%} %>	
				  				</select>
				  			</td>
				  		</tr>
				  		<tr><td colspan="8" height="10"></td></tr>
				  		<tr>	
				  			<td align="right" ><label for="tasa_anual" ></label>  Tasa Anual:&nbsp;</td>
				  			<td>&nbsp;&nbsp;<input type="text" id="tasa_anual" name="tasa_anual" value="<%=edificio.getTasa_anual() %>" size="2"/></input><font color="red">*&nbsp;&nbsp;</font></td>
				  			<td align="right" ><label for="amortizacion" ></label>  Amortizaci&oacute;n:&nbsp;</td>
				  			<td colspan="7">&nbsp;&nbsp;
				  			<select  id="amortizacion" name="amortizacion">
				  			<%if (edificio.getAmortizacion().equalsIgnoreCase("FRANCES")){ %> 
				  				<option value="ALEMAN">ALEM&Aacute;N</option>
				  				<option value="FRANCES" selected="selected">FRANC&Eacute;S</option>
				  			<%}else{ %>
				  				<option value="ALEMAN" selected="selected">ALEM&Aacute;N</option>
				  				<option value="FRANCES">FRANC&Eacute;S</option>
				  			<%} %>
				  				</select>
				  			</td>
				  			<td colspan="2"></td>
				  			
				  		</tr>
				  		<tr><td colspan="8">C&aacute;lculo de Inter&eacute;s</td></tr>
				  		<tr>	
				  		<%
				  			String punitorio = edificio.getMora().equalsIgnoreCase("punitorio")?"checked":"";
				  			String afecha = edificio.getMora().equalsIgnoreCase("afecha")?"checked":"";
				  			String diferido = edificio.getMora().equalsIgnoreCase("diferido")?"checked":"";
				  			String habilitadoSegundoVto = punitorio.equals("checked")?"":"disabled";
				  			
				  		%>
				 			<td>&nbsp;&nbsp;<label for="punitorio"></label><input type="radio" id="punitorio" name="mora" value="punitorio"  <%=punitorio%> onclick="habilita()"/>Punitorio</td>
				 			<td>&nbsp;&nbsp;<label for="afecha"></label><input type="radio" id="afecha" name="mora" value="afecha" <%=afecha%> onclick="habilita()" />A fecha de pago &nbsp;</td>
			 				<td>&nbsp;&nbsp;<label for="diferido"></label><input type="radio" id="diferido" name="mora" value="diferido" <%=diferido%> onclick="habilita()" />Diferido &nbsp;</td>
			 				
			 			</tr>
				  		<tr><td colspan="8" height="10"></td></tr>
				 		<tr><td colspan="8">Fondo</td></tr>
				  		<tr>	
				 			<td align="right"><label for="dia_primer_vto">Primer Vto:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="dia_primer_vto" name="dia_primer_vto" value="<%=edificio.getDia_primer_vto() %>" size="9"/><font color="red">*&nbsp;&nbsp;</font></td>
				 			<td align="right" ><label for="dia_segundo_vto"> Segundo Vto:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="dia_segundo_vto" name="dia_segundo_vto" value="<%=edificio.getDia_segundo_vto() %>" size="9" <%=habilitadoSegundoVto%> /></td>
				 		</tr>
				  		</table>			  	
			</fieldset>
			<s:actionerror cssClass="error"/>
			<input class="btn" type="button" value="Aceptar" onclick="validar()" />
			<a href="EdificioListarAction?redi=edificio">Volver</a>
		</form>
	</td>
	<td width="15"  class="fondo"></td>
	<td width="5" class="borde"></td>
</tr>
</table>
<jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
