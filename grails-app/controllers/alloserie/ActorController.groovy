package alloserie

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.codehaus.groovy.grails.commons.GrailsResourceUtils

class ActorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(url:"../", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [actorInstanceList: Actor.list(params), actorInstanceTotal: Actor.count()]
    }

    def create = {
        def actorInstance = new Actor()
        actorInstance.properties = params
        return [actorInstance: actorInstance]
    }

    def save = {
        def actorInstance = new Actor(params)

        def downloadedFile = ((MultipartHttpServletRequest)request).getFile("image");
        if(downloadedFile != null && downloadedFile.originalFilename != ""){

            String newFileName = new Date().getTime() + downloadedFile.originalFilename;
            downloadedFile.transferTo(new File(GrailsResourceUtils.WEB_APP_DIR + "/images/actors/" + newFileName))
            actorInstance.imagePath = "actors/" + newFileName
        }

        if (actorInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'actor.label', default: 'Actor'), actorInstance.id])}"
            redirect(action: "show", id: actorInstance.id)
        }
        else {
            render(view: "create", model: [actorInstance: actorInstance])
        }
    }

    def show = {
        def actorInstance = Actor.get(params.id)
        if (!actorInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'actor.label', default: 'Actor'), params.id])}"
            redirect(action: "index")
        }
        else {
            [actorInstance: actorInstance]
        }
    }

    def edit = {
        def actorInstance = Actor.get(params.id)
        if (!actorInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'actor.label', default: 'Actor'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [actorInstance: actorInstance]
        }
    }

    def update = {
        def actorInstance = Actor.get(params.id)
        if (actorInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (actorInstance.version > version) {

                    actorInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'actor.label', default: 'Actor')] as Object[], "Another user has updated this Actor while you were editing")
                    render(view: "edit", model: [actorInstance: actorInstance])
                    return
                }
            }
            actorInstance.properties = params
            if (!actorInstance.hasErrors() && actorInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'actor.label', default: 'Actor'), actorInstance.id])}"
                redirect(action: "show", id: actorInstance.id)
            }
            else {
                render(view: "edit", model: [actorInstance: actorInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'actor.label', default: 'Actor'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def actorInstance = Actor.get(params.id)
        if (actorInstance) {
            try {
                actorInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'actor.label', default: 'Actor'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'actor.label', default: 'Actor'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'actor.label', default: 'Actor'), params.id])}"
            redirect(action: "index")
        }
    }
}
