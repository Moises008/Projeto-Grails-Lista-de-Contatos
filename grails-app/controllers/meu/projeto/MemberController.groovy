package meu.projeto

class MemberController {

    MemberService memberService

    def index() {
        def result = memberService.list(params)
        [memberList: result.memberList, memberCount: result.totalCount]
    }

    def create() {
        [member: new Member()]
    }

    def save() {
        def result = memberService.registerMember(params)

        if (!result.success) {
            render view: 'create', model: [member: result.member]
            return
        }

        redirect action: 'index'
    }

    def delete(Long id) {
        memberService.delete(id)
        redirect action: 'index'
    }
    def edit(Long id) {
        def member = memberService.get(id)
        if (!member) {
            flash.message = "Membro não encontrado!"
            redirect action: 'index'
            return
        }
        [member: member]
    }

    def show(Long id) {

        def member = memberService.get(id)


        if (!member) {
            flash.message = "Membro não encontrado!"
            redirect action: 'index'
            return
        }


        [memberInstance: member]
    }

    def update(Long id) {
        def result = memberService.updateMember(id, params)

        if (!result.success) {

            render view: 'edit', model: [member: result.member]
            return
        }

        flash.message = "Membro atualizado com sucesso!"
        redirect action: 'index'
    }
}
