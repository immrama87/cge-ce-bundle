<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<div>
	<ul class="background-primary-dark">
		<c:forEach items="${kapp.categories}" var="category">
			<%-- If the category is not hidden, and it contains at least 1 form --%>
			<c:if test="${fn:toLowerCase(category.getAttribute('Hidden').value) ne 'true'}">
				<li class="category">
					${text.escape(category.name)}
				</li>
			</c:if>
		</c:forEach>
	</ul>
</div>