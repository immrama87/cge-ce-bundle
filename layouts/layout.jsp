<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0">
        <link rel="apple-touch-icon" sizes="76x76" href="${bundle.location}/images/apple-touch-icon.png">
        <link rel="icon" type="image/png" href="${bundle.location}/images/android-chrome-96x96.png" sizes="96x96">
        <link rel="icon" type="image/png" href="${bundle.location}/images/favicon-32x32.png" sizes="32x32">
        <link rel="icon" type="image/png" href="${bundle.location}/images/favicon-96x96.png" sizes="96x96">
        <link rel="icon" type="image/png" href="${bundle.location}/images/favicon-16x16.png" sizes="16x16">
        <link rel="shortcut icon" href="${bundle.location}/images/favicon.ico" type="image/x-icon"/>
        <app:headContent/>
        <bundle:stylepack>
            <bundle:style src="${bundle.location}/libraries/bootstrap/bootstrap.min.css" />
            <bundle:style src="${bundle.location}/libraries/notifie/jquery.notifie.css" />
			<bundle:style src="${bundle.location}/libraries/jquery-datatables/jquery.dataTables.min.css" />
            <bundle:style src="${bundle.location}/css/default.css "/>
			<bundle:style src="${bundle.location}/css/colors.css "/>
			<bundle:style src="${bundle.location}/css/common.css "/>
        </bundle:stylepack>
        <link href="${bundle.location}/libraries/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <bundle:scriptpack>
            <bundle:script src="${bundle.location}/libraries/kd-search/search.js" />
            <bundle:script src="${bundle.location}/libraries/bootstrap/bootstrap.min.js" />
            <bundle:script src="${bundle.location}/libraries/notifie/jquery.notifie.js" />
            <bundle:script src="${bundle.location}/libraries/jquery-datatables/jquery.dataTables.js" />
            <bundle:script src="${bundle.location}/libraries/typeahead/typeahead.min.js" />
            <bundle:script src="${bundle.location}/libraries/moment/moment.min.js" />
            <bundle:script src="${bundle.location}/libraries/moment/moment-timezone.min.js" />
            <bundle:script src="${bundle.location}/js/catalog.js" />
            <bundle:script src="${bundle.location}/js/review.js" />
			<bundle:script src="${bundle.location}/js/jstz.min.js" />
        </bundle:scriptpack>
        <c:if test="${empty sessionScope.timezone}">
            <script>
            $(document).ready(function() {
                $.ajax({
                    type : "get",
                    url : "?partial=setlocale",
                    data: {"timezone":moment.tz.guess()}
                });
            });
            </script>
        </c:if>
        <bundle:yield name="head"/>
        <style>
            <c:if test="${not empty kapp.getAttribute('logo-height-px')}">
                .navbar-brand {height:${kapp.getAttribute('logo-height-px').value}px;}
            </c:if>
        </style>
    </head>
    <body>
        <div class="view-port">
			<div class="col-md-2 col-sm-3 hidden-xs bg-gray-darkest sidebar">
				<c:import url="${bundle.path}/partials/sidebar.jsp" charEncoding="UTF-8"/>
			</div>
			<div class="col-xs-12 col-md-10 col-sm-9 main-content">
	            <c:if test="${not empty identity}">
                    <c:import url="${bundle.path}/partials/header.jsp" charEncoding="UTF-8"/>
                </c:if>
                <bundle:yield/>
			</div>
            <c:import url="${bundle.path}/partials/footer.jsp" charEncoding="UTF-8"/>
        </div>
    </body>
</html>
