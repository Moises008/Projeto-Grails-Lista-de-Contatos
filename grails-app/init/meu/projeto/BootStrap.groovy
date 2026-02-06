package meu.projeto

class BootStrap {


    AppInitializationService appInitializationService

    def init = { servletContext ->

        appInitializationService.initialize()
    }

    def destroy = {

    }
}