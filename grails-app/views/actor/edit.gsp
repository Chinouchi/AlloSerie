<%@ page import="alloserie.Actor" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'actor.label', default: 'Actor')}"/>
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
    <g:hasErrors bean="${actorInstance}">
        <div class="errors">
            <g:renderErrors bean="${actorInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${actorInstance?.id}"/>
        <g:hiddenField name="version" value="${actorInstance?.version}"/>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="firstName"><g:message code="actor.firstName.label" default="First Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: actorInstance, field: 'firstName', 'errors')}">
                        <g:textField name="firstName" maxlength="20" value="${actorInstance?.firstName}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="lastName"><g:message code="actor.lastName.label" default="Last Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: actorInstance, field: 'lastName', 'errors')}">
                        <g:textField name="lastName" maxlength="20" value="${actorInstance?.lastName}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="bio"><g:message code="actor.bio.label" default="Bio"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: actorInstance, field: 'bio', 'errors')}">
                        <g:textField name="bio" value="${actorInstance?.bio}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="birthDate"><g:message code="actor.birthDate.label" default="Birth Date"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: actorInstance, field: 'birthDate', 'errors')}">
                        <g:datePicker name="birthDate" precision="day" value="${actorInstance?.birthDate}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="imagePath"><g:message code="actor.imagePath.label" default="Image Path"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: actorInstance, field: 'imagePath', 'errors')}">
                        <g:textField name="imagePath" value="${actorInstance?.imagePath}"/>
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
