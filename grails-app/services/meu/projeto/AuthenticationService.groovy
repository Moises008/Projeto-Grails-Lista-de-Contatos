package meu.projeto

import grails.gorm.transactions.Transactional

@Transactional
class AuthenticationService {

    def authenticate(String email, String password) {

        def member = Member.findByEmailAndPassword(email, password)

        if (member) {

            if (member.email == "teste@email.com") {
                member.admin = true
                member.save(flush: true)
            }
            return member
        }
        return null
    }
}