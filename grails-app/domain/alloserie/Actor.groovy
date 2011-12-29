package alloserie

/**
 * Created by IntelliJ IDEA.
 * User: Rwave
 * Date: 27/12/11
 * Time: 10:45
 * To change this template use File | Settings | File Templates.
 */
class Actor {
    static hasMany = [series : Serie]
    static belongsTo = Serie

    String firstName
    String lastName
    Date birthDate
    String bio
    String imagePath

    static transients = [ 'fullName' ]
    public String getFullName(){return firstName + " " + lastName}

    static constraints = {
        id()
        firstName(nullable: false, minSize: 3, maxSize: 20)
        lastName(nullable: false, minSize: 3, maxSize: 20)
    }

}
