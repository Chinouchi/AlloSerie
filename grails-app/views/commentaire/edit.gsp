<%@ page import="alloserie.Commentaire" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'commentaire.label', default: 'Commentaire')}"/>
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
    <g:hasErrors bean="${commentaireInstance}">
        <div class="errors">
            <g:renderErrors bean="${commentaireInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${commentaireInstance?.id}"/>
        <g:hiddenField name="version" value="${commentaireInstance?.version}"/>
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
                        <g:textField name="comment" value="${commentaireInstance?.comment}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="date"><g:message code="commentaire.date.label" default="Date"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: commentaireInstance, field: 'date', 'errors')}">
                        <g:datePicker name="date" precision="day" value="${commentaireInstance?.date}"/>
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
