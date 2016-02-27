<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<bundle:scriptpack>
	<bundle:script src="${bundle.location}/js/alerts.js"/>
</bundle:scriptpack>

<c:set scope="request" var="orient" value="${param['orient']}" />

<c:choose>
	<c:when test="${orient eq 'vertical'}">
		<ul class="dropdown-menu messages" aria-labelledby="drop1" container-max="4">
			<c:choose>
				<c:when test="${not empty space.getKapp('helper') && not empty space.getKapp('helper').getForm('alerts')}">
					<c:set scope="request" var="alertsList" value="${Submissions.searchByForm(space.getKapp('helper').getForm('alerts'))}"/>
					<c:forEach items="${alertsList}" var="alert" varStatus="loop">
						<c:set scope="request" var="hideshow" value=""/>
						<c:if test="${loop.index gt 3}">
							<c:set scope="request" var="hideshow" value="hide"/>
						</c:if>
						<li class="message ${hideshow}">
							<div class="date">
								<div class="day"><fmt:formatDate type="both" pattern="d" timeZone="${timezone}" value="${alert.createdAt}" /></div>
								<div class="mt">
									<fmt:formatDate type="both" pattern="MMMM" timeZone="${timezone}" value="${alert.createdAt}" /><br />
									<fmt:formatDate type="both" pattern="hh:mm a" timeZone="${timezone}" value="${alert.createdAt}" />
								</div>
							</div>
							<div class="content">
								<h3 class="subject gray-darkest">${text.escape(alert.getValue('Subject'))}</h3>
								<p class="body">${text.escape(alert.getValue('Message'))}</p>
							</div>
						</li>
						<li class="divider"></li>
					</c:forEach>
					
					<c:if test="${fn:length(alertsList) gt 4}">
						<div class="shift up inactive" content-target="li.message">
							<span>
								<i class="icon fa fa-chevron-up"></i>
							</span>
						</div>
						<div class="shift down" content-target="li.message">
							<i class="icon fa fa-chevron-down"></i>
						</div>
					</c:if>
				</c:when>
				<c:otherwise>
					<li><a href="#"><i class="fa fa-pencil fa-fw"></i>Customer is missing supporting Alerts Data</a></li>
					<li class="divider"></li>
				</c:otherwise>
			</c:choose>
        </ul>
	</c:when>
	<c:otherwise>
		<div class="row color-black announcements">
			<div class="title col-md-2 gray-darkest">
				<i class="fa fa-bullhorn"></i>
				<h4>Announcements</h4>
			</div>
			<div class="col-md-10 messages bg-gray-lightest">
				<div class="row" container-max="3">
					<!-- Test to make sure the helper Kapp and alerts form exists in the Space -->
					<c:choose>
						<c:when test="${not empty space.getKapp('helper') && not empty space.getKapp('helper').getForm('alerts')}">
							<c:set scope="request" var="alertsList" value="${Submissions.searchByForm(space.getKapp('helper').getForm('alerts'))}"/>
							<c:forEach items="${alertsList}" var="alert" varStatus="loop">
								<c:set scope="request" var="hideshow" value=""/>
								<c:if test="${loop.index gt 2}">
									<c:set scope="request" var="hideshow" value="hide"/>
								</c:if>
								<div class="col-md-4 message ${hideshow}">
									<div class="date" time-value="${time.format(alert.createdAt)}">
										<div class="day"><fmt:formatDate type="both" pattern="d" timeZone="${timezone}" value="${alert.createdAt}" /></div>
										<div class="mt">
											<fmt:formatDate type="both" pattern="MMMM" timeZone="${timezone}" value="${alert.createdAt}" /><br />
											<fmt:formatDate type="both" pattern="hh:mm a" timeZone="${timezone}" value="${alert.createdAt}" />
										</div>
									</div>
									<div class="content">
										<h3 class="subject gray-darkest">${text.escape(alert.getValue('Subject'))}</h3>
										<p class="body">${text.escape(alert.getValue('Message'))}</p>
									</div>
								</div>
							</c:forEach>

							<c:if test="${fn:length(alertsList) gt 3}">
								<div class="shift left inactive" content-target="div.message">
									<span>
										<i class="icon fa fa-chevron-left"></i>
									</span>
								</div>
								<div class="shift right" content-target="div.message">
									<i class="icon fa fa-chevron-right"></i>
								</div>
							</c:if>
						</c:when>
						<c:otherwise>
							<div class="no-data">
								<h3>Customer is missing supporting Alerts Data</h3>
								<p>Please verify that the Helper Kapp has been installed and the Alerts form has been created</p>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>