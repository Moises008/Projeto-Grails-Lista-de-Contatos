package meu.projeto

class ContactDetail {
    String type
    String mobileNumber
    String phoneNumber
    String email
    String website
    String address

    static belongsTo = [contact: Contact]

    static constraints = {

        mobileNumber nullable: false, blank: false
        email email: true, nullable: false, blank: false


        address nullable: true, blank: false
        type nullable: true, blank: false
        phoneNumber nullable: true, blank: false
        website nullable: true, blank: false
    }
}