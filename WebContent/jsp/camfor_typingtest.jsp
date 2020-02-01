<!DOCTYPE html  "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	String USER_Name=(String)session.getAttribute("USER_Name");
	int USER_AUTOID =(Integer) session.getAttribute("USER_AUTOID");
	if(USER_AUTOID == 0)
	{
		response.sendRedirect("Login.jsp");
	}
%>

<%
	System.out.println("START - C");
%>

<html>
  <head>
    <title>[24]7 SPRINGBOARD</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/careers.css"/>
<style type="text/css">

iframe {
	border: 0px solid #000000;
	//height:620px;
}


#webcam, #canvas {
	width: 220px;
	border:10px solid #333;
	background:#eee;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}

#webcam {
	position:relative;
	/* margin-top:50px; */
	/* margin-bottom:50px; */
	/*  margin-left: 292px;*/
}

#webcam > span {
	bottom: -12px;
    color: #EEEEEE;
    font-size: 9px;
    left: 62px;
    position: absolute;
    z-index: 2;
}

#webcam > img {
	z-index:1;
	position:absolute;
	border:0px none;
	padding:0px;
	bottom:-40px;
	left:89px;
}

#webcam > div {
	border:5px solid #333;
	position:absolute;
	right:-90px;
	padding:5px;
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	cursor:pointer;
}

#webcam a {
	background:#fff;
	font-weight:bold;
}

#webcam a > img {
	border:0px none;
}

#canvas {
	border:10px solid #ccc;
	background:#eee;
}

#flash {
	position:absolute;
	top:0px;
	left:0px;
	z-index:5000;
	width:100%;
	height:500px;
	background-color:#c00;
	display:none;
}

object {
	display:block; /* HTML5 fix */
	position:relative;
	z-index:1000;
}

</style>
	<script type="text/javascript" src="<%=request.getContextPath()%>/example/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/example/jquery.webcam.js"></script>
  </head>
  <body onclick="" style="padding-top:15px;padding-left: 15px;">
	<div id="webcam">
		<span>[24]7 Online Test</span>
	</div>
<p style="display: none;"><canvas id="canvas" height="180" width="220"></canvas></p>
<script type="text/javascript">

var pos = 0;
var ctx = null;
var cam = null;
var image = null;

var filter_on = false;
var filter_id = 0;

function changeFilter() {
	if (filter_on) {
		filter_id = (filter_id + 1) & 7;
	}
}

function toggleFilter(objd)
 {
	if (filter_on =!filter_on) 
	{
	
		objd.parentNode.style.borderColor = "#c00";
	}
	 else 
	 {
		objd.parentNode.style.borderColor = "#333";
	}
}
function callthisfunction()
 {
 
 //alert("yes");
 //if (document.getElementById("chkcamthere").value == '0')
//{
//alert("cam_name null hai ");
document.getElementById("tohandle").innerHTML="<li style='display:none;' id='cam_name'>null</li>";


//}else{
//alert("cam_name null hai2 ");
 document.getElementById("cam_name_flag").value=document.getElementById("cam_name").innerHTML;
 //}
 webcam.capture();
	
	if(test_flag=="0")
	{
	//alert(test_flag);
	webcam.save('<%=session.getAttribute("ip")%>/example/upload.php?id=<%=USER_AUTOID %>');
	parent.content.document.getElementById("proceed").style.display="";
	}else if(test_flag=="1")
	{
	webcam.save('<%=session.getAttribute("ip")%>/example/pict_on_typingtest.php?id=<%=USER_AUTOID %>');
	}else if(test_flag=="2")
	{
	webcam.save('<%=session.getAttribute("ip")%>/example/pict_on_readingtest.php?id=<%=USER_AUTOID %>');
	}else if(test_flag=="3")
	{
	webcam.save('<%=session.getAttribute("ip")%>/example/pict_on_engtest.php?id=<%=USER_AUTOID %>');
	}
	else if(test_flag=="4")
	{
	webcam.save('<%=session.getAttribute("ip")%>/example/pict_on_precistest.php?id=<%=USER_AUTOID %>');
	}
	else if(test_flag=="5")
	{
	webcam.save('<%=session.getAttribute("ip")%>/example/pict_on_moktest.php?id=<%=USER_AUTOID %>');
	}
}

jQuery("#webcam").webcam({

	width: 220,
	height: 180,
	mode: "save",
	swffile: "<%=request.getContextPath()%>/example/jscam.swf",

	onTick: function(remain) {

		if (0 == remain) {
			jQuery("#status").text("Cheese!");
		} else {
			jQuery("#status").text(remain + " seconds remaining...");
		}
	},

	onSave: function(data) {

		var col = data.split(";");
		var img = image;

		if (false == filter_on) 
		{
			for(var i = 0; i < 320; i++) {
				var tmp = parseInt(col[i]);
				img.data[pos + 0] = (tmp >> 16) & 0xff;
				img.data[pos + 1] = (tmp >> 8) & 0xff;
				img.data[pos + 2] = tmp & 0xff;
				img.data[pos + 3] = 0xff;
				pos+= 4;
			//	alert("tmp is :"+tmp);
			}
		} 
		else 
		{
			var id = filter_id;
			var r,g,b;
			var r1 = Math.floor(Math.random() * 255);
			var r2 = Math.floor(Math.random() * 255);
			var r3 = Math.floor(Math.random() * 255);

			for(var i = 0; i < 320; i++) {
				var tmp = parseInt(col[i]);

				/* Copied some xcolor methods here to be faster than calling all methods inside of xcolor and to not serve complete library with every req */

				if (id == 0) {
					r = (tmp >> 16) & 0xff;
					g = 0xff;
					b = 0xff;
				} else if (id == 1) {
					r = 0xff;
					g = (tmp >> 8) & 0xff;
					b = 0xff;
				} else if (id == 2) {
					r = 0xff;
					g = 0xff;
					b = tmp & 0xff;
				} else if (id == 3) {
					r = 0xff ^ ((tmp >> 16) & 0xff);
					g = 0xff ^ ((tmp >> 8) & 0xff);
					b = 0xff ^ (tmp & 0xff);
				} else if (id == 4) {

					r = (tmp >> 16) & 0xff;
					g = (tmp >> 8) & 0xff;
					b = tmp & 0xff;
					var v = Math.min(Math.floor(.35 + 13 * (r + g + b) / 60), 255);
					r = v;
					g = v;
					b = v;
				} else if (id == 5) {
					r = (tmp >> 16) & 0xff;
					g = (tmp >> 8) & 0xff;
					b = tmp & 0xff;
					if ((r+= 32) < 0) r = 0;
					if ((g+= 32) < 0) g = 0;
					if ((b+= 32) < 0) b = 0;
				} else if (id == 6) {
					r = (tmp >> 16) & 0xff;
					g = (tmp >> 8) & 0xff;
					b = tmp & 0xff;
					if ((r-= 32) < 0) r = 0;
					if ((g-= 32) < 0) g = 0;
					if ((b-= 32) < 0) b = 0;
				} else if (id == 7) {
					r = (tmp >> 16) & 0xff;
					g = (tmp >> 8) & 0xff;
					b = tmp & 0xff;
					r = Math.floor(r / 255 * r1);
					g = Math.floor(g / 255 * r2);
					b = Math.floor(b / 255 * r3);
				}

				img.data[pos + 0] = r;
				img.data[pos + 1] = g;
				img.data[pos + 2] = b;
				img.data[pos + 3] = 0xff;
				pos+= 4;
			}
		}

		if (pos >= 0x4B000) {
			ctx.putImageData(img, 0, 0);
			pos = 0;
		}
	},

	onCapture: function () {
	//alert("YES @@");
	//alert("YES1213242424523@@");
	var test_flag=document.getElementById("test_flag").value;
	//var ty=0;
	//alert('ankush'+ty)
	//var test_flag='0';
	//alert(test_flag);
	//webcam.save('http://192.168.1.83/example/upload.php?id=<%=USER_AUTOID %>');
	if(test_flag=="0")
	{
	//alert("test_flag is :"+test_flag);
	var cam_name=document.getElementById("cam_name_flag").value;
	//var cam_name="ankush";
	//alert(cam_name);
	webcam.save('<%=session.getAttribute("ip")%>/example/upload.php?id=<%=USER_AUTOID %>&cam_name='+cam_name);
	parent.content.document.getElementById("processing").style.display="none";
	parent.content.document.getElementById("proceed").style.display="";
	
	}else if(test_flag=="1")
	{
	webcam.save('<%=session.getAttribute("ip")%>/example/pict_on_typingtest.php?id=<%=USER_AUTOID %>');
	}else if(test_flag=="2")
	{
	webcam.save('<%=session.getAttribute("ip")%>/example/pict_on_readingtest.php?id=<%=USER_AUTOID %>');
	}else if(test_flag=="3")
	{
	webcam.save('<%=session.getAttribute("ip")%>/example/pict_on_engtest.php?id=<%=USER_AUTOID %>');
	}
	else if(test_flag=="4")
	{
	webcam.save('<%=session.getAttribute("ip")%>/example/pict_on_precistest.php?id=<%=USER_AUTOID %>');
	}
	else if(test_flag=="5")
	{
	webcam.save('<%=session.getAttribute("ip")%>/example/pict_on_moktest.php?id=<%=USER_AUTOID %>');
	}
        
		jQuery("#flash").css("display", "block");
		jQuery("#flash").fadeOut(100, function () {
			jQuery("#flash").css("opacity", 1);
		});
	},

	debug: function (type, string) {
		jQuery("#status").html(type + ": " + string);
	},

	onLoad: function () {

		var cams = webcam.getCameraList();
		for(var i in cams) {
		if(cams[i]=='Google Camera Adapter 0' || cams[i]=='Google Camera Adapter 1' || cams[i]=='CyberLink Web Camera Filter' )
		{
		jQuery("#cams").append("<li id='no_cam_detect'>No Camera Detected</li><li style='display:none;' id='cam_name'>null</li>");
		//parent.content.document.getElementById("take_a_pict").style.display="none";
		//document.getElementById("webcam").style.display="none";
		break;
		}else{
		
			jQuery("#cams").append("<li id='cam_name'>" + cams[i] + "</li>");
			parent.content.document.getElementById("take_a_pict").style.display="";
			document.getElementById("no_cam_detect").style.display="none";
			
			}
		}
		
	}
});

function getPageSize() {

	var xScroll, yScroll;

	if (window.innerHeight && window.scrollMaxY) {
		xScroll = window.innerWidth + window.scrollMaxX;
		yScroll = window.innerHeight + window.scrollMaxY;
	} else if (document.body.scrollHeight > document.body.offsetHeight){ // all but Explorer Mac
		xScroll = document.body.scrollWidth;
		yScroll = document.body.scrollHeight;
	} else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
		xScroll = document.body.offsetWidth;
		yScroll = document.body.offsetHeight;
	}

	var windowWidth, windowHeight;

	if (self.innerHeight) { // all except Explorer
		if(document.documentElement.clientWidth){
			windowWidth = document.documentElement.clientWidth;
		} else {
			windowWidth = self.innerWidth;
		}
		windowHeight = self.innerHeight;
	} else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
		windowWidth = document.documentElement.clientWidth;
		windowHeight = document.documentElement.clientHeight;
	} else if (document.body) { // other Explorers
		windowWidth = document.body.clientWidth;
		windowHeight = document.body.clientHeight;
	}

	// for small pages with total height less then height of the viewport
	if(yScroll < windowHeight){
		pageHeight = windowHeight;
	} else {
		pageHeight = yScroll;
	}

	// for small pages with total width less then width of the viewport
	if(xScroll < windowWidth){
		pageWidth = xScroll;
	} else {
		pageWidth = windowWidth;
	}

	return [pageWidth, pageHeight];
}

window.addEventListener("load", function() {

	jQuery("body").append("<div id=\"flash\"></div>");

	var canvas = document.getElementById("canvas");

	if (canvas.getContext) {
		ctx = document.getElementById("canvas").getContext("2d");
		ctx.clearRect(0, 0, 320, 240);

		var img = new Image();
		// img.src = "logo.gif";
		img.onload = function() {
			ctx.drawImage(img, 129, 89);
		}
		image = ctx.getImageData(0, 0, 320, 240);
	}
	
	var pageSize = getPageSize();
	jQuery("#flash").css({ height: pageSize[1] + "px" });

}, false);

window.addEventListener("resize", function() {

	var pageSize = getPageSize();
	jQuery("#flash").css({ height: pageSize[1] + "px" });

}, false);

</script>
<div class="cont-lft">
<h3>Available Cameras</h3>
<ul id="cams" style="font-family: Arial,Helvetica,sans-serif;font-size: 12px; color: #666666; padding-left: 0;"></ul>
</div>
<input type="hidden" name="test_flag" id="test_flag" value="0">
<input type="hidden" name="chkcamthere" id="chkcamthere" value="0">
<input type="hidden" name="cam_name_flag" id="cam_name_flag" value="Camera">
<div id="tohandle" style="display: none;"></div>

<!-- Old Google Analytics Code -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15437724-1']);
  _gaq.push(['_setDomainName', 'none']);
  _gaq.push(['_setAllowLinker', true]);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- Old Google Analytics Code -->

  </body>
</html>

<%
	System.out.println("END - C");
%>
