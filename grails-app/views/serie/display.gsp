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
                            <span>${serieInstance?.genre}</span><br />
                            <span>${serieInstance?.rating}</span>  <br />
                            <span>${serieInstance?.description}</span>   <br />
                        </td>
                    </tr>
                 </tbody>
            </table>
        </div>
        <div>
            <g:each in="${serieInstance?.actors}" var="currentActor">
                <table class="Acteurs">
                    <thead >
                        <th colspan="2"><a href="actor/show/${currentActor.id}"> ${currentActor.fullName}</a></th>
                    </thead>
                    <tbody>
                        <tr>
                            <td width="15%"><img src="${resource(dir:"images", file:currentActor.imagePath)}" alt=""></td>
                                <td>
                                    <span>Prénom : ${currentActor.firstName}</span><br />
                                    <span>Nom : ${currentActor.lastName}</span><br />
                                    <span>Date de naissance : ${currentActor.birthDate.toLocaleString()}</span><br />
                                    <g:if test="${currentActor.bio.length() > 200}">
                                       <span>${currentActor.bio.substring(0,200)} ... </span>
                                    </g:if>
                                    <g:else>
                                        <span>${currentActor.bio}</span>
                                    </g:else>
                                </td>
                        </tr>
                     </tbody>
                </table>
            </g:each>
        </div>
        <div>add acteur</div>
    </div>
  </body>
</html>