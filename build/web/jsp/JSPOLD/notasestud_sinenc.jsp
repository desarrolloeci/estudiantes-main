<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
    response.setHeader("Cache-Control","no-cache"); 
    String periodo = request.getParameter("periodo");
    String ban = new String((String)session.getAttribute("ban"));
    PrintWriter oout = response.getWriter() ;
    configECI cfgEci = new configECI();
//    Estudiante est = new Estudiante(carnet,oout) ;
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
%>
<html>
<head>
<title>Servicios Academicos - Consulta de Notas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000"> 
 
<table width="616" border="0" cellpadding="0" align="center" cellspacing="0">
  <tr> 
    <td width="24"><img src="../img/arbIzqAz.gif" width="24" height="24"></td>
    <td width="564" valign="top"><img src="../img/puntoAz.gif" width="564" height="2.5" align="absmiddle"></td>
    <td width="28"><img src="../img/arbDerAz.gif" width="24" height="24"></td>
  </tr>
  <tr> 
    <td width="24" height="42"></td>
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
              a Estudiantes - Consulta de Notas</font></font></div>
          </td>
        </tr>
<%Vector notas = est.getNotasAnt(carnet, periodo);
    Vector notasact = est.getNotasAct(carnet,cfgEci.getPeriodoActual());%>

<%if ((notas.size()>0) || (notasact.size()>0)){%>

<%if (!(periodo.equals("PA"))){%>
    <% for ( int j = 0 ; j < 1 ; j++ ){
		Vector notasant = (Vector)notas.elementAt(j) ;
    %>
        <tr> 
          <td height="6" colspan="2"> 
            <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Nombre: 
              <font color="#000000"><%=notasant.elementAt(0)%></font></b> </font><br>
            <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Programa: 
              <font color="#000000"> <%=notasant.elementAt(1)%></font></b> </font><br>
            <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Plan de estudios: 
              <font color="#000000"> <%=notasant.elementAt(2)%></font></b> </font><br>
            <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Pr. Acum: 
              <font color="#000000"><%=notasant.elementAt(3)%></font></b> </font><br>
            <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Pr. Ult. Sem: 
              <font color="#000000"><%=notasant.elementAt(4)%></font></b> </font><br>
            <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Sem. Actual: 
              <font color="#000000"><%=notasant.elementAt(5)%></font></b> </font><br>
            <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Datos para el Periodo: 
              <font color="#000000"><%=notasant.elementAt(6)%></font></b> </font><br>
          </td>
        </tr>
    <%}%>
<%}else{%><!--else si periodo es actual-->
    <% for ( int j = 0 ; j < 1 ; j++ ){
		Vector notasactual = (Vector)notasact.elementAt(j) ;
    %>
        <tr> 
          <td height="6" colspan="2"> 
            <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Nombre: 
              <font color="#000000"><%=notasactual.elementAt(0)%></font></b> </font><br>
            <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Programa: 
              <font color="#000000"> <%=notasactual.elementAt(1)%></font></b> </font><br>
            <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Plan de estudios: 
              <font color="#000000"> <%=notasactual.elementAt(2)%></font></b> </font><br>
            <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Pr. Acum: 
              <font color="#000000"><%=notasactual.elementAt(3)%></font></b> </font><br>
            <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Pr. Ult. Sem: 
              <font color="#000000"><%=notasactual.elementAt(4)%></font></b> </font><br>
            <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Sem. Actual: 
              <font color="#000000"><%=notasactual.elementAt(5)%></font></b> </font><br>
          </td>
        </tr>
    <%}%>
<%}%><!--fin else-->
<%if (!(periodo.equals("PA"))){%>
        <tr> 
          <td valign="top" colspan="2"> <br>
            <table width="100%" border="1" align="center" bordercolor="#336699">
            <tr bgcolor="#336699">
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>C�digo</b></font></div></td>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nombre</b></font></div></td>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota</b></font></div></td>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Clave</b></font></div></td>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Observaciones</b></font></div></td>
            </tr>
           
            <% for ( int j = 0 ; j < notas.size() ; j++ ){
		Vector notasant = (Vector)notas.elementAt(j) ;%>
           <tr>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasant.elementAt(7)%></font></div></td>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasant.elementAt(8)%></font></div></td>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasant.elementAt(9)%></font></div></td>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasant.elementAt(10)%></font></div></td>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasant.elementAt(11)%></font></div></td>
            </tr>  
            <%}%>            
            </table>                    
          </td>
        </tr>
<%}else{%><!--cierra if de periodo diferente PA-->
       <tr> 
          <td valign="top" colspan="2"> <br>
            <table width="100%" border="1" align="center" bordercolor="#336699">
            <tr bgcolor="#336699">
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>C�digo</b></font></div></td>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota 1</b></font></div></td>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota 2</b></font></div></td>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota 3</b></font></div></td>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota Lab</b></font></div></td>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Nota</b></font></div></td>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Clave</b></font></div></td>
            </tr>
           
            <% for ( int j = 0 ; j < notasact.size() ; j++ ){
		Vector notasactual = (Vector)notasact.elementAt(j) ;%>
           <tr>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasactual.elementAt(6)%></font></div></td>
<%          if (notasactual.elementAt(7).equals("No disponible")){%>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div></td>
<%          } else {%>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasactual.elementAt(7)%></font></div></td>
<%          }%>  
<%          if (notasactual.elementAt(8).equals("No disponible")){%>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div></td>
<%          } else {%>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasactual.elementAt(8)%></font></div></td>
<%          }%>            
<%          if (notasactual.elementAt(9).equals("No disponible")){%>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div></td>
<%          } else {%>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasactual.elementAt(9)%></font></div></td>
<%          }%>          
<%          if (notasactual.elementAt(10).equals("No disponible")){%>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div></td>
<%          } else {%>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasactual.elementAt(10)%></font></div></td>
<%          }%>         
<%          if (notasactual.elementAt(11).equals("No disponible")){%>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></div></td>
<%          } else {%>
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasactual.elementAt(11)%></font></div></td>
<%          }%>        
            <td><div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=notasactual.elementAt(12)%></font></div></td>       
            </tr>  
            <%}%>            
            </table>                    
          </td>
        </tr>
    <%}%>
<%}else{%>
    <tr><td colspan="2">&nbsp;</td></tr>
    <tr><td colspan="2"><p><b>NO EXISTEN DATOS PARA ESTE PERIODO</b></p></td></tr>
<%}%>
        <tr><td colspan="2">&nbsp;</td></tr>
        <tr><td colspan="2">&nbsp;</td></tr>
        <tr> 
          <td valign="top" colspan="2"> 
            <div align="right"></div>
            <div align="right"> 
              <table width="45%" border="0" height="17">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="consultnotas.jsp">ANTERIOR</a> </font></b></font></div>
                    <!-- <FORM NAME="buttonbar">
                        <INPUT TYPE="button" VALUE="Atr�s" onClick="history.back()">     
                    </FORM> -->
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                 <%if (ban.equals("0")){%>
                      <a href="menuServEstud.jsp">INICIO</a></font></b></font></div>
                 <%} else {%>
                      <a href="menuServEstud1.jsp">INICIO</a></font></b></font></div>
                 <%}%>
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
    <td width="28" height="42" align="right"></td>
  </tr>
  <tr> 
    <td width="24"><img src="../img/abaIzqAz.gif" width="24" height="24"></td>
    <td width="564" valign="bottom"><img src="../img/puntoAz.gif" width="564" height="2.5"></td>
    <td width="28"><img src="../img/abaDerAz.gif" width="24" height="24"></td>
  </tr>
</table>	
<p align="center">

</body>
</html>
