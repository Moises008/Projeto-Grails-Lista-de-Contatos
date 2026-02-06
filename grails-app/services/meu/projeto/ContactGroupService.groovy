package meu.projeto

class ContactGroupController {

    ContactGroupService contactGroupService

    def index() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        
        [contactGroupList: contactGroupService.list(params),
         contactGroupCount: contactGroupService.count()]
    }

    def show(Long id) {
        
        def contactGroup = contactGroupService.get(id)
        if (!contactGroup) {
            flash.error = "Grupo não encontrado!"
            redirect(action: "index")
            return
        }
        
        respond contactGroup, model: [contactList: contactGroup.contacts]
    }

    def create() {
        respond new ContactGroup(params)
    }

    def save() {
        
        def contactGroup = new ContactGroup(params)

        if (contactGroupService.save(contactGroup)) {
            flash.message = "Grupo '${contactGroup.name}' criado com sucesso!"
            redirect(action: "index")
        } else {
            
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
