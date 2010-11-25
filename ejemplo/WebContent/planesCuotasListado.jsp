<jsp:include page="/WEB-INF/jspf/header.jspf" />
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="contenido">
	<div class="titulo">
		<h3>Plan de pago</h3>
	</div>
	<div class="cuerpo" align="center">
		<div>Fecha: <s:property value="plan.fecha"/> </div>
		<div>Tipo:  <s:property value="plan.tipo" /> </div>
		<div>Responsable: <s:property value="plan.responsable.nombre"/></div>
		<div>Monto: <s:property value="plan.monto"/></div>
		<div>Cantidad cuotas: <s:property value="plan.cantidadCuotas"/></div>
		<!-- TODO: hidden con el dni, fecha y cantidad cuotas. -->	
		</div>
		<div>
			<div>Detalle de expensas a cancelar</div>
			<table class="listado">
				<thead>
					<tr>
						<th>Tipo Propiedad</th>
						<th>Nivel</th>
						<th>Orden</th>
						<th>Fecha</th>
						<th>Monto</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="plan.cobrosCancelados">
						<tr>
						<s:push value="liquidacion.propiedad">
							<td><s:property value="tipoPropiedad.nombreTipo"/></td>
							<td><s:property value="nivel"/></td>
							<td><s:property value="orden"/></td>
						</s:push>
							<td><s:property value="liquidacion.fecha"/></td>
							<td><s:property value="montoPago"/></td>
							<!-- TODO: hidden con los id de las liquidaciones a cobrar. -->
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		<div>
			<div>Detalle de cuotas</div>
			<table class="listado">
				<thead>
					<tr>
						<th>Cuota</th>
						<th>Monto</th>
						<th>Interes</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="plan.cuotas">
						<tr>
							<td><s:property value="numeroCuota"/></td>
							<td><s:property value="monto"/></td>
							<td><s:property value="intereses"/></td>
							<td><s:property value="monto + intereses"/></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/jspf/footer.jspf" />