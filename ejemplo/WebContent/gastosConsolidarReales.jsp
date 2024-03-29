<%@page import="gastos.appl.GastosAppl"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page import="gastos.dto.GastoRealDTO"%><jsp:include page="/WEB-INF/jspf/header.jspf"></jsp:include>
<%@ page language="java" contentType="text/html" import="java.util.*"%>
<%@ page language="java" contentType="text/html" import="gastos.*"%>
<%@ page language="java" contentType="text/html" import="utilidades.*"%>
<%@ page language="java" contentType="text/html" import="org.hibernate.*"%>
<%
	GastosAppl edifAppl = new GastosAppl();
	SessionFactory factory = HibernateUtil.getSessionFactory();	
	int id = Integer.parseInt(request.getParameter("id"));
	GastoRealDTO gasto = edifAppl.getGastosRealesPendientesPorid(factory,id);
%>
<table  cellpadding="0" cellspacing="0" >
<tr>
	<td width="5"  class="borde"></td>
	<td width="800" class="borde" align="center"><h3 id="header">Gastos Reales</h3></td>
	<td width="5" class="borde"></td>
</tr>
</table>
<table id="tablaGastoGrales" height ="300" cellpadding="0" cellspacing="0" border="0">
<tr>
<td width="5"  class="borde"></td>
	<td width="15"  class="fondo"></td>
	<td width="770" class="fondo" align="left">
		<form class="elegante" name="consolidarGastoReal" id="consolidarGastoReal" action="GastoRealConsolidarAction">
			<fieldset>
		  		<legend>Consolidar Gasto Real</legend>
			 		<table  border="0" cellpadding="0" cellspacing="0" >
			 			<tr><td colspan="4" height="10"></td></tr>
			 			<tr>
			 				<td align="right"><label for="nombre">Folio:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="folio" name="folio" value="<%=gasto.getNumeroFolio() %>" readonly size="15"/></td>
			 				<td align="right"><label for="nombre">Detalle:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="detalle" name="detalle" value="<%=gasto.getDetalle() %>" readonly size="30"/></td>	
				 		</tr>
				 		<tr height="10"><td colspan="4"></td></tr>
				 		<tr>
				 			<td align="right"><label for="nombre">Monto:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="monto" name="monto" value="<%=gasto.getMonto() %>" readonly size="15"/></td>					 			
				 			<td align="right"><label for="nombre">Razon Social:</label> </td>
				 			<td>&nbsp;&nbsp;<input type="text" id="razon_social" name="razon_social" value="<%=gasto.getRazonSocial() %>" readonly size="30"/></td>		
				 		</tr>
				 		<tr height="30"><td></td></tr>
				 		<tr>
				 			<td align="right"><label for="formaPago">Forma de Pago:</label> </td>
				 			<td colspan="3">&nbsp;&nbsp;<input type="text" id="formaPago" name="formaPago" value="<%=gasto.getFormaPago() %>" readonly size="15"/></td>
				 		</tr>
				 		<tr height="10"><td colspan="4"></td></tr>
				 		<tr>	
				 			<td align="right"><label for="nroFac">Nro. Factura:</label> </td>
				 			<td colspan="3">&nbsp;&nbsp;<input type="text" id="nroFac" name="nroFac" value="<%=gasto.getNumeroFacturaPago() %>" readonly  size="15"/></td>
				 		</tr>
				 		<tr height="10"><td colspan="4" ></td></tr>
				 		<tr>	
				 			<td align="right"><label for="fechaPago">Fecha Pago:</label> </td>
				 			<td colspan="3">
				 				&nbsp;&nbsp;<input type="hidden" id="fechaPago" name="fechaPago"  readonly size="15"/>
				 				<input type="text" name="dia" maxlength="2" size="2" style="width:22px;" value="<%=gasto.getFechaPago().getDate()%>" >
									&nbsp;<input type="text" name="mes" maxlength="2" size="2"  style="width:22px;"  value="<%=gasto.getFechaPago().getMonth()+1%>">
									&nbsp;<input type="text" name="anio" maxlength="4" size="4" style="width:32px;" value="<%=gasto.getFechaPago().getYear() +1900%>" >
								
				 			</td>
				 		</tr>
				 		<tr>
				 			<td>&nbsp;&nbsp;<input type="text" style="display: none;" id="id" name="id" value="<%=gasto.getId() %>" readonly size="15"/></td>
				 			<td colspan="3">&nbsp;&nbsp;<input type="text" style="display: none;" id="idEdificio" name="idEdificio" value="<%=gasto.getEdificio().getId() %>" readonly size="15"/></td>
				 		</tr>
				  		
			  		</table>			  	
			</fieldset>
			<s:actionerror cssClass="error"/>
			<input class="btn" type="button" value="Aceptar" onclick="submit()" />&nbsp;&nbsp;
			<a href="GastosListarModifElimAction?id=<%=gasto.getEdificio().getId()%>">Volver</a>
		</form>
	</td>
	<td width="15"  class="fondo"></td>
	<td width="5" class="borde"></td>
</tr>
</table>
<jsp:include page="/WEB-INF/jspf/footer.jspf"></jsp:include>
