package meu.projeto

import java.util.Date

class Member {
    String firstName
    String lastName
    String email
    String password
    String memberType
    Boolean isActive

    Boolean admin = false

    Date dateCreated
    Date lastUpdated

    static constraints = {
        email email: true, unique: true
        password minSize: 6
        memberType nullable: true
        isActive nullable: true
        admin nullable: true
        dateCreated nullable: true
        lastUpdated nullable: true
    }
}