// Table Delete Row with Calendar

var INPUT_NAME_PREFIX = 'chatQues'; // this is being set via script
var RADIO_NAME = 'totallyrad'; // this is being set via script
var TABLE_NAME = 'tblSample'; // this should be named in the HTML
var ROW_BASE = 1; // first number (for display)
var txtInp2 = null;
window.onload=fillInRows;
var part=0;
var ques=0;
var quesValue=0;
var inques=1;

	function fillInRows()
	{
		addRowHeader();
		
	}

// CONFIG:
// myRowObject is an object for storing information about the table rows
	function myRowObject(one, two, three , four, five, six, seven, eight, nine, ten)
	{
		this.one = one; // tr disp object for id
		this.two = two; // td  object	for id
		this.three = three; // td  disp object for data
		this.four = four;		// input text object
		this.five = five;	// input radio object
		this.six = six;	// paragraph
		this.seven = seven;	// input radio object for DISP
		this.eight = eight;	// Label object for DISP
		this.nine  = nine; //Del button Id
		this.ten  = ten; //Radio button value for hidden field
	}

/*
 * addRowHeader
 * Inserts at row 'num', or appends to the end if no arguments are passed in. Don't pass in empty strings.
 */
	function incQues(inc)
	{
		inques = inc;
	}
function addRowHeader(num)
{
	var tbl;
		for(var k = 1; k <= 5 ; k++)
		{
			tbl = document.getElementById(TABLE_NAME+k);
			var iter= ROW_BASE;
			if(num == null)
			 { 
				num = nextRow;
			}
			 else 
			{
				iter = num + ROW_BASE;
			}
			if(part >=0)
			{
				part++;
			}
			else if(part==0)
			{
				part=1;
			}
			var tblinner = document.createElement('table');
			tblinner.setAttribute("id", "part"+part+"Qns");
			tblinner.setAttribute("name", "part"+part+"Qns");
			tblinner.setAttribute("width", "100%");
			tblinner.setAttribute("cellpadding", "6");
			tblinner.setAttribute("cellspacing", "6");
			var tblbody = document.createElement('tbody');
			tblinner.appendChild(tblbody);
			tbl.appendChild(tblinner);
			var tblnew = document.getElementById("part"+part+"Qns");
			var nextRow = tblnew.tBodies[0].rows.length;
			
			/*<<<<<<<<<<<<<<<<<<<<<<<<< Part Header >>>>>>>>>>>>>>>>>>>>>>>>> */	
			
			
			//Initially adding Header //
			var rowheader = tblnew.tBodies[0].insertRow(0);
			rowheader.setAttribute('id', 'part'+part+'_'+'Header' );
			rowheader.setAttribute('name', 'part_Header'+ part);
			
			var cellb = rowheader.insertCell(0);
			var textNode2 = document.createTextNode("Option");
			cellb.className='classCompTestleft_TDSmall';	
			cellb.appendChild(textNode2);
			
			var cellc = rowheader.insertCell(1);
			var textNode3 = document.createTextNode("Option Text");
			cellc.className='classCompTestleft_TDBig';	
			cellc.setAttribute('align', 'center' );
			cellc.appendChild(textNode3);
			
			var celld = rowheader.insertCell(2);
			var textNode4 = document.createTextNode("Select Correct Answer");
			celld.className='classCompTestleft_TDSmall';	
			celld.setAttribute('align', 'center' );
			celld.appendChild(textNode4);
			
			var celle = rowheader.insertCell(3);
			var textNode5 = document.createTextNode("Delete");
			celle.className='classCompTestleft_TDSmall';	
			celle.setAttribute('align', 'center' );
			celle.appendChild(textNode5);
			
			var addButton = document.getElementById('addQuesbutton'+part);
			addButton.setAttribute('onclick', 'addRowQuestion('+part+');');
			ques=iter-1;
			
			var compQnsDISP = document.getElementById('part'+part+'Qns'+part+'DISP');
			var divele = document.createElement('div');
			divele.setAttribute("id", 'part'+part+'Q'+part+'DISP');
			divele.setAttribute("style", "font-weight: bold;font-family: Arial,Helvetica,sans-serif;font-size: 12px;padding-top:5px;");
			compQnsDISP.appendChild(divele);
			
			var paragraphele = document.createElement('p');
			paragraphele.setAttribute("id", 'part'+part+'Qpara'+iter+'DISP');
			paragraphele.setAttribute("style", "font-family: Arial,Helvetica,sans-serif;font-size: 12px;padding:3px 0px 0px 2px; ");
			compQnsDISP.appendChild(paragraphele);
			
			var diveleRadio = document.createElement('input');
			diveleRadio.type = 'radio';
			diveleRadio.setAttribute('name', 'part'+ part+'Ans'+iter+'DISP');
			diveleRadio.setAttribute('id', 'part'+ part+'Ans'+iter+'DISP');
			diveleRadio.setAttribute('disabled', 'disabled');
			paragraphele.appendChild(diveleRadio);
			
			var diveleLBL = document.createElement('label');
			diveleLBL.setAttribute('name', 'part'+ part+'Option'+iter+'DISP');
			diveleLBL.setAttribute('id', 'part'+ part+'Option'+iter+'DISP');
			diveleLBL.setAttribute("style", "padding-left:3px;");
			paragraphele.appendChild(diveleLBL);
			
			
			//Initially adding question //
			var alpa = String.fromCharCode(64+iter);
			alpa.toLowerCase();
			alpa = alpa + ". ";
			var rowqns1 = tblnew.tBodies[0].insertRow(1);
			rowqns1.setAttribute('id', 'part'+part+'_'+'Qns'+iter);
			rowqns1.setAttribute('name', 'part'+part+'_'+'Qns'+iter);
			
			var cellb = rowqns1.insertCell(0);
			var textNode2 = document.createTextNode(iter);
			cellb.className='classCompTestleft_TDSmall';	
			cellb.setAttribute('id', 'part'+ part+'SlNo'+iter+'Disp');
			cellb.appendChild(textNode2);
			
			var cellc = rowqns1.insertCell(1);
			var txtInp1 = document.createElement('input');
			txtInp1.type = 'text';
			txtInp1.setAttribute('id', 'part'+ part+'Option'+iter);
			txtInp1.setAttribute('name', 'part'+ part+'Option'+iter);
			txtInp1.setAttribute('class', 'inputText' );	
			txtInp1.setAttribute('value', alpa );	
			txtInp1.setAttribute('maxlength', '250' );	
			txtInp1.setAttribute('onkeypress', 'return AllowChars(event);' );	
			cellc.className = 'classCompTestright_TD';	
			cellc.appendChild(txtInp1);
			
			var celld = rowqns1.insertCell(2);
			var txtInp2 = document.createElement('input');
			txtInp2.type = 'radio';
			txtInp2.setAttribute('name', 'part'+ part+'Ans');
			txtInp2.setAttribute('id', 'part'+ part+'Ans'+iter);
			txtInp2.setAttribute('onclick', 'changeValSltd('+part+','+iter+');');
			txtInp2.setAttribute('value', 'N');
			var txtInpHdd = document.createElement('input');
			txtInpHdd.type = 'hidden';
			txtInpHdd.setAttribute('name', 'part'+ part+'AnsSeltd'+iter);
			txtInpHdd.setAttribute('id', 'part'+ part+'AnsSeltd'+iter);
			txtInpHdd.setAttribute('value', 'N');
			celld.className = 'delImg';	
			celld.setAttribute('align', 'center' );
			txtInp2.setAttribute('size', '50' );
			celld.appendChild(txtInpHdd);
			celld.appendChild(txtInp2);
			
			var celle = rowqns1.insertCell(3);
			var btnE2 = document.createElement('input');
			btnE2.type = 'button';
			btnE2.value = '';
			btnE2.setAttribute('class', 'srcvis');
			btnE2.setAttribute('onclick', 'deleteCurrentRow(this,'+part+','+iter+');');
			btnE2.setAttribute('id', 'part'+ part+'Del'+iter);
			celle.className='delImg';
			celle.setAttribute('align', 'center' );
			celle.appendChild(btnE2);
			
			rowqns1.myRow = new myRowObject(rowqns1, cellb, textNode2, txtInp1, txtInp2, paragraphele, diveleRadio, diveleLBL, btnE2, txtInpHdd );
			var itersec = 2;
			if (num == null)
			 { 
				num = nextRow;
			} else 
			{
				itersec = num + 2;
			} 
			var compQnsDISP = document.getElementById('part'+part+'Qns'+part+'DISP');
			var paragraphele = document.createElement('p');
			paragraphele.setAttribute("id", 'part'+part+'Qpara'+itersec+'DISP');
			paragraphele.setAttribute("style", "font-family: Arial,Helvetica,sans-serif;font-size: 12px;padding:3px 0px 0px 2px; ");
			compQnsDISP.appendChild(paragraphele);
			
			var diveleRadio = document.createElement('input');
			diveleRadio.type = 'radio';
			diveleRadio.setAttribute('name', 'part'+ part+'Ans'+itersec+'DISP');
			diveleRadio.setAttribute('id', 'part'+ part+'Ans'+itersec+'DISP');
			diveleRadio.setAttribute('disabled', 'disabled');
			paragraphele.appendChild(diveleRadio);
			
			var diveleLBL = document.createElement('label');
			diveleLBL.setAttribute('name', 'part'+ part+'Option'+itersec+'DISP');
			diveleLBL.setAttribute('id', 'part'+ part+'Option'+itersec+'DISP');
			diveleLBL.setAttribute("style", "padding-left:3px;");
			paragraphele.appendChild(diveleLBL);
			
			//Initially adding question2 //
			var alpa = String.fromCharCode(64+itersec);
			alpa.toLowerCase();
			alpa = alpa + ". ";
			var rowqns2 = tblnew.tBodies[0].insertRow(2);
			rowqns2.setAttribute('id', 'part'+part+'_'+'Qns'+itersec);
			rowqns2.setAttribute('name', 'part'+part+'_'+'Qns'+itersec);
			
			var cellb = rowqns2.insertCell(0);
			var textNode2 = document.createTextNode(itersec);
			cellb.className='classCompTestleft_TDSmall';	
			cellb.setAttribute('id', 'part'+ part+'SlNo'+itersec+'Disp');
			cellb.appendChild(textNode2);
			
			var cellc = rowqns2.insertCell(1);
			var txtInp1 = document.createElement('input');
			txtInp1.type = 'text';
			txtInp1.setAttribute('id', 'part'+ part+'Option'+itersec);
			txtInp1.setAttribute('name', 'part'+ part+'Option'+itersec);
			txtInp1.setAttribute('class', 'inputText' );	
			txtInp1.setAttribute('value', alpa );
			txtInp1.setAttribute('maxlength', '250' );		
			txtInp1.setAttribute('onkeypress', 'return AllowChars(event);' );
			cellc.className = 'classCompTestright_TD';	
			cellc.appendChild(txtInp1);
			
			var celld = rowqns2.insertCell(2);
			var txtInp2 = document.createElement('input');
			txtInp2.type = 'radio';
			txtInp2.setAttribute('name', 'part'+ part+'Ans');
			txtInp2.setAttribute('id', 'part'+ part+'Ans'+itersec);
			txtInp2.setAttribute('onclick', 'changeValSltd('+part+','+itersec+');');
			txtInp2.setAttribute('value', 'N');
			var txtInpHdd = document.createElement('input');
			txtInpHdd.type = 'hidden';
			txtInpHdd.setAttribute('name', 'part'+ part+'AnsSeltd'+itersec);
			txtInpHdd.setAttribute('id', 'part'+ part+'AnsSeltd'+itersec);
			txtInpHdd.setAttribute('value', 'N');
			celld.className = 'delImg';	
			celld.setAttribute('align', 'center' );
			txtInp2.setAttribute('size', '50' );
			celld.appendChild(txtInp2);
			celld.appendChild(txtInpHdd);
			
			var celle = rowqns2.insertCell(3);
			var btnE2 = document.createElement('input');
			btnE2.type = 'button';
			btnE2.value = '';
			btnE2.setAttribute('class', 'srcvis');
			btnE2.setAttribute('onclick', 'deleteCurrentRow(this,'+part+','+itersec+');');
			btnE2.setAttribute('id', 'part'+ part+'Del'+itersec);
			celle.className='delImg';
			celle.setAttribute('align', 'center' );
			celle.appendChild(btnE2);
			rowqns2.myRow = new myRowObject(rowqns2, cellb, textNode2, txtInp1, txtInp2, paragraphele, diveleRadio, diveleLBL, btnE2, txtInpHdd );
			document.getElementById('part'+part+'_'+'TotalQns').value = itersec;  // Stores the total value
		}
	}
var temp=1;
var ques1=0;

		function addRowQuestion(partId)
		{
			var num ;
			//ques1=quesid;
			
			var tblqns = document.getElementById("part"+partId+"Qns");
			var nextRow = tblqns.tBodies[0].rows.length;
			if(nextRow > 15)
			{
				alert('Cannot add more than 15 options for each question !');	
			}
			else
			{
		/*<<<<<<<<<<<<<<<<<<<<<<<<< Enter the Question from 2 part >>>>>>>>>>>>>>>>>>>>>>>>> */	
			var iteration = 0;
			iteration = ROW_BASE + 1;
			if(partId==temp)
			{
				iteration++;
				iteration= nextRow;	
			}	
			else if(partId > temp)
			{
				iteration++;
				iteration= nextRow;
			}	
			if (num == null) 
			{ 
				num = nextRow;
			}
			else 
			{
				iteration = num + ROW_BASE;
			}
			
			var compQnsDISP = document.getElementById('part'+partId+'Qns'+partId+'DISP');
			var paragraphele = document.createElement('p');
			paragraphele.setAttribute("id", 'part'+partId+'Qpara'+iteration+'DISP');
			paragraphele.setAttribute("style", "font-family: Arial,Helvetica,sans-serif;font-size: 12px;padding:3px 0px 0px 2px; ");
			compQnsDISP.appendChild(paragraphele);
			
			var diveleRadio = document.createElement('input');
			diveleRadio.type = 'radio';
			diveleRadio.setAttribute('name', 'part'+ partId+'Ans'+iteration+'DISP');
			diveleRadio.setAttribute('id', 'part'+ partId+'Ans'+iteration+'DISP');
			diveleRadio.setAttribute('disabled', 'disabled');
			paragraphele.appendChild(diveleRadio);
			
			var diveleLBL = document.createElement('label');
			diveleLBL.setAttribute('name', 'part'+ partId+'Option'+iteration+'DISP');
			diveleLBL.setAttribute('id', 'part'+ partId+'Option'+iteration+'DISP');
			diveleLBL.setAttribute("style", "padding-left:3px;");
			paragraphele.appendChild(diveleLBL);
			
			var alpa = String.fromCharCode(64+iteration);
			alpa.toLowerCase();
			alpa = alpa + ". ";
			
			// Add the row for dynamically 
			var rownew = tblqns.tBodies[0].insertRow(num);
			rownew.setAttribute('id', 'part'+partId+'_'+'Qns'+iteration);
			rownew.setAttribute('name', 'part'+partId+'_'+'Qns'+iteration);
			
			var cellb = rownew.insertCell(0);
			var textNode2 = document.createTextNode(iteration);
			cellb.className='classCompTestleft_TDSmall';	
			cellb.setAttribute('id', 'part'+ partId+'SlNo'+iteration+'Disp');
			cellb.appendChild(textNode2);
			
			var cellc = rownew.insertCell(1);
			var txtInp1 = document.createElement('input');
			txtInp1.type = 'text';
			txtInp1.setAttribute('id', 'part'+ partId+'Option'+iteration);
			txtInp1.setAttribute('name', 'part'+ partId+'Option'+iteration);
			txtInp1.setAttribute('class', 'inputText' );		
			txtInp1.setAttribute('value', alpa );
			txtInp1.setAttribute('maxlength', '250' );
			txtInp1.setAttribute('onkeypress', 'return AllowChars(event);' );
			cellc.className = 'classCompTestright_TD';	
			cellc.appendChild(txtInp1);
			
			var celld = rownew.insertCell(2);
			var txtInp2 = document.createElement('input');
			txtInp2.type = 'radio';
			txtInp2.setAttribute('name', 'part'+ partId+'Ans');
			txtInp2.setAttribute('id', 'part'+ partId+'Ans'+iteration);
			txtInp2.setAttribute('onclick', 'changeValSltd('+partId+','+iteration+');');
			txtInp2.setAttribute('value', 'N');
			var txtInpHdd = document.createElement('input');
			txtInpHdd.type = 'hidden';
			txtInpHdd.setAttribute('name', 'part'+ partId+'AnsSeltd'+iteration);
			txtInpHdd.setAttribute('id', 'part'+ partId+'AnsSeltd'+iteration);
			txtInpHdd.setAttribute('value', 'N');
			celld.className = 'delImg';	
			celld.setAttribute('align', 'center' );
			txtInp2.setAttribute('size', '50' );
			celld.appendChild(txtInp2);
			celld.appendChild(txtInpHdd);
			
			var celle = rownew.insertCell(3);
			var btnE2 = document.createElement('input');
			btnE2.type = 'button';
			btnE2.value = '';
			btnE2.setAttribute('class', 'srcvis');
			btnE2.setAttribute('onclick', 'deleteCurrentRow(this,'+partId+','+iteration+');');
			btnE2.setAttribute('id', 'part'+ partId+'Del'+iteration);
			celle.className='delImg';
			celle.setAttribute('align', 'center' );
			celle.appendChild(btnE2);
			
			// Pass in the elements you want to reference later
			// Store the myRow object in each row
			rownew.myRow = new myRowObject(rownew, cellb, textNode2, txtInp1, txtInp2, paragraphele, diveleRadio, diveleLBL, btnE2, txtInpHdd );
			
			document.getElementById('part'+partId+'_'+'TotalQns').value = iteration;  // Stores the total value
			incQues(iteration);
			}
		}


// If there isn't an element with an onclick event in your row, then this function can't be used.
		function deleteCurrentRow(obj,partId,qnsID)
		{
			var tbldel = document.getElementById("part"+partId+"Qns");
			var nextRow = tbldel.tBodies[0].rows.length;
			if (nextRow > 3)
			{
				var divEleParent =  document.getElementById('part'+partId+'Qns'+partId+'DISP');
				var divEleDeleteChd = document.getElementById('part'+partId+'Qpara'+qnsID+'DISP'); 
				divEleParent.removeChild(divEleDeleteChd);
				var delRow = obj.parentNode.parentNode;
				var tbldelRow = delRow.parentNode.parentNode;
				var rIndex = delRow.sectionRowIndex;
				var rowArray = new Array(delRow);			
				deleteRows(rowArray);
				reorderRows(tbldelRow, rIndex,partId,qnsID);
				document.getElementById('part'+partId+'_'+'TotalQns').value = (nextRow - 2);  // Stores the total value
			}
			else
			{
				alert('Cannot delete. At least two options required !');	
			}
		
		}

		function reorderRows(tbldelRow, startingIndex,partId,qnsID)
		{
			if (tbldelRow.tBodies[0].rows[startingIndex])
			{
				var count = startingIndex;
				for (var i = startingIndex; i<tbldelRow.tBodies[0].rows.length; i++) 
				{				
					var k = i +1 ; 
					var countTemp = count + 1;
					var tempOptionText = document.getElementById('part'+partId+'Option'+k).value;
					var alpa = String.fromCharCode(64+count);
					alpa.toUpperCase();
					//alpa = alpa + ". ";
					
					var alpaTemp = String.fromCharCode(64+countTemp);
					alpaTemp.toUpperCase();
					
					if(tempOptionText.charAt(1) == ".")
					{
						tempOptionText = tempOptionText.replace(alpaTemp,alpa);
					}
					else
					{
						tempOptionText = tempOptionText;
					}
					
					tbldelRow.tBodies[0].rows[i].myRow.one.id = 'part'+partId+'_Qns'+count;
					tbldelRow.tBodies[0].rows[i].myRow.two.id = 'part'+partId+'SlNo'+count+'Disp'; 
					tbldelRow.tBodies[0].rows[i].myRow.three.data = count; 
					tbldelRow.tBodies[0].rows[i].myRow.four.value = tempOptionText; 
					tbldelRow.tBodies[0].rows[i].myRow.four.id = 'part'+partId+'Option'+count; 
					tbldelRow.tBodies[0].rows[i].myRow.four.name = 'part'+partId+'Option'+count; 
					tbldelRow.tBodies[0].rows[i].myRow.five.id = 'part'+partId+'Ans'+count; 
					tbldelRow.tBodies[0].rows[i].myRow.six.id = 'part'+partId+'Qpara'+count+'DISP'; 
					tbldelRow.tBodies[0].rows[i].myRow.seven.id = 'part'+partId+'Ans'+count+'DISP';
					tbldelRow.tBodies[0].rows[i].myRow.seven.name = 'part'+partId+'Ans'+count+'DISP';
					tbldelRow.tBodies[0].rows[i].myRow.eight.id = 'part'+partId+'Option'+count+'DISP';
					tbldelRow.tBodies[0].rows[i].myRow.eight.name = 'part'+partId+'Option'+count+'DISP';
					tbldelRow.tBodies[0].rows[i].myRow.nine.id = 'part'+partId+'Del'+count; 
					tbldelRow.tBodies[0].rows[i].myRow.ten.id = 'part'+partId+'AnsSeltd'+count; 
					tbldelRow.tBodies[0].rows[i].myRow.ten.name = 'part'+partId+'AnsSeltd'+count;
					document.getElementById('part'+ partId +'Ans'+count ).setAttribute('onclick', 'changeValSltd('+partId+','+ count +');' );
					document.getElementById('part'+ partId +'Del'+count ).setAttribute('onclick', 'deleteCurrentRow(this,'+partId+','+ count +');' );
					count = count + 1;
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

	function openInNewWindow(frm)
	{
		// open a blank window
		var aWindow = window.open('', 'TableAddRow2NewWindow',
		'scrollbars=yes,menubar=yes,resizable=yes,toolbar=no,width=400,height=400');
		
		// set the target to the blank window
		frm.target = 'TableAddRow2NewWindow';
		
		// submit
		frm.submit();
	}