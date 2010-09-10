<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript">
function habilitarInputsOrdinario(){
	var extraordinario= document.getElementById("tipoExtraOrdinario");
	document.getElementById("eventual").disabled=(extraordinario.checked==true)?"disabled":"";
	document.getElementById("periodico").disabled=(extraordinario.checked==true)? "disabled":"";
	document.getElementById("periodo").disabled=(extraordinario.checked==true)? "disabled":"";
	document.getElementById("montoFijo").disabled=(extraordinario.checked==true)? "disabled":"";
	document.getElementById("montoVariable").disabled=(extraordinario.checked==true)? "disabled":"";
	document.getElementById("montoActual").disabled=(extraordinario.checked==true)? "disabled":"";
	document.getElementById("montoPrevision").disabled=(extraordinario.checked==true)? "disabled":"";
	document.getElementById("diaLimite").disabled=(extraordinario.checked==true)? "disabled":"";
	document.getElementById("proximoVencimiento").disabled=(extraordinario.checked==true)? "disabled":"";

}
</script>




<table  cellpadding="0" cellspacing="0" >
<tr>
	<td width="5"  class="borde"></td>
	<td width="800" class="borde" align="center"> <span id="header"><h>Alta de Tipo de Gastos</h></td>
	<td width="5" class="borde"></td>
</tr>
</table>
<table id="tablaTiposDeGastos" height ="300" cellpadding="0" cellspacing="0" >
<tr>
	<td width="5"  class="borde"></td>
	<td width="15"  class="fondo"></td>
	<td width="770" class="fondo" align="left">
		<form class="elegante" id="tipoDeGastoAlta" action="TipoDeGastosAction">
			<fieldset>
		  		<legend>Alta en el servicio</legend>
			 		<table>
			 			<label for="codigo">Codigo:</label> <input type="text" id="codigo" name="codigo" /><font color="red">*&nbsp;&nbsp;</font>
			 			<label for="descripcion">Descripci&oacute;n:</label> <input type="text" id="descripcion" name="descripcion" /><font color="red">*&nbsp;&nbsp;</font>
			 			</br>
				  		<label for="tipoOrdinario"></label> <input type="radio" id="tipoOdinario" name="tipoGasto" onclick="habilitarInputsOrdinario()"/>Ordinario</br>
				  		<label for="tipoExtraOrdinario"></label> <input type="radio" id="tipoExtraOrdinario" name="tipoGasto" onclick="habilitarInputsOrdinario()"/> Extraordinario</br>
				  		</br>
				  		<label for="eventual"></label> <input type="radio" id="eventual" name="gastoPlazo" disabled="disabled" />Eventual</br>
				  		<label for="periodico"></label> <input type="radio" id="periodico" name="gastoPlazo" disabled="disabled"/> Peri&oacute;dico&nbsp;&nbsp;<label for="periodo">Per&iacute;odo:</label> <input type="text" id="periodo" name="periodo" disabled="disabled" /></br>
				  		</br>
				  		<span>Monto</span></br>
				  		<label for="montoVariable"></label> <input type="radio" id="montoVariable" name="tipoMonto" disabled="disabled" /> Variable&nbsp;&nbsp;&nbsp;&nbsp;<label for="montoActula">Monto Actual:</label> <input type="text" id="montoActual" name="montoActual" disabled="disabled"/>&nbsp;&nbsp;<label for="diaLimite">D&iacute;a L&iacute;mite:</label> <input type="text" id="diaLimite" name="diaLimite" disabled="disabled"/></br>
				  		<label for="montoFijo"></label> <input type="radio" id="montoFijo" name="tipoMonto" disabled="disabled" /> Fijo&nbsp;&nbsp;&nbsp;&nbsp;<label for="montoPrevision">Monto Previsi&oacute;n:</label> <input type="text" id="montoPrevision" name="montoPrevision" disabled="disabled"/>&nbsp;&nbsp;<label for="proximoVencimiento">Prox. Vto:</label> <input type="text" id="proximoVencimiento" name="proximoVencimiento" disabled="disabled"/></br>
				  		</br>			  		
			  	  		
			  			<input class="btn" type="button" value="Add"  onclick="validar()"/>
			  		</table>
			  	</legend>
			</fieldset>
		</form>
	</td>
	<td width="15"  class="fondo"></td>
	<td width="5" class="borde"></td>
</tr>


</table>

<jsp:include page="footer.jsp"></jsp:include>