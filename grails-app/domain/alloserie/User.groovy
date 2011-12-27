package alloserie

class User {

    String firstName
    String lastName
    short age
    String logging
    String password



    static constraints = {
      firstName(blank:false , maxSize: 20, nullable: false )
      lastName(blank:false , maxSize: 20, nullable: false)
      age(nullable: false , max: 105, min: 5)
      logging(nullable: false , maxSize: 20, minSize: 5, unique: true)
      password(nullable: false, minSize: 6)
    }
}
