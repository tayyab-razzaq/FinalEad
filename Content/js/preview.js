
 
function imagePreview(){	
	/* CONFIG */
		
		xOffset = -10;
		yOffset = 10;
		
		// these 2 variable determine popup's distance from the cursor
		// you might want to adjust to get the right result
		
	/* END CONFIG */
	$("img.preview").hover(function(e){
		t = title;
		title = "";	
		var c = (t != "") ? "<br/>" + t : "";
		$("body").append("<p id='preview'><img src='"+ src +"' alt='Image preview' />"+ c +"</p>");
		$("#preview")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px")
			.fadeIn("fast");						
    },
	function(){
		title = t;	
		$("#preview").remove();
    });	
	$("img.preview").mousemove(function(e){
		$("#preview")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px");
	});			
};


// starting the script on page load
$(document).ready(function(){
	imagePreview();
});