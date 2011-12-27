<%@ page import="alloserie.Serie" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'serie.label', default: 'Serie')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                           args="[entityName]"/></g:link></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                               args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${serieInstance}">
        <div class="errors">
            <g:renderErrors bean="${serieInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${serieInstance?.id}"/>
        <g:hiddenField name="version" value="${serieInstance?.version}"/>
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
                        <label for="imagePath"><g:message code="serie.imagePath.label" default="Image Path"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: serieInstance, field: 'imagePath', 'errors')}">
                        <g:textField name="imagePath" value="${serieInstance?.imagePath}"/>
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
            <span class="button"><g:actionSubmit class="save" action="update"
                                                 value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
            <span class="button"><g:actionSubmit class="delete" action="delete"
                                                 value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                 onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
        </div>
    </g:form>
</div>
</body>
</html>
