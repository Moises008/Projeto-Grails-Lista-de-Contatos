<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%-- 1. SCRIPT ANTI-PISCADA --%>
    <script>
        (function() {
            const savedTheme = localStorage.getItem('theme') || 'light';
            document.documentElement.setAttribute('data-theme', savedTheme);
        })();
    </script>

    <title><g:layoutTitle default="Contacts Book"/></title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <asset:stylesheet src="application.css"/>

    <style>
        :root {
            --bg-body: #f4f7f6;
            --bg-sidebar: #ffffff;
            --bg-sidebar-hover: #f8f9fa;
            --bg-card: #ffffff;
            --text-color: #333333;
            --text-link: #007bff;
            --border-color: #dee2e6;
            --nav-bg: #343a40;
        }

        [data-theme="dark"] {
            --bg-body: #0f0f0f;
            --bg-sidebar: #1a1a1a;
            --bg-sidebar-hover: #2d2d2d;
            --bg-card: #1e1e1e;
            --text-color: #e0e0e0;
            --text-link: #66b0ff;
            --border-color: #333333;
            --nav-bg: #000000;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: var(--bg-body);
            color: var(--text-color);
            transition: background-color 0.3s ease;
        }

        /* Navbar e Sidebar */
        .navbar-custom { background: var(--nav-bg); color: white; height: 56px; position: fixed; top: 0; width: 100%; z-index: 1050; display: flex; align-items: center; justify-content: space-between; padding: 0 20px; }
        .sidebar { width: 220px; background: var(--bg-sidebar); border-right: 1px solid var(--border-color); position: fixed; height: 100%; }
        .sidebar li { border-bottom: 1px solid var(--border-color); }
        .sidebar li a { color: var(--text-link); display: block; padding: 15px 20px; text-decoration: none; }
        .sidebar li a:hover { background: var(--bg-sidebar-hover); }
        .main-content { margin-left: 220px; padding: 30px; width: calc(100% - 220px); flex-grow: 1; }
        .wrapper { display: flex; margin-top: 56px; min-height: calc(100vh - 56px); }


        [data-theme="dark"] .card,
        [data-theme="dark"] .card-body,
        [data-theme="dark"] .bg-white,
        [data-theme="dark"] .list-group-item {
            background-color: var(--bg-card) !important;
            color: var(--text-color) !important;
            border-color: var(--border-color) !important;
        }


        [data-theme="dark"] .table {
            color: var(--text-color) !important;
            background-color: var(--bg-card) !important;
        }
        [data-theme="dark"] .table td,
        [data-theme="dark"] .table th {
            border-top: 1px solid var(--border-color) !important;
        }
        [data-theme="dark"] .table thead th {
            background-color: #252525 !important;
            color: #66b0ff !important;
        }


        [data-theme="dark"] b,
        [data-theme="dark"] strong,
        [data-theme="dark"] label {
            color: #66b0ff !important;
        }


        [data-theme="dark"] .form-control {
            background-color: #2d2d2d !important;
            color: #ffffff !important;
            border: 1px solid var(--border-color) !important;
        }
    </style>
    <g:layoutHead/>
</head>
<body>

    <div class="navbar-custom shadow-sm">
        <div style="font-weight: bold; font-size: 1.1rem;">
            <i class="fas fa-address-book mr-2"></i> Grails Online Contacts Book
        </div>

        <div class="d-flex align-items-center">
            <button id="theme-toggle" class="btn btn-sm btn-outline-light mr-3" type="button" title="Trocar Tema">
                <span id="theme-icon">🌙</span>
            </button>

            <div class="dropdown">
                <a class="text-white dropdown-toggle" href="#" role="button" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="text-decoration: none;">
                    <i class="fas fa-user-circle mr-1"></i>
                    ${session.member ? session.member.email : 'System Administrator'}
                </a>
                <div class="dropdown-menu dropdown-menu-right shadow" aria-labelledby="userMenu">
                    <g:link controller="authentication" action="logout" class="dropdown-item text-danger font-weight-bold">
                        <i class="fas fa-sign-out-alt mr-2"></i> Logout
                    </g:link>
                </div>
            </div>
        </div>
    </div>

    <div class="wrapper">
        <nav class="sidebar">
            <ul>
                <li><g:link controller="dashboard" action="index">Dashboard</g:link></li>
                <li><g:link controller="contactGroup" action="index">Contact Group</g:link></li>
                <li><g:link controller="contact" action="index">Contact</g:link></li>
                <g:if test="${session.member?.admin}">
                    <li><g:link controller="member" action="index">Member</g:link></li>
                </g:if>
            </ul>
        </nav>

        <main class="main-content">
            <g:layoutBody/>
        </main>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <asset:javascript src="application.js"/>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const toggleBtn = document.getElementById('theme-toggle');
            const themeIcon = document.getElementById('theme-icon');
            const htmlElement = document.documentElement;


            const currentTheme = htmlElement.getAttribute('data-theme');
            updateIcon(currentTheme);

            if (toggleBtn) {
                toggleBtn.addEventListener('click', () => {
                    const theme = htmlElement.getAttribute('data-theme');
                    const newTheme = theme === 'light' ? 'dark' : 'light';

                    htmlElement.setAttribute('data-theme', newTheme);
                    localStorage.setItem('theme', newTheme);
                    updateIcon(newTheme);
                });
            }

            function updateIcon(theme) {
                if (themeIcon) {
                    themeIcon.textContent = theme === 'light' ? '🌙' : '☀️';
                }
            }
        });
    </script>
</body>
</html>