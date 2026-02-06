package meu.projeto

import grails.gorm.transactions.Transactional

@Transactional
class MemberService {

    def registerMember(params) {
        def member = new Member()
        member.firstName = params.firstName
        member.lastName = params.lastName
        member.email = params.email
        member.password = params.password

        member.isActive = true
        member.memberType = "STANDARD"
        member.admin = false

        if (member.save(flush: true)) {
            return [success: true, member: member]
        } else {
            return [success: false, member: member]
        }
    }

    @Transactional(readOnly = true)
    def list(params) {

        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        params.offset = params.offset ?: 0

        def result = Member.createCriteria().list(params) {
            if (params.search) {
                or {
                    ilike("firstName", "%${params.search}%")
                    ilike("lastName", "%${params.search}%")
                    ilike("email", "%${params.search}%")
                }
            }
        }


        return [memberList: result, totalCount: result.totalCount]
    }

    def delete(Long id) {
        def member = Member.get(id)
        if (member) {
            member.delete(flush: true)
            return true
        }
        return false
    }

    def get(Long id) {
        return Member.get(id)
    }

    def updateMember(id, params) {
        def member = Member.get(id)
        if (member) {
            member.firstName = params.firstName
            member.lastName = params.lastName
            member.email = params.email


            if (params.password) {
                member.password = params.password
            }

            if (member.save(flush: true)) {
                return [success: true, member: member]
            }
        }
        return [success: false, member: member]
    }
}