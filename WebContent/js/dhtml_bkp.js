// tabledeleterow.js version 1.2 2006-02-21
// mredkj.com

// CONFIG notes. Below are some comments that point to where this script can be customized.
// Note: Make sure to include a <tbody></tbody> in your table's HTML

var a = 'a'; // this is being set via script
var RADIO_NAME = 'totallyrad'; // this is being set via script
var TABLE_NAME = 'tblSample'; // this should be named in the HTML
var ROW_BASE = 1; // first number (for display)
var hasLoaded = false;

window.onload=fillInRows;

function fillInRows()
{
	hasLoaded = true;
	//addRowToTable();
	//addRowToTable();
}

// CONFIG:
// myRowObject is an object for storing information about the table rows
function myRowObject(one, two, three, four)
{
	this.one = one; // text object
	this.two = two; // input text object
	this.three = three; // input checkbox object
	this.four = four; // input radio object
}

/*
 * insertRowToTable
 * Insert and reorder
 */
function insertRowToTable()
{
	if (hasLoaded) {
		var tbl = document.getElementById(TABLE_NAME);
		var rowToInsertAt = tbl.tBodies[0].rows.length;
		for (var i=0; i<tbl.tBodies[0].rows.length; i++) {
			if (tbl.tBodies[0].rows[i].myRow && tbl.tBodies[0].rows[i].myRow.four.getAttribute('type') == 'radio' && tbl.tBodies[0].rows[i].myRow.four.checked) {
				rowToInsertAt = i;
				break;
			}
		}
		addRowToTable(rowToInsertAt);
		reorderRows(tbl, rowToInsertAt);
	}
}

function Calc(){
var frm = document.form0;
var tbl = document.getElementById(TABLE_NAME);
var total=0;

for (var xyz=0;xyz<tbl.tBodies[0].rows.length;xyz++){
cellval=tbl.tBodies[0].rows[xyz].cells[2].childNodes[0].value;
if (cellval.length>0&&!isNaN(parseInt(cellval))) total+=parseInt(cellval);
}
frm.SUM.value=total;
}

/*
 * addRowToTable
 * Inserts at row 'num', or appends to the end if no arguments are passed in. Don't pass in empty strings.
 */
function addRowToTable(num)
{
	if (hasLoaded) {
		var tbl = document.getElementById(TABLE_NAME);
		var nextRow = tbl.tBodies[0].rows.length;
		var iteration = nextRow + ROW_BASE;
		//alert(nextRow+'aaa'+ROW_BASE+'bbb'+num);
		if (num == null) { 
			num = nextRow;
		} else {
			iteration = num + ROW_BASE;
		}
		
		// add the row
		var row = tbl.tBodies[0].insertRow(num);
		
		// CONFIG: requires classes named classy0 and classy1
		row.className = 'classy' + (iteration % 2);
		row.bgColor   = 'white';
	
		// CONFIG: This whole section can be configured
		
		// cell 0 - Input text box		
		var cell0 = row.insertCell(0);
		var txtInp0 = document.createElement('input');
		txtInp0.setAttribute('type', 'text');
		txtInp0.setAttribute('name', 'other_language' + iteration);
		txtInp0.setAttribute('id', 'other_language' + iteration);
		//txtInp0.setAttribute('size', '40');
		txtInp0.setAttribute('value', 'Others. Please specify.'); // iteration included for debug purposes
		txtInp0.setAttribute("onClick", "this.value=''");
		cell0.appendChild(txtInp0);
		
		// cell 1 - dropdown box
		var cell1 = row.insertCell(1);
		var txtInp1 = document.createElement('select');
		txtInp1.setAttribute('name', 'lor' + iteration);
		txtInp1.setAttribute('id', 'lor' + iteration);
		txtInp1.options[0] = new Option("Yes","1");
		txtInp1.options[1] = new Option("No","0");
		//txtInp1.options[1] = new Option("No", "0", 'defaultSelected', 'selected')
		cell1.appendChild(txtInp1);

		// cell a - dropdown box
		var cell1a = row.insertCell(2);
		var txtInp2 = document.createElement('select');
		txtInp2.setAttribute('name', 'low' + iteration);
		txtInp2.setAttribute('id', 'low' + iteration);
		txtInp2.options[0] = new Option("Yes","1");
		txtInp2.options[1] = new Option("No","0");
		cell1a.appendChild(txtInp2);
		
		// cell 2 - dropdown box
		var cell2 = row.insertCell(3);
		var cbEl = document.createElement('select');
		cbEl.setAttribute('name', 'los' + iteration);
		cbEl.setAttribute('id', 'los' + iteration);
		cbEl.options[0] = new Option("Yes","1");
		cbEl.options[1] = new Option("No","0");
		cell2.appendChild(cbEl);
		
		// cell 3 - input button
		var cell3 = row.insertCell(4);
		var btnEl = document.createElement('input');
		btnEl.setAttribute('type', 'image');
		btnEl.setAttribute('src', '../images/btn-delete.gif');
		btnEl.setAttribute('value', 'Delete');
		btnEl.onclick = function () {deleteCurrentRow(this)};
		cell3.appendChild(btnEl);
		
		// Pass in the elements you want to reference later
		// Store the myRow object in each row
		//row.myRow = new myRowObject(txtInp0, txtInp1, txtInp2, cbEl, raEl);
		document.getElementById('total_box').value = iteration;  // Stores the total value
		row.myRow = new myRowObject(txtInp0, txtInp1, txtInp2, cbEl);
	}
}

// CONFIG: this entire function is affected by myRowObject settings
// If there isn't a checkbox in your row, then this function can't be used.
function deleteChecked()
{
	if (hasLoaded) {
		var checkedObjArray = new Array();
		var cCount = 0;
	
		var tbl = document.getElementById(TABLE_NAME);
		for (var i=0; i<tbl.tBodies[0].rows.length; i++) {
			if (tbl.tBodies[0].rows[i].myRow && tbl.tBodies[0].rows[i].myRow.three.getAttribute('type') == 'checkbox' && tbl.tBodies[0].rows[i].myRow.three.checked) {
				checkedObjArray[cCount] = tbl.tBodies[0].rows[i];
				cCount++;
			}
		}
		if (checkedObjArray.length > 0) {
			var rIndex = checkedObjArray[0].sectionRowIndex;
			deleteRows(checkedObjArray);
			reorderRows(tbl, rIndex);
		}
	}
				
}

// If there isn't an element with an onclick event in your row, then this function can't be used.
function deleteCurrentRow(obj)
{
	if (hasLoaded) {
		var delRow = obj.parentNode.parentNode;
		var tbl = delRow.parentNode.parentNode;
		var rIndex = delRow.sectionRowIndex;
		var rowArray = new Array(delRow);
		deleteRows(rowArray);
		reorderRows(tbl, rIndex);
	}
	//document.getElementById('total_box').value = document.getElementById('total_box').value-1;
}

function editCurrentRow(obj)
{
	if (hasLoaded) {
		var editRow = obj.parentNode.parentNode;
		var tbl = editRow.parentNode.parentNode;
		var rIndex = editRow.sectionRowIndex;
		var rowArray = new Array(editRow);
		callPrompt(rowArray);
	}
}

function reorderRows(tbl, startingIndex)
{
	if (hasLoaded) {
		if (tbl.tBodies[0].rows[startingIndex]) {
			var count = startingIndex + ROW_BASE;
			for (var i=startingIndex; i<tbl.tBodies[0].rows.length; i++) {
			
				// CONFIG: next line is affected by myRowObject settings
				tbl.tBodies[0].rows[i].myRow.one.data = count; // text
				
				// CONFIG: next line is affected by myRowObject settings
				tbl.tBodies[0].rows[i].myRow.two.name = a + count; // input text

				// CONFIG: next line is affected by myRowObject settings
				// tbl.tBodies[0].rows[i].myRow.two.name = a[1]_2 + count; // input text
				
				// CONFIG: next line is affected by myRowObject settings
				var tempVal = tbl.tBodies[0].rows[i].myRow.two.value.split(' '); // for debug purposes
				tbl.tBodies[0].rows[i].myRow.two.value = count + ' was' + tempVal[0]; // for debug purposes
				
				// CONFIG: next line is affected by myRowObject settings
				tbl.tBodies[0].rows[i].myRow.four.value = count; // input radio
				
				// CONFIG: requires class named classy0 and classy1
				tbl.tBodies[0].rows[i].className = 'classy' + (count % 2);
				
				count++;
			}
		}
	}
}

function deleteRows(rowObjArray)
{
	if (hasLoaded) {
		for (var i=0; i<rowObjArray.length; i++) {
			var rIndex = rowObjArray[i].sectionRowIndex;
			rowObjArray[i].parentNode.deleteRow(rIndex);
		}
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
