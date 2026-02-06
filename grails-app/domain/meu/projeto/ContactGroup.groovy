package meu.projeto

class ContactGroup {
    String name
    Date dateCreated
    Date lastUpdated


    static hasMany = [contacts: Contact]

    static constraints = {
        name blank: false, unique: true
    }
}