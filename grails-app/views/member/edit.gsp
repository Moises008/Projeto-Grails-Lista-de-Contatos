<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Member</title>
</head>
<body>

<div class="row">
    <div class="col-md-8 col-md-offset-2">

        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">Edit Member: ${member?.firstName}</h4>
            </div>

            <div class="panel-body">
                <g:form action="update" id="${member?.id}" method="POST">

                    <div class="form-group">
                        <label>First Name</label>
                        <g:textField name="firstName" class="form-control" value="${member?.firstName}" required="true"/>
                    </div>

                    <div class="form-group">
                        <label>Last Name</label>
                        <g:textField name="lastName" class="form-control" value="${member?.lastName}" required="true"/>
                    </div>

                    <div class="form-group">
                        <label>Email Address</label>
                        <g:field type="email" name="email" class="form-control" value="${member?.email}" required="true"/>
                    </div>

                    <div class="form-group">
                        <label>Password (leave blank to keep current)</label>
                        <g:passwordField name="password" class="form-control" placeholder="New password..."/>
                    </div>

                    <hr/>

                    <div class="pull-right">
                        <g:link action="index" class="btn btn-default">Cancel</g:link>
                        <g:submitButton name="update" value="Save Changes" class="btn btn-primary"/>
                    </div>

                </g:form>
            </div>
        </div>
    </div>
</div>

</body>
</html>