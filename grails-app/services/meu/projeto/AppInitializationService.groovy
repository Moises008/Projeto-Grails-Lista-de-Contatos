package meu.projeto

import grails.gorm.transactions.Transactional

@Transactional
class AppInitializationService {

    def initialize() {

        if (Member.countByEmail("teste@email.com") == 0) {
            println ">>> [INIT] Criando usuário administrador: Moises..."

            def testUser = new Member(
                    firstName: "Moises",
                    lastName: "User",
                    email: "teste@email.com",
                    password: "password123",
                    memberType: "ADMIN",
                    isActive: true,
                    admin: true
            )

            if (testUser.save(flush: true)) {
                println "------------------------------------------"
                println "SUCESSO: Usuario 'Moises' criado automaticamente!"
                println "------------------------------------------"
            } else {
                testUser.errors.allErrors.each { println it }
            }
        } else {
            println ">>> [INIT] Usuario administrador já existe no banco. Pulando..."
        }
    }
}