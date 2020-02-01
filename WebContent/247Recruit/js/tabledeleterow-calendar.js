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
var INPUT_NAME_PREFIX = 'chatQues'; // this is being set via script
var RADIO_NAME = 'totallyrad'; // this is being set via script
var TABLE_NAME = 'tblSample'; // this should be named in the HTML
var ROW_BASE = 1; // first number (for display)
var hasLoaded = false;

window.onload=fillInRows;


function debug(msg)
{
    var debug = document.getElementById('txtdebug')
    var d = new Date();
    var tempTimestamp =
    	(d.getHours() < 10 ? '0' + d.getHours() : d.getHours())
    	+ ':' +
    	(d.getMinutes() < 10 ? '0' + d.getMinutes() : d.getMinutes())
    	+ ':' +
    	(d.getSeconds() < 10 ? '0' + d.getSeconds() : d.getSeconds())
    debug.value = tempTimestamp + ':' + msg + '\n' + debug.value ;
}

function fillInRows()
{
	addRowToTable();
}

// CONFIG:
// myRowObject is an object for storing information about the table rows
function myRowObject(one, two)
{
	this.one = one; // text object
	this.two = two; // input text object
}

/*
 * addRowToTable
 * Inserts at row 'num', or appends to the end if no arguments are passed in. Don't pass in empty strings.
 */
function addRowToTable(num)
{

		var tbl = document.getElementById(TABLE_NAME);
		var nextRow = tbl.tBodies[0].rows.length;
		var iteration = nextRow + ROW_BASE;
		if (num == null) { 
			num = nextRow;
		} else {
			iteration = num + ROW_BASE;
		}
		
		// add the row
		var row = tbl.tBodies[0].insertRow(num);
		
		// CONFIG: requires classes named classy0 and classy1
		row.className = 'classy' + (iteration % 2);
	
		// CONFIG: This whole section can be configured
		
		// cell 0 - text
		var cell0 = row.insertCell(0);
		var textNode = document.createTextNode("Enter the question "+iteration);
		cell0.className='classlangTestleft_TDDYNA';	
		cell0.appendChild(textNode);
		
		// cell 1 - input text
		var cell1 = row.insertCell(1);
		var txtInp = document.createElement('input');
		txtInp.type = 'text';
		txtInp.name = INPUT_NAME_PREFIX;
		txtInp.setAttribute('id', 'mockTest'+ iteration);
		txtInp.setAttribute('class', 'reSizeforOther');	
		txtInp.setAttribute('onkeypress', 'return AllowChars(event);');//  onkeypress="return AllowChars(event);"	
		cell1.className='classlangTestright_JS';	
		cell1.setAttribute('colspan', '3' );
		cell1.appendChild(txtInp);
		
		// cell 3 - delete button
		var cell2 = row.insertCell(2);
		var btnEl = document.createElement('input');
		
		btnEl.type = 'button';
		btnEl.value = '';
		btnEl.setAttribute('style', 'width:16px; height:16px;float:center;');
		btnEl.setAttribute('class', 'srcvis');
		btnEl.onclick = function () {deleteCurrentRow(this)};
		cell2.className='delImg';
		cell2.appendChild(btnEl);
				
		// Pass in the elements you want to reference later
		// Store the myRow object in each row
		row.myRow = new myRowObject(textNode, txtInp);
		
		document.getElementById('total_box').value = iteration;  // Stores the total value
		document.getElementById('PartAPart1QCountDIV').innerHTML = iteration;

	}

// If there isn't an element with an onclick event in your row, then this function can't be used.
function deleteCurrentRow(obj)
{
	var tbl = document.getElementById(TABLE_NAME);
	var nextRow = tbl.tBodies[0].rows.length;
	if (nextRow > 1)
	{
		var delRow = obj.parentNode.parentNode;
		var tbl = delRow.parentNode.parentNode;
		var rIndex = delRow.sectionRowIndex;
		var rowArray = new Array(delRow);			
		deleteRows(rowArray);
		reorderRows(tbl, rIndex);
		document.getElementById('total_box').value = (nextRow-1);  // Stores the total value
		document.getElementById('PartAPart1QCountDIV').innerHTML = (nextRow-1);

	}
	else
	{
		alert('Can not delete. At least one row required !');	
	}

}

function reorderRows(tbl, startingIndex)
{
	if (tbl.tBodies[0].rows[startingIndex])
	{
		var count = startingIndex + ROW_BASE;
		for (var i=startingIndex; i<tbl.tBodies[0].rows.length; i++) 
		{				
			// CONFIG: next line is affected by myRowObject settings
			tbl.tBodies[0].rows[i].myRow.one.data = "Enter the question "+count; // text
			
			// CONFIG: next line is affected by myRowObject settings
			//tbl.tBodies[0].rows[i].myRow.two.name = INPUT_NAME_PREFIX + count; // input text

			//tbl.tBodies[0].rows[i].myRow.two.name = INPUT_NAME_PREFIX + count;
			
			tbl.tBodies[0].rows[i].myRow.two.id = 'mockTest'+count;
			//'mockTest'+ iteration
			
			// CONFIG: requires class named classy0 and classy1
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