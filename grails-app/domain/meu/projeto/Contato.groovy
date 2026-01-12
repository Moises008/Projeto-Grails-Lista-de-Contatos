package meu.projeto

class Contato {

    String nome
    String email
    String telefone

    static constraints = {
        nome blank: false
        email blank: false
        telefone blank: false
    }
}
