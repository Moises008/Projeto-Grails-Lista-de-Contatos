package meu.projeto

class UrlMappings {
    static mappings = {
        "/"(controller: "dashboard", action: "index")
        "/$controller/$action?/$id?(.$format)?"{
            constraints { }
        }
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}