<head>
    <meta name="layout" content="auth"/>
    <title>Member Login</title>
</head>

<body>
    <h5>Contacts Book Member Login</h5>
    <g:form controller="login" action="authenticate" method="POST">
        <div class="form-group mb-3 text-left">
            <input type="text" name="username" class="form-control" placeholder="Email/Username">
        </div>
        <div class="form-group mb-3 text-left">
            <input type="password" name="password" class="form-control" placeholder="******">
        </div>
        <button class="btn btn-primary btn-block w-100" type="submit">Login</button>
        <g:link controller="member" action="create" class="btn btn-outline-primary btn-block w-100 mt-2">
            Member Registration
        </g:link>
    </g:form>
</body>