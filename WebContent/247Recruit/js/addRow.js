// Table Delete Row with Calendar
// mredkj.com
// based off tabledeleterow.js version 1.2 2006-02-21
// tabledeleterow-calendar.js version 1.2.1 2006-05-04
// tabledeleterow-calendar.js version 1.2.2 2006-10-10

// CONFIG notes. Below are some comments that point to where this script can be customized.
// Note: Make sure to include a <tbody></tbody> in your table's HTML
// Note: Cannot use this with any calendar script that references object ids
//		 The way the rows are added and deleted, ids aren't reset.
// var coNo = document.getElementById('total_box').value;
var INPUT_NAME_PREFIX = 'addQues'; // this is being set via script
var RADIO_NAME = 'totallyrad'; // this is being set via script
var TABLE_NAME = 'tblSample'; // this should be named in the HTML
var TABLE_NAME1 = 'part1Tbl';
var ROW_BASE = 1; // first number (for display)
var hasLoaded = false;
window.onload=fillInRows;
var part=0; // No. of parts
var partIndex = 0;
var inques=1;
var iter1 = 0;
var incCnt = 1;
var k = 0;
var i = 0;
var j = 0;
function fillInRows()
{
	addRowHeaderOnload();
	onPreview();
}

// CONFIG:
// myRowObject is an object for storing information about the table rows
function myRowObject(one, two, three, four ,five)
{
	this.one = one; // tr id
	this.two = two; // td object data
	this.three = three; // input text object for id
	this.four = four;
	this.five = five;
}
function myRowObjectPart(one)
{
	this.one = one; // data id for part header
}
function myRowdivPart(one)
{
	this.one = one; // data id for part header
}
function myRowdiv(one, two, three)
{
	this.one = one; // tr id
	this.two = two; // td object data
	this.three = three;	
}
function incQues(inc)
{
	inques = inc;
}

function addRowHeaderOnload()
{
	var tbl = document.getElementById(TABLE_NAME);
	
/*<<<<<<<<<<<<<<<<<<<<<<<<< Create Inner Table & hidden input for tbl >>>>>>>>>>>>>>>>>>>>>>>>> 	*/
	var tot_parts = document.getElementById('total_parts').value;
	for(var i =1; i<= tot_parts;i++)
	{
		var tr_inner = document.createElement('tr');
		tr_inner.setAttribute('id','tr_tbl'+i );
		tbl.appendChild(tr_inner);
		
		var td_inner = document.createElement('td');
		td_inner.setAttribute('id','td_tbl'+i );
		tr_inner.appendChild(td_inner);
		
		var tblinner = document.createElement('table');
		tblinner.setAttribute("id", "part"+i+"Tbl");
		
		var tblbody = document.createElement('tbody');
		tblinner.appendChild(tblbody);
		
		var txtInp4 = document.createElement('input');
		txtInp4.type = 'hidden';
		txtInp4.name = 'total_box_Qns'+i;
		txtInp4.setAttribute('id', 'total_box_Qns'+ i);
		tblbody.appendChild(txtInp4);
		td_inner.appendChild(tblinner);
		
		var tblnew = document.getElementById("part"+i+"Tbl");
		tblnew.setAttribute('style', 'width:900px;');
		var nextRow = tblnew.tBodies[0].rows.length;
	
	/*<<<<<<<<<<<<<<<<<<<<<<<<< Part Header >>>>>>>>>>>>>>>>>>>>>>>>> */	
		var partValue = document.getElementById('partVal'+i).value;
		var row1 = tblnew.tBodies[0].insertRow(0);
		
		//row1.className = 'classy' + (iter % 2);
		row1.setAttribute('id', 'part_HeaderRow_tr'+ i);
		
		var cella = row1.insertCell(0);
		var textNode1 = document.createTextNode("Part \t"+i+"\t Header");
		cella.setAttribute('id', 'partHeader_td'+ i);
		cella.className='classOprnleft_TD';	
		cella.appendChild(textNode1);
		
		var cellb = row1.insertCell(1);
		var txtInp1 = document.createElement('input');
		txtInp1.type = 'text';
		txtInp1.name = 'partHeader'+ i;
		txtInp1.setAttribute('id', 'partHeader'+ i);
		txtInp1.value = partValue;
		txtInp1.setAttribute('class', 'reSizeforOther' );	
		txtInp1.setAttribute('maxlength', '500' );	
		txtInp1.setAttribute('onkeypress','return AllowChars(event);');
		cellb.className = 'classOprnright_TD';	
		cellb.appendChild(txtInp1);
	
	/*<<<<<<<<<<<<<<<<<<<<<<<<< Number of Question Part >>>>>>>>>>>>>>>>>>>>>>>>> */	
		var celld = row1.insertCell(2);
		var textQues1 =	document.createTextNode("Number Of Questions");
		celld.setAttribute('id', 'noofQues_td'+ i);
		celld.className = 'classOprnleft_TD';	
		celld.appendChild(textQues1);
		
		var celle = row1.insertCell(3);
		var totalQues = document.createElement("text");
		totalQues.value = inques;
		totalQues.setAttribute('id', 'PartAPart1QCountDIV'+ i);
		celle.className = 'classOprnright_TD_Qns';	
		celle.appendChild(totalQues);
		
		row1.myRow = new myRowObjectPart(textNode1);
	
		document.getElementById('total_box').value = i; 
		
	/*<<<<<<<<<<<<<<<<<<<<<<<<< Enter the Question 1 OnLoad >>>>>>>>>>>>>>>>>>>>>>>>> */	
		
		var tot_ques = document.getElementById('total_ques'+i).value;
		
		for( var j = 1; j <= tot_ques; j++)
		{ 
			var ques = document.getElementById('part'+i+'Ques'+j).value;
			var row = tblnew.tBodies[0].insertRow(j);
			
			// CONFIG: requires classes named classy0 and classy1
			row.className = 'classy' + (j % 2);
			row.setAttribute('id', 'part'+i+'_Qns_tr'+j);
			
			// CONFIG: This whole section can be configured
			// cell 0 - text
			var cell0 = row.insertCell(0);
			var textNode = document.createTextNode("Enter the question "+j);
			cell0.setAttribute('id', 'part'+i+'addQues_td'+ j);
			cell0.className='classOprnleft_TDDYNA';	
			cell0.appendChild(textNode);
			
			// cell 1 - input text
			var cell1 = row.insertCell(1);
			var txtInp = document.createElement('input');
			txtInp.type = 'text';
			txtInp.name = 'part'+i+'addQues'+ j;
			txtInp.setAttribute('id', 'part'+i+'addQues'+ j);
			txtInp.value = ques;
			txtInp.setAttribute('onkeypress','return AllowChars(event);');
			txtInp.setAttribute('class', 'reSizeforOther' );	
			txtInp.setAttribute('maxlength', '500' );	
			cell1.className = 'classOprnright_JS';	
			cell1.setAttribute('colspan', '3');
			cell1.appendChild(txtInp);
			
			// cell 3 - delete button
			var cell2 = row.insertCell(2);
			var btnEl = document.createElement('input');
			btnEl.type = 'button';
			btnEl.value = '';
			btnEl.setAttribute('id', 'part' + i + 'del_img'+ j);
			btnEl.setAttribute('name', 'part' + i + 'del_img'+ j);
			btnEl.setAttribute('class', 'srcvis');
			btnEl.setAttribute('onclick', 'deleteCurrentRow(this,' + i + ','+j+');');
			cell2.className='delImg';
			cell2.appendChild(btnEl);
			
			row.myRow = new myRowObject(row,cell0,textNode, txtInp, btnEl);
			
			document.getElementById('total_box_Qns'+i).value = j; 
			document.getElementById('PartAPart1QCountDIV'+i).innerHTML = j;
			k = j + 1;
		}
		
	/*<<<<<<<<<<<<<<<<<<<<<<<<< Add Row buttons OnLoad >>>>>>>>>>>>>>>>>>>>>>>>> 	*/
		var row2 = tblnew.tBodies[0].insertRow(k);
		row2.setAttribute('id', 'part'+ i +'_delRow_tr');
			
		var cellx = row2.insertCell(0);
		var txtInp2 = document.createElement('input');
		txtInp2.type = 'button';
		txtInp2.value = 'Delete Part';
		txtInp2.setAttribute('id', 'delPart'+ i +'button');
		txtInp2.setAttribute('name', 'delPart'+ i +'button');
		txtInp2.setAttribute('class', 'buttonMedium' );	
		txtInp2.setAttribute('style', ' float:left;');
		txtInp2.setAttribute('onclick', 'deleteCurrentPart('+i+');' );	
		cellx.setAttribute('colspan', '2');
		cellx.appendChild(txtInp2);
		
		var celly = row2.insertCell(1);
		var txtInp3 = document.createElement('input');
		txtInp3.type = 'button';
		txtInp3.value = 'Add Question';
		txtInp3.setAttribute('id', 'addQuesPart'+ i +'button');
		txtInp3.setAttribute('name', 'addQuesPart'+ i +'button');
		txtInp3.setAttribute('class', 'buttonMedium' );	
		txtInp3.setAttribute('style', ' float:right;');
		txtInp3.setAttribute('onclick', 'addRowQuestion('+i+');' );	
		celly.setAttribute('colspan', '3');
		celly.appendChild(txtInp3);
		
	}
}

function onPreview()
{
	var divId = document.getElementById("tblSample1");
	var tot_parts = document.getElementById('total_parts').value;

	for( var a =1;a<= tot_parts;a++)
	{
		var partVal = document.getElementById('partVal'+ a).value;
		
		var tr_divinner = document.createElement('tr');
		tr_divinner.setAttribute('id','tr_div'+a );
		divId.appendChild(tr_divinner);
		
		var td_divinner = document.createElement('td');
		td_divinner.setAttribute('id','td_div'+a );
		tr_divinner.appendChild(td_divinner);
		
		var divinner = document.createElement('table');
		divinner.setAttribute("id", "part"+a+"div");
		divinner.setAttribute("cellspacing", "6");
		divinner.setAttribute("cellpadding", "6");
		divinner.setAttribute("width", "900px");
		divinner.setAttribute("border", "0");
		
		var divbody = document.createElement('tbody');
		divinner.appendChild(divbody);
		
		var divInp4 = document.createElement('input');
		divInp4.type = 'hidden';
		divInp4.name = 'total_div_Qns'+a;
		divInp4.setAttribute('id', 'total_div_Qns'+ a);
		divbody.appendChild(divInp4);
		td_divinner.appendChild(divinner);
		
		var divnew = document.getElementById("part"+a+"div");
		divnew.setAttribute('style', 'width:900px;');
		divnew.setAttribute('cellspacing', '6');
		divnew.setAttribute('cellpadding', '6');
		divnew.setAttribute('border', '0');

		var nextRow = divnew.tBodies[0].rows.length;
	
		var divRow = divnew.tBodies[0].insertRow(0);
		divRow.setAttribute('id', 'part_div_tr'+ a);
		
		var diva = divRow.insertCell(0); 
		var divNode1 = document.createTextNode("Part"+a+"-"+partVal);
		diva.setAttribute('id', 'partdiv_td'+ a);
		diva.setAttribute('colspan', '4');
		diva.className='allBackheading';
		diva.appendChild(divNode1);
		
		var divRow2 = divnew.tBodies[0].insertRow(1);
		divRow2.setAttribute('id', 'Qns_div_tr'+ a);
		divRow2.className='allBackmain';
		divRow2.setAttribute('align', 'center');
	
		var divb = divRow2.insertCell(0); 
		var divNode2 = document.createTextNode("Sl.No");
		divb.setAttribute('id', 'snodiv_td'+ a);
		divb.appendChild(divNode2);
		
		var divc = divRow2.insertCell(1); 
		var divNode3 = document.createTextNode("Question");
		divc.setAttribute('id', 'Qnsdiv_td'+ a);
		divc.setAttribute('align', 'left');
		divc.appendChild(divNode3);
		
		var divd = divRow2.insertCell(2); 
		var divNode4= document.createTextNode("Comment");
		divd.setAttribute('id', 'cmtdiv_td'+ a);
		divd.appendChild(divNode4);
		
		var dive = divRow2.insertCell(3); 
		var divNode5 = document.createTextNode("Score");
		dive.setAttribute('id', 'scrdiv_td'+ a);
		dive.appendChild(divNode5);
		
		document.getElementById('total_divbox').value =a; 
		var tot_ques = document.getElementById('total_ques'+a).value;
		for( var b = 1; b <= tot_ques; b++)
		{ 
			var ques = document.getElementById('part'+a+'Ques'+b).value;
			var c = b+1;
			var divRow3 = divnew.tBodies[0].insertRow(c);
			divRow3.setAttribute('id', 'part'+a+'ques_div_tr'+ b);
			divRow3.setAttribute('align', 'center');
			
			var divf = divRow3.insertCell(0);
			var sNo = document.createElement("div");
			divf.setAttribute('id', 'part'+a+'sNo'+ b);
			divf.setAttribute('class', 'allBackColor');
			divf.setAttribute('width', '150px');
			sNo.innerHTML = "";
			divf.appendChild(sNo); 
			
			var divg = divRow3.insertCell(1);
			var qns = document.createElement("div");
			divg.setAttribute('id', 'part'+a+'qns'+ b);
			divg.setAttribute('class', 'allBackColor');
			divg.setAttribute('align', 'left');
			divg.setAttribute('width', '300px');
			qns.innerHTML = ques;
			divg.appendChild(qns); 
			
			var divh = divRow3.insertCell(2);
			var cmt = document.createElement("textarea");
			cmt.setAttribute('style','width:300px;resize:none;');
			divh.setAttribute('id', 'cmt');
			divh.setAttribute('width', '150px');
			cmt.setAttribute('rows', '2');
			divh.setAttribute('style','background-color: #F2F2F2;');
			cmt.setAttribute('disabled','disabled');
			divh.appendChild(cmt); 
			
			var divi = divRow3.insertCell(3);
			var scr = document.createElement("select");
			var opt = document.createElement("option");
			divi.setAttribute('id', 'scr');
			divi.setAttribute('width', '150px');
			scr.setAttribute('style',' width:170px;height: 20px; color: #342826;text-align: center;');
			scr.setAttribute('disabled','disabled');
			scr.setAttribute('size', '1');
			opt.innerHTML = 'Select';
			scr.appendChild(opt);
			divi.appendChild(scr);
			document.getElementById('total_div_Qns'+a).value =b; 
			
		}
	}	
}
function addRowHeader()
{
	var tbl = document.getElementById(TABLE_NAME);
	
	part = document.getElementById('total_box').value;
	if(part == 0)
	{
		part=1;
	}
	else if(part >= 0)
	{
		part++;
	}
	
/*<<<<<<<<<<<<<<<<<<<<<<<<< Create Inner Table & hidden input for tbl >>>>>>>>>>>>>>>>>>>>>>>>> 	*/

	var tr_inner = document.createElement('tr');
	tr_inner.setAttribute('id','tr_tbl'+part );
	tbl.appendChild(tr_inner);
	
	var td_inner = document.createElement('td');
	td_inner.setAttribute('id','td_tbl'+part );
	tr_inner.appendChild(td_inner);
	
	var tblinner = document.createElement('table');
	tblinner.setAttribute("id", "part"+part+"Tbl");
	
	var tblbody = document.createElement('tbody');
	tblinner.appendChild(tblbody);
	
	var txtInp4 = document.createElement('input');
	txtInp4.type = 'hidden';
	txtInp4.name = 'total_box_Qns'+part;
	txtInp4.setAttribute('id', 'total_box_Qns'+ part);
	tblbody.appendChild(txtInp4);
	td_inner.appendChild(tblinner);
	
	var tblnew = document.getElementById("part"+part+"Tbl");
	tblnew.setAttribute('style', 'width:900px;');
	
	var nextRow = tblnew.tBodies[0].rows.length;

/*<<<<<<<<<<<<<<<<<<<<<<<<< Part Header >>>>>>>>>>>>>>>>>>>>>>>>> */	
	
	var row1 = tblnew.tBodies[0].insertRow(0);
	
	//row1.className = 'classy' + (iter % 2);
	row1.setAttribute('id', 'part_HeaderRow_tr'+ part);
	
	var cella = row1.insertCell(0);
	var textNode1 = document.createTextNode("Part \t"+part+"\t Header");
	cella.setAttribute('id', 'partHeader_td'+ part);
	cella.className='classOprnleft_TD';	
	cella.appendChild(textNode1);
	
	var cellb = row1.insertCell(1);
	var txtInp1 = document.createElement('input');
	txtInp1.type = 'text';
	txtInp1.name = 'partHeader'+ part;
	txtInp1.setAttribute('id', 'partHeader'+ part);
	txtInp1.setAttribute('class', 'reSizeforOther' );	
	txtInp1.setAttribute('maxlength', '500' );	
	txtInp1.setAttribute('onkeypress','return AllowChars(event);');
	cellb.className = 'classOprnright_TD';	
	cellb.appendChild(txtInp1);

/*<<<<<<<<<<<<<<<<<<<<<<<<< Number of Question Part >>>>>>>>>>>>>>>>>>>>>>>>> */	
	var celld = row1.insertCell(2);
	var textQues1 =	document.createTextNode("Number Of Questions");
	celld.setAttribute('id', 'noofQues_td'+ part);
	celld.className = 'classOprnleft_TD';	
	celld.appendChild(textQues1);
	
	var celle = row1.insertCell(3);
	var totalQues = document.createElement("text");
	totalQues.value = inques;
	totalQues.setAttribute('id', 'PartAPart1QCountDIV'+ part);
	celle.className = 'classOprnright_TD_Qns';	
	celle.appendChild(totalQues);
	
	row1.myRow = new myRowObjectPart(textNode1);

	document.getElementById('total_box').value = part; 
	

	/*<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
	var divId = document.getElementById("tblSample1");

	var tr_divinner = document.createElement('tr');
	tr_divinner.setAttribute('id','tr_div'+part);
	divId.appendChild(tr_divinner);
	
	var td_divinner = document.createElement('td');
	td_divinner.setAttribute('id','td_div'+part );
	tr_divinner.appendChild(td_divinner);
	
	var divinner = document.createElement('table');
	divinner.setAttribute("id", "part"+part+"div");
	divinner.setAttribute("cellspacing", "6");
	divinner.setAttribute("cellpadding", "6");
	divinner.setAttribute("width", "900px");
	divinner.setAttribute("border", "0");
	
	var divbody = document.createElement('tbody');
	divinner.appendChild(divbody);
	var divInp4 = document.createElement('input');
	divInp4.type = 'hidden';
	divInp4.name = 'total_div_Qns'+part;
	divInp4.setAttribute('id', 'total_div_Qns'+ part);
	divbody.appendChild(divInp4);
	td_divinner.appendChild(divinner);
	
	var divnew = document.getElementById("part"+part+"div");
	divnew.setAttribute('style', 'width:900px;');
	
	var nextRow = divnew.tBodies[0].rows.length;

	var divRow = divnew.tBodies[0].insertRow(0);
	divRow.setAttribute('id', 'part_div_tr'+ part);
	
	var diva = divRow.insertCell(0); 
	var divNode1 = document.createTextNode("Part"+part+"-");
	diva.setAttribute('id', 'partdiv_td'+ part);
	diva.setAttribute('colspan', '4');
	diva.className='allBackheading';
	diva.appendChild(divNode1);
	
	var divRow2 = divnew.tBodies[0].insertRow(1);
	divRow2.setAttribute('id', 'Qns_div_tr'+ part);
	divRow2.className='allBackmain';
	divRow2.setAttribute('align', 'center');

	var divb = divRow2.insertCell(0); 
	var divNode2 = document.createTextNode("Sl.No");
	divb.setAttribute('id', 'snodiv_td'+ part);
	divb.appendChild(divNode2);
	
	var divc = divRow2.insertCell(1); 
	var divNode3 = document.createTextNode("Question");
	divc.setAttribute('id', 'Qnsdiv_td'+ part);
	divc.setAttribute('align', 'left');
	divc.appendChild(divNode3);
	
	var divd = divRow2.insertCell(2); 
	var divNode4= document.createTextNode("Comment");
	divd.setAttribute('id', 'cmtdiv_td'+ part);
	divd.appendChild(divNode4);
	
	var dive = divRow2.insertCell(3); 
	var divNode5 = document.createTextNode("Score");
	dive.setAttribute('id', 'scrdiv_td'+ part);
	dive.appendChild(divNode5);
	
	document.getElementById('total_divbox').value =part; 
}
/*<<<<<<<<<<<<<<<<<<<<<<<<< Enter the Question 1 OnLoad >>>>>>>>>>>>>>>>>>>>>>>>> */	
	// add the row
function addQuestionOnload()
{
	var j = 0;
	var tblnew = document.getElementById("part"+part+"Tbl");
	tblnew.setAttribute('style', 'width:900px;');
	var tot_parts = document.getElementById('total_parts').value;
	var tot_ques = document.getElementById('total_ques').value;
	for(var i =1; i<= tot_parts;i++)
	{
		for(j = 1; j <= tot_ques; j++)
		{
		var ques = document.getElementById('part'+i+'Ques'+j).value;
		var row = tblnew.tBodies[0].insertRow(j);
		
		// CONFIG: requires classes named classy0 and classy1
		row.className = 'classy' + (j % 2);
		row.setAttribute('id', 'part'+i+'_Qns_tr'+j);
		
		// CONFIG: This whole section can be configured
		// cell 0 - text
		var cell0 = row.insertCell(0);
		var textNode = document.createTextNode("Enter the question "+j);
		cell0.setAttribute('id', 'part'+i+'addQues_td'+ j);
		cell0.className='classOprnleft_TDDYNA';	
		cell0.appendChild(textNode);
		
		// cell 1 - input text
		var cell1 = row.insertCell(1);
		var txtInp = document.createElement('input');
		txtInp.type = 'text';
		txtInp.name = 'part'+i+'addQues'+ j;
		txtInp.setAttribute('id', 'part'+i+'addQues'+ j);
		txtInp.value = ques;
		txtInp.setAttribute('onkeypress','return AllowChars(event);');
		txtInp.setAttribute('class', 'reSizeforOther' );
		txtInp.setAttribute('maxlength', '500' );	
		cell1.className = 'classOprnright_JS';	
		cell1.setAttribute('colspan', '3');
		cell1.appendChild(txtInp);
		
		// cell 3 - delete button
		var cell2 = row.insertCell(2);
		var btnEl = document.createElement('input');
		btnEl.type = 'button';
		btnEl.value = '';
		btnEl.setAttribute('id', 'part' + i + 'del_img'+ j);
		btnEl.setAttribute('name', 'part' + i + 'del_img'+ j);
		btnEl.setAttribute('class', 'srcvis');
		btnEl.setAttribute('onclick', 'deleteCurrentRow(this,' + i + ','+j+');');
		cell2.className='delImg';
		cell2.appendChild(btnEl);
		
		k = j+1;
		
		row.myRow = new myRowObject(row,cell0,textNode, txtInp, btnEl);

		document.getElementById('total_box_Qns'+i).value = j; 
		document.getElementById('PartAPart1QCountDIV'+i).innerHTML = j;
		}
	}
}

/*<<<<<<<<<<<<<<<<<<<<<<<<< Add Row buttons OnLoad >>>>>>>>>>>>>>>>>>>>>>>>> 	*/
function addRowButtonsOnload()
{
	var tblnew = document.getElementById("part"+part+"Tbl");
	tblnew.setAttribute('style', 'width:900px;');
	
	var row2 = tblnew.tBodies[0].insertRow(k);
	row2.setAttribute('id', 'part'+ part +'_delRow_tr');
		
	var cellx = row2.insertCell(0);
	var txtInp2 = document.createElement('input');
	txtInp2.type = 'button';
	txtInp2.value = 'Delete Part';
	txtInp2.setAttribute('id', 'delPart'+ part +'button');
	txtInp2.setAttribute('name', 'delPart'+ part +'button');
	txtInp2.setAttribute('class', 'buttonMedium' );	
	txtInp2.setAttribute('style', ' float:left;');
	txtInp2.setAttribute('onclick', 'deleteCurrentPart('+part+');' );	
	cellx.setAttribute('colspan', '2');
	cellx.appendChild(txtInp2);
	
	var celly = row2.insertCell(1);
	var txtInp3 = document.createElement('input');
	txtInp3.type = 'button';
	txtInp3.value = 'Add Question';
	txtInp3.setAttribute('id', 'addQuesPart'+ part +'button');
	txtInp3.setAttribute('name', 'addQuesPart'+ part +'button');
	txtInp3.setAttribute('class', 'buttonMedium' );	
	txtInp3.setAttribute('style', ' float:right;');
	txtInp3.setAttribute('onclick', 'addRowQuestion('+part+');' );	
	celly.setAttribute('colspan', '3');
	celly.appendChild(txtInp3);
	
}

/*<<<<<<<<<<<<<<<<<<<<<<<<< Enter the Question 1 OnAddPart >>>>>>>>>>>>>>>>>>>>>>>>> */	

function addQuestionOnAddPart()
{
	
	var tblnew = document.getElementById("part"+part+"Tbl");
	
	iter1 = 1;
	var row = tblnew.tBodies[0].insertRow(1);
	
	// CONFIG: requires classes named classy0 and classy1
	row.className = 'classy' + (iter1 % 2);
	row.setAttribute('id', 'part'+part+'_Qns_tr'+iter1);
	
	// CONFIG: This whole section can be configured
	// cell 0 - text
	var cell0 = row.insertCell(0);
	var textNode = document.createTextNode("Enter the question "+iter1);
	cell0.setAttribute('id', 'part'+part+'addQues_td'+ iter1);
	cell0.className='classOprnleft_TDDYNA';	
	cell0.appendChild(textNode);
	
	// cell 1 - input text
	var cell1 = row.insertCell(1);
	var txtInp = document.createElement('input');
	txtInp.type = 'text';
	txtInp.name = 'part'+part+'addQues'+ iter1;
	txtInp.setAttribute('id', 'part'+part+'addQues'+ iter1);
	txtInp.setAttribute('onkeypress','return AllowChars(event);');
	txtInp.setAttribute('class', 'reSizeforOther' );	
	txtInp.setAttribute('maxlength', '500' );	
	cell1.className = 'classOprnright_JS';	
	cell1.setAttribute('colspan', '3');
	cell1.appendChild(txtInp);
	
	// cell 3 - delete button
	var cell2 = row.insertCell(2);
	var btnEl = document.createElement('input');
	btnEl.type = 'button';
	btnEl.value = '';
	btnEl.setAttribute('id', 'part' + part + 'del_img'+ iter1);
	btnEl.setAttribute('name', 'part' + part + 'del_img'+ iter1);
	btnEl.setAttribute('class', 'srcvis');
	btnEl.setAttribute('onclick', 'deleteCurrentRow(this,' + part + ','+iter1+');');
	cell2.className='delImg';
	cell2.appendChild(btnEl);
	
	row.myRow = new myRowObject(row,cell0,textNode, txtInp, btnEl);
	
	document.getElementById('total_box_Qns'+part).value = iter1; 
	document.getElementById('PartAPart1QCountDIV'+part).innerHTML = iter1;
	
	var divnew = document.getElementById("part"+part+"div");

	var divRow3 = divnew.tBodies[0].insertRow(2);
	divRow3.setAttribute('id', 'part'+part+'ques_div_tr'+ iter1);
	divRow3.setAttribute('align', 'center');
	
	var divf = divRow3.insertCell(0);
	var sNo = document.createElement("div");
	divf.setAttribute('id', 'part'+part+'sNo'+ iter1);
	divf.setAttribute('class', 'allBackColor');
	divf.setAttribute('width', '150px');
	sNo.innerHTML = "";
	divf.appendChild(sNo); 
	
	var divg = divRow3.insertCell(1);
	var qns = document.createElement("div");
	divg.setAttribute('id', 'part'+part+'qns'+ iter1);
	divg.setAttribute('class', 'allBackColor');
	divg.setAttribute('align', 'left');
	divg.setAttribute('width', '300px');
	qns.innerHTML = "";
	divg.appendChild(qns); 
	
	var divh = divRow3.insertCell(2);
	var cmt = document.createElement("textarea");
	cmt.setAttribute('style','width:300px;resize:none;');
	divh.setAttribute('id', 'cmt');
	cmt.setAttribute('rows', '2');
	divh.setAttribute('style','background-color: #F2F2F2;');
	divh.setAttribute('width', '300px');
	cmt.setAttribute('disabled','disabled');
	divh.appendChild(cmt); 
	
	var divi = divRow3.insertCell(3);
	var scr = document.createElement("select");
	var opt = document.createElement("option");
	divi.setAttribute('id', 'scr');
	divi.setAttribute('width', '150px');
	scr.setAttribute('style',' width:170px;height: 20px; color: #342826;text-align: center;');
	scr.setAttribute('disabled','disabled');
	scr.setAttribute('size', '1');
	opt.innerHTML = 'Select';
	scr.appendChild(opt);
	divi.appendChild(scr);
	
	document.getElementById('total_div_Qns'+part).value =iter1; 
}

/*<<<<<<<<<<<<<<<<<<<<<<<<< Add Row buttons OnAddPart >>>>>>>>>>>>>>>>>>>>>>>>> 	*/
function addRowButtonsOnAddPart()
{
	var tblnew = document.getElementById("part"+part+"Tbl");
	tblnew.setAttribute('style', 'width:900px;');
	
	var row2 = tblnew.tBodies[0].insertRow(2);
	row2.setAttribute('id', 'part'+ part +'_delRow_tr');
		
	var cellx = row2.insertCell(0);
	var txtInp2 = document.createElement('input');
	txtInp2.type = 'button';
	txtInp2.value = 'Delete Part';
	txtInp2.setAttribute('id', 'delPart'+ part +'button');
	txtInp2.setAttribute('name', 'delPart'+ part +'button');
	txtInp2.setAttribute('class', 'buttonMedium' );	
	txtInp2.setAttribute('style', ' float:left;');
	txtInp2.setAttribute('onclick', 'deleteCurrentPart('+part+');' );	
	cellx.setAttribute('colspan', '2');
	cellx.appendChild(txtInp2);
	
	var celly = row2.insertCell(1);
	var txtInp3 = document.createElement('input');
	txtInp3.type = 'button';
	txtInp3.value = 'Add Question';
	txtInp3.setAttribute('id', 'addQuesPart'+ part +'button');
	txtInp3.setAttribute('name', 'addQuesPart'+ part +'button');
	txtInp3.setAttribute('class', 'buttonMedium' );	
	txtInp3.setAttribute('style', ' float:right;');
	txtInp3.setAttribute('onclick', 'addRowQuestion('+part+');' );	
	celly.setAttribute('colspan', '3');
	celly.appendChild(txtInp3);
	
}

function addRowQuestion(partId)
{
	var tblqns = document.getElementById("part"+partId+"Tbl");
	var nextRow = tblqns.tBodies[0].rows.length;
	
/*<<<<<<<<<<<<<<<<<<<<<<<<< Enter the Question from 2 part >>>>>>>>>>>>>>>>>>>>>>>>> */	
	
	var temp=document.getElementById('total_box_Qns'+partId).value;
	//alert("temp :" + temp);
	var iteration = 0;
	
	if(temp==1)
	{
		iteration = 1;
		iteration++;
		//iteration= nextRow-1;	
	}	
	else if(temp>= 1)
	{
		iteration = temp ;
		iteration++;
		//iteration= nextRow-1;
	}	
	
	// add the row
	var row = tblqns.tBodies[0].insertRow(iteration);
	
	// CONFIG: requires classes named classy0 and classy1
	row.className = 'classy' + (iteration % 2);
	row.setAttribute('id', 'part'+partId+'_Qns_tr'+iteration);
	
	// cell 0 - text
	var cell0 = row.insertCell(0);
	var textNode = document.createTextNode("Enter the question "+iteration);
	cell0.setAttribute('id', 'part'+partId+'addQues_td'+ iteration);
	cell0.className='classOprnleft_TDDYNA';	
	cell0.appendChild(textNode);
	
	// cell 1 - input text
	var cell1 = row.insertCell(1);
	var txtInp = document.createElement('input');
	txtInp.type = 'text';
	txtInp.name = 'part'+partId+'addQues'+ iteration;
	txtInp.setAttribute('id', 'part'+partId+'addQues'+ iteration);
	txtInp.setAttribute('onkeypress','return AllowChars(event);');
	txtInp.setAttribute('class', 'reSizeforOther' );	
	txtInp.setAttribute('maxlength', '500' );	
	cell1.className='classOprnright_JS';	
	cell1.setAttribute('colspan', '3');
	cell1.appendChild(txtInp);
	
	var cell2 = row.insertCell(2);
	var btnEl = document.createElement('input');
	btnEl.type = 'button';
	btnEl.value = '';
	btnEl.setAttribute('id', 'part'+partId+'del_img'+ iteration);
	btnEl.setAttribute('name', 'part'+partId+'del_img'+ iteration);
	btnEl.setAttribute('class', 'srcvis');
	btnEl.setAttribute('onclick', 'deleteCurrentRow(this,'+partId+','+iteration+');');
	cell2.className='delImg';
	cell2.appendChild(btnEl);
	
	row.myRow = new myRowObject(row,cell0,textNode, txtInp, btnEl);
	
	document.getElementById('total_box_Qns'+partId).value = iteration; // Stores the total value
	document.getElementById('PartAPart1QCountDIV'+partId).innerHTML = iteration;
	incQues(iteration); // Stores the latest iteration value incQues func
	
	var divnew = document.getElementById("part"+partId+"div");
	
	var d = (iteration + 1);
	var divRow3 = divnew.tBodies[0].insertRow(d);
	divRow3.setAttribute('id', 'part'+partId+'ques_div_tr'+ iteration);
	divRow3.setAttribute('align', 'center');
	
	var divf = divRow3.insertCell(0);
	var sNo = document.createElement("div");
	divf.setAttribute('id', 'part'+partId+'sNo'+ iteration);
	divf.setAttribute('class', 'allBackColor');
	divf.setAttribute('width', '150px');
	sNo.innerHTML = "";
	divf.appendChild(sNo); 
	
	var divg = divRow3.insertCell(1);
	var qns = document.createElement("div");
	divg.setAttribute('id', 'part'+partId+'qns'+ iteration);
	divg.setAttribute('class', 'allBackColor');
	divg.setAttribute('align', 'left');
	divg.setAttribute('width', '300px');
	divg.appendChild(qns); 
	
	var divh = divRow3.insertCell(2);
	var cmt = document.createElement("textarea");
	cmt.setAttribute('style','width:300px;resize:none; ');
	divh.setAttribute('id', 'cmt');
	divh.setAttribute('width', '300px');
	cmt.setAttribute('rows', '2');
	divh.setAttribute('style','background-color: #F2F2F2;');
	cmt.setAttribute('disabled','disabled');
	divh.appendChild(cmt); 
	
	var divi = divRow3.insertCell(3);
	var scr = document.createElement("select");
	var opt = document.createElement("option");
	divi.setAttribute('id', 'scr');
	divi.setAttribute('width', '150px');
	scr.setAttribute('style',' width:170px;height: 20px; color: #342826;text-align: center;');
	scr.setAttribute('disabled','disabled');
	scr.setAttribute('size', '1');
	opt.innerHTML = 'Select';
	scr.appendChild(opt);
	divi.appendChild(scr);
	
	document.getElementById('total_div_Qns'+partId).value =iteration; 
	divRow3.myRow = new myRowdiv(divRow3,divf,divg);
}

/*<<<<<<<<<<<<<<<<<<<<<<<<< Delete Current Row >>>>>>>>>>>>>>>>>>>>>>>>> */	
function deleteCurrentRow(obj,partId,qnsId)
{
	var tbldel = document.getElementById("part"+partId+"Tbl");
	var nextRow = tbldel.tBodies[0].rows.length;
	if (nextRow >3)
	{
		var delRow = obj.parentNode.parentNode;
		var tbldelRow = delRow.parentNode.parentNode;
		var rIndex = delRow.sectionRowIndex;
		var rowArray = new Array(delRow);			
		deleteRows(rowArray);
		reorderRows(tbldelRow, rIndex,partId);
		
		document.getElementById('PartAPart1QCountDIV'+partId).innerHTML = count-1;
		document.getElementById('total_box_Qns'+partId).value = count-1; // Stores the total value
		
		var delRow1 = document.getElementById("part" + partId + "ques_div_tr" + qnsId);
		var tbldelRow1 = delRow1.parentNode.parentNode;
		var rIndex1 = delRow1.sectionRowIndex;
		var rowArray1 = new Array(delRow1);			
		deleteRows(rowArray1);
		reorderRows1(tbldelRow1, qnsId,partId);
	}
	else
	{
		alert('Can not delete. At least one row required !');	
	}

}
function reorderRows(tbl, startingIndex,partId)
{
	if (tbl.tBodies[0].rows[startingIndex])
	{
		count = startingIndex ;
		for (var i=(startingIndex); i<(tbl.tBodies[0].rows.length)-1; i++) 
		{				
			tbl.tBodies[0].rows[i].myRow.one.id = 'part'+partId+'_Qns_tr'+count; // tr id for enter the Ques
			
			tbl.tBodies[0].rows[i].myRow.two.id = 'part'+partId+'addQues_td'+count; // td id for enter the Ques
			
			tbl.tBodies[0].rows[i].myRow.three.data = "Enter the question "+count; // data for enter the Ques
			
			tbl.tBodies[0].rows[i].myRow.four.id = 'part'+partId+'addQues'+count; // input id for enter the Ques
			tbl.tBodies[0].rows[i].myRow.four.name = 'part'+partId+'addQues'+count; // input name for enter the Ques
			
			tbl.tBodies[0].rows[i].myRow.five.id = 'part'+partId+'del_img'+count; // td id for del_img
			tbl.tBodies[0].rows[i].myRow.five.name = 'part'+partId+'del_img'+count; // td name for del_img
			document.getElementById("part" + partId + "del_img" + i).setAttribute('onclick', 'deleteCurrentRow(this,' + partId + ','+ i +');');
			
			tbl.tBodies[0].rows[i].className = 'classy' + (count % 2);			
			count++;
		}
	}
	
}
function deleteRows(rowObjArray)
{
	for (var i=0; i<rowObjArray.length; i++) 
	{
		var rIndex = rowObjArray[i].sectionRowIndex;
		rowObjArray[i].parentNode.deleteRow(rIndex);
	}
}
function reorderRows1(tbl, startingIndex,partId)
{
	if (tbl.tBodies[0].rows[startingIndex])
	{
		for (var i=(startingIndex+1); i<(tbl.tBodies[0].rows.length); i++) 
		{				
			var New_Id = i - 1;
			
			document.getElementById('part'+ partId +'ques_div_tr' + i).id = 'part'+ partId +'ques_div_tr' + New_Id ;
		
			document.getElementById('part'+ partId +'sNo' + i).id = 'part'+ partId +'sNo' + New_Id ; 
		
			document.getElementById('part'+ partId +'qns' + i).id = 'part'+ partId +'qns' + New_Id ; 
			
			document.getElementById('total_div_Qns'+partId).value = New_Id;
		}
	}
}
function deleteCurrentPart(partId)
{
	var tbldelpartrowtbl = document.getElementById("tblSample");
	var tbldelpartrow = document.getElementById("tr_tbl"+partId);
	
	var nextRow = tbldelpartrowtbl.rows.length;
	if(nextRow > 1)		
	{
		tbldelpartrowtbl.removeChild(tbldelpartrow);
		reorderPart(partId);
		part = part - 1;
		
		var divParent = document.getElementById("tblSample1");
		var divChildtr = document.getElementById("tr_div"+partId);
		divParent.removeChild(divChildtr);
		reorderPart1(partId);
	}
	else
	{
		alert('Can not delete. At least one part required !');	
	}
}

function reorderPart(startingIndex)
{
	var tot_parts = document.getElementById('total_box').value;
	
	document.getElementById('total_box').value = tot_parts - 1; 

	for (var i = (startingIndex+1); i <= tot_parts; i++) 
	{				
		
		var tbl = document.getElementById("part" + i + "Tbl");
		var RowCt = tbl.rows.length - 1;
		var NewId = i - 1 ;
		
		document.getElementById('tr_tbl' + i).id = 'tr_tbl' + NewId ; // tr id ;
		document.getElementById('td_tbl' + i).id = 'td_tbl' + NewId ; // td id ;
		
		document.getElementById('part_HeaderRow_tr' + i).id = 'part_HeaderRow_tr' + NewId ; // tr id ;
		
		document.getElementById('partHeader_td' + i).id = 'partHeader_td' + NewId ; // td id ;
		
		tbl.tBodies[0].rows[0].myRow.one.data = "Part \t"+ NewId +"\t Header"; // data for part header

		document.getElementById('partHeader' + i).name = 'partHeader' + NewId ; // td id ;
		document.getElementById('partHeader' + i).id = 'partHeader' + NewId ; // tr id ;
		
		document.getElementById('noofQues_td' + i).id = 'noofQues_td' + NewId ; // tr id ;
		
		document.getElementById('PartAPart1QCountDIV' + i).name = 'PartAPart1QCountDIV' + NewId ; // tr id ;
		document.getElementById('PartAPart1QCountDIV' + i).id = 'PartAPart1QCountDIV' + NewId ; // td id ;
		
		newquesId = document.getElementById('total_box_Qns' + i).value;
		
		document.getElementById('total_box_Qns' + i).name = 'total_box_Qns' + NewId ; // tr id ;
		document.getElementById('total_box_Qns' + i).id = 'total_box_Qns' + NewId ; // td id ;
		
		for (var j = 1; j < RowCt; j++) 
		{	
			document.getElementById("part" + i + "_Qns_tr" + j).id = 'part' + NewId + '_Qns_tr' + j; // tr id for enter the ques;
			document.getElementById("part" + i + "addQues_td" + j).id = 'part' + NewId + 'addQues_td' + j; // 
			document.getElementById("part" + i + "addQues" + j).name = 'part' + NewId + 'addQues' + j; // 
			document.getElementById("part" + i + "addQues" + j).id = 'part' + NewId + 'addQues' + j; // 
			
			document.getElementById("part" + i + "del_img" + j).removeAttribute('onclick', 'deleteCurrentRow(this,' + startingIndex + ');');
			document.getElementById("part" + i + "del_img" + j).name = "part" + NewId + "del_img" + j;
			document.getElementById("part" + i + "del_img" + j).id = "part" + NewId + "del_img" + j;
			document.getElementById("part" + NewId + "del_img" + j).setAttribute('onclick', 'deleteCurrentRow(this,' + NewId + ','+ j +');');
		}
		document.getElementById('part'+ i +'_delRow_tr' ).id = 'part'+ NewId +'_delRow_tr' ;
		document.getElementById('delPart'+ i +'button' ).removeAttribute('onclick');
		document.getElementById('delPart'+ i +'button' ).name = 'delPart'+ NewId +'button' ;
		document.getElementById('delPart'+ i +'button' ).id = 'delPart'+ NewId +'button' ;
		document.getElementById('delPart'+ NewId +'button' ).setAttribute('onclick', 'deleteCurrentPart('+ NewId +');' );
		
		document.getElementById('addQuesPart'+ i +'button' ).removeAttribute('onclick');
		document.getElementById('addQuesPart'+ i +'button' ).name = 'addQuesPart'+ NewId +'button' ;
		document.getElementById('addQuesPart'+ i +'button' ).id = 'addQuesPart'+ NewId +'button' ;
		document.getElementById('addQuesPart'+ NewId +'button' ).setAttribute('onclick', 'addRowQuestion('+ NewId +');' );	
		
		tbl.id = 'part' + NewId + 'Tbl';
		document.getElementById('total_box_Qns'+NewId).value = newquesId;


	}
}

function reorderPart1(startIndex)
{
	var tot_part = document.getElementById('total_divbox').value;
	for (var i = (startIndex+1); i <= tot_part; i++) 
	{				
		var tbl = document.getElementById("part" + i + "div");
		var RowCt = tbl.rows.length - 1;
		var New_Id = i - 1;
		
		document.getElementById('tr_div' + i).id = 'tr_div' + New_Id ; // tr id ;
		document.getElementById('td_div' + i).id = 'td_div' + New_Id ; // td id ;
		
		document.getElementById('part_div_tr' + i).id = 'part_div_tr' + New_Id ; // tr id ;
		document.getElementById('partdiv_td' + i).id = 'partdiv_td' + New_Id ; // tr id ;
		
		document.getElementById('Qns_div_tr' + i).id = 'Qns_div_tr' + New_Id ; // td id ;
		document.getElementById('snodiv_td' + i).id = 'snodiv_td' + New_Id ; // tr id ;
		document.getElementById('Qnsdiv_td' + i).id = 'Qnsdiv_td' + New_Id ; // tr id ;
		
		newques_Id = document.getElementById('total_div_Qns' + i).value;
		
		document.getElementById('total_div_Qns' + i).name = 'total_div_Qns' + New_Id ; // tr id ;
		document.getElementById('total_div_Qns' + i).id = 'total_div_Qns' + New_Id ; // td id ;
		
		for (var j = 1; j < RowCt; j++) 
		{	
			document.getElementById('part'+ i +'ques_div_tr' + j).id = 'part'+ New_Id +'ques_div_tr' + j ;
			document.getElementById('part'+ i +'sNo' + j).id = 'part'+ New_Id +'sNo' + j ; 
			document.getElementById('part'+ i +'qns' + j).id = 'part'+ New_Id +'qns' + j ; 
		}
		
		tbl.id = 'part' + New_Id + 'div';
		document.getElementById('total_box_Qns'+New_Id).value = newques_Id;
		document.getElementById('total_divbox').value = tot_part - 1; 
		
	}
}
