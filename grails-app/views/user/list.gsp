
<%@ page import="alloserie.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'user.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'user.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'user.lastName.label', default: 'Last Name')}" />
                        
                            <g:sortableColumn property="age" title="${message(code: 'user.age.label', default: 'Age')}" />
                        
                            <g:sortableColumn property="login" title="${message(code: 'user.login.label', default: 'Login')}" />
                        
                            <g:sortableColumn property="password" title="${message(code: 'user.password.label', default: 'Password')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userInstanceList}" status="i" var="userInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: userInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: userInstance, field: "lastName")}</td>
                        
                            <td>${fieldValue(bean: userInstance, field: "age")}</td>
                        
                            <td>${fieldValue(bean: userInstance, field: "login")}</td>
                        
                            <td>${fieldValue(bean: userInstance, field: "password")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${userInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
