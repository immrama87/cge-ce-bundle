<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>

<section class="dashboard">
	<header>
		My Managed Services Dashboard
		<div class="options">
			<i class="icon fa fa-th-large"></i> View Options <i class="icon fa fa-caret-down"></i>
			<div class="wrap hide" aria-hidden="true">
				<ul class="options">
				</ul>
			</div>
		</div>
	</header>
	<section class="widgets background-gray">
		<div class="row color-black announcements">
			<div class="title col-md-2 color-gray-darkest">
				<i class="fa fa-bullhorn"></i>
				<h4>Announcements</h4>
			</div>
			<div class="col-md-10 messages background-gray-lightest">
				<div class="row" container-max="3">
				<%for(int i=0;i<messages.length;i++){%>
					<div class="col-md-4 message<%if(i>2){%> hide<%}%>">
						<div class="date">	
							<%
								String date = messages[i].getDate();
								DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss'Z'");
								df.setTimeZone(java.util.TimeZone.getTimeZone("Zulu"));
								Date d = df.parse(date);
								
								date = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.SHORT).format(d);
								
								int mon_index = date.indexOf(" ");
								int day_index = date.indexOf(",", mon_index+1);
								int time_index = date.lastIndexOf(" ");
								time_index = date.lastIndexOf(" ", time_index-1);
								
								String month = date.substring(0, mon_index);
								String day = date.substring(mon_index+1, day_index);
								String time = date.substring(time_index+1);
							%>
							<div class="day"><%= day%></div>
							<div class="mt"><%= month%><br /><%= time%></div>
						</div>
						<div class="content">
							<h3 class="subject"><%= messages[i].getSubject()%></h3>
							<p class="body"><%= messages[i].getMessage()%></p>
						</div>
					</div>
				<%}%>
				<%if(messages.length > 3){%>
					<div class="shift left inactive" content-target="div.message">
						<span>
							<i class="background fa fa-circle"></i>
							<i class="icon fa fa-chevron-circle-left"></i>
						</span>
					</div>
					<div class="shift right" content-target="div.message">
						<i class="background fa fa-circle"></i>
						<i class="icon fa fa-chevron-circle-right"></i>
					</div>
				<%}%>
				<%for(int i=messages.length;i<3;i++){%>
					<div class="col-md-4 message">
					</div>
				<%}%>
				</div>
			</div>
		</div>
		
		<section class="reports">
			
		</section>
	</section>
</section>