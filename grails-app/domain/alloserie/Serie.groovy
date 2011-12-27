package alloserie

/**
 * Created by IntelliJ IDEA.
 * User: Rwave
 * Date: 27/12/11
 * Time: 10:45
 * To change this template use File | Settings | File Templates.
 */
class Serie {

    String name
    String genre
    String description
    short rating
    String imagePath

    static constraints = {
        name(nullable: false, minSize: 2)
        description(nullable: true , maxSize: 1500)
        rating(nullable: true, min : (short)0, max: (short)5)
        imagePath(nullable: true)
        genre()
    }

}
