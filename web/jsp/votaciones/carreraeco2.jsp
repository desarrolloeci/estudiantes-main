<%@ page import = "javax.servlet.http.HttpSession" %>
<%  
    HttpSession sesion = request.getSession();
    String carnet = (String)session.getAttribute("carnet");

    if (carnet != null && !carnet.equals("")) {
%>
<html>

<head>
<title>Votaci�n</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="guardavotos">
<table border="0" cellspacing="0" cellpadding="0" width="725">
    <tr>
      <td height="14" valign="top" width="725"><font face="Impact" size="3">Comit�
      carrera&nbsp;&nbsp; <img src="img/gris.jpg" width="380" height="3"> </font><br>
      &nbsp;</td>
    </tr>
    <tr>
      <td height="14" width="725">Seleccione un s�lo candidato haciendo click en el circulo del
      cuadro rojo correspondiente al candidato deseado y presionando al final el bot�n de
      enviar voto.<p>&nbsp;</td>
    </tr>
    <tr align="center">
      <td height="12" valign="top" width="725"><table border="1" width="725">
        <tr>
          <td width="362"><table border="0" width="242">
            <tr>
              <td width="100" rowspan="2"><img src="img/Vizcaino.jpg" width="100" height="110"
              alt="wpe133.jpg (3748 bytes)" align="right"></td>
                  <td width="80" rowspan="2"><font size="1"><strong>JAIME RAFAEL 
                    VIZCAINO PULIDO</strong></font> 
                    <p>&nbsp;</td>
              <td width="62"><img src="img/tarjet2.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
            </tr>
            <tr>
              <td width="62"><div align="center"><center><table border="1" cellspacing="4" width="48%"
              bgcolor="#FF0000">
                <tr>
                  <td width="100%"><input type="radio" name="R1" value="1"></td>
                </tr>
              </table>
              </center></div></td>
            </tr>
          </table>
          </td>
          <td width="363"><table border="0" width="242">
            <tr>
              <td width="160" rowspan="2"><img src="img/blanco.jpg" width="140" height="95"
              alt="wpe133.jpg (3748 bytes)" align="right">&nbsp;<p>&nbsp;</p>
              <p>&nbsp;</td>
              <td width="90"><img src="img/nro2.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
            </tr>
            <tr>
              <td width="90"><div align="center"><center><table border="1" cellspacing="4" width="48%"
              bgcolor="#FF0000">
                <tr>
                  <td width="100%"><input type="radio" name="R1" value="2"></td>
                </tr>
              </table>
              </center></div></td>
            </tr>
          </table>
          </td>
        </tr>
  <input type="hidden" name="R1" value="R1">
<input type="hidden" name="nomcrp" value="vprg2">
<input type="hidden" name="codcrp" value="17">
<input type="hidden" name="carnet"  value="<%= carnet %>">
      </table>
      </td>
    </tr>
    <tr align="center">
      <td height="10" valign="top" width="725"></td>
    </tr>
    <tr align="center">
      <td height="10" valign="top" width="756"></td>
    </tr>
    <tr align="center">
      <td height="10" valign="top" width="756"><div align="center"><center><p><b><blink>Una vez
      seleccionado el candidato presione el bot�n&nbsp; =========&gt; </blink></b><input
      type="submit" value="Enviar  voto" name="B1">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
      </center></div><p>&nbsp;</td>
    </tr>
    <tr align="center">
      <td height="24" valign="top" width="756">
<p><font
      color="#CCCCCC" size="2"><a href="../../index.htm" target="_top"><font color="#999999">Escuela
      Colombiana de Ingenier�a</font></a><br>
      Avenida 13 No 205-59 Autopista Norte. Km 13 <br>
      Bogot�, D.C. - Colombia. Sur Am�rica<br>
      Webmaster: <a href="mailto:webmaster@escuelaing.edu.co"><font color="#999999">Home Page
      Escuela Colombiana de Ingenier�a</font></a></font> </td>
    </tr>
    <tr align="center">
      <td height="12" valign="top" width="91"><div align="center"></div></td>
    </tr>
  </table>
</form>
</body>
</html>
<%
    } else {
%>
<% response.sendRedirect("../estudiantes/jsp/login?msg=4") ; 	
    } 
%>
