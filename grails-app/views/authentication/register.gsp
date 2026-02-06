<!DOCTYPE html>
<html>
<head>
    <title>Member Registration - Contacts Book</title>
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
        .register-box {
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 400px;
            text-align: left;
        }
        .register-box h2 { text-align: center; color: #333; margin-bottom: 25px; }
        .form-label { display: block; margin-bottom: 5px; font-weight: bold; font-size: 0.9em; color: #555; }
        .form-input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn-container { display: flex; gap: 10px; margin-top: 10px; }
        .btn {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            font-size: 0.9em;
        }
        .btn-register { background-color: #007bff; color: white; }
        .btn-back { background-color: #6c757d; color: white; }

        /* Estilos para as mensagens de erro e sucesso */
        .alert {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
            font-size: 0.85em;
        }
        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .error-list { margin: 0; padding-left: 20px; }
    </style>
</head>
<body>
    <div class="register-box">
        <h2>Member Registration</h2>

        <g:if test="${flash.error}">
            <div class="alert alert-danger">
                ${flash.error}
            </div>
        </g:if>

        <g:if test="${flash.message}">
            <div class="alert alert-success">
                ${flash.message}
            </div>
        </g:if>

        <g:hasErrors bean="${member}">
            <div class="alert alert-danger">
                <ul class="error-list">
                    <g:eachError bean="${member}" var="error">
                        <li><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>

        <g:form controller="authentication" action="saveMember" method="POST">

            <label class="form-label">First Name *</label>
            <g:textField name="firstName" class="form-input" placeholder="Name" required="required" value="${member?.firstName}"/>

            <label class="form-label">Last Name</label>
            <g:textField name="lastName" class="form-input" placeholder="Please Last Name" value="${member?.lastName}"/>

            <label class="form-label">Email Address *</label>
            <g:textField name="email" class="form-input" placeholder="Please Enter Email" required="required" value="${member?.email}"/>

            <label class="form-label">Password *</label>
            <g:passwordField name="password" class="form-input" placeholder="Please Enter Password" required="required"/>

            <div class="btn-container">
                <button type="submit" class="btn btn-register">Registration</button>
                <g:link controller="authentication" action="login" class="btn btn-back">Back to Login</g:link>
            </div>

        </g:form>
    </div>
</body>
</html>