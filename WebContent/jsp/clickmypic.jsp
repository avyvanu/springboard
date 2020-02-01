<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclareNEW.jsp" %>

<% 
	String x_val = (String)session.getAttribute("x_val");
	System.out.println("Session Value from LoginServlet Page : "+x_val);
	if(x_val.equals("1"))
	{
		session.setAttribute("x_val", "2");
		request.getHeader("User-Agent") ;
		System.out.println("User-Agent is :"+request.getHeader("User-Agent"));  // main_index.jsp
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>[24]7 SPRINGBOARD</title>
<link rel="stylesheet" type="text/css" href="../css/careers.css"/>
<link rel="stylesheet" type="text/css" href="../imageloader/skin.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../imageloader/style.css" />
<script type="text/javascript" src="../imageloader/utilities.js"></script>
<script type="text/javascript" src="../imageloader/container-min.js"></script>
<script type="text/javascript" src="../imageloader/loadingpanel.js"></script>
<script type="text/javascript" src="../imageloader/imageloader.js"></script>

<SCRIPT LANGUAGE="JavaScript">

function redirect()
{ 
	setTimeout("go_now()",10000); 
}
function go_now()   
{
	window.location.href = "<%=request.getContextPath()%>/jsp/WithoutWebCamFrame.jsp";
}
</SCRIPT>
<script type="text/javascript">

	redirect();	
	function loadImage1()
	{
		var loadingPanel = new yuiLoadingPanel();
		var loader = new ImageLoader('<%=request.getContextPath()%>/images/rel_interstitial_loading.gif');
		loadingPanel.show('Loading, please wait...');
		loader.loadEvent = function(url, image){}
		loader.load();
	}

</script>
<style type="text/css">

iframe {
	border: 0px solid #000000;
	height:620px;
}

#webcam, #canvas {
	width: 320px;
	border:20px solid #000;
	background:#000;
	-webkit-border-radius: 20px;
	-moz-border-radius: 20px;
	border-radius: 20px;
}

#webcam {
	position:relative;
	margin-top:50px;
	margin-bottom:50px;
	 margin-left: 292px;
}

#webcam > span {
	z-index:-2;
	position:absolute;
	color:#eee;
	font-size:10px;
	bottom: -16px;
	left:102px;
}

#webcam > img {
	z-index:-1;
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
	background:#000;
	font-weight:bold;
}

#webcam a > img {
	border:0px none;
}

#canvas {
	border:20px solid #000;
	background:#000;
}

#flash {
	position:absolute;
	top:0px;
	left:0px;
	z-index:5000;
	width:100%;
	height:500px;
	background-color:#000;
	display:none;
}

object {
	display:block; /* HTML5 fix */
	position:relative;
	z-index:-1000;
}

</style>
<script type="text/javascript" src="../example/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="../example/jquery.webcam.js"></script>

</head>

<body onload="loadImage1()" style="background-color: black;">

<div class="wrapper" id="wrapper">
<div class="content">
<div class="inner-content">
  <div class="cont-lft-twocol">
    <div style="width: 100%;" class="cont-lft"> <div class="redTxt"></div>      
        <div style="padding: 0pt 0pt 10px;" class="forms">
          <input type="hidden" value="" id="sessionmemid" name="sessionmemid" />
          <table width="950" cellspacing="1" cellpadding="6" border="0" height="157">
            <tbody>
            <tr><td valign="top" width="45%" colspan="2" align="left" style="background-color: black;">
	<div id="webcam" style="top: 3000px; background-color: black;">
		<span>[24]7 Online Test</span>
	</div>
<p style="display: none;"><canvas id="canvas" height="240" width="320"></canvas></p>
<h3 style="display: none;">Available Cameras</h3>
<ul id="cams"></ul>
<script type="text/javascript">

var pos = 0;
var ctx = null;
var cam = null;
var image = null;

var filter_on = false;
var filter_id = 0;

function changeFilter() 
{
	if (filter_on) 
	{
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

jQuery("#webcam").webcam({

	width: 320,
	height: 240,
	mode: "save",
	swffile: "../example/jscam.swf",

	onTick: function(remain) 
	{

		if (0 == remain) 
		{
			jQuery("#status").text("Cheese!");
		} 
		else 
		{
			jQuery("#status").text(remain + " seconds remaining...");
		}
	},

	onSave: function(data) 
	{

		var col = data.split(";");
		var img = image;

		if (false == filter_on) {

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

			for(var i = 0; i < 320; i++) 
			{
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

	onCapture: function () 
	{
	     
        document.getElementById("proceed").style.display="";
		jQuery("#flash").css("display", "block");
		jQuery("#flash").fadeOut(100, function () 
		{
			jQuery("#flash").css("opacity", 1);
		});
	},

	debug: function (type, string) 
	{
		jQuery("#status").html(type + ": " + string);
	},

	onLoad: function () 
	{
		var cams = webcam.getCameraList();
		for(var i in cams) 
		{
		if(cams[i]=='Google Camera Adapter 0' || cams[i]=='Google Camera Adapter 1' || cams[i]=='CyberLink Web Camera Filter' )
		{
			jQuery("#cams").append("<li id='no_cam_detect'>No Camera Detected</li>");
			document.getElementById("take_a_pict").style.display="none";
			document.getElementById("webcam").style.display="none";
			break;
		}
		else
		{
		    window.location.href="../main_index.jsp";
			jQuery("#cams").append("<li>" + cams[i] + "</li>");
			document.getElementById("take_a_pict").style.display="";
			document.getElementById("no_cam_detect").style.display="none";
		}
	 }
	}
});

function getPageSize() 
{

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

</script></td>
</tr>
           
          </tbody></table>
        </div>
     
    </div>
    
  </div>
</div>
</div>
</div>

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