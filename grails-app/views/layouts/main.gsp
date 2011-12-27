<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="AlloSerie" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Loading..." />
        </div>

         <div id="banner"><img src="${resource(dir:'images',file:'banner.png')}" alt="Grails" border="10"  /></div>
        <g:layoutBody />
    </body>
</html>