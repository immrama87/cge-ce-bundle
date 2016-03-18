<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<c:set var="params" value="${Resources.map()}"/>
<c:set target="${params}" property="customerId" value="940a07e1604fa7c89307eb44a98e8c073ffd60bab8"/>
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
				 <td>${text.escape(record.get('incidentId'))}</td>
				 <td>${text.escape(record.get('createdDateTime'))}</td>
				 <td>${text.escape(record.get('status'))}</td>
				 <td>${text.escape(record.get('description'))}</td>
				</tr>
			</c:forEach>
		  </tbody>
		 </table>
		</div>
	</div>
</div>

