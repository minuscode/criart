// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(
	function(){
		$("#cloud-wrap").click(function(ev){
			$('.cloud-zoom').CloudZoom()
			return false;
		});
		
		$("#image").mousemove(function(event) {
			$("#messageZoom").show()
		    $("#messageZoom").css({"left": (event.pageX+10)+"px"}).css({"top": (event.pageY+10)+"px"});
		});
		$("#image").mouseout(function() {
			$("#messageZoom").hide()
		});
	}
);