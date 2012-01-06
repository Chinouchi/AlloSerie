package alloserie

class Commentaire {
    String Comment
    String Auteur
    Date date
    static belongsTo = [serie: Serie]

    static constraints = {
           Comment(maxSize: 1500)
    }
}
