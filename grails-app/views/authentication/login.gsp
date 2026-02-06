<!DOCTYPE html>
<html>
<head>
    <title>Login - Contacts Book</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f7f6;
            font-family: sans-serif;
        }
        .login-box {
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 350px;
            text-align: center;
        }
        .login-box h2 { color: #333; margin-bottom: 25px; }
        .form-input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .btn-login { background-color: #007bff; color: white; }
        .alert-error {
            color: #721c24;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Member Login</h2>

        <g:if test="${flash.message}">
            <div class="alert-error">${flash.message}</div>
        </g:if>

        <g:form controller="authentication" action="authenticate" method="POST">

            <input type="email" name="email" placeholder="Email" class="form-input" required="required">

            <input type="password" name="password" placeholder="Senha" class="form-input" required="required">

            <button type="submit" class="btn btn-login">Entrar</button>

            <div style="margin-top: 15px; text-align: center;">
                <g:link controller="authentication" action="register" style="color: #007bff; text-decoration: none;">
                    Não tem uma conta? Registre-se aqui
                </g:link>
            </div>

        </g:form>
    </div>
</body>
</html>