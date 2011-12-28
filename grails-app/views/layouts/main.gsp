<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="AlloSerie" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
        <script src="http://cdn.jquerytools.org/1.2.6/jquery.tools.min.js"></script>
       <!-- <script type="text/javascript" src="${resource(dir:'js',file:'mainjs.js')}"></script> -->


       <script type="text/javascript">
        $(function() {
	// setup ul.tabs to work as tabs for each div directly under div.panes
	$("ul.tabs").tabs("div.panes > div");
});</script>


        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="Loading..." />
        </div>
        <div id="banner"><img src="${resource(dir:'images',file:'banner.png')}" alt="Grails" border="0" /></div>
        <g:layoutBody />

    </body>
</html>