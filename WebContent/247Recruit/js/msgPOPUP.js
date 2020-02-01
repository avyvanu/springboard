function myFunction()
{
	var vcv = setInterval(function()
	{ 
		document.getElementById('closeblock').click();
		clearInterval(vcv);
	},5000);
	return false;
}

function createlightbox() 
{
    document.getElementById('light').style.display = 'block';
    document.getElementById('fade').style.display = 'block'
}
function closelightbox() 
{
   	document.getElementById('light').style.display = 'none';
	document.getElementById('fade').style.display = 'none'
}