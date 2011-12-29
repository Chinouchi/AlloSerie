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
            <div id="Seriesdiv">
                <g:each in="${Serie.findAll()}" var="currentSerie">
                    <table class="Series">
                          <thead >
                            <th colspan="2"><a href="serie/display/${currentSerie.id}"> ${currentSerie.name}</a></th>

                           </thead>
                        <tbody>
                            <tr>
                                <td width="15%"><img src="${resource(dir:"images", file:currentSerie.imagePath)}" alt=""></td>
                                    <td>
                                    <span>${currentSerie.genre}</span><br />
                                    <span>${currentSerie.rating}</span>  <br />
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

            <div id="Acteursdiv">
                <g:each in="${Actor.findAll()}" var="currentActor">
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

            <g:if test="${session.getAttribute('user') != null}">
                <div>
                    <fieldset id="addSerieFieldSet">
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
                    <fieldset id="editSerieFieldSet">
                       <legend>Editer une série</legend>
                    </fieldset>
                </div>
            </g:if>
        </div>
    </body>
</html>
