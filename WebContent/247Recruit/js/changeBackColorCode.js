
// Check if toolbar is being used when in text mode
function validateMode() {
  if (! bTextMode) return true;
  alert("Please uncheck the \"View HTML source\" checkbox to use the toolbars");
  Composition1.focus();
  return false;
}

//Formats text in Composition1.
function format1(what,opt) {
  if (!validateMode()) return;
  
  if (opt=="removeFormat") {
    what=opt;
    opt=null;
  }

  if (opt==null) Composition1.document.execCommand(what);
  else Composition1.document.execCommand(what,"",opt);
  
  pureText = false;
 // Composition1.focus();
  Composition1.document.getSelection().removeAllRanges();
  return opt;
}


//Sets the text color.
function foreColor(strcolor) {

  if (! validateMode()) return;
   format('forecolor', strcolor);
}

//Sets the background color.
function backColor1(strbk) 
{
  // alert('hello '+strbk );
	if (!validateMode()) 
	 return;
	format1('backcolor', strbk);

}
