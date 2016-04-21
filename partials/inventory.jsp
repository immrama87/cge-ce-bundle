<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<c:set var="params" value="${Resources.map()}"/>
<c:catch var="catchException">
	<c:set var="records" value="${Resources.search('CloudPassage%20Servers')}"/>
</c:catch>
<div class="col-md-6 widget report" widget-target="server-inventory" data-target="div.content" >
	<div class="wrap">
		<header>
			<div class="label gray-darkest">
				<span>Inventory View</span>
			</div>
		</header>
		<div class="content bg-gray-lightest">
		<c:choose>
			<c:when test="${catchException == null}">
				 <table class="hover dataTable no-footer">
				  <thead>
				   <tr>
					<th>Server</th>
					<th>Platform</th>
					<th>OS Version</th>
				   </tr>
				  </thead>
				  <tbody>
					<c:forEach var="record" items="${records}">
						<tr>
						 <td><a href="${kapp.slug}/server-details?id=${record.get('id')}">${text.escape(record.get('hostname'))}</a></td>
						 <td>${text.escape(record.get('platform'))}</td>
						 <td>${text.escape(record.get('osVersion'))}</td>
						</tr>
					</c:forEach>
				  </tbody>
				 </table>
			 </c:when>
			 <c:otherwise>
				<p>There was an exception while trying to fetch the server inventory.</p>
				<p>Exception information: ${catchException.message}</p>
			 </c:otherwise>
		 </c:choose>
		</div>
	</div>
</div>

