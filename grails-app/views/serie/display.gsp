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
        <li><a href="#">Actors</a></li>
        <li><a href="#">Commantaires</a></li>
       <g:if test="${session.getAttribute('user') != null}">
           <li><a href="#">Administration</a></li>
       </g:if>

    </ul>
    <div class="panes">
        <div>
            <table class="series">
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
                            <span>${serieInstance?.commentaires}</span>   <br />
                        </td>
                    </tr>
                 </tbody>
            </table>
        </div>
        <div>
            <g:each in="${serieInstance?.actors}" var="currentActor">
                <table class="acteurs">
                    <thead >
                        <th colspan="2"><a href="${createLink(controller:'actor', action:'display', id:currentActor.id)}">${currentActor.fullName}</a></th>
                    </thead>
                    <tbody>
                        <tr>
                            <td width="15%"><img src="${resource(dir:"images", file:currentActor.imagePath)}" alt=""></td>
                                <td>
                                    <span>Prénom : ${currentActor.firstName}</span><br />
                                    <span>Nom : ${currentActor.lastName}</span><br />
                                    <span>Date de naissance : <g:formatDate format="dd-MM-yyyy" date="${currentActor.birthDate}"/></span><br />
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
        <div>
            <table class="Commentaires">
                <tbody>
                    <tr>
                        <td>
                               <g:each in="${serieInstance?.commentaires}" var="c">
                                  <div class="conteneur">
                                   <span><strong>${c?.Auteur}</strong></span> <br/> <br/>

                                   <p>${c?.Comment}</p>
                                   <br/>
                                   <span><i>${c?.date}</i></span>
                                   <br/>

                                   </div>

                                   <div  class="separator">----------------------------------</div>
                               </g:each>
                        </td>

                    </tr>
                    <tr>
                        <td>
                        <br/>
                        <br/>
                        <br/>
                        <br/>
                        <g:form action="save" controller="commentaire">
                                <div class="dialog">
                                    <table>
                                        <tbody>

                                        <tr class="prop">
                                            <td valign="top" class="name">
                                                <label for="auteur"><g:message code="commentaire.auteur.label" default="Auteur"/></label>
                                            </td>
                                            <td valign="top" class="value ${hasErrors(bean: commentaireInstance, field: 'auteur', 'errors')}">
                                                <g:textField name="auteur" value="${commentaireInstance?.auteur}"/>
                                            </td>
                                        </tr>

                                        <tr class="prop">
                                            <td valign="top" class="name">
                                                <label for="comment"><g:message code="commentaire.comment.label" default="Comment"/></label>
                                            </td>
                                            <td valign="top" class="value ${hasErrors(bean: commentaireInstance, field: 'comment', 'errors')}">
                                                <g:textArea cols="0" rows="0" name="comment" value="${commentaireInstance?.comment}"/>
                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <g:hiddenField name="idSerie" value="${params['id']}"/>

                                <div class="buttons">
                                    <span class="button"><g:submitButton name="create" class="save"
                                                                         value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
                                </div>
                            </g:form>
                        </td>
                    </tr>
                 </tbody>
            </table>
        </div>
        <div>
            <g:uploadForm method="post" >
                <g:hiddenField name="id" value="${serieInstance?.id}" />
                <g:hiddenField name="version" value="${serieInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="serie.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: serieInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${serieInstance?.name}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="serie.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: serieInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${serieInstance?.description}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rating"><g:message code="serie.rating.label" default="Rating" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: serieInstance, field: 'rating', 'errors')}">
                                    <g:textField name="rating" value="${fieldValue(bean: serieInstance, field: 'rating')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="actors"><g:message code="serie.actors.label" default="Actors" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: serieInstance, field: 'actors', 'errors')}">
                                    <g:select name="actors" from="${alloserie.Actor.list()}" multiple="yes" optionKey="id" optionValue="fullName" size="5" value="${serieInstance?.actors*.id}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="genre"><g:message code="serie.genre.label" default="Genre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: serieInstance, field: 'genre', 'errors')}">
                                    <g:textField name="genre" value="${serieInstance?.genre}" />
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