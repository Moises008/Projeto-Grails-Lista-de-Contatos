package meu.projeto

import grails.gorm.transactions.Transactional

class ContatoController {


    private boolean isAdmin() {
        session.usuario?.role == 'ADMIN'
    }

    def index() {
        [
                contatos: Contato.list(sort: 'id', order: 'desc'),
                contato : new Contato()
        ]
    }

    @Transactional
    def save() {
        def contato = new Contato(params)

        if (!contato.save(flush: true)) {
            flash.error = "Erro ao salvar contato"
            render(view: "index", model: [
                    contatos: Contato.list(sort: 'id', order: 'desc'),
                    contato : contato
            ])
            return
        }

        flash.message = "Contato salvo com sucesso"
        redirect(action: "index")
    }


    def edit(Long id) {

        if (!isAdmin()) {
            flash.error = "Você não tem permissão para editar contatos"
            redirect(action: "index")
            return
        }

        def contato = Contato.get(id)

        if (!contato) {
            flash.error = "Contato não encontrado"
            redirect(action: "index")
            return
        }

        render(view: "edit", model: [contato: contato])
    }


    @Transactional
    def update(Long id) {

        if (!isAdmin()) {
            flash.error = "Você não tem permissão para editar contatos"
            redirect(action: "index")
            return
        }

        def contato = Contato.get(id)

        if (!contato) {
            flash.error = "Contato não encontrado"
            redirect(action: "index")
            return
        }

        contato.properties = params

        if (!contato.save(flush: true)) {
            render(view: "edit", model: [contato: contato])
            return
        }

        flash.message = "Contato atualizado com sucesso"
        redirect(action: "index")
    }


    @Transactional
    def delete(Long id) {

        if (!isAdmin()) {
            flash.error = "Você não tem permissão para excluir contatos"
            redirect(action: "index")
            return
        }

        def contato = Contato.get(id)

        if (!contato) {
            flash.error = "Contato não encontrado"
            redirect(action: "index")
            return
        }

        contato.delete(flush: true)
        flash.message = "Contato excluído com sucesso"
        redirect(action: "index")
    }
}
