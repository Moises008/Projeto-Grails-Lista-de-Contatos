package meu.projeto

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class ContatoSpec extends Specification implements DomainUnitTest<Contato> {

    void "deve criar um contato valido"() {
        when: "um contato valido e criado"
        def contato = new Contato(
                nome: "João Silva",
                email: "joao@email.com",
                telefone: "11999999999"
        )

        then: "o contato deve ser valido"
        contato.validate()
        !contato.hasErrors()
    }

    void "nao deve permitir contato sem nome"() {
        when:
        def contato = new Contato(
                email: "semnome@email.com",
                telefone: "11988888888"
        )

        then:
        !contato.validate()
        contato.errors['nome']
    }
}
