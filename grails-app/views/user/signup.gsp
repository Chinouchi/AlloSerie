

<%@ page import="alloserie.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>Nouvel utilisateur</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                            <td valign="top" class="name">
                                <label for="firstName"><g:message code="user.firstName.label" default="First Name"/></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'firstName', 'errors')}">
                                <g:textField name="firstName" maxlength="20" value="${userInstance?.firstName}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="lastName"><g:message code="user.lastName.label" default="Last Name"/></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'lastName', 'errors')}">
                                <g:textField name="lastName" maxlength="20" value="${userInstance?.lastName}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="age"><g:message code="user.age.label" default="Age"/></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'age', 'errors')}">
                                <g:textField name="age" value="${fieldValue(bean: userInstance, field: 'age')}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="logging"><g:message code="user.logging.label" default="Logging"/></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'logging', 'errors')}">
                                <g:textField name="logging" maxlength="20" value="${userInstance?.logging}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="password"><g:message code="user.password.label" default="Password"/></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                <g:textField name="password" value="${userInstance?.password}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="userType"><g:message code="user.userType.label" default="User Type"/></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'userType', 'errors')}">
                                <g:select name="userType" from="${userInstance.constraints.userType.inList}"
                                          value="${userInstance?.userType}" valueMessagePrefix="user.userType"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="S'enregistrer" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
