<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<c:set var="params" value="${Resources.map()}"/>
<c:set var="records" value="${Resources.search('CloudPassage%20Servers')}"/>
<div class="col-md-6 widget report" widget-target="server-inventory" data-target="div.content" >
	<div class="wrap">
		<header>
			<div class="label gray-darkest">
				<span>Inventory View</span>
			</div>
		</header>
		<div class="content bg-gray-lightest">
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
		</div>
	</div>
</div>

