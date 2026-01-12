<%@ page import="grails.util.Environment; org.springframework.core.SpringVersion; org.springframework.boot.SpringBootVersion"
%><!doctype html>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lista de Contatos</title>
</head>
<body>

<h1>Contatos</h1>

<!-- Mensagem de sucesso -->
<g:if test="${flash.message}">
    <div style="color: green; font-weight: bold;">
        ${flash.message}
    </div>
</g:if>

<!-- Mensagem de erro -->
<g:if test="${flash.error}">
    <div style="color: red; font-weight: bold;">
        ${flash.error}
    </div>
</g:if>

<h2>Novo Contato</h2>

<g:form controller="contato" action="save">

    <label>Nome:</label><br/>
    <g:textField name="nome" value="${contato?.nome}"/><br/>
    <g:hasErrors bean="${contato}" field="nome">
        <span style="color:red">
            <g:fieldError bean="${contato}" field="nome"/>
        </span>
    </g:hasErrors>
    <br/>

    <label>Email:</label><br/>
    <g:textField name="email" value="${contato?.email}"/><br/>
    <g:hasErrors bean="${contato}" field="email">
        <span style="color:red">
            <g:fieldError bean="${contato}" field="email"/>
        </span>
    </g:hasErrors>
    <br/>

    <label>Telefone:</label><br/>
    <g:textField name="telefone" value="${contato?.telefone}"/><br/>
    <g:hasErrors bean="${contato}" field="telefone">
        <span style="color:red">
            <g:fieldError bean="${contato}" field="telefone"/>
        </span>
    </g:hasErrors>
    <br/><br/>

    <g:submitButton name="salvar" value="Salvar"/>
</g:form>

<hr/>

<table border="1">
    <tr>
        <th>Nome</th>
        <th>Email</th>
        <th>Telefone</th>
    </tr>

    <g:each in="${contatos}" var="c">
        <tr>
            <td>${c.nome}</td>
            <td>${c.email}</td>
            <td>${c.telefone}</td>
        </tr>
    </g:each>
</table>

</body>
</html>

