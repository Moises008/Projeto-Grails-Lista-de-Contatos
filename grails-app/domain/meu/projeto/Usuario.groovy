package meu.projeto

class Usuario {

    String username
    String password
    String role
    Boolean enabled
    Long version = 0

    static constraints = {
        username blank: false, unique: true
        password blank: false
        role blank: false
        enabled nullable: false
    }
}

