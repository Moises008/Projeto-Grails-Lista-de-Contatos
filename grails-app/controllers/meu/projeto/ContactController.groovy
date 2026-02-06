package meu.projeto

class ContactController {


    ContactService contactService

    ContactGroupService contactGroupService

    def index() {
        def result = contactService.list(params)
        respond result.contactList, model: [contactList: result.contactList, total: result.totalCount]
    }

    def create() {

        def groups = contactGroupService.list([:])
        respond new Contact(params), model: [groupList: groups]
    }

    def save() {
        def file = request.getFile('imageFile')
        byte[] imageBytes = (file && !file.empty) ? file.bytes : null
        List<Map> details = params.list('details')

        try {

            contactService.save(params, imageBytes, details)
            flash.message = "Contact saved successfully!"
            redirect(action: "index")
        } catch (Exception e) {
            log.error("Error saving contact: ${e.message}")
            def groups = contactGroupService.list([:])
            render(view: "create", model: [contact: new Contact(params), groupList: groups])
        }
    }

    def detail(Long id) {
        def contact = contactService.getById(id)
        if (!contact) {
            flash.error = "Contact not found"
            redirect(action: "index")
            return
        }
        [contact: contact]
    }

    def displayImage(Long id) {
        def contact = contactService.getById(id)
        if (contact && contact.image) {
            response.contentType = 'image/png'
            response.contentLength = contact.image.size()
            response.outputStream << contact.image
            response.outputStream.flush()
        }
    }

    def delete(Long id) {
        if (id == null) {
            flash.error = "ID do contato não encontrado."
            redirect(action: "index")
            return
        }

        if (contactService.delete(id)) {
            flash.message = "Contato excluído com sucesso!"
        } else {
            flash.error = "Falha ao excluir o contato."
        }

        redirect(action: "index")
    }

    def edit(Long id) {
        def contact = contactService.getById(id)

        if (!contact) {
            flash.error = "Contact not found"
            redirect(action: "index")
            return
        }


        try {

            contact.contactGroup?.id
        } catch (org.hibernate.ObjectNotFoundException e) {

            contact.contactGroup = null
        }

        def groups = contactGroupService.list([:])
        [contact: contact, groupList: groups]
    }

    def update(Long id) {
        def file = request.getFile('imageFile')
        byte[] imageBytes = file && !file.empty ? file.bytes : null

        // Captura a lista de detalhes do formulário (se houver)
        List<Map> details = params.list('details')

        try {
            contactService.update(id, params, details, imageBytes)
            flash.message = "Contact updated successfully!"
            redirect(action: "index")
        } catch (Exception e) {
            log.error("Update error: ${e.message}")
            def contact = contactService.getById(id)
            def groups = contactGroupService.list([:])
            render(view: "edit", model: [contact: contact, groupList: groups])
        }
    }
}