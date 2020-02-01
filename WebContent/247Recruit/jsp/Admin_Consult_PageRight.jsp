<!DOCTYPE html "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="GlobalDeclare.jsp" %>
<html>
  <head>
    <title>[24]7 SPRINGBOARD </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link lrel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		html,body,form
		{
			margin: 0px;
		}
	    .classlangTestleft_TD
		{
			width: 150px;
			height: 50px;
			font-size: 12px;
			background-color: #D8D8D8;
		}
		.classlangTestright_TD
		{
			width: 200px;
			height: 50px;
			font-size: 12px;
			background-color: #F8F8F8;
		}
	</style>

<script type="text/javascript">
function chkStatus()
{
	var cons_Status = document.getElementById("consStutas").checked;
	var activeVal = document.getElementById("activeVal").value;
	var chkActive = false;
	if(activeVal == '1')
	{
		chkActive = true;
	}
	if(cons_Status == chkActive)
	{
		alert("No change in status!!");
		return false;
	}
	else
	{
		return true;
	}
}
</script>
<script type="text/javascript">
function chkDeleteField()
{
	var deleteConsult = document.getElementById('deleteConsult').value;
	
	if(deleteConsult == '' || deleteConsult == null || deleteConsult.trim().length == 0)
	{
		alert("Please enter the delete reason !");
		return false;
	}
	else
	{
		if(confirm('Are you sure you want to delete this consultant name? It will be removed permanently from the list of consultant name.'))
		{
			return true;
		}
		
	}
}
</script>
	<script type="text/javascript">
	function chkConsName()
	{
	  var addnewConsult =  document.getElementById('addnewConsult').value;
	  if(addnewConsult == '' || addnewConsult == null || addnewConsult.trim().length == 0)
	  {
	  	alert("Please enter the consultant name !");
		return false;
	  }
	  else
	  {
	 	 if(confirm('Are you sure you want to add this consultant name. it will be available to candidates immediately'))
		 {
			return true;
		 }
	 	 
	  }
	}
	</script>
	
<script type="text/javascript">
var url = '';
function ConsultantServlet(id)
{
	var goTo = true;
	
	if(id == '1')
	{
		goTo = chkConsName();
	}
	if(id == '2')
	{
		goTo = chkStatus();
	}
	if(id == '3')
	{
		goTo = chkDeleteField();
	}
	if(goTo)
	{
		
		var consultId = document.getElementById('consultId').value;
		url = url+"?cid="+consultId;
		var addnewConsult = document.getElementById('addnewConsult').value;
		url = url+"&addn="+addnewConsult;
		var consStutas = document.getElementById('consStatusvalue').value;
		url = url+"&act="+consStutas;
		url = url+"&sid="+Math.random();
		url = url+"&id="+id
		var deleteConsult = document.getElementById('deleteConsult').value;
		url = url+"&delr="+deleteConsult;	
		var dynaNum = document.getElementById('dynaNum').value;	
		url = url+"&enctype"+dynaNum;
		top.window.location.href = "<%=request.getContextPath()%>/ConsultantServlet"+url;
	}
}
</script>	
	
<script type="text/javascript">
function addConsulntFun()
{

	document.getElementById('dispConsName').style.display = 'none';
	document.getElementById('dispConsStatus').style.display = 'none';

	document.getElementById('addCons').style.display = '';
	document.getElementById('isActiveDisplayButton').style.display = 'none';
	document.getElementById('isaddConsult').style.display = '';
}
</script>
<script type="text/javascript">
function cancelSubmit()
{
	document.getElementById('dispConsName').style.display = '';
	document.getElementById('dispConsStatus').style.display = '';
	
	document.getElementById('dispConsStatusRadio').style.display = 'none';
	
	
	document.getElementById('isaddConsult').style.display = 'none';
	document.getElementById('addCons').style.display = 'none';	
	document.getElementById('isActiveDisplayButton').style.display = '';
	

}
</script>
<script type="text/javascript">
function editConsultFun()
{
	document.getElementById('dispConsStatus').style.display = 'none';
	document.getElementById('dispConsStatusRadio').style.display = '';
	document.getElementById('isActiveDisplayButton').style.display = 'none';
	document.getElementById('iseditConsult').style.display = '';


}
</script>
<script type="text/javascript">
function editcancelSubmit()
{
	document.getElementById('iseditConsult').style.display = 'none';
	document.getElementById('isActiveDisplayButton').style.display = '';
	document.getElementById('dispConsStatusRadio').style.display = 'none';
	document.getElementById('dispConsStatus').style.display = '';
}
</script>

<script type="text/javascript">
function deleteConsultFun()
{
	document.getElementById('isActiveDisplayButton').style.display = 'none';
	document.getElementById('isdeleteConsult').style.display = '';
	document.getElementById('dispcondDelete').style.display = '';	
	
}
</script>
<script type="text/javascript">
function deletecancelSubmit()
{
	document.getElementById('dispcondDelete').style.display = 'none';	
	document.getElementById('isdeleteConsult').style.display = 'none';
	document.getElementById('isActiveDisplayButton').style.display = '';
}
</script>
<script language="javascript" type="text/javascript">
function randomString() 
{
	var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
	var string_length = 15;
	var randomstring = '';
	for (var i=0; i<string_length; i++) {
		var rnum = Math.floor(Math.random() * chars.length);
		randomstring += chars.substring(rnum,rnum+1);
	}
	document.getElementById('dynaNum').value = randomstring;
}
</script>
<script type="text/javascript">
function showOption(status)
{
	document.getElementById('consStatusvalue').value = status;
}
</script>
</head>

<%
	String consultId = request.getParameter("consultId");
	String consName = request.getParameter("consName");
	String active = request.getParameter("active");
	System.out.println("consName \t"+consName);
	if(consultId != null)
	{
		session.setAttribute("CONSID",consultId);
		session.setAttribute("CONSNAME",consName);
		session.setAttribute("CONSACTIVE",active);
%>
<body onload="randomString()">
 <form>    
   <table  border="0" cellpadding="6" cellspacing="6">
  
		<tr id="dispConsName">
			<td class="classlangTestleft_TD">Consultancy Name </td>
			<td class="classlangTestright_TD"><%=consName%></td>			
		</tr>
		<tr id="dispConsStatus">
			<td class="classlangTestleft_TD">Status</td>
			<td class="classlangTestright_TD">
			<%
			
  				if(active.equalsIgnoreCase("1"))
  				{
			%>
 					Active
			<%	
					
  				}
  				else
  				{
			%>
 					Inactive
			<%
  				}
  				
			%>
			<input type="hidden" name="activeVal" id="activeVal" value="<%=active%>"/>
			<input type="hidden" name="consultId" id="consultId" value="<%=consultId%>"/>
			
			</td>			
		</tr>
		
		<tr id="addCons" style="display: none;">
			<td class="classlangTestleft_TD">Consultancy Name </td>
			<td class="classlangTestright_TD">
				<input name="addnewConsult" id="addnewConsult"/> 
				 <input type="hidden" id="dynaNum" name="dynaNum"/>
			</td>			
		</tr>		
		
		<tr id="dispConsStatusRadio" style="display: none;">
			<td class="classlangTestleft_TD">Status</td>
			<td class="classlangTestright_TD">
			<%if(active.equalsIgnoreCase("1")){%>
  					<input type="radio" name="consStutas" id="consStutas" value="1" checked="checked" onclick="showOption(this.value);"/>Active
  					<input type="radio" name="consStutas" id="consStutas" value="0" onclick="showOption(this.value);"/>Inactive
  				<%}else{%>
  					<input type="radio" name="consStutas" id="consStutas" value="1" onclick="showOption(this.value);"/>Active
  					<input type="radio" name="consStutas" id="consStutas" value="0" checked="checked" onclick="showOption(this.value);"/>Inactive
  			<%}%>
  			
  			 <input type="hidden" id="consStatusvalue" name="consStatusvalue"/>
			</td>			
		</tr>
		<tr id="dispcondDelete" style="display: none;">
			<td class="classlangTestleft_TD">Reason</td>
			<td class="classlangTestright_TD">
				<input type="text" name="deleteConsult" id="deleteConsult"/> 
			</td>			
		</tr>
		
  		<tr id="isActiveDisplayButton">
            <td colspan="2" align="center">
            	<table border="0" cellpadding="0" cellspacing="0" width="100%">
            		<tr>
            			<td align="center">
				            <input type="button" name="addConsulnt" id="addConsulnt" value="Add" class="buttonSmall" onclick="return addConsulntFun();"/>
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="center">
				            <input type="button" name="editConsulnt" id="editConsulnt" value="Edit" class="buttonSmall" onclick="return editConsultFun();"/>
            			</td>
            			<td style="width: 15px;">&nbsp;</td>
            			<td align="center">
				            <input type="button" name="deleteConsulnt" id="deleteConsulnt" value="Delete" class="buttonSmall" onclick="return deleteConsultFun();"/>
            			</td>
            		</tr>
            	</table>
            </td>
        </tr>

  		<tr id="isaddConsult" style="display: none;">
            <td colspan="2" align="center">
            	<table border="0" cellpadding="0" cellspacing="0" width="100%">
            		<tr>            			
            			<td align="right">
				            <input type="button" name="cancelCons" id="cancelCons" value="Cancel" class="buttonSmall" onclick="return cancelSubmit();"/>
            			</td>
            			
            			<td align="left">
				            <input type="button" name="addCons" id="addCons" value="Add" class="buttonSmall" onclick="return ConsultantServlet('1');"/>
            			</td>
            		</tr>
            	</table>
            </td>
        </tr>
        
        
        <tr id="iseditConsult" style="display: none;">
            <td colspan="2" align="center">
            	<table border="0" cellpadding="0" cellspacing="0" width="100%">
            		<tr>            			
            			<td align="right">
				            <input type="button" name="cancelCons" id="cancelCons" value="Cancel" class="buttonSmall" onclick="return editcancelSubmit();"/>
            			</td>
            			
            			<td align="left">
				            <input type="button" name="editCons" id="editCons" value="Update" class="buttonSmall" onclick="return ConsultantServlet('2');"/>
            			</td>
            		</tr>
            	</table>
            </td>
        </tr>
        
        <tr id="isdeleteConsult" style="display: none;">
            <td colspan="2" align="center">
            	<table border="0" cellpadding="0" cellspacing="0" width="100%">
            		<tr>            			
            			<td align="right">
				            <input type="button" name="cancelCons" id="cancelCons" value="Cancel" class="buttonSmall" onclick="return deletecancelSubmit();"/>
            			</td>
            			
            			<td align="left">
				            <input type="button" name="deleteCons" id="deleteCons" value="Delete" class="buttonSmall" onclick="return ConsultantServlet('3');"/>
            			</td>
            		</tr>
            	</table>
            </td>
        </tr>
	</table>							
</form>
</body>
<%
}
%>
</html>
