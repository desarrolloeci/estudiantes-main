<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="java.text.*" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudFin" %>

<%  
    response.setHeader("Cache-Control","no-cache"); 
    String nombre = new String((String)session.getAttribute("nombre"));
    String ban = new String((String)session.getAttribute("ban"));
    Vector tot = new Vector () ;
    NumberFormat nf = NumberFormat.getIntegerInstance() ;
    int i = 0 ;
    long val = 0;    
    PrintWriter oout = response.getWriter() ;
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    EstudFin efin = new EstudFin(est.getIdEst()) ;
    String modo = new String("Ordinaria") ;
%>

<html>
<head>
<title>Servicios Academicos - Forma de Pago de derechos de Matrícula</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.boton{
        font-size:10px;
        font-family:Verdana,Helvetica;
        font-weight:bold;
        color:white;
		background-image:url(img/blue-background.gif);
        height:25px;
		border-color: 666699;
		border-width: 2;
       }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}
a{color: blue;}
a:hover{color:#3366CC; }
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="640" height="70" border="0" align="center" cellpadding="0" cellspacing="0" id="Tabla_01">
  <tr>
    <td> <img src="img/servest_01.gif" width="150" height="60" alt=""></td>
    <td> <img src="img/servest_02.gif" width="20" height="60" alt=""></td>
    <td> <img src="img/servest_03.gif" width="233" height="60" alt=""></td>
    <td> <img src="img/servest_04.gif" width="237" height="60" alt=""></td>
  </tr>
  <tr>
    <td colspan="4"> <img src="img/servest_05.gif" width="640" height="10" alt=""></td>
  </tr>
</table>

<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr>     
    <td width="640" valign="top" height="255"> 
      <p align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
        <b>Forma de Pago de derechos de Matrícula</b></font></p>
      <table width="100%" border="0" align="center">
        <tr>
<%      Vector lisas = new Vector(efin.getPagarP()) ;
        if (lisas.size() == 1 ) {    
            tot = (Vector) lisas.elementAt(i) ;
            int lim = Integer.parseInt((String) tot.elementAt(6)) ;
            if (lim <= 0) {
                val = Long.parseLong((String) tot.elementAt(5)) ;
            } else {
                val = Long.parseLong((String) tot.elementAt(7)) ;
                modo = "Extraordianria" ;
            }
%>
            <form method="POST" action="https://www.edinet.com/pse/pago.aspx">
            <table align="center" border="1" width="640">
            <tr>
                <td width="30%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
                    <b> Documento </b></font></td>
                <td width="70%"><%=tot.elementAt(0)%></td>
            </tr>
            <tr>
                <td width="30%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
                    <b> Estudiante</b></font></td>
                <td width="70%"><%=tot.elementAt(1)%></td>
            </tr>
            <tr>
                <td width="30%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
                    <b> Orden Matrícula </b></font></td>
                <td width="70%"><%=tot.elementAt(4)%></td>
            </tr>
            <tr>
                <td width="30%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
                    <b> Valor </b></font></td>
                <td width="70%">$ <%=nf.format(val)%>   (<%=modo%>)</td>
            </tr>
            <tr>
                <td width="30%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
                    <b> IVA </b></font></td>
                <td width="70%">$ 0.00</td>
            </tr>
            <input type="hidden" name="Id" value="159cd765-1498-4806-a743-51ae33fc911c">
            <input type="hidden" name="CodigoServicio" value="8600348113">
            <input type="hidden" name="NoFact" maxlength="80" value="<%=tot.elementAt(4)%>">
            <input type="hidden" name="Ref1" maxlength="80" value="<%=tot.elementAt(3)%>">
            <input type="hidden" name="Ref2" maxlength="80" value="<%=tot.elementAt(1)%>">
            <input type="hidden" name="Ref3" maxlength="80" value="<%=tot.elementAt(2)%>">
            <input type="hidden" name="Valor" maxlength="10" value="<%=val%>">
            <input type="hidden" name="Iva" maxlength="8" value="0">           
            </table>
              <p align="center" >
                <input type="hidden" name="casig" value="<%=i%>">
                <input type="submit" value="PAGAR" name="B1"></p>
            </form>
<%      }
%>
        </tr>
        <tr> 
          <td valign="top" height="12"> 
            <table width="45%" border="0" align="right">
              <tr> 
                  <td width="27%" height="12"> 
                    <div align="center"> 
                      <%if (ban.equals("0")){%>
                      <font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">ANTERIOR</a> </font></b></font> 
                      <%} else {%>
                      <font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud1">ANTERIOR</a> </font></b></font> 
                      <%}%>
                    </div>
                  </td>
                  <td width="4%" height="12" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="12"> 
                    <%if (ban.equals("0")){%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">INICIO</a></font></b></font></div>
                    <%} else {%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud1">INICIO</a></font></b></font></div>
                    <%}%>
                  </td>
                  <td width="4%" height="12" align="center" valign="middle"> 
                    <div align="center"><b>|</b></div>
                  </td>
                  <td width="43%" height="12"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
                </tr>
              </table>
          
          </td>
          
        </tr>
        <tr>
          <td height="5" colspan="3" align="center">
            <img src="img/bararhoriz.gif" width="640" height="5"></td>
        </tr>
      </table>
  </tr>
</table>
</body>
</html>