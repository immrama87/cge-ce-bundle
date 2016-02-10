<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<div>
	<ul class="sidebar-nav">
		<li class="category">
			<a class="white color-hover-ice" href="javascript:void(0);" aria-label="My Dashboard">
				<i class="fa fa-th-large"></i>
				<span>My Dashboard</span>
			</a>
		</li>
		<c:forEach items="${kapp.categories}" var="category">
			<%-- If the category is not hidden, and it contains at least 1 form --%>
			<c:if test="${fn:toLowerCase(category.getAttribute('Hidden').value) ne 'true'}">
				<li class="category">
					<a class="white color-hover-ice" href="${bundle.spaceLocation}/${kapp.slug}?page=categories&category=${category.name}" aria-label="${text.escape(category.name)}">
						<i class="fa ${category.getAttribute('fa-logo').value}"></i>
						<span>${text.escape(category.name)}</span>
					</a>
				</li>
			</c:if>
		</c:forEach>
	</ul>
</div>