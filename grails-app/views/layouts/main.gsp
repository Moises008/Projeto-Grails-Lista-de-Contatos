<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title><g:layoutTitle default="Grails"/></title>

    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
</head>

<body class="bg-light">

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="/">
            <asset:image src="grails.svg" alt="Grails Logo" height="30"/>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarContent">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav me-auto">
                <g:pageProperty name="page.nav"/>
            </ul>
        </div>
    </div>
</nav>

<!-- CONTEÚDO -->
<main class="container my-4">

    <!-- FLASH MESSAGE -->
    <g:if test="${flash.message}">
        <div class="alert alert-success alert-dismissible fade show">
            ${flash.message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </g:if>

    <g:layoutBody/>
</main>

<!-- FOOTER -->
<footer class="bg-white border-top mt-5">
    <div class="container py-4">
        <div class="row text-center text-md-start">

            <div class="col-md-4 mb-3">
                <h6 class="fw-bold">
                    <asset:image src="advancedgrails.svg" width="24" class="me-2"/>
                    Grails Guides
                </h6>
                <p class="small text-muted">
                    Step-by-step tutorials to build Grails applications.
                </p>
            </div>

            <div class="col-md-4 mb-3">
                <h6 class="fw-bold">
                    <asset:image src="documentation.svg" width="24" class="me-2"/>
                    Documentation
                </h6>
                <p class="small text-muted">
                    Official Grails documentation and user guides.
                </p>
            </div>

            <div class="col-md-4 mb-3">
                <h6 class="fw-bold">
                    <asset:image src="slack.svg" width="24" class="me-2"/>
                    Community
                </h6>
                <p class="small text-muted">
                    Join the Grails community on Slack.
                </p>
            </div>

        </div>
    </div>
</footer>

<!-- SPINNER -->
<div id="spinner" class="position-fixed top-0 end-0 p-3" style="display:none;">
    <div class="spinner-border spinner-border-sm text-primary"></div>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
