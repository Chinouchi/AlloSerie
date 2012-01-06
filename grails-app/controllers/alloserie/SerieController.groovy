package alloserie

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.codehaus.groovy.grails.commons.GrailsResourceUtils

class SerieController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(controller: "home", action: "index", params: params)
    }

    def display = {
      def serieInstance = Serie.get(params.id)
        if (!serieInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'serie.label', default: 'Serie'), params.id])}"
            redirect(action: index)
        }
        else {
            [serieInstance: serieInstance]
        }
    }



    def create = {
        def serieInstance = new Serie()
        serieInstance.properties = params
        return [serieInstance: serieInstance]
    }

    def save = {
        def serieInstance = new Serie(params)
        def downloadedFile = ((MultipartHttpServletRequest)request).getFile("image");
        if(downloadedFile != null && downloadedFile.originalFilename != ""){

            String newFileName = new Date().getTime() + downloadedFile.originalFilename;
            downloadedFile.transferTo(new File(GrailsResourceUtils.WEB_APP_DIR + "/images/series/" + newFileName))
            serieInstance.imagePath = "series/" + newFileName
        }

        if (serieInstance.save(flush: true, validate : true)){
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'serie.label', default: 'Serie'), serieInstance.id])}"
            redirect(action: "display", id: serieInstance.id)
        }
        else {
            redirect(controller:"home", action: "index", params : params, method:"post")
        }
    }

    def edit = {
        def serieInstance = Serie.get(params.id)
        if (!serieInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'serie.label', default: 'Serie'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [serieInstance: serieInstance]
        }
    }

    def update = {
        def serieInstance = Serie.get(params.id)
        if (serieInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (serieInstance.version > version) {

                    serieInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'serie.label', default: 'Serie')] as Object[], "Another user has updated this Serie while you were editing")
                    render(view: "edit", model: [serieInstance: serieInstance])
                    return
                }
            }
            serieInstance.properties = params
            if (!serieInstance.hasErrors() && serieInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'serie.label', default: 'Serie'), serieInstance.id])}"
                //ajout de la news

                News nouvelle = new News()
                nouvelle.dateCommentaire = new Date()
                nouvelle.version = 1
                nouvelle.commentaire = "La serie ${serieInstance.name} a été mis a jour"
                nouvelle.save()


                redirect(action: "display", id: serieInstance.id)
            }
            else {
                render(view: "edit", model: [serieInstance: serieInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'serie.label', default: 'Serie'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def serieInstance = Serie.get(params.id)
        if (serieInstance) {
            try {
                serieInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'serie.label', default: 'Serie'), params.id])}"
                redirect(action: "index")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'serie.label', default: 'Serie'), params.id])}"
                redirect(action: "display", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'serie.label', default: 'Serie'), params.id])}"
            redirect(action: "index")
        }
    }
}
