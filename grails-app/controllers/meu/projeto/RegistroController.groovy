package meu.projeto

import grails.gorm.transactions.Transactional

class RegistroController {

    def index() {

    }

    @Transactional
    def salvar() {

        if (!params.username || !params.password) {
            flash.message = "Preencha todos os campos"
            redirect(action: "index")
            return
        }

        if (Usuario.findByUsername(params.username)) {
            flash.message = "Usuário já existe"
            redirect(action: "index")
            return
        }

        def usuario = new Usuario(
                username: params.username,
                password: params.password,
                role: 'MEMBER',
                enabled: true
        )

        if (usuario.save(flush: true)) {
            flash.message = "Cadastro realizado com sucesso"
            redirect(controller: "login", action: "index")
        } else {
            flash.message = "Erro ao cadastrar"
            redirect(action: "index")
        }
    }
}
