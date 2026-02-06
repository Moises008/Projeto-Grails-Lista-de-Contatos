<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>List Of Contact Group</title>
    </head>
    <body>

        <div class="card">
            <div class="card-header">
                <span class="float-left">List Of Contact Group</span>
                <div class="float-right">
                    <g:link class="btn btn-success" action="create">Create</g:link>
                    <g:link class="btn btn-primary" action="index">Reload</g:link>
                </div>
            </div>

            <div class="card-body">
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th>Name</th>
                            <th class="text-right">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${contactGroupList}" var="group">
                            <tr>
                                <td>${group.name}</td>
                                <td class="text-right">
                                    <div class="btn-group">
                                        <g:link class="btn btn-secondary" action="show" id="${group.id}">
                                            <i class="fa fa-eye"></i>
                                        </g:link>
                                        <g:link class="btn btn-secondary" action="edit" id="${group.id}">
                                            <i class="fa fa-edit"></i>
                                        </g:link>
                                        <g:link class="btn btn-secondary" action="delete" id="${group.id}" onclick="return confirm('Tem certeza?')">
                                            <i class="fa fa-trash"></i>
                                        </g:link>
                                    </div>
                                </td>
                            </tr>
                        </g:each>
                        <g:if test="${!contactGroupList}">
                            <tr>
                                <td colspan="2" class="text-center">Nenhum grupo encontrado.</td>
                            </tr>
                        </g:if>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>