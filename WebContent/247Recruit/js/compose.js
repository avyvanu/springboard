
// Check if toolbar is being used when in text mode
function validateMode() {
  if (! bTextMode) return true;
  alert("Please uncheck the \"View HTML source\" checkbox to use the toolbars");
 
  Composition.focus();
  return false;
}

//Formats text in composition.
function format(what,opt) {
  if (!validateMode()) return;
  
  if (opt=="removeFormat") {
    what=opt;
    opt=null;
  }

  if (opt==null) Composition.document.execCommand(what);
  else Composition.document.execCommand(what,"",opt);
  
  pureText = false;
  //Composition.focus();

  Composition.document.getSelection().removeAllRanges();

  return opt;
}


//Sets the text color.
function foreColor(strcolor) {

  if (! validateMode()) return;
   format('forecolor', strcolor);
}

//Sets the background color.
function backColor(strbk) 
{

	if (!validateMode()) 
	 return;
	format('backcolor', strbk);

}
