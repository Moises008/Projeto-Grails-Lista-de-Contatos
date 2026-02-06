package meu.projeto

class LoginController {


    AuthenticationService authenticationService

    def index() {

    }

    def autenticar() {
        println "👉 Solicitando autenticação ao Service para: ${params.email}"



        def user = authenticationService.authenticate(params.email, params.password)

        if (user) {
            session.usuario = user
            println "👉 SUCESSO: Redirecionando para o Dashboard"
            redirect(controller: "dashboard", action: "index")
        } else {
            println "👉 FALHA: Credenciais incorretas"
            flash.message = "E-mail ou senha inválidos"
            redirect(action: "index")
        }
    }

    def logout() {
        session.invalidate()
        redirect(action: "index")
    }
}