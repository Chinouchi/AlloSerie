package alloserie

class CommentaireController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [commentaireInstanceList: Commentaire.list(params), commentaireInstanceTotal: Commentaire.count()]
    }

    def create = {
        def commentaireInstance = new Commentaire()
        commentaireInstance.properties = params
        return [commentaireInstance: commentaireInstance]
    }

    def save = {
        def serieInstance = Serie.get(params["idSerie"])
        def commentaireInstance = new Commentaire(params)
        commentaireInstance.date = new Date()
        commentaireInstance.serie = serieInstance
        if (commentaireInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'commentaire.label', default: 'Commentaire'), commentaireInstance.id])}"
            redirect(controller: "serie", action: "display", id: commentaireInstance.id)
        }
        else {
            render(view: "create", model: [commentaireInstance: commentaireInstance])
        }
    }

    def show = {
        def commentaireInstance = Commentaire.get(params.id)
        if (!commentaireInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'commentaire.label', default: 'Commentaire'), params.id])}"
            redirect(action: "list")
        }
        else {
            [commentaireInstance: commentaireInstance]
        }
    }

    def edit = {
        def commentaireInstance = Commentaire.get(params.id)
        if (!commentaireInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'commentaire.label', default: 'Commentaire'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [commentaireInstance: commentaireInstance]
        }
    }

    def update = {
        def commentaireInstance = Commentaire.get(params.id)
        if (commentaireInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (commentaireInstance.version > version) {

                    commentaireInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'commentaire.label', default: 'Commentaire')] as Object[], "Another user has updated this Commentaire while you were editing")
                    render(view: "edit", model: [commentaireInstance: commentaireInstance])
                    return
                }
            }
            commentaireInstance.properties = params
            if (!commentaireInstance.hasErrors() && commentaireInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'commentaire.label', default: 'Commentaire'), commentaireInstance.id])}"
                redirect(action: "show", id: commentaireInstance.id)
            }
            else {
                render(view: "edit", model: [commentaireInstance: commentaireInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'commentaire.label', default: 'Commentaire'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def commentaireInstance = Commentaire.get(params.id)
        if (commentaireInstance) {
            try {
                commentaireInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'commentaire.label', default: 'Commentaire'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'commentaire.label', default: 'Commentaire'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'commentaire.label', default: 'Commentaire'), params.id])}"
            redirect(action: "list")
        }
    }
}
