package meu.projeto

import grails.gorm.transactions.Transactional

@Transactional
class ContactDetailsService {


    def save(ContactDetail contactDetail) {
        return contactDetail.save(flush: true)
    }


    ContactDetail get(Long id) {
        return ContactDetail.get(id)
    }


    def delete(Long id) {
        def contactDetail = ContactDetail.get(id)
        if (contactDetail) {
            contactDetail.delete(flush: true)
            return true
        }
        return false
    }
}