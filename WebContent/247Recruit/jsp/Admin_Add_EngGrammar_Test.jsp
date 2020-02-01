<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<html>
<head>
	<title>[24]7 SPRINGBOARD</title>
	<%
	String USER_Name = null;
  	String User_Type_Id = null;
  	try
  	{
  	USER_Name =(String)session.getAttribute("USER_Name");
  	if(USER_Name == null)
  	{
  		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
  	}
  	User_Type_Id = (String)session.getAttribute("User_Type_Id");
     if(User_Type_Id == null)
	  	{
	  	  response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	  	}
	 }
	 catch(Exception e)
	{
		response.sendRedirect(request.getContextPath() + "/247Recruit/jsp/SessionTimeout.jsp");
	} 		
	%>
	<link rel="stylesheet" type="text/css" href="<%=recruitPath%>css/MasterTheme.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/js/NoBack.js"></script>

		<!-- jQuery for Datepicker -->
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/demos/demos.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.all.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/jquery.ui.theme.css" rel="stylesheet" />
	<link type="text/css" href="<%=request.getContextPath() %>/247Recruit/development-bundle/themes/base/jquery.ui.theme.css"  rel="stylesheet" />

	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.core.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/247Recruit/development-bundle/ui/jquery.ui.tabs.js"></script>
	<!-- End jQuery for Datepicker -->

	<script type="text/javascript">
	$(function() {
		$("#tabs").tabs();
	});
	</script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/247Recruit/css/TestExam.css"/>
	<link rel="stylesheet" type="text/css" href="../css/careers.css"/>
	<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/247Recruit/js/addRowEngGrammar.js"></script>	
	<script language="javascript" src="<%=recruitPath%>js/shortcut.js"></script>
	<script type="text/javascript">
	function ShowDoc(Filepath)
	{
		someWindow = window.open(Filepath,'ReasonWindow','height=635,width=605,scrollbars=no,resizable=no,menubar=no,location=no,titlebar=no,toolbar=no');
	}
	</script>

	<style type="text/css">
	html,body
	{
		font-family: Arial,Helvetica,sans-serif;
	    font-size: 12px;
	    margin: 0;
		
	}
	
	.theader 
	{
	    background: url("/springboard/247Recruit/images/header_BG.jpg") repeat-x scroll 0 0 transparent;
	    color: #FFFFFF;
	}
	.classCompTestleft_TD
	{
		width: 200px;
		font-size: 12px;
		background-color: #D8D8D8;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	.classCompTestleft_TDBig
	{
		width: 400px;
		font-size: 12px;
		background-color: #D8D8D8;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	.classCompTestleft_TDSmall
	{
		width: 145px;
		font-size: 12px;
		background-color: #D8D8D8;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	.classCompTestright_TD
	{
		width: 200px;
		font-size: 12px;
		background-color: #F8F8F8;
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	.inputText
	{
		width: 100%;
	}
	.setBgStyple
	{
		resize: none; 
		width: 660px; 
		height: 150px; 
		text-align: left; 
		background-color:#f8f8f8; 
		border-bottom-color: gray;	

		border-right-color: gray;	
	}
	.delImg
	{
		background-color:#F8F8F8;
		valign:middle;
	}
	.srcvis
	{ 
		background: url('<%=recruitPath%>/images/delO.png') no-repeat; 
		border-style: none;
		cursor: pointer;
		cursor: hand;
		width:16px;
		height:16px;
		font-weight: bold;
		font-size: 11px;
		padding-right: 7px;
		font-weight: bold;
		vertical-align: text-bottom;
		text-align: center;
	}
	</style>
	<script type="text/javascript">
	function changeValSltd(partId,QnsId)
	{
		var total_Options = document.getElementById('part'+partId+'_TotalQns').value;
		for(var j = 1; j <= total_Options ; j++)
			{
				var optionSelection = document.getElementById('part'+partId+'Ans'+j);
				optionSelection.value = "N";
				var optionSelectionHdd = document.getElementById('part'+partId+'AnsSeltd'+j);
				optionSelectionHdd.value = "N";
				var partAns = document.getElementById('part'+partId+'Ans'+j+'DISP');
				partAns.removeAttribute('checked', 'checked');
			}
		document.getElementById('part'+partId+'Ans'+QnsId).value = "Y";
		document.getElementById('part'+partId+'AnsSeltd'+QnsId).value = "Y";			
	}
	function cancelAddView()
	{
		if(confirm('Are you sure you want to cancel ? Changes made will not be saved.'))
		{
			parent.window.location.href = '<%=request.getContextPath()%>/247Recruit/jsp/Admin_Manage_EngGrammar.jsp';
		}
	}
	</script>
	<script type="text/javascript">
	function AllowChars(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
		      // alert(charCode);
		if ((charCode > 47 && charCode < 58) || (charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 32 || charCode == 44 || charCode == 45 || charCode == 46 || charCode == 95) 
		{
			return true;
		}
		else
		{
			//alert("Invalid character entered !!");
			return false;
		}
	}      
	</script>
	
	<script type="text/javascript">
	var PartAPart1Header = 0;
	var getCountValidate = 0;
	function chkLangValidation()
	{
		var TestName = document.getElementById('TestName').value;
		if(TestName == '' || TestName == null || TestName.trim().length == 0)
		{
			alert('Please enter the test name !');
			document.getElementById('TestName').focus();
			return false;
		}
		var TestHeader = document.getElementById('TestHeader').value;
		if(TestHeader == '' || TestHeader == null || TestHeader.trim().length == 0)
		{
			alert('Please enter the test header !');
			document.getElementById('TestHeader').focus();
			return false;
		}
		var ParagraphText = document.getElementById('ParagraphText').value;
		if(ParagraphText == '' || ParagraphText == null || ParagraphText.trim().length == 0)
		{
			alert('Please enter the Paragraph !');
			document.getElementById('ParagraphText').focus();
			return false;
		}
		var total_qns = document.getElementById('total_questions').value;
		for(var i = 1; i < total_qns ; i++ )
			{
				var radioChk = false;
				var qnsEntered = document.getElementById('part'+i+'Q'+i);
				var qnsEnteredVal = qnsEntered.value;
				if(qnsEnteredVal == '' || qnsEnteredVal == null || qnsEnteredVal.trim().length <= 3)
					{
						alert('Please enter question '+i+' !');
						qnsEntered.value = "";
						qnsEntered.focus();
						qnsEntered.value = i+". ";
						return false;
					}
					var total_Options = document.getElementById('part'+i+'_TotalQns').value;
					for(var j = 1; j <= total_Options ; j++)
					{
						var optionSelection = document.getElementById('part'+i+'Ans'+j);
						var optionEntered = document.getElementById('part'+i+'Option'+j);
						var optionEnteredVal = optionEntered.value;
						if(optionEnteredVal == '' || optionEnteredVal == null || optionEnteredVal.trim().length <= 3)
							{
								var alpa = String.fromCharCode(64+j);
								alpa.toUpperCase();
								alpa = alpa + ". ";
								alert('Please enter option ' +j+ ' text for question ' +i+ ' !');
								optionEntered.value = "";
								optionEntered.focus();
								optionEntered.value = alpa;
								return false;
							}
							if(optionSelection.checked)
							{
								radioChk = true;
							}
						var partAns = document.getElementById('part'+i+'Ans'+j+'DISP');
						document.getElementById('part'+i+'Option'+j+'DISP').innerHTML=document.getElementById('part'+i+'Option'+j).value;
						partAns.value=document.getElementById('part'+i+'Ans'+j).value; 
					}
					if(radioChk == false)
					{
						alert('Please select the correct answer for question ' +i+ ' !');
						document.getElementById('part'+i+'Ans'+1).focus();
						return false;
					}
	document.getElementById('part'+i+'Q'+i+'DISP').innerHTML=document.getElementById('part'+i+'Q'+i).value; 
			}
	document.getElementById('testHeaderName').innerHTML=document.getElementById("TestHeader").value; 
	document.getElementById('ParagraphTextLBL').innerHTML=document.getElementById("ParagraphText").value;  	
	document.getElementById('EditDetailsData').style.display="none"; 
	document.getElementById('displayPriviewDetails').style.display="";	
	}
	</script>
	<script type="text/javascript">
	function EditValidationField()
	{			
			document.getElementById('displayPriviewDetails').style.display="none";
			document.getElementById('EditDetailsData').style.display="";
	}
	</script>
	
	<script type="text/javascript">
	function confirmSubmitField()
	{
		if(confirm('Are you sure you want to add this test? It will be available to candidates immediately.'))
		{
			return true;
		}
		else 
		{
			return false;
		}
	}
	</script>

</head>
<body>
     <table cellpadding="0" cellspacing="0" width="100%">
	    <tr>
	        <td align="left">
	            <img src="<%=recruitPath%>images/247_Logo_left.jpg" alt="Logo" />
	        </td>
	        <td align="right">
	            <img src="<%=recruitPath%>images/Springboard_LOG.jpg" alt="Logo" />
	        </td>
	    </tr>
	    <tr class="tBackColor">
	        <td align="left" colspan="2" style="height:12px;">
			</td>
		</tr>
	    <tr>
	        <td colspan="2" style="height:10px;"></td>	
	    </tr>
	    <tr>
	        <td align="left" style="padding-left:10px;">
	            <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial;"><a href="<%=recruitPath%>jsp/Home_Page.jsp">Home</a> > </font>
	           <font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; "><a href="<%=recruitPath%>jsp/Admin_Home_Page.jsp">Administration  </a>></font> 
	           <font style="color: #7E7E7E; font-weight: bold; font-size: 12px; font-family: Arial;">
					<a href="<%=recruitPath%>jsp/Admin_Manage_EngGrammar.jsp">Manage English Grammar Tests </a>  >
			   </font>
	           <font class="nonLink">Add</font>
	           
	        </td>
	        <td align="right" class="recName" style="padding-right:10px;">
				<b><span class="recName"><%=USER_Name%></span></b><font style="color:#7E7E7E; font-weight:bold; font-size:12px; font-family:Arial; ">&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/LogoutServletV" style="cursor:hand; cursor:pointer;">Logout</a></font>
			</td>
	    </tr>
	    <tr>
	        <td colspan="2">
	     </td>
	   </tr>
	   <tr>
	        <td colspan="2" style="height:10px;" align="center"><br/>
	        <!-- *************************************************************************** -->
	       <form action="<%=request.getContextPath()%>/AddEngGrammarTest" name="addComprehensionTest" id="addComprehensionTest" method="post" autocomplete="off">
				<div id="EditDetailsData">	  
			        <table border="0" cellpadding="6" cellspacing="6" width="900">
			        	<tr>
			        		<th colspan="4" class="classCompTestleft_TD">Add New English Grammar Test</th>
			        	</tr>
			        	<tr>
			        		<td class="classCompTestleft_TD">Test Name</td>
			        		<td colspan="3" class="classCompTestright_TD">
				        		<div id="TestNameDiv">
				        			<input type="text" name="TestName" id="TestName" class="inputText" value="" maxlength="500" onkeypress="return AllowChars(event);"/>
								</div>
			        		</td>
			        	</tr>
			        	<tr>
			        		<td class="classCompTestleft_TD">Test Header</td>
			        		<td colspan="3" class="classCompTestright_TD">
				        		<div id="TestHeaderDiv">
				        			<input type="text" name="TestHeader" id="TestHeader" class="inputText" value="Answer the questions given below after reading the instructions :" maxlength="500" onkeypress="return AllowChars(event);"/>
								</div>
			        		</td>
			        	</tr>
			        	<tr>	
			        		<td class="classCompTestleft_TD">Paragraph</td>
			        		<td colspan="3" class="classCompTestright_TD"> 
			        		<div id="ParagraphTextDIV">
			        		<textarea name="ParagraphText" id="ParagraphText" style=" height: 128px; width: 656px; resize: none;"  onkeypress="return AllowChars(event);"></textarea> 
			        		</div>
			        		</td>
			        	</tr>
		        	</table>
			        	<%
			        	int k = 1;
			        	for(k = 1; k <= 15 ; k++) 
			        	{
			        	%>
		        	<table border="0" cellpadding="6" cellspacing="6" width="900" id="part<%=k%>header">	
			        	<tr id="rowA<%=k %>">
			        		<td class="classCompTestleft_TD"  colspan="1"><b>Question <%=k%></b></td>
			        		<td colspan="3" class="classCompTestright_TD">
							<div id="PartAPart<%=k%>Q<%=k%>DIV">
			        			<input type="text" name="part<%=k%>Q<%=k%>" id="part<%=k%>Q<%=k%>" class="inputText" value="<%=k%>. " maxlength="1000"  onkeypress="return AllowChars(event);"/>
			        		</div>
			        		</td>
			        	</tr>
			        	<tr>
			        		<td id="tblSample<%=k%>" colspan="4">
			        			<input type="hidden" name="part<%=k%>_TotalQns" id="part<%=k%>_TotalQns" value="">
			        		</td>
			        	</tr>
			        	<tr>
			        		<td align="right" colspan="5" style="padding:0px;"><input type="button" name="addQuesbutton<%=k%>" value="Add" id="addQuesbutton<%=k%>" class="buttonSmall" onclick="addRowQuestion('<%=k%>');"></td>
			        	</tr>
			        </table>
				        <%
				        }
				        System.out.println("i::::::::::::::::;"+k);
				        %>
			         <input type="hidden" name="total_questions" id="total_questions" value="<%=k%>">
			         <table border="0" cellpadding="0" cellspacing="6" width="900">
			         	<tr>
			         		<td align="left">
								<div align="left">		
									<input type="button" onclick="return  cancelAddView();" class="buttonMedium" value="Cancel" name="Cancel">
								</div>					
							</td>
							<td align="right">
								<div align="right">		
									<input type="button" onclick="return chkLangValidation();" class="buttonMedium" value="Preview" name="preview">
								</div>					
							</td>
			         	</tr>
			         </table>
				</div>
			    <div id="displayPriviewDetails"  class="demo" style="width: 700px; display: none;">
					<div class="forms"  style="float: left;">
					    <table border="0" cellpadding="6" width="100%" cellspacing="0" style="margin:15px 0 0 0" >
							<tr>
								<th colspan="4" class="taL"><div style="float:left;font-family: Arial,Helvetica,sans-serif;font-size: 12px;">Reading Comprehension</div><div style="float:right;">Time Remaining <input type="text" name="disp" size="3" value="5:00" class="timer" id="disp"/> </div></th>
							</tr>
							<tr>
					       		<td colspan="4"><div style="float:left;"> <p style="color: #aa0000;"><b><label id="testHeaderName"></label></b></p></div></td>
					       </tr>
					       <tr>
			       			 <td>
			       			   <div style="float: left;" >
								<%
								int ranNum = 10;
								Connection con=null;
								con= ConnectDatabase.getConnection();
								Statement stmt = null;
								ResultSet resultSet = null;
								Statement stmt12 = null;
								ResultSet resultSet12 = null;
								int compQsnId = 0;
								String compQsnPass=null;
								int qsnID=0;
								int no_qs=0;
								String qsnStr = null;
								
								try
								{
								String compQsnQry = "SELECT * FROM bpo_reading_comp_master where READING_COMP_MASTER_ID="+ranNum;
								System.out.println("Step 8 Query "+compQsnQry);
								Statement adrStmt = con.createStatement();
								ResultSet adrRs = adrStmt.executeQuery(compQsnQry);
								if(adrRs.next())
								{
								compQsnId = adrRs.getInt("READING_COMP_MASTER_ID");
								compQsnPass = adrRs.getString("PASSAGE");
								}
								}
								catch (Exception e)
								{
								e.printStackTrace();
								}
								%>
								<textarea name="ParagraphTextLBL" id="ParagraphTextLBL" class="quest_output" style="resize:none;height: 311;" readonly="readonly" >&nbsp;</textarea>
								</div>
									<div style="float: left;margin-left: 2px;width: 350px;" class="quest_output2">
										<%
										for(int kdiv = 1 ; kdiv <=15; kdiv++)
										{
										 %>
										<div id="part<%=kdiv %>Qns<%=kdiv %>DISP">
										</div>
										<%
										}
										 %>
									</div>
								</td>
					       </tr>
							<tr>
								<td align="center">					
									<div id="displayQuestion" style="width: 700px;">
										<table style="width: 700px;" border="0" cellpadding="0" cellspacing="0">
											<tr id="Confirmation">
													<td colspan="2" align="left">					
														<div id="Editbutton" align="left">
															<input type="button" name="EditQuestion" class="buttonMedium" value="Edit" onclick="return EditValidationField();"/>
														</div>
													</td>
													<td colspan="2" align="right">
														<div id="Confirmbutton" align="right">
															<input type="submit" name="Confirm" value="Confirm" class="buttonMedium" onclick="return confirmSubmitField();"/>
														</div>
												  </td>
											 </tr>		
										</table>	
									</div>
								</td>
							</tr>		
					 </table>
				   </div>
				</div>
	        </form>	
	    </td>
      </tr>
		<tr>
	        <td colspan="2" style="height:10px;"></td>
	    </tr>
	     <tr class="footerBackColor" >
	       <td align="left" valign="middle" style="background-color:#808080; color:#FFFFFF; font-weight:bold; height:21px; font-size:9px; font-family:Arial;padding-left:5px;" colspan="1">
				&copy; 2012. [24]7. ALL RIGHTS RESERVED.
			</td>
			<td align="right" valign="middle" style="background-color:#808080;height:21px; padding-right:5px;">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<%if(User_Type_Id.equalsIgnoreCase("1") || User_Type_Id.equalsIgnoreCase("99") ) 
							{
							%>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						    <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("2")) 
						    {
						     %>
						     <a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						   <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("3"))
						    {
						   %>
						   <a onclick="return ShowDoc('<%=HelpDocVPathOPS%>')"><font style="color:#FFFFFF; font-weight:bold; font-size:9px;font-family:Arial;">HELP</font></a>
						  <%
						   }
						   %>
						</td>
						<td style="width: 5px;"></td>
						<td>
							<%if(User_Type_Id.equalsIgnoreCase("1") || User_Type_Id.equalsIgnoreCase("99") ) 
							{
							%>
							<a onclick="return ShowDoc('<%=HelpDocVPath%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
							<%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("2")) 
						    {
						    %>
						    <a onclick="return ShowDoc('<%=HelpDocVPathLND%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						    <%
						    }
						    else if(User_Type_Id.equalsIgnoreCase("3"))
						    {
						   %>
						   <a onclick="return ShowDoc('<%=HelpDocVPathOPS%>')"><img src="<%=recruitPath%>images/help.png" width="20px" height="20px" style="padding-right: 3px;"></a>
						  <%
						   }
						   %>
						   
						</td>
					</tr>
				</table>
			</td>
	    </tr>
</table>
	
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