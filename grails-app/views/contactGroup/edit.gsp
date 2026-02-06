<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Edit Contact Group</title>
    </head>
    <body>
        <div class="card">
            <div class="card-header">
                <strong>Update Contact Group</strong>
            </div>
            <div class="card-body">
                <g:form resource="${this.contactGroup}" method="PUT">
                    <g:hiddenField name="version" value="${this.contactGroup?.version}" />

                    <div class="form-group">
                        <label for="name">Contact Group Name *</label>
                        <g:textField name="name" class="form-control" value="${contactGroup?.name}" required="" />
                    </div>

                    <div class="mt-3">
                        <button type="submit" class="btn btn-primary">
                             Update
                        </button>
                        <g:link class="btn btn-secondary" action="index">Cancel</g:link>
                    </div>
                </g:form>
            </div>
        </div>
    </body>
</html>