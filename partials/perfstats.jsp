<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<c:set var="params" value="${Resources.map()}"/>
<c:set var="records" value="${Resources.search('CloudPassage%20Servers')}"/>
<div class="col-md-6 widget report" widget-target="server-inventory" data-target="div.content" >
	<div class="wrap">
		<header>
			<div class="label gray-darkest">
				<span>Performance Stats</span>
			</div>
		</header>
		<div class="content bg-gray-lightest">
			<iframe src="${kapp.getAttribute('PerformanceStatsURL').value}"></iframe>
		</div>
	</div>
</div>

