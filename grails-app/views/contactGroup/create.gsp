<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Create Contact Group</title>
    </head>
    <body>
        <div class="card">
            <div class="card-header">
                <strong>Create Contact Group</strong>
            </div>
            <div class="card-body">
                <g:form controller="contactGroup" action="save" method="POST">
                    <div class="form-group">
                        <label for="name">Group Name</label>
                        <g:textField name="name" class="form-control" value="${contactGroup?.name}" placeholder="Ex: Friends, Work, Family" required="required" />
                    </div>

                    <div class="mt-3">
                        <button type="submit" class="btn btn-success">
                            <i class="fa fa-save"></i> Save Group
                        </button>
                        <g:link class="btn btn-secondary" action="index">Cancel</g:link>
                    </div>
                </g:form>
            </div>
        </div>
    </body>
</html>