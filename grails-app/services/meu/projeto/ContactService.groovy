package meu.projeto

import grails.gorm.transactions.Transactional

@Transactional
class ContactService {

    def save(Map contactParams, byte[] imageBytes, List<Map> detailsParams) {

        detailsParams.removeAll { !it.mobileNumber?.toString()?.trim() || !it.email?.toString()?.trim() }

        Contact contact = new Contact(contactParams)
        contact.image = imageBytes


        contact.save(failOnError: true)


        detailsParams.each { detailMap ->
            contact.addToDetails(new ContactDetail(detailMap))
        }

        return contact.save(flush: true)
    }

    def update(Long id, Map params, List<Map> detailsParams, byte[] imageBytes) {
        Contact contact = Contact.get(id)
        if (!contact) return null


        detailsParams.removeAll { !it.mobileNumber?.toString()?.trim() || !it.email?.toString()?.trim() }

        contact.properties = params
        if (imageBytes && imageBytes.length > 0) contact.image = imageBytes


        def oldDetails = contact.details ? new ArrayList(contact.details) : []
        oldDetails.each { detail ->
            contact.removeFromDetails(detail)
            detail.delete()
        }
        contact.save(flush: true)


        detailsParams.each { detailMap ->
            contact.addToDetails(new ContactDetail(detailMap))
        }

        return contact.save(flush: true)
    }

    def delete(Long id) {
        Contact.withTransaction { status ->
            def contact = Contact.get(id)
            if (contact) {
                try {

                    if (contact.hasProperty('imagePath') && contact.imagePath) {
                        File imageFile = new File(contact.imagePath)
                        if (imageFile.exists()) imageFile.delete()
                    }

                    def details = contact.details ? new ArrayList(contact.details) : []
                    details.each { it.delete() }

                    contact.delete(flush: true)
                    return true
                } catch (Exception e) {
                    status.setRollbackOnly()
                    return false
                }
            }
            return false
        }
    }

    @Transactional(readOnly = true)
    def list(Map params) {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def contactList = Contact.list(params)
        return [contactList: contactList, totalCount: Contact.count()]
    }

    @Transactional(readOnly = true)
    def getById(Long id) { return Contact.get(id) }
}