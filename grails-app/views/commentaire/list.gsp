<%@ page import="alloserie.Commentaire" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'commentaire.label', default: 'Commentaire')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                               args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="${message(code: 'commentaire.id.label', default: 'Id')}"/>

                <g:sortableColumn property="auteur"
                                  title="${message(code: 'commentaire.auteur.label', default: 'Auteur')}"/>

                <g:sortableColumn property="comment"
                                  title="${message(code: 'commentaire.comment.label', default: 'Comment')}"/>

                <g:sortableColumn property="date" title="${message(code: 'commentaire.date.label', default: 'Date')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${commentaireInstanceList}" status="i" var="commentaireInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${commentaireInstance.id}">${fieldValue(bean: commentaireInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: commentaireInstance, field: "auteur")}</td>

                    <td>${fieldValue(bean: commentaireInstance, field: "comment")}</td>

                    <td><g:formatDate date="${commentaireInstance.date}"/></td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${commentaireInstanceTotal}"/>
    </div>
</div>
</body>
</html>
