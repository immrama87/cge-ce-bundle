<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<div class="col-md-6 widget report" widget-target="server-inventory" data-target="div.content" >
	<div class="wrap">
		<header>
			<div class="label gray-darkest">
				<span>Financial Management View</span>
			</div>
		</header>
		<div class="content bg-gray-lightest">
			<iframe src="${kapp.getAttribute('Financial Management URL').value}"></iframe>
		</div>
	</div>
</div>

