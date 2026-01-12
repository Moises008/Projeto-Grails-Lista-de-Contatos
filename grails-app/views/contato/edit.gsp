<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Editar Contato</title>
</head>
<body>

<h2>Editar Contato</h2>

<g:form action="update" method="POST">
    <g:hiddenField name="id" value="${contato.id}" />

    <div>
        <label>Nome</label><br/>
        <g:textField name="nome" value="${contato.nome}" required="true"/>
    </div>

    <div>
        <label>Email</label><br/>
        <g:textField name="email" value="${contato.email}" />
    </div>

    <div>
        <label>Telefone</label><br/>
        <g:textField name="telefone" value="${contato.telefone}" />
    </div>

    <br/>

    <g:submitButton name="atualizar" value="Atualizar"/>
    <g:link action="index">Cancelar</g:link>
</g:form>

</body>
</html>
