<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>

<%
        response.setHeader("Cache-Control", "no-cache");
        String mensaje = "Usted no tiene ninguna solicitud de readmisi�n en curso";
        configECI cfgEci = new configECI();
        Vector infread = new Vector();
        String nombre = new String((String) session.getAttribute("nombre"));
        Estudiante est = (Estudiante) session.getAttribute("estClase");
        String prog = "";
        String dpto = est.getDpto();
        String docEst = est.getDocest();
        BdEstudiante bdest = new BdEstudiante();
        bdest.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        Vector admi = bdest.AdmitidosReadmision(docEst, dpto);
//  Vector estadoread = bdest.EstadoReadmision(docEst, dpto) ;
        bdest.desconectar();
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <title>Servicios Acad�micos - Solicitud de readmisi�n</title>

    <!-- JavaScript -->
    <script type="text/javascript" src="scripts/wufoo.js"></script>

    <!-- CSS -->
      <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
    <script language="javascript">
        <!--
        function validar() {
            if(document.formulario1.asistir[0].checked){
                document.formulario1.target = "ventanaAsistir";
                document.formulario1.action = "ImpInvitacion";
                window.open("", "ventanaAsistir", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
                document.formulario1.submit();
                return false;
            }else if(document.formulario1.asistir[1].checked){
                if(confirm("Confirma que no desea asistir al evento?")){
                    document.formulario1.target = "ventanaAsistir";
                    document.formulario1.action = "ImpInvitacion";
                    window.open("", "ventanaAsistir", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
                    document.formulario1.submit();
                    history.back();
                }
            }else{
                alert("Debe escoger una opci�n");
            }
            return false;
        }
        -->
    </script>
</head>
  <body id="public" style="background-color: white">
        <div id="container">
            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
<tr>
    <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
</tr>
<tr>
    <td>

        <jsp:include page="encabezado" flush="true">
            <jsp:param name="anterior" value="menuServEstud" />
        </jsp:include>
    </td>
</tr>
<tr>
    <td colspan="2">
        <div class="info" align="center">
            <h2><font color="#666666">
                    <label id="msj">Respuesta de Admisi�n Proceso de Readmisiones </label>
            </font></h2>
    </div></td>
</tr>
<tr>
<td>

<%if ((admi.size()) == 0) {%>


<table width="70%" border="0" cellspacing="0" cellpadding="0" height="20"  class="texto1" align="center">
    <tr>
        <td>
            <div align="center"><br>
                No est� autorizado para realizar este proceso, por favor comun�quese con
                la Oficina de Admisiones. <br>
            Tel&eacute;fono: 6683600 Ext: 274, 263 o 101. </div>
        </td>
    </tr>
</table>


<%} else  { %>
      <table width="91%" border="0" cellspacing="0" cellpadding="0"  align="center" class="texto1">
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <%
    for (int k = 0; k < admi.size(); k++) {
        Vector readmi = (Vector) admi.elementAt(k);%>
        <%if (readmi.elementAt(1).equals("13")) {
        prog = "INGENIERIA CIVIL";

    } else if (readmi.elementAt(1).equals("14")) {
        prog = "INGENIERIA ELECTRICA";

    } else if (readmi.elementAt(1).equals("15")) {
        prog = "INGENIERIA DE SISTEMAS";

    } else if (readmi.elementAt(1).equals("16")) {
        prog = "INGENIERIA INDUSTRIAL";

    } else if (readmi.elementAt(1).equals("17")) {
        prog = "INGENIERIA ELECTRONICA";

    } else if (readmi.elementAt(1).equals("18")) {
        prog = "ECONOMIA";

    } else if (readmi.elementAt(1).equals("19")) {
        prog = "ADMINISTRACION DE EMPRESAS";

    } else if (readmi.elementAt(1).equals("20")) {
        prog = "MATEMATICAS";

    } else if (readmi.elementAt(1).equals("260")) {
        prog = "INGENIERIA MECANICA";

    }%>
        <tr> 
          <td colspan="2">Estudio de admisi&oacute;n para el programa de <b><%=prog%></b></td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td height="19" colspan="2"> 
            <p><%=readmi.elementAt(0)%></p>
          </td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2">Apreciado Aspirante:</td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>

        <%if (readmi.elementAt(2).equals("-13") && readmi.elementAt(4).equals("Z") ) {%>
        <tr> 
          <td colspan="2"> 
            <p><br>
              Le informamos que su solicitud de Readmisi&oacute;n para el periodo 
              <%=cfgEci.getPerOrdenes()%> </b>, ha sido aprobada. <br>
            </p>
            <p>Deber� cursar todas las asignaturas correspondientes al plan de 
              estudios vigente para el <%=cfgEci.getPerOrdenes()%> (consultar 
              en la p&aacute;gina web- Estudiantes- Servicios Acad&eacute;micos), 
              teniendo en cuenta el an&aacute;lisis de clasificaci&oacute;n de 
              los puntajes obtenidos en las &aacute;reas de inter&eacute;s del 
              ex&aacute;men de Estado con el que usted ingres&oacute; la primera 
              vez. Si usted ingres&oacute; por transferencia, se le tendr&aacute;n 
              en cuenta las homologaciones iniciales. Se le retirar�n del Registro 
              todas las calificaciones obtenidas en  las asignaturas cursadas 
              hasta el momento, aprobados o no aprobados,  para efectos de las condiciones
              de permanencia expresadas en el Reglamento Estudiantil y la expedici�n
              de certificados (Art�culo 92, Reglamento Estudiantil). </p>
            <p>Deber&aacute; presentarse a la Inducci&oacute;n que se llevar&aacute;
              a cabo el 27, 28 y 29 de Julio a partir de las 8:00 a.m en el Aula 
              M&aacute;xima. Adicionalmente con el &aacute;nimo de favorecer su 
              desempe&ntilde;o acad&eacute;mico en la Escuela se requiere la presencia 
              de los padres del estudiante el 29 de julio a las 4:00 p.m. en el 
              Aula M&aacute;xima, donde se dar&aacute; a conocer el programa de 
              acompa&ntilde;amiento, as&iacute; como la programaci&oacute;n de 
              las reuniones que se desarrollar&aacute;n durante el semestre.<br>
            </p>
            <p>Deber&aacute; presentar ex&aacute;men de diagn&oacute;stico as&iacute;: 
              (No aplica para transferencias) </p>
            <ul>
              <li>Jueves 30 de Julio a las 10:00 a.m : Matem&aacute;ticas (Para 
                todos los programas) </li>
              <li>Jueves 30 de Julio a la 01:00 p.m : Lenguaje (Para todos los 
                programas)</li>
              <li>Jueves 30 de Julio a las 03:00 p.m: F&iacute;sica (&Uacute;nicamente 
                para los programas de Ingenier&iacute;a y Matem&aacute;ticas).</li>
              <li>Viernes 31 de Julio a las 03:00 p.m: Qu&iacute;mica (&Uacute;nicamente 
                para los programas de Ingenier&iacute;a Industrial, Mec&aacute;nica 
                y Matem&aacute;ticas).</li>
            </ul>
            <p>Si el aspirante Readmitido desea solicitar su <b>reclasificaci�n 
              a un nivel superior</b>, deber� hacerlo mediante comunicaci�n escrita 
              firmada por el estudiante y su acudiente a m�s tardar el 31 de julio, 
              dirigida a la Secretar�a General Admisiones. Para ello se tomar� 
              como referencia el resultado obtenido en el examen diagn�stico y 
              en caso de ser reclasificado, el estudiante deber� proceder a ajustar 
              su registro de asignaturas seg�n corresponda el 3 de agosto en su 
              decanatura. </p>
            <p>As� mismo, si el estudiante desea su <b>reclasificaci�n a un nivel 
              inferior</b>, deber� manifestarlo mediante comunicaci�n escrita, 
              dirigida a Secretar�a General Admisiones a m�s tardar el 31 de julio 
              de 2009. Si esto sucede despu&eacute;s de haber hecho el horario, 
              deber&aacute; ajustar su registro de asignaturas seg�n corresponda 
              el 3 de agosto en su decanatura. 
            <p>La Escuela le asignar&aacute; un consejero acad&eacute;mico el 
              cual le ser&aacute; informado durante la primera semana de clases 
              a trav&eacute;s de su decanatura.</p>
            <p>Deber� imprimir nuevamente su orden de pago para cancelar los derechos 
              de matr�cula correspondientes, teniendo en cuenta que la orden anterior 
              expedida en Mayo no tiene validez en su caso. Una vez haya cancelado 
              deber� firmar acta de matr�cula y realizar su horario en las fechas 
              programadas para tal fin. <br>
            </p>
            <p>Al aceptar su readmisi&oacute;n se compromete a cumplir con el 
              reglamento estudiantil de la Escuela y en especial en lo relacionado 
              con las condiciones de permanencia expresadas en el Cap&iacute;tulo 
              III, t&iacute;tulo tercero.</p>
            <p>Le deseamos �xitos en el desarrollo de sus estudios. <br>
              <br>
              Atentamente, <br>
              Psi. Nancy Barrero Ram�rez Jefe de Admisiones </p>
            </td>
        </tr>
        <tr> 
          <td width="25%">
            <center>
              <a onclick="window.open('http://admisiones.escuelaing.edu.co/inscripcioneslinea/Guias?idprog=<%=readmi.elementAt(1)%>','','width=850,height=600,scrollbars=yes,top=80,left=100');"><img src="img/guiasexamen.gif" width="180" height="51"></a>
            </center>
          </td>
  <td width="51%">
            <div align="center"><a href="http://www.escuelaing.edu.co/documentos/Formalizacionesreadmision.pdf"><img src="img/insformaliza.gif" width="185" height="48"></a></div>
          </td>
        </tr>
        <%}  else if (readmi.elementAt(2).equals("-19") && readmi.elementAt(4).equals("Z") ){
      %>
      <tr>
         <td>
            Una vez estudiado su caso, lamentamos informarle que el comit� de Admisiones conceptu�
            no aprobar su solicitud de readmisi�n.
            <br>
                No obstante lo anterior, le agradecemos que haya escogido a la Escuela como una opci�n para adelantar
                sus estudios de Pregrado.
                <p>
                Atentamente,<br>
                Psi. Nancy Barrero<br>
                    Jefe de Admisiones
                </p>
         </td>
      </tr>


    <%}
        }

    
    }
%>
</table>
<p>&nbsp;</p>
</div>

</fieldset>                    </td>
</tr>

</table>

</div><!--container-->
   <footer style="position: static">
    <div class="container">
        <div class="row">
            <div class="col-8 oferta-academica">
                <ul>
                <h6>Oferta Educativa</h6>  
                   <li>Carreras profesionales</li>
                   <li>Especializaciones</li>
                   <li>Maestr�as</li>
                   <li>Doctorado</li>
                   <li>Educaci�n Continuada</li>
                   <li>Escuela Internacional de Verano</li> 
               </ul>
                
            </div>
            <div class="col localizacion-redes">
                <ul> 
                    <li><img width="60%" height="60%" src="img/Navegacion/acreditacion.png" class="img-fluid" alt="acreditaci�n institucional"></li><br>
                   <li>
                     <div class="row">
                         <div class="col-1 mr-2">
                            <img src="img/Navegacion/icono-localizacion.png" alt="localizacion">
                        </div>
                         <div class="col ml-1">
                             <p>AK. 45 n.� 205 - 59 (Autopista Norte)
                             <br>PBX: +57 (1) 668 3600 - Bogot�
                             <br>L�nea nacional gratuita: 018000112668</p>
                         </div>
                     </div>
                   </li>
                   <li>
                       <ul class="list-inline">
                           <li class="list-inline-item"><a href="https://www.facebook.com/EscuelaIng/" target="_blank"><img src="img/Navegacion/icono-facebook.png" class="img-fluid" alt="facebook"></a></li>
                           <li class="list-inline-item"><a href="https://twitter.com/Escuelaing" target="_blank"><img src="img/Navegacion/icono-twitter.png" class="img-fluid" alt="twitter"></a></li>
                           <li class="list-inline-item"><a href="https://www.linkedin.com/school/escuela-colombiana-de-ingenieria/" target="_blank"><img src="img/Navegacion/icono-linkedin.png" class="img-fluid" alt="linkedin"></a></li>
                           <li class="list-inline-item"><a href="https://www.instagram.com/somoscivilescuelaing/" target="_blank"><img src="img/Navegacion/icono-instagram.png" class="img-fluid" alt="instagram"></a></li>
                           <li class="list-inline-item"><a href="https://www.youtube.com/user/escuelacolingenieria" target="_blank"><img src="img/Navegacion/icono-youtube.png" class="img-fluid" alt="youtube"></a></li>
                       </ul>
                   </li>
               </ul>
            </div>
            <div class="col-12 derechos-reservados">
                <p>
                    Todos los derechos reservados �2011 - Escuela Colombiana de Ingenier�a Julio Garavito. Personer�a Jur�dica 086 de enero 19 de 1973. Renovaci�n de Acreditaci�n Institucional de Alta Calidad. Resoluci�n 002710 del 18 de marzo de 2019 (vigencia de 6 a�os). Vigilada por Mineducaci�n.
                </p>
            </div>
        </div>
    </div>
</footer>
</body>

</html>
</html>
