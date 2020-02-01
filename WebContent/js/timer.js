/*   Free Script provided by HIOXINDIA            */
/*   visit us at http://www.hscripts.com     */
/*   This is a copyright product of hioxindia.com */

var rTimer;
var sds ;

TimeTick();

function TimeTick()
{
	sds =  new Date();
	document.time.tfield.value=" "+sds.getHours()+" : "+sds.getMinutes()+" : "+sds.getSeconds();
	if(rTimer)
		{
			clearTimeout(rTimer);
		}

	rTimer = setTimeout('TimeTick()', 1000);
}


