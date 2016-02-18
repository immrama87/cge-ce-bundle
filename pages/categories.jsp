<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<%
String category = request.getParameter("category");
request.setAttribute("category", category);
%>
<bundle:layout page="${bundle.path}/layouts/layout.jsp">
    <bundle:variable name="head">
        <title>Unify360 - ${text.escape(kapp.getCategory(category).name)}</title>
    </bundle:variable>
    <bundle:scriptpack>
    </bundle:scriptpack>
    <header>
        <h3 class="header-label color-black">${text.escape(kapp.getCategory(category).name)}</h3>
    </header>
    <section class="categories">
        <div class="row">
            <section class="col-md-6 templates">
                <div class="templates background-gray-lightest">
                    <header>
                        <p>Select a type of <span class="list-label">${text.escape(kapp.getCategory(category).name)}</span> below:</p>
                    </header>
                    <div class="wrap">
                        <c:forEach var="form" items="${kapp.getCategory(category).forms}">
                            <div class="template col-sm-4">
                                <a href="${bundle.spaceLocation}/${kapp.slug}/${form.slug}">
                                    <c:choose>
                                        <c:when test="${not empty form.getAttributeValue('Image')}">
                                            <div class="icon-category">
                                                <img src="${bundle.location}/images/${form.getAttributeValue('Image')}"/>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="icon-category">
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
            <section class="col-sm-6 tickets">
                <div class="category-tickets ticket-list">
                    <header>
                        <span>My <span class="ticket-label">${text.escape(kapp.getCategory(category).name)}</span> Tickets</span>
                    </header>
                    <section class="list background-gray-lightest">
                    </section>
                </div>
                <div class="change-tickets ticket-list">
                    <header>
                        <span>My Change Requests</span>
                    </header>
                    <section class="list background-gray-lightest">
                    </section>
                </div>
            </section>
        </div>
    </section>
</bundle:layout>