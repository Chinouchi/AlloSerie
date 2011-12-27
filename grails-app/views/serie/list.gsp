<%@ page import="alloserie.Serie" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'serie.label', default: 'Serie')}"/>
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

                <g:sortableColumn property="id" title="${message(code: 'serie.id.label', default: 'Id')}"/>

                <g:sortableColumn property="name" title="${message(code: 'serie.name.label', default: 'Name')}"/>

                <g:sortableColumn property="description"
                                  title="${message(code: 'serie.description.label', default: 'Description')}"/>

                <g:sortableColumn property="rating" title="${message(code: 'serie.rating.label', default: 'Rating')}"/>

                <g:sortableColumn property="imagePath"
                                  title="${message(code: 'serie.imagePath.label', default: 'Image Path')}"/>

                <g:sortableColumn property="genre" title="${message(code: 'serie.genre.label', default: 'Genre')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${serieInstanceList}" status="i" var="serieInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${serieInstance.id}">${fieldValue(bean: serieInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: serieInstance, field: "name")}</td>

                    <td>${fieldValue(bean: serieInstance, field: "description")}</td>

                    <td>${fieldValue(bean: serieInstance, field: "rating")}</td>

                    <td>${fieldValue(bean: serieInstance, field: "imagePath")}</td>

                    <td>${fieldValue(bean: serieInstance, field: "genre")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${serieInstanceTotal}"/>
    </div>
</div>
</body>
</html>
