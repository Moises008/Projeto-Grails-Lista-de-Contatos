<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lista de Contatos</title>
</head>
<body>

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h1>Contatos</h1>

        <g:link controller="login"
                action="logout"
                class="btn btn-danger">
            Sair
        </g:link>
    </div>

    <h2>Novo Contato</h2>
    <g:form controller="contato" action="save">
        <label>Nome:</label><br/>
        <g:textField name="nome" value="${contato?.nome}"/><br/><br/>

        <label>Email:</label><br/>
        <g:textField name="email" value="${contato?.email}"/><br/><br/>

        <label>Telefone:</label><br/>
        <g:textField name="telefone" value="${contato?.telefone}"/><br/><br/>

        <g:submitButton name="salvar" value="Salvar" class="btn btn-primary"/>
    </g:form>

    <hr/>

    <div class="card shadow-sm mt-4">
        <div class="card-header">
            <h5 class="mb-0">Lista de Contatos</h5>
        </div>

        <div class="card-body p-0">
            <table class="table table-striped table-hover mb-0">
                <thead class="table-light">
                    <tr>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Telefone</th>
                        <g:if test="${session.usuario?.role == 'ADMIN'}">
                            <th class="text-center">Ações</th>
                        </g:if>
                    </tr>
                </thead>

                <tbody>
                    <g:each in="${contatos}" var="c">
                        <tr>
                            <td>${c.nome}</td>
                            <td>${c.email}</td>
                            <td>${c.telefone}</td>
                            <td class="text-center">
                                <g:if test="${session.usuario?.role == 'ADMIN'}">
                                    <g:link action="edit" id="${c.id}" class="btn btn-sm btn-warning">
                                        Editar
                                    </g:link>

                                    <g:link action="delete"
                                            id="${c.id}"
                                            class="btn btn-sm btn-danger"
                                            onclick="return confirm('Deseja excluir este contato?')">
                                        Excluir
                                    </g:link>
                                </g:if>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>


