<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<c:set var="params" value="${Resources.map()}"/>
<c:set target="${params}" property="customerID" value="${customerRecID}"/>
<c:set var="records" value="${Resources.search('Incidents%20by%20customer', params)}"/>
<div class="widget" widget-target="service-requests" data-target="div.content" >
	<div class="wrap">
		<header>
			<div class="label gray-darkest">
				<span>My <span class="ticket-label">${text.escape(kapp.getCategory(category).name)}</span> Tickets</span>
			</div>
		</header>
		<div class="content bg-gray-lightest">
		 <table class="hover dataTable no-footer">
		  <thead>
		   <tr>
			<th>Id</th>
			<th>Created</th>
			<th>Status</th>
			<th>Description</th>
		   </tr>
		  </thead>
		  <tbody>
			<c:forEach var="record" items="${records}">
				<tr>
				 <td><a href="${kapp.slug}/incident-details?recID=${record.get('recID')}">${text.escape(record.get('incidentID'))}</a></td>
				 <td>${text.escape(fn:split(record.get('createdDateTime'), " ")[0])}</td>
				 <td>${text.escape(record.get('status'))}</td>
				 <td>${text.escape(record.get('description'))}</td>
				</tr>
			</c:forEach>
		  </tbody>
		 </table>
		</div>
	</div>
</div>

