<%@ page import="alloserie.Serie" %>
<html>
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'serie.label', default: 'Serie')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

  <body>
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
     <ul class="tabs">
        <li><a href="#">Resume</a></li>
        <li><a href="#">Series</a></li>
       <g:if test="${session.getAttribute('user') != null}">
           <li><a href="#">Administration</a></li>
       </g:if>
    </ul>
    <div class="panes">
        <div>
            <table class="actorAlone">
                <thead >
                   <th colspan="2"> ${actorInstance?.fullName}</th>
                </thead>
                <tbody>
                    <tr>
                        <td width="15%"><img src="${resource(dir:"images", file:actorInstance?.imagePath)}" alt=""></td>
                        <td>
                            <span><strong>Prénom :</strong> ${actorInstance.firstName}</span><br />
                            <span><strong>Nom :</strong> ${actorInstance.lastName}</span><br />
                            <span><strong>Date de naissance :</strong><g:formatDate format="dd-MM-yyyy" date="${actorInstance.birthDate}"/> </span><br />
                            <span><strong>Biographie :</strong></span><br/>
                            <g:if test="${actorInstance.bio?.length() > 200}">
                               <span>${actorInstance.bio?.substring(0,200)} ... </span>
                            </g:if>
                            <g:else>
                                <span>${actorInstance.bio}</span>
                            </g:else>
                        </td>
                    </tr>
                 </tbody>
            </table>
        </div>
        <div>
            <g:each in="${actorInstance?.series}" var="currentSerie">
                <table class="series">
                          <thead >
                            <th colspan="2"><g:link controller="serie" action="display" id="${currentSerie.id}"> ${currentSerie.name}</g:link></th>

                           </thead>
                        <tbody>
                            <tr>
                                <td width="15%"><img src="${resource(dir:"images", file:currentSerie.imagePath)}" alt=""></td>
                                    <td>
                                    <span><strong>Genre(s) :</strong> ${currentSerie.genre}</span><br />
                                    <span><strong>Notation :</strong> ${currentSerie.rating}</span><br />
                                        <span><strong>Description :</strong></span>
                                    <g:if test="${currentSerie.description?.length() > 200}">
                                       <span>${currentSerie.description?.substring(0,200)} ... </span>
                                    </g:if>
                                    <g:else>
                                        <span>${currentSerie.description} </span>
                                    </g:else>
                                    </td>
                            </tr>
                         </tbody>
                    </table>
            </g:each>
        </div>
        <div>
            <g:uploadForm method="post" >
                <g:hiddenField name="id" value="${actorInstance?.id}" />
                <g:hiddenField name="version" value="${actorInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="firstName"><g:message code="actor.firstName.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" maxlength="20" value="${actorInstance?.firstName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastName"><g:message code="actor.lastName.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" maxlength="20" value="${actorInstance?.lastName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bio"><g:message code="actor.bio.label" default="Bio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorInstance, field: 'bio', 'errors')}">
                                    <g:textField name="bio" value="${actorInstance?.bio}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="birthDate"><g:message code="actor.birthDate.label" default="Birth Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorInstance, field: 'birthDate', 'errors')}">
                                    <g:datePicker name="birthDate" precision="day" value="${actorInstance?.birthDate}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="imagePath"><g:message code="actor.imagePath.label" default="Image Path" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorInstance, field: 'imagePath', 'errors')}">
                                    <g:textField name="imagePath" value="${actorInstance?.imagePath}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="series"><g:message code="actor.series.label" default="Series" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: actorInstance, field: 'series', 'errors')}">

                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:uploadForm>
        </div>
    </div>
  </body>
</html>