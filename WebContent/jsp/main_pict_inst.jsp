<!DOCTYPE html  "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclareNEW.jsp"%>

<%
	String USER_Name = (String)session.getAttribute("USER_Name");
	int USER_AUTOID = (Integer)session.getAttribute("USER_AUTOID");
	if (USER_AUTOID == 0)
	{
		response.sendRedirect("Login.jsp");
	}
	//session.setAttribute("ip", "http://localhost"); // Localhost
	// session.setAttribute("ip","http://172.30.0.113:8080"); // Test
	session.setAttribute("ip","http://172.17.0.30:8080"); // Live
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>[24]7 SPRINGBOARD</title>
		<link rel="stylesheet" type="text/css" href="../css/careers.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/MasterTheme.css" />
		<style type="text/css">
			iframe 
			{
				border: 0px solid #000000;
				height: 620px;
			}
		</style>
		<script type="text/javascript">
			function callthisfunction()
			{
				document.getElementById("take_a_pict").style.display="none";
				document.getElementById("processing").style.display="";
				parent.related.callthisfunction();
			}
		</script>
		<script type="text/javascript">
			var keyvalues;
			function document.onkeydown()
			{
				keyvalues=event.keyCode;
				if ( event.keyCode==8)
				{
					return false;
				}
			}
		</script>
		<script type="text/javascript">
			function redirect()
			{
				window.location.href = "instruction.jsp";
				return false;
			}
		</script>
	</head>
	<body>
		<div class="wrapperSize" id="wrapper">
			<div class="content">
				<div class="inner-content">
					<div class="cont-lft-twocol">
						<div style="width: 100%;" class="cont-lft">
							<div class="redTxt"></div>
							<div style="padding: 0pt 0pt 10px;" class="forms">
								<input type="hidden" value="" id="sessionmemid" name="sessionmemid" />
								<table width="700px" cellspacing="1" cellpadding="6" border="0">
									<tbody>
										<tr>
											<th colspan="2" class="taL">
												Welcome
											</th>
										</tr>
										<tr>
											<td width="45%" colspan="2" align="left">
												<h3>Dear&nbsp;<span class="username"><%=USER_Name%></span></h3>
												<p>
													The online test comprises of 5 modules Typing Test, English
													Comprehension Test and English Grammar Test. You may access
													these modules using the links which would be provided.
													Please note that the tests or modules once completed
													without interruption cannot be attempted again. If there is
													an interruption due to power outage or loss of internet
													connectivity, you can log in again and complete the tests
													that were interrupted or were incomplete.
												</p>
												<p>
													To complete your registration and before your proceed with
													the test's, you are required to take a photo of yourself.
												</p>
												<p>
													Adjust your webcam so that your face is clearly visible.
													View your picture on the screen. when you are ready, click
													on the link below to capture.
												</p>
												<div style="height: 10px;"></div>
											</td>
										</tr>
										<tr>
											<td valign="top" width="45%" colspan="2" align="left">
												<p style="text-align: center;" id="take_a_pict">
													<a href="javascript:callthisfunction();">Take a Picture </a>
												</p>
												<span class="register" id="processing" style="display: none;">
													<b>
														<font color="#000033" class="taL">Processing, please wait...</font>
													</b>
												</span>
												<div style="text-align: right;">
													<input type="button" value="Proceed" class="buttonMedium" id="proceed" style="display: none;" onclick="redirect();" />
												</div>
											</td>
										</tr>
									</tbody>
								</table>
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
