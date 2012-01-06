package alloserie

class HomeController {

    def index = {
        // Si une série n'a pas pu s'ajouter correctement, on prérempli les champs présents dans l'admin et on affiche les erreurs

        def serieInstance = new Serie()
        serieInstance.properties = params
        serieInstance.validate()
        [serieInstance: serieInstance]

        //Actor actorInstance = new Actor(params.actor)
        //[actorInstance, actorInstance]
    }
}
