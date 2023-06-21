<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.baseDatos.BdAsignatura" %>
<%@ page import="estudiantes.configuracion.configECI" %>

<%  
    Vector prei = new Vector() ;
    Vector lisAsig = new Vector(), asig = new Vector() ;
    configECI cfgEci = new configECI();
    response.setHeader("Cache-Control","no-cache"); 
    String nombre = new String((String)session.getAttribute("nombre"));
    String nomas, oper, cred;
    String prog = new String();
    PrintWriter oout = response.getWriter() ;

    BdAsignatura bdAsig = new BdAsignatura() ;
    bdAsig.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
    Estudiante est = new Estudiante(carnet,oout) ;
    Vector lispre = est.getPreintermedio(carnet) ;
    lisAsig = bdAsig.ConsultaAsigInter(carnet) ;
    if (lisAsig.size() == 0)
        lisAsig = bdAsig.ConsultaAsigInter() ;
    int i, j ;
%>

<html>
<head>
<title>Horario Estudiantes</title>
<%
    out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
    out.println("<!-- ");
    out.println("function openPop(pagename){");
    out.println("window.open(pagename,'','top=30, left = 10,toolbar=no,scrollbars=yes,directories=no,status=no,menubar=yes,resizable=yes,height=400,width=620')} ");
    out.println("//-->"); 
    out.println("</SCRIPT>");
%>

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
              a Estudiantes - Preinscripción Periodo Intermedio&nbsp;</font></font></div>
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
          <form method="POST" action="../servlet/procpreintermedio/">
            <table width="100%" border="1" bordercolor="#336699">
              <tr bgcolor="#336699">
                <td width="15%"><div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Créditos</font></b></div></td>
                <td width="65%">
                  <p align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Asignatura</font></b></td>
                <td width="20%">
                  <p align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Operación</font></b></td>
              </tr>
<%  for (i = 0; i < lispre.size(); i++) {
        prei = (Vector) lispre.elementAt(i) ;
        nomas = "as" + i ;
        oper = "op" + i ;
        cred = "cred" + i ;
%>
	      <tr>       
		   <td>
		     <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                         <%=(String) prei.elementAt(2)%></font> </div>
                   </td>
		   <td>
		     <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                         <input type="hidden" name="<%=nomas%>" size="5" value="<%=(String) prei.elementAt(0)%>">
                         <input type="hidden" name="<%=cred%>" size="5" value="<%=(String) prei.elementAt(2)%>">
                         <%=(String) prei.elementAt(1)%></font> </div>
                   </td>
		   <td>
                        <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1"> 
                             <select size="1" name="<%=oper%>">
                                <option value="0" checked>Mantener</option>
                                <option value="1" checked>Eliminar</option>
                            </select>
                        </font>
                   </td>
           </tr>
<%
    }
%>
             <tr>
               <td>
                 <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                     Seleccione la Asignatura</font> </div>
               </td>
               <td>
                 <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                     <select size="1" name="asf1">
                     <%  for (j = 0; j < lisAsig.size(); j++) {
                            asig = (Vector) lisAsig.elementAt(j) ;
                     %>
                        <option value="<%=(String) asig.elementAt(0)%>"><%=(String) asig.elementAt(1)%></option>
                      <%   }%>
                     </select>
                  </font> </div>
               </td>
               <td>
                <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1">
                     <select size="1" name="opf1">
                        <option value="0" checked>No Preinscribir</option>
                        <option value="1" checked>Preinscribir</option>
                     </select>
                     <input type="hidden" name="cref1" size="5" value="<%=(String) asig.elementAt(2)%>">
                     <input type="hidden" name="cupf1" size="5" value="<%=(String) asig.elementAt(3)%>">
                    </font> </div>
               </td>
        </tr>
    </table>
    <input type="hidden" name="ncampos" size="2" value="<%=i%>">
    <br><input type="submit" value="Enviar Preinscripción" name="B1">
    </form>

    <p>
        Solo preinscriba las asignaturas teóricas. <br>
       Las asignaturas se preinscribirán en el orden dado.</p>
      <a href="JavaScript:openPop('../servlet/horAsig')"> Consulta de Cupos de Asignaturas </a> 
        <br><br>
    </td>
        </tr>
        <tr> 
         <td valign="top" colspan="2"> 
         <div align="right"> 
          <table width="45%" border="0" height="17">
            <tr> 
              <td width="27%" height="14"> 
                <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                  <a href="menuServEstud.jsp">ANTERIOR</a> </font></b></font></div>
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
