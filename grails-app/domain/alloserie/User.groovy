package alloserie

class User {

    String firstName
    String lastName
    short age
    String login
    String password
    String userType


    static constraints = {
      firstName(blank:false , maxSize: 20, nullable: false )
      lastName(blank:false , maxSize: 20, nullable: false)
      age(nullable: false , max: (short)105, min:  (short)5)
      login(nullable: false , maxSize: 20, minSize: 5, unique: true)
      password(nullable: false, minSize: 6)
      userType inList: ["Admin", "User"]
    }
}
