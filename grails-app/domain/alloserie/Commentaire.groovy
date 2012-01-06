package alloserie

class Commentaire {
    String Comment
    String Auteur
    Date date
    static belongsTo = [serie: Serie]

    static constraints = {
           Comment(maxSize: 1500, minSize: 1 , blank: false)
           Auteur(nullable: false , maxSize: 50, minSize: 4, blank: false)
    }
}
