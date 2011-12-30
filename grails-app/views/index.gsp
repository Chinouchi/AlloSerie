<%@ page import="alloserie.Actor; alloserie.Serie" %>
<html>
    <head>
        <title>Welcome to AlloSeries</title>
        <meta name="layout" content="main" />

    </head>
    <body>
       <ul class="tabs">
            <li><a href="#">Accueil</a></li>
            <li><a href="#">Series</a></li>
            <li><a href="#">Acteurs</a></li>
           <g:if test="${session.getAttribute('user') != null}">
               <li><a href="#">Administration</a></li>
           </g:if>
        </ul>

       <!-- onglets contenue 1 -->
        <div class="panes">
            <div>
                <fieldset id="news" title="News" > <legend>News :</legend></fieldset>
                <div id="fieldtv">
                    <fieldset id="toptv" title="Top TV Shows" > <legend>Top TV Shows :</legend></fieldset>
                    <fieldset id="todaytv"title="Today Show" > <legend>Today Show :</legend></fieldset>
                </div>
	        </div>

        <!-- onglets contenue 2-->
            <div>
                <g:each in="${Serie.findAll()}" var="currentSerie">
                    <table class="series">
                          <thead >
                            <th colspan="2"><a href="serie/display/${currentSerie.id}"> ${currentSerie.name}</a></th>

                           </thead>
                        <tbody>
                            <tr>
                                <td width="15%"><img src="${resource(dir:"images", file:currentSerie.imagePath)}" alt=""></td>
                                    <td>
                                    <span><strong>Genre(s) :</strong> ${currentSerie.genre}</span><br />
                                    <span><strong>Notation :</strong> ${currentSerie.rating}</span><br />
                                        <span><strong>Description :</strong></span>
                                   <g:if test="${currentSerie.description.length() > 200}">
                                       <span>${currentSerie.description.substring(0,200)} ... </span>
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
                <g:each in="${Actor.findAll()}" var="currentActor">
                    <table class="acteurs">
                          <thead >
                            <th colspan="2"><a href="${createLink(controller:'actor', action:'show', id:currentActor.id)}">${currentActor.fullName}</a></th>
                           </thead>
                        <tbody>
                            <tr>
                                <td width="15%"><img src="${resource(dir:"images", file:currentActor.imagePath)}" alt=""></td>
                                    <td>
                                        <span><strong>Prénom :</strong> ${currentActor.firstName}</span><br />
                                        <span><strong>Nom :</strong> ${currentActor.lastName}</span><br />
                                        <span><strong>Date de naissance :</strong> ${currentActor.birthDate.toLocaleString()}</span><br />
                                        <span><strong>Biographie :</strong></span><br/>
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

            <g:if test="${session.getAttribute('user') != null}">
                <div id="administrationTab">
                    <fieldset>
                       <legend>Ajouter une série</legend>
                       <g:uploadForm controller="serie" action="save" >
                            <div class="dialog">
                                <table>
                                    <tbody>

                                    <tr class="prop">
                                        <td valign="top" class="name">
                                            <label for="name"><g:message code="serie.name.label" default="Name"/></label>
                                        </td>
                                        <td valign="top" class="value ${hasErrors(bean: serieInstance, field: 'name', 'errors')}">
                                            <g:textField name="name" value="${serieInstance?.name}"/>
                                        </td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name">
                                            <label for="description"><g:message code="serie.description.label"
                                                                                default="Description"/></label>
                                        </td>
                                        <td valign="top" class="value ${hasErrors(bean: serieInstance, field: 'description', 'errors')}">
                                            <g:textArea name="description" cols="40" rows="5" value="${serieInstance?.description}"/>
                                        </td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name">
                                            <label for="rating"><g:message code="serie.rating.label" default="Rating"/></label>
                                        </td>
                                        <td valign="top" class="value ${hasErrors(bean: serieInstance, field: 'rating', 'errors')}">
                                            <g:textField name="rating" value="${fieldValue(bean: serieInstance, field: 'rating')}"/>
                                        </td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name">
                                            <label for="imageField">Image</label>
                                        </td>
                                        <td valign="top" class="value">
                                            <input type="file" id="imageField" name="image" />
                                        </td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name">
                                            <label for="genre"><g:message code="serie.genre.label" default="Genre"/></label>
                                        </td>
                                        <td valign="top" class="value ${hasErrors(bean: serieInstance, field: 'genre', 'errors')}">
                                            <g:textField name="genre" value="${serieInstance?.genre}"/>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>

                            <div class="buttons">
                                <span class="button"><g:submitButton name="create" class="save"
                                                                     value="${message(code: 'default.button.create.label', default: 'Ajouter')}"/></span>
                            </div>
                        </g:uploadForm>
                    </fieldset>
                    <fieldset>
                       <legend>Ajouter un auteur</legend>
                        <g:uploadForm controller="actor" action="save" >
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
                                                <g:textArea cols="40" rows="5" name="bio" value="${actorInstance?.bio}" />
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
                                                <label for="actorImageField"><g:message code="actor.imagePath.label" default="Image Path" /></label>
                                            </td>
                                            <td valign="top" class="value ${hasErrors(bean: actorInstance, field: 'imagePath', 'errors')}">
                                                 <input type="file" id="actorImageField" name="image" />
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>

                            <div class="buttons">
                                <span class="button"><g:submitButton name="create" class="save"
                                                                     value="${message(code: 'default.button.create.label', default: 'Ajouter')}"/></span>
                            </div>
                        </g:uploadForm>
                    </fieldset>
                </div>
            </g:if>
        </div>
    </body>
</html>
