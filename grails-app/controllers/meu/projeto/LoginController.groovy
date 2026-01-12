package meu.projeto

class LoginController {

    def index() {

    }

    def autenticar() {
        println "👉 ENTROU NO AUTENTICAR"

        def user = Usuario.findByUsernameAndPassword(
                params.username, params.password
        )

        println "👉 USER ENCONTRADO? ${user}"

        if (user) {
            session.usuario = user
            println "👉 REDIRECIONANDO PARA CONTATO"
            redirect(controller: "contato", action: "index")
        } else {
            flash.message = "Usuário ou senha inválidos"
            redirect(action: "index")
        }
    }


    def logout() {
        session.invalidate()
        redirect(action: "index")
    }
}
