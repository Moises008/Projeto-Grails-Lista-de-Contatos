package meu.projeto

class ContactGroupController {

    ContactGroupService contactGroupService

    def index() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        // Sincronizado com os métodos list() e count() do seu Service
        [contactGroupList: contactGroupService.list(params),
         contactGroupCount: contactGroupService.count()]
    }

    def show(Long id) {
        // Chamando .get() como definido no Service
        def contactGroup = contactGroupService.get(id)
        if (!contactGroup) {
            flash.error = "Grupo não encontrado!"
            redirect(action: "index")
            return
        }
        // Exibe o grupo e seus contatos (usando o hasMany do Domain)
        respond contactGroup, model: [contactList: contactGroup.contacts]
    }

    def create() {
        respond new ContactGroup(params)
    }

    def save() {
        // Criamos o objeto e passamos para o Service salvar
        def contactGroup = new ContactGroup(params)

        if (contactGroupService.save(contactGroup)) {
            flash.message = "Grupo '${contactGroup.name}' criado com sucesso!"
            redirect(action: "index")
        } else {
            // Caso haja erro de validação (ex: nome duplicado)
            render(view: 'create', model: [contactGroup: contactGroup])
        }
    }

    def edit(Long id) {
        def contactGroup = contactGroupService.get(id)
        if (!contactGroup) {
            flash.error = "Grupo não encontrado!"
            redirect(action: "index")
            return
        }
        respond contactGroup
    }

    def update(Long id) {
        def contactGroup = contactGroupService.get(id)
        if (!contactGroup) {
            flash.error = "Grupo não encontrado!"
            redirect(action: "index")
            return
        }

        // Aplica as mudanças dos campos
        contactGroup.properties = params

        if (contactGroupService.save(contactGroup)) {
            flash.message = "Grupo atualizado com sucesso!"
            redirect(action: "index")
        } else {
            render(view: 'edit', model: [contactGroup: contactGroup])
        }
    }

    def delete(Long id) {
        if (id == null) {
            flash.error = "ID do grupo não encontrado."
            redirect(action: "index")
            return
        }

        try {

            contactGroupService.delete(id)
            flash.message = "Grupo excluído com sucesso!"
        } catch (Exception e) {

            flash.error = e.message
        }

        redirect(action: "index")
    }
}