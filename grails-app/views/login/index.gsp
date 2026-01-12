<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Login</title>
</head>
<body>

<h2>Login</h2>

<g:if test="${flash.message}">
    <div style="color:red">${flash.message}</div>
</g:if>

<g:form controller="login" action="autenticar" method="post">
    <label>Usuário</label>
    <input type="text" name="username"/>

    <label>Senha</label>
    <input type="password" name="password"/>

    <button type="submit">Entrar</button>
</g:form>

<br>
<g:link controller="registro" action="index">
    Registrar-se como membro
</g:link>

</body>
</html>
