package alloserie

class News {
      String commentaire
      Date dateCommentaire

    static mapping = {
        sort dateCommentaire:'asc'
    }

    static constraints = {

    }
}
