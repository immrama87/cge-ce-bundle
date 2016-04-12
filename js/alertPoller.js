$(function(){
	/**
	 * Initialize the poller here
	 */
	 
	function pollMessageQueue(){
		if(bundle.lastPollTime == undefined){
			retrieveLastPollTime();
		}
		else {
			/*$.get(bundle.kappLocation() + "?partial=alerts&orient=vertical", function( data ) {
				$("#user-alerts").replaceWith(data);
			});*/
		}
	}
		
	function retrieveMessages(){
		console.log("ran again!!");
		$.get(bundle.kappLocation() + "?partial=alerts&orient=vertical", function( data ) {
			$("#user-alerts").html(data);
		});
	}

	retrieveMessages();
	
	function retrieveLastPollTime() {
		$.ajax({
			method: 'GET',
			url: 'app/api/v1/users/' + bundle.username + '?include=attributes',
			dataType: "json",
			contentType: "application/json",
			  
			// If form creation was successful run this code
			success: function(response, textStatus, jqXHR){
				var found = false;
				for(attr in response.user.attributes){
					if(attr.name == "Last Poll Time" && attr.values[0] != undefined){
						bundle.lastPollTime = attr.values[0];
						found = true;
						break;
					}
				}
					
				if(!found){
					bundle.lastPollTime = 0;
				}
				
				pollMessageQueue();
			},
			// If there was an error, show the error
			error: function(jqXHR, textStatus, errorThrown){
				console.log('Error retrieving last poll time. Setting to 0');
				bundle.lastPollTime = 0;
				pollMessageQueue();
			}
		});
	}
	
	$("drop1").on("click touch touchstart", function(evt){
		if($(this).attr("cgi-expanded") === 'true'){
			$(this).attr("cgi-expanded", false);
		}
		else{
			$(this).attr("cgi-expanded", true);
		}
	});
});