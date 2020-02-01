 $(document).ready(function() {
   overDrive();
   $(".menu-link").click(function () { 
   });
   $("div.tab").hover(function() {
     $(this).addClass("tab-highlight");
   },function(){
     $(this).removeClass("tab-highlight");
   });
   $("div.tab").click(function() {
     $("div.tab").removeClass("tab-selected");
     $(this).addClass("tab-selected");
	var toGo = $(this).find("a");
	document.location= toGo.attr("href");
   });
 });


function overDrive() { 
	$(".navigation-output").each( function() {
		var instanceDriver = $(this)[0];
		template_hover_navout_set(instanceDriver);  // hover = highlight id
	});
} 

        function template_hover_navout_set( strId) {
                var jItem = $(strId);
                jItem.hover(function() {
                        $(this).addClass("button-highlight");
                        },function(){
                        $(this).removeClass("button-highlight");
                });
                jItem.click(function () {
                        template_pageload(strId);
                });
        }

	function template_navigation_set( strId) { 
		var jItem = $("#"+strId.toString());
		jItem.hover(function() {
			$(this).addClass("button-highlight");
			},function(){
			$(this).removeClass("button-highlight");
		});
  		jItem.click(function () { 
			template_panelload_toggle(strId);
		}); 
		jItem.find("a.navigation-link").click( function () {  
			template_panelload_toggle(strId);
			return false; } );
 	} 

	function template_pageload( mainElement ) { 
		var target = $(mainElement).find("a").attr("href");
		document.location=target;
 	} 

