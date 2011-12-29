<%@ page import="alloserie.Serie" %>
<html>
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'serie.label', default: 'Serie')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

  <body>
         <ul class="tabs">
            <li><a href="#">Resume</a></li>
            <li><a href="#">Actors</a></li>
           <g:if test="${session.getAttribute('user') != null}">
               <li><a href="#">Administration</a></li>
           </g:if>
        </ul>
    <div class="panes">
        <div>
            <table class="Seriesalone">
                          <thead >
                            <th colspan="2"> ${serieInstance?.name}</th>

                           </thead>
                        <tbody>
                            <tr>
                                <td width="15%"><img src="${resource(dir:"images", file:serieInstance?.imagePath)}" alt=""></td>
                                    <td>
                                    <spam>${serieInstance?.genre}</spam><br />
                                    <spam>${serieInstance?.rating}</spam>  <br />
                                    <spam>${serieInstance?.description}</spam>   <br />
                                  </td>
                            </tr>
                         </tbody>
                    </table>
        </div>
        <div> acteur</div>
        <div>add acteur</div>
    <div>

  </body>
</html>