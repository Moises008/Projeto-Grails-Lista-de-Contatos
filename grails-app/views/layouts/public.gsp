<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><g:layoutTitle default="Login"/></title>
    <asset:stylesheet src="application.css"/> <style>
        body { background-color: #f8f9fa; display: flex; align-items: center; justify-content: center; height: 100vh; }
        .auth-card { width: 100%; max-width: 400px; padding: 20px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); background: white; border-radius: 8px; }
    </style>
    <g:layoutHead/>
</head>
<body>
    <div class="auth-card text-center">
        <asset:image src="grails_logo.png" width="80" class="mb-4"/> <g:layoutBody/> </div>
</body>
</html>