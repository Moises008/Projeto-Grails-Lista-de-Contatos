<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Cadastro</title>
</head>
<body>

<h2>Cadastro de Membro</h2>

<g:form controller="registro" action="salvar">
    <div>
        <label>Usuário</label><br>
        <input type="text" name="username" required />
    </div>

    <div>
        <label>Senha</label><br>
        <input type="password" name="password" required />
    </div>

    <br>
    <button type="submit">Cadastrar</button>
</g:form>

<br><br>

<g:link controller="login" action="index">
    Voltar para login
</g:link>

<g:if test="${flash.message}">
    <p style="color:red">${flash.message}</p>
</g:if>

</body>
</html>
