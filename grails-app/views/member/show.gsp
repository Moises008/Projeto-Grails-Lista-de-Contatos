<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Detalhes do Membro</title>
</head>
<body>

<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">Informações do Membro</h4>
            </div>
            <div class="panel-body">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <th style="width: 20%; background: #f9f9f9;">First Name</th>
                        <td>${memberInstance?.firstName}</td>
                    </tr>
                    <tr>
                        <th style="background: #f9f9f9;">Last Name</th>
                        <td>${memberInstance?.lastName}</td>
                    </tr>
                    <tr>
                        <th style="background: #f9f9f9;">Email</th>
                        <td>${memberInstance?.email}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="panel-footer">
                <g:link class="btn btn-primary" action="index">
                    <i class="fa fa-arrow-left"></i> Voltar para Lista
                </g:link>
                <g:link class="btn btn-info" action="edit" id="${memberInstance?.id}">
                    <i class="fa fa-edit"></i> Editar
                </g:link>
            </div>
        </div>
    </div>
</div>

</body>
</html>