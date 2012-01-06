package alloserie


/**
 * Created by IntelliJ IDEA.
 * User: Rwave
 * Date: 27/12/11
 * Time: 10:45
 * To change this template use File | Settings | File Templates.
 */
class Serie {
    static hasMany = [actors: Actor]

    String name
    String genre
    String description
    short rating
    String imagePath

    static constraints = {
        name(nullable: false, blank:false, minSize: 2)
        description(nullable: true , maxSize: 15000, blank: false)
        rating(nullable: true, min : (short)0, max: (short)5, blank:false)
        imagePath(nullable: true)
        genre(blank:false)
    }
}
