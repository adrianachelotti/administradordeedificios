<jsp:include page="/WEB-INF/jspf/header.jspf" />
<style type="text/css">
<!--
	.contenido div {
		padding: 1px; /* sin padding no se pinta correctamente el fondo. */ 
	}

	.titulo {
		color:white;
		background-color:black;
	}

	.titulo h3 {
		text-align: center;
		margin: 0;
	}

	.cuerpo {
		background-color: grey;
	}

-->
</style>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="contenido">
	<div class="titulo">
		<h3>Propiedades</h3>
	</div>
	<div class="cuerpo">
	<s:if test="lista.size() > 0">
		<table>
		<s:iterator value="lista">
			<tr>
				<td><s:property value="nivel" /></td>
				<td><s:property value="orden" /></td>
				<td><s:property value="tipoPropiedad.nombreTipo" /></td>
				<td><s:property value="propietario.dni" /></td>
				<td>
					<s:property value="inquilino.dni" />
				</td>
				<td>
					<s:property value="ubicacion" />
				</td>
				<td><s:property value="autoridad" /></td>
				<td>
					<s:url id="url" action="responsablesFormulario!editar">
						<s:param name="dni" value="dni" />
					</s:url>
					<a href="<s:property value='#url' />">Editar</a>
				</td>
			</tr>
		</s:iterator>
		</table>
	</s:if>
	<s:url id="url" action="responsablesFormulario!crear" />
	<a href="<s:property value='#url' />">Agregar Responsable</a>
	</div>
</div>
<jsp:include page="/WEB-INF/jspf/footer.jspf" />