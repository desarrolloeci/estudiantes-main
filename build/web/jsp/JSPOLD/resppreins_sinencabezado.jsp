<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%  
        Vector prei = new Vector() ;
        response.setHeader("Cache-Control","no-cache"); 
	String nombre = new String((String)session.getAttribute("nombre"));
	String raz = new String(), traz = new String();
	PrintWriter oout = response.getWriter() ;
        Vector lispre = (Vector) session.getAttribute("lisrep") ;
        int i ;
%>

<html>
<head>
<title>Horario Estudiantes</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">

 
    <table width="580" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr> 
        <td width="8"><img src="../img/arbIzqAz.gif" width="24" height="24"></td>
        <td width="564" valign="top"><img src="../img/puntoAz.gif" width="564" height="2.5" align="absmiddle"></td>
        <td width="8"><img src="../img/arbDerAz.gif" width="24" height="24"></td>
    </tr>
    <tr> 
        <td width="8" height="42"></td>
        <td width="564" height="42"> 
        <table width="100%" border="0" align="center">
            <tr> 
            <td height="37" rowspan="2" align="left" valign="top" width="14%"> 
                <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif"><b><img src="../img/LogEci.gif" width="72" height="74"></b></font></div>
            </td>
            <td height="33" width="86%"> 
             <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#336699" size="4">ESCUELA 
              COLOMBIANA DE INGENIERIA</font></b></font></div>
            </td>
            </tr>
            <tr> 
             <td width="86%" height="55" valign="top"> 
                <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><font size="4">Servicios 
              a Estudiantes - Preinscripci�n&nbsp;</font></font></div>
            </td>
            </tr>
            <tr> 
            <td height="6" colspan="2"> 
                <div><font face="Verdana, Arial, Helvetica, sans-serif"><b>Nombre: 
                <font size="2">&nbsp;<%=nombre%> </font></b> </font></div>
            </td>
            </tr>
            <tr> 
            
          <td align="center" valign="top" colspan="2"> 
            <table width="100%" border="1" bordercolor="#336699">
              <tr bgcolor="#336699">
                <td width="35%"><div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Asignaturas</font></b></div></td>
                <td width="65%">
                  <p align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Resultado</font></b></td>
              </tr>
<%  for (i = 0; i < lispre.size(); i++) {
        prei = (Vector) lispre.elementAt(i) ;
        raz = (String) prei.elementAt(0) ;
        if ( raz.equals("-1") )
            traz = "Asignatura no existe o es Laboratorio" ;
        else if ( raz.equals("-2") )
            traz = "Sobrepasa la carga de cr�ditos para preinscripci�n" ;
        else
            traz = "Preinscripci�n Aceptada" ;
%>
	      <tr>       
		   <td>
		     <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                         <%=(String) prei.elementAt(1)%></font> </div>
                   </td>
		   <td>
		     <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                        <%=traz%> </font> </div>
                   </td>
           </tr>
<%  }
%>
            </table>

            <p>&nbsp;</p>
            </td>
            </tr>
            <tr> 
             <td valign="top" colspan="2"> 
             <div align="right"> 
              <table width="45%" border="0" height="17">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="preinscripcion.jsp">ANTERIOR</a> </font></b></font></div>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="14"> 
                 
                     <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud.jsp">INICIO</a></font></b></font></div>
                 
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center"><b>|</b></div>
                  </td>
                  <td width="43%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="../servlet/LogOutEst/">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table>
    </td>
    <td width="8" height="42" align="right"></td>
  </tr>
  <tr> 
    <td width="8"><img src="../img/abaIzqAz.gif" width="24" height="24"></td>
    <td width="564" valign="bottom"><img src="../img/puntoAz.gif" width="564" height="2.5"></td>
    <td width="8"><img src="../img/abaDerAz.gif" width="24" height="24"></td>
  </tr>
</table>