package alloserie

class HomeController {

    static allowedMethods = [serie:'POST']

    def index = {
        // Si une série n'a pas pu s'ajouter correctement, on prérempli les champs présents dans l'admin et on affiche les erreurs

        if(params.containsKey(""))
        {
            def serieInstance = new Serie()
            serieInstance.properties = params
            serieInstance.validate()
            [serieInstance: serieInstance]
        }

        //Actor actorInstance = new Actor(params.actor)
        //[actorInstance, actorInstance]
    }
}
