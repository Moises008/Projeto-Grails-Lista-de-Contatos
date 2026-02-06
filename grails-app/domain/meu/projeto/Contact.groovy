package meu.projeto

class Contact {
    String contactName
    byte[] image

    Date dateCreated
    Date lastUpdated



    static belongsTo = [contactGroup: ContactGroup]


    static hasMany = [details: ContactDetail]

    static mapping = {
        table 'contact'
        image sqlType: 'longblob'

        details cascade: "all-delete-orphan"
    }

    static constraints = {
        contactName blank: false
        contactGroup nullable: false
        image nullable: true
    }
}