$(function(){
	$("div.message.hide, li.message.hide").removeClass("hide").hide();
	$("div.shift").on("click", function(){
		if(!$(this).hasClass("inactive")){
			var contentTarget = $(this).attr("content-target");
			var parent = $(this).parent();
			var shiftOffset = $(parent).attr("shift-offset");
			var max = parseInt($(parent).attr("container-max"));
			
			if(shiftOffset == undefined){
				shiftOffset = 0;
			}
			
			
			if($(this).hasClass("right") || $(this).hasClass("down")){
				shiftOffset++;
			}
			else if($(this).hasClass("left") || $(this).hasClass("up")){
				shiftOffset--;
			}
			
			shiftOffset = parseInt(shiftOffset);
			shiftMax = shiftOffset + parseInt(max);
			
			var contents = $(parent).find(contentTarget);
			for(var i=0;i<contents.length;i++){
				if(i < shiftOffset || i >= shiftMax){
					$(contents[i]).hide();
				}
				else {
					$(contents[i]).show();
				}
			}
			
			$(parent).attr("shift-offset", shiftOffset);
			
			console.log(shiftOffset, contents.length);
			
			if(shiftOffset == contents.length - max){
				$(parent).find("div.shift.right, div.shift.down").addClass("inactive");
			}
			else {
				$(parent).find("div.shift.right, div.shift.down").removeClass("inactive");
			}
			
			if(shiftOffset == 0){
				$(parent).find("div.shift.left, div.shift.up").addClass("inactive");
			}
			else {
				$(parent).find("div.shift.left, div.shift.up").removeClass("inactive");
			}
		}
	});
	
	
	$("ul.messages").on("click touch touchstart", function(evt){
		evt.stopPropagation();
	});
});