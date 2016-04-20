<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<%
String category = request.getParameter("category");
request.setAttribute("category", category);
%>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <bundle:stylepack>
        <bundle:style src="${bundle.location}/css/category.css" />
    </bundle:stylepack>
    <bundle:variable name="head">
        <title>Unify360 - ${text.escape(kapp.getCategory(category).name)}</title>
    </bundle:variable>
    <bundle:scriptpack>
    </bundle:scriptpack>
    <header>
        <h2 class="header-label color-black">${text.escape(kapp.getCategory(category).name)}</h2>
    </header>
    <section class="categories">
        <div class="row">
            <section class="col-md-6 templates">
                <div class="templates bg-white">
                    <header>
                        <p>Select a type of <span class="list-label">${text.escape(kapp.getCategory(category).name)}</span> below:</p>
                    </header>
                    <div class="wrap">
                        <c:forEach var="form" items="${kapp.getCategory(category).forms}">
                            <div class="template col-xs-4">
                                <a href="${bundle.spaceLocation}/${kapp.slug}/${form.slug}">
                                    <c:choose>
                                        <c:when test="${not empty form.getAttributeValue('Image')}">
                                            <div class="icon">
                                                <img src="${bundle.location}/images/${form.getAttributeValue('Image')}"/>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="icon">
                                                <img src="${bundle.location}/images/placeholder.png"/>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <h3 class="color-black">${text.escape(form.name)}</h3>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <section class="col-md-6 tickets">
				<!-- Temporary change until Cherwell bridge can be fixed -->
			    <!-- c:import url="${bundle.path}/partials/servicerequests.jsp"/ -->
                <div class="change-tickets ticket-list">
                    <header>
                        <span>My Change Requests</span>
                    </header>
                    <section class="list bg-white">
                    </section>
                </div>
            </section>
        </div>
    </section>
</bundle:layout>