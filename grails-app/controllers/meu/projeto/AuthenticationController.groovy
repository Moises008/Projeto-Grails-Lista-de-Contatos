package meu.projeto

class AuthenticationController {

    MemberService memberService
    AuthenticationService authenticationService

    def login() {
        if (session.member) {
            redirect(controller: 'dashboard', action: 'index')
            return
        }
        render(view: 'login')
    }

    def authenticate() {
        String email = params.email?.trim()
        String password = params.password?.trim()


        def member = authenticationService.authenticate(email, password)

        if (member) {
            session.member = member
            log.info ">>> [LOGIN] Usuário: ${member.email} | Admin: ${member.admin}"
            redirect(controller: 'dashboard', action: 'index')
        } else {
            flash.message = "Email ou senha incorretos!"
            redirect(action: 'login')
        }
    }

    def logout() {
        session.invalidate()
        redirect(action: 'login')
    }


    def register() {
        render(view: 'register')
    }

    def saveMember() {
        def result = memberService.registerMember(params)
        if (result.success) {
            flash.message = "Cadastro realizado com sucesso!"
            redirect(action: 'login')
        } else {
            render(view: 'register', model: [member: result.member])
        }
    }
}