<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--<xsl:output method="xml" indent="yes"/>-->
	<xsl:template match="/">
		<!--Aquí se crea el html-->
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="archivo.css" />
			</head>
			<body color="red">
				<h1>Tienda</h1>				 							
				<h2>Productos</h2>
				<!--Creamos una tabla con sus encabezados-->
				<table border="1">
					<tr>
						<th>Código</th>
						<th>Nombre</th>
						<th>Categoría</th>
						<th>Precio</th>
						<th>Fecha</th>
						<th>Descripción</th>
					</tr>
					<!--Recorremos los productos y pintamos sus datos-->
					<xsl:for-each select="tienda/productos/producto">
						<!--Se ordena por código de producto-->
						<xsl:sort select="@codigo"/>
						<tr>
							<td>
								<xsl:value-of select="@codigo"/>
							</td>
							<td>
								<xsl:value-of select="nombreproducto"/>
							</td>
							<td>
								<xsl:value-of select="categoria"/>
							</td>
							<td>
								<xsl:value-of select="precio"/>
							</td>
							<td>
								<xsl:value-of select="fecha"/>
							</td>
							<td>
								<xsl:value-of select="descripcion"/>
							</td>
						</tr>
					</xsl:for-each>
					
				</table>

				<h2>Clientes</h2>
				<ul>
					<!--Recorremos los clientes y pintamos sus datos-->
					<xsl:for-each select="tienda/clientes/cliente">
						<!--Se ordena por nombe del cliente-->
						<xsl:sort select="nombre"/>
						<li><b>Nombre: </b>
							<xsl:value-of select="nombre"/>
							<b>Primer apellido: </b> <xsl:value-of select="apellido"/> <b>Segundo apellido: </b><xsl:value-of select="apellido2"/>
							<br/>
							<b>DNI: </b> <xsl:value-of select="dni"/> <b>Mail: </b> <xsl:value-of select="mail"/>
							<b>Teléfono: </b> <xsl:value-of select="telefono"/>							
							<br/>
							<xsl:choose>
								<xsl:when test="sexo='Mujer'">
									<b>Es una clienta</b>
								</xsl:when>
								<xsl:when test="sexo='Hombre'">
									<b>Es un cliente</b>
								</xsl:when>
								<xsl:otherwise><b>No se sabe si es hombre o mujer</b></xsl:otherwise>
							</xsl:choose>

						</li>
					</xsl:for-each>
				</ul>
				
			</body>
		</html>
        
    </xsl:template>
	
</xsl:stylesheet>
