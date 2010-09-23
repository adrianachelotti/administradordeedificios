<jsp:include page="/WEB-INF/jspf/header.jspf"></jsp:include>
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
				 		<tr><td  colspan="8">Domicilio</td>	</tr>
				 		<tr>	
				 			<td align="right"><label for="calle">Calle:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="calle" name="calle" value="<%=edificio.getCalle() %>" readonly size="15"/></td>
				 			<td align="right"><label for="numero">Nro:</label> </td>
				 			<td >&nbsp;&nbsp;<input type="text" id="numero" name="numero" value="<%=edificio.getNumero() %>" readonly size="2"/></td>
				 			<td align="right"><label for="localidad">Localidad:</label> </td>
				 			<td colspan="3">&nbsp;&nbsp;<input type="text" id="localidad" name="localidad" value="<%=edificio.getLocalidad() %>" readonly size="15" /></td>
			 			</tr>
			 			<tr><td colspan="8" height="10"></td></tr>
				 		<tr><td colspan="8">Encargado</td></tr>
			 			<tr>	
				 			<td align="right"><label for="encargado_nombre">Nombre:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="encargado_nombre" name="encargado_nombre" value="<%=edificio.getEncargado_nombre() %>" readonly size="15"/></td>
				 			<td align="right" ><label for="encargado_telefono">Tel:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="encargado_telefono" name="encargado_telefono" value="<%=edificio.getEncargado_telefono() %>" readonly size="9"/></td>
				 			<td align="right" ><label for="encargado_piso">Piso</label> &nbsp;&nbsp;
				 			<input type="text" id="encargado_piso" name="encargado_piso" value="<%=edificio.getEncargado_piso() %>" readonly size="2"/></td>
				 			<td align="right" ><label for="encargado_depto">Departamento</label> &nbsp;&nbsp;
				 			<input type="text" id="encargado_depto" name="encargado_depto" value="<%=edificio.getEncargado_depto() %>" readonly size="2"/></td>
			 			</tr>			
			 			<tr><td colspan="8" height="10"></td></tr>	  		
			 			<tr>
				 			<td><label for="apto_profesional">Apto Profesional</label></td>
				 			 <td colspan="7">&nbsp;&nbsp;<input type="checkbox" value="true" id="apto_profesional" readonly name="apto_profesional" readonly/></td>
				 		</tr>				 		
				  		<tr><td colspan="8" height="10"></td></tr>  		
				  		<tr><td class="borderline" colspan="8" height="10"></td></tr>
				  		<tr>	
				  			<td align="right" ><label for="formaliq_exp">Forma Liq.:&nbsp;</label>  </td>
				  			<td colspan="7">&nbsp;&nbsp;<select  id="formaliq_exp" name="formaliq_exp"> <option>FIJO</option><option>PRORRATEO</option></select></td>
				  		</tr>
				  		<tr><td colspan="8" height="10"></td></tr>
				  		<tr>	
				  			<td align="right" ><label for="tasa_anual" ></label>  Tasa Anual:&nbsp;</td>
				  			<td>&nbsp;&nbsp;<input type="text" id="tasa_anual" name="tasa_anual" value="<%=edificio.getTasa_anual() %>" readonly size="2"/></input></td>
				  			<td align="right" ><label for="amortizacion" ></label>  Amortizacion:&nbsp;</td>
				  			<td>&nbsp;&nbsp;<input type="text" id="amortizacion" name="amortizacion" value="<%=edificio.getAmortizacion() %>" readonly size="3"/></input></td>
				  			<td colspan="2"></td>
				  			
				  		</tr>
				  		<tr><td colspan="8" height="10"></td></tr>
				 		<tr><td colspan="8">Fondo</td></tr>
				  		<tr>	
				 			<td align="right"><label for="dia_primer_vto">Primer Vto:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="dia_primer_vto" name="dia_primer_vto" value="<%=edificio.getDia_primer_vto() %>" size="9"/></td>
				 			<td align="right" ><label for="dia_segundo_vto"> Seg Vta:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="dia_segundo_vto" name="dia_segundo_vto" value="<%=edificio.getDia_segundo_vto() %>" size="9"/></td>
				 			
			 			</tr>
				  		<tr>		  	
			  			<td> <a href="edificio.jsp">Volver</a> </td>
			  			</tr>
			  		</table>			  	
			</fieldset>
		</form>
	</td>
	<td width="15"  class="fondo"></td>
	<td width="5" class="borde"></td>
</tr>
</table>
<jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
