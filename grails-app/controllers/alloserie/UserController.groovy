package alloserie

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        if(session.getAttribute("user") == null)
        {
            redirect(action:"signin", params: params)
        }
        redirect(action: "list", params: params)
    }

    def list = {
        if(session.getAttribute("user") == null)
        {
            redirect(action:"signin", params: params)
        }
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def save = {
        def userInstance = new User(params)
        if (userInstance.save(flush: true)) {
            flash.message = "L'utilisateur a bien été créé."
            session.setAttribute("user", userInstance);
            redirect(action: "show", id: userInstance.id)
        }
        else {
            render(view: "signup", model: [userInstance: userInstance])
        }
    }

    def signup = {
        def userInstance = new User()
        userInstance.properties = params
        return [userInstance: userInstance]
    }

    def signin = {
        def userInstance = new User()
        userInstance.properties = params
        return [userInstance: userInstance]
    }

    def checkSignIn = {
        def userInstance = new User(params)
        def dbUser = User.find(userInstance)
        if(dbUser != null)
        {
            userInstance = User.find(userInstance)
            session.setAttribute("id", userInstance.id)
            redirect(action: index, params: params)
        }
        else
        {
            flash.message = "Les identifiants rentrés sont incorrects"
        }
    }

    def show = {
        if(session.getAttribute("user") == null)
        {
            redirect(action:"signin", params: params)
        }
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userInstance: userInstance]
        }
    }

    def edit = {
        if(session.getAttribute("user") == null)
        {
            redirect(action:"signin", params: params)
        }
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userInstance: userInstance]
        }
    }

    def update = {
        if(session.getAttribute("user") == null)
        {
            redirect(action:"signin", params: params)
        }
        def userInstance = User.get(params.id)
        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {

                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.properties = params
            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "edit", model: [userInstance: userInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        if(session.getAttribute("user") == null)
        {
            redirect(action:"signin", params: params)
        }
        def userInstance = User.get(params.id)
        if (userInstance) {
            try {
                userInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }
}
