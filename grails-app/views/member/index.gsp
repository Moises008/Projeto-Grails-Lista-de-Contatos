<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Member List</title>
    <style>
        .btn-group .btn i { margin-right: 0; }
        .action-column { width: 140px; text-align: center; }
        
        .fa-edit { color: #333; }
    </style>
</head>

<body>

<div class="row">
    <div class="col-md-12">

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="alert">
                ${flash.message}
            </div>
        </g:if>

        <div class="panel panel-default">
            <div class="panel-heading clearfix">
                <h4 class="panel-title pull-left" style="padding-top:7px;">
                    Member Management
                </h4>

                <div class="pull-right">
                    <g:form action="index" method="get" class="form-inline" style="display:flex; gap:6px">
                        <select class="form-control" name="field">
                            <option value="firstName" ${params.field == 'firstName' ? 'selected' : ''}>First Name</option>
                            <option value="lastName" ${params.field == 'lastName' ? 'selected' : ''}>Last Name</option>
                            <option value="email" ${params.field == 'email' ? 'selected' : ''}>Email</option>
                        </select>

                        <input type="text"
                               class="form-control"
                               name="search"
                               value="${params.search}"
                               placeholder="Search..."/>

                        <button type="submit" class="btn btn-default">
                            <i class="fa fa-search"></i> Search
                        </button>

                        <g:link class="btn btn-success" action="create">
                            <i class="fa fa-plus"></i> Create
                        </g:link>
                        <g:link class="btn btn-primary" action="index">
                            <i class="fa fa-sync"></i> Reload
                        </g:link>
                    </g:form>
                </div>
            </div>

            <div class="panel-body">
                <table class="table table-bordered table-hover">
                    <thead style="background:#2f3b43;color:#fff;">
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th class="action-column">Action</th>
                    </tr>
                    </thead>

                    <tbody>
                    <g:if test="${memberList}">
                        <g:each in="${memberList}" var="m">
                            <tr>
                                <td>${m.firstName}</td>
                                <td>${m.lastName}</td>
                                <td>${m.email}</td>
                                <td class="text-center">
                                    <div class="btn-group">
                                        <g:link action="show" id="${m.id}" class="btn btn-default btn-sm" title="View">
                                            <i class="fa fa-eye"></i>
                                        </g:link>

                                        <g:link action="edit" id="${m.id}" class="btn btn-default btn-sm" title="Edit">
                                            <i class="fa fa-edit"></i>
                                        </g:link>

                                        <g:link action="delete" id="${m.id}" class="btn btn-default btn-sm"
                                                title="Delete" onclick="return confirm('Are you sure you want to delete this member?')">
                                            <i class="fa fa-trash"></i>
                                        </g:link>
                                    </div>
                                </td>
                            </tr>
                        </g:each>
                    </g:if>
                    <g:else>
                        <tr>
                            <td colspan="4" class="text-center">No members found.</td>
                        </tr>
                    </g:else>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
