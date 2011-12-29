<%@ page import="alloserie.Serie" %>
<html>
    <head>
        <title>Welcome to AlloSeries</title>
        <meta name="layout" content="main" />

    </head>
    <body>
       <ul class="tabs">
            <li><a href="#">Accueil</a></li>
            <li><a href="#">Series</a></li>

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
                <g:each var="currentserie" in="${Serie.findAll()}">
                    <table class="Series">
                          <thead >
                            <th colspan="2"><g:link controller="serie" action="display" id="${currentserie.id}"> ${currentserie.name}</g:link></th>

                           </thead>
                        <tbody>
                            <tr>
                                <td width="15%"><img src="${resource(dir:"images", file:currentserie.imagePath)}" alt=""></td>
                                    <td>
                                    <spam>${currentserie.genre}</spam><br />
                                    <spam>${currentserie.rating}</spam>  <br />
                                   <g:if test="${currentserie.description.length() > 200}">
                                       <spam>${currentserie.description.substring(0,200)} ... </spam>
                                    </g:if>
                                    <g:else>
                                        <spam>${currentserie.description} </spam>
                                    </g:else>
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
