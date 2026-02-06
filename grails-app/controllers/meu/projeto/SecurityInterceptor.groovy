package meu.projeto

class SecurityInterceptor {

    SecurityInterceptor() {
        matchAll()
                .except(controller: 'authentication')
    }

    boolean before() {
        if (!session.member) {
            redirect(controller: 'authentication', action: 'login')
            return false
        }

        def adminVal = session.member.admin
        boolean isAdmin = adminVal.toString() == "true" || adminVal.toString() == "1"


        println ">>> [SECURITY] Usuário: ${session.member.email} | Admin Bruto: ${adminVal} | Final: ${isAdmin}"

        if (controllerName == 'member' && !isAdmin) {
            flash.error = "Acesso negado: Área restrita a administradores."
            redirect(controller: 'dashboard', action: 'index')
            return false
        }

        if (controllerName == 'contact' && (actionName in ['edit', 'update', 'delete']) && !isAdmin) {
            flash.error = "Você não tem permissão para esta ação."
            redirect(controller: 'contact', action: 'index')
            return false
        }

        return true
    }
}