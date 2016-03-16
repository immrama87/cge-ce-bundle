<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<div>
	<div class="bg-black hidden-xs">
	    <c:if test="${kapp != null}">
	        <a class="logo bg-black" href="${bundle.kappLocation}">
	            <c:if test="${not empty kapp.getAttribute('logo-url')}">
	                <img class="bg-black" src="${bundle.location}/images/${kapp.getAttribute('logo-url').value}" alt="logo">
	            </c:if>
	            <c:if test="${empty kapp.getAttribute('logo-url')}">
	                <i class="fa fa-home"></i> ${text.escape(kapp.name)}
	            </c:if>
	        </a>
	    </c:if>
	</div>

	<ul class="sidebar-nav">

		<li class="category">
			<a class="white color-hover-ice" href="${bundle.spaceLocation}/${kapp.slug}?page=dashboard" aria-label="dashboard">
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
		<li class="category">
			<a class="white color-hover-ice" href="${bundle.spaceLocation}/${kapp.slug}?page=profile" aria-label="profile">
				<i class="fa fa-user"></i>
				<span>Update Profile</span>
			</a>
		</li>
	</ul>
</div>