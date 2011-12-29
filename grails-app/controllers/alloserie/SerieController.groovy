package alloserie

import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.util.ResourceUtils
import org.codehaus.groovy.grails.commons.GrailsResourceUtils

class SerieController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def display = {
      def serieInstance = Serie.get(params.id)
        if (!serieInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'serie.label', default: 'Serie'), params.id])}"
            redirect(url: "../index")
        }
        else {
            [serieInstance: serieInstance]
            render(view: "display" , model: [serieInstance: serieInstance])
        }
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [serieInstanceList: Serie.list(params), serieInstanceTotal: Serie.count()]
    }

    def create = {
        def serieInstance = new Serie()
        serieInstance.properties = params
        return [serieInstance: serieInstance]
    }

    def save = {
        def serieInstance = new Serie(params)
        def downloadedFile = ((MultipartHttpServletRequest)request).getFile("image");
        if(downloadedFile != null && downloadedFile != ""){
            downloadedFile.transferTo(new File(GrailsResourceUtils.WEB_APP_DIR + "/images/" + downloadedFile.originalFilename))
            serieInstance.imagePath = downloadedFile.originalFilename
        }

        if (serieInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'serie.label', default: 'Serie'), serieInstance.id])}"
            redirect(action: "show", id: serieInstance.id)
        }
        else {
            render(view: "create", model: [serieInstance: serieInstance])
        }
    }

    def show = {
        def serieInstance = Serie.get(params.id)
        if (!serieInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'serie.label', default: 'Serie'), params.id])}"
            redirect(action: "list")
        }
        else {
            [serieInstance: serieInstance]
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
                redirect(action: "show", id: serieInstance.id)
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
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'serie.label', default: 'Serie'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'serie.label', default: 'Serie'), params.id])}"
            redirect(action: "list")
        }
    }
}
