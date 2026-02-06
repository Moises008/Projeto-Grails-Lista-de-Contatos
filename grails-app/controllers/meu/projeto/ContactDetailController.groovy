package meu.projeto

class ContactDetailController {

    ContactDetailsService contactDetailsService
    ContactService contactService


    def create(Long contactId) {
        def contact = contactService.get(contactId)
        if (!contact) {
            flash.error = "Contato não encontrado!"
            redirect(controller: 'contact', action: 'index')
            return
        }
        [contactDetail: new ContactDetail(contact: contact)]
    }

    def save() {

        def contactDetail = new ContactDetail(params)


        if (contactDetailsService.save(contactDetail)) {
            flash.message = "Informações adicionais salvas!"

            redirect(controller: 'contact', action: 'show', id: contactDetail.contact.id)
        } else {
            render(view: 'create', model: [contactDetail: contactDetail])
        }
    }

    def delete(Long id) {
        def contactDetail = contactDetailsService.get(id)
        Long contactId = contactDetail?.contact?.id

        if (contactDetailsService.delete(id)) {
            flash.message = "Detalhe removido com sucesso."
        }

        redirect(controller: 'contact', action: 'show', id: contactId)
    }
}