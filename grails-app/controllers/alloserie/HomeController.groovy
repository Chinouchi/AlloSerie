package alloserie

class HomeController {

    def index = {
        // Si une série n'a pas pu s'ajouter correctement, on prérempli les champs présents dans l'admin et on affiche les erreurs
        if(params.containsKey("rating"))
        {
            def serieInstance = new Serie()
            serieInstance.properties = params
            serieInstance.validate()
            [serieInstance: serieInstance]
        }
        // Idem pour un acteur
        else if(params.containsKey("birthDate"))
        {
            def actorInstance = new Actor()
            actorInstance.properties = params
            actorInstance.validate()
            [actorInstance: actorInstance]
        }
    }
}
