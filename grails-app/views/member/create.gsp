<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Create Member</title>
    </head>
    <body>
        <div class="container">
            <h2>Create New Member</h2>

            <g:form controller="member" action="save">
                <div class="form-group">
                    <label>First Name</label>
                    <g:textField name="firstName" class="form-control" value="${member?.firstName}" />
                </div>

                <div class="form-group">
                    <label>Last Name</label>
                    <g:textField name="lastName" class="form-control" value="${member?.lastName}" />
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <g:textField name="email" type="email" class="form-control" value="${member?.email}" />
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <g:passwordField name="password" class="form-control" />
                </div>

                <br/>
                <g:submitButton name="create" class="btn btn-primary" value="Save Member" />
                <g:link action="index" class="btn btn-default">Cancel</g:link>
            </g:form>
            <g:hasErrors bean="${member}">
                <div class="alert alert-danger">
                    <ul>
                        <g:eachError bean="${member}" var="error">
                            <li><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </div>
            </g:hasErrors>
        </div>
    </body>
</html>