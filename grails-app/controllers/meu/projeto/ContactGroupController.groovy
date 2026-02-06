package meu.projeto

import grails.gorm.transactions.Transactional

@Transactional
class ContactGroupService {

    // Método para buscar um grupo por ID
    ContactGroup get(Serializable id) {
        return ContactGroup.get(id)
    }

    // Método para salvar ou atualizar (recebe o objeto)
    def save(ContactGroup contactGroup) {
        return contactGroup.save(flush: true)
    }


    List<ContactGroup> list(Map params) {
        return ContactGroup.list(params)
    }


    Long count() {
        return ContactGroup.count()
    }


    def delete(Long id) {
        def contactGroup = ContactGroup.get(id)
        if (!contactGroup) {
            return false
        }


        def contactCount = Contact.countByContactGroup(contactGroup)
        if (contactCount > 0) {

            throw new Exception("Não é possível excluir: existem ${contactCount} contatos vinculados a este grupo.")
        }

        contactGroup.delete(flush: true)
        return true
    }
}