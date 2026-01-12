<!doctype html>
<html>
<head>
    <title>Login</title>
</head>
<body>

<h1>Login</h1>

<g:if test="${flash.error}">
    <div style="color:red">
        ${flash.error}
    </div>
</g:if>

<g:form controller="login" action="login" method="post">

    <label>Usuário:</label><br/>
    <g:textField name="username"/><br/><br/>

    <label>Senha:</label><br/>
    <g:passwordField name="password"/><br/><br/>

    <g:submitButton name="entrar" value="Entrar"/>

</g:form>

</body>
</html>
