
//popup login box 
jQuery(function($)
{
	jQuery('#loginblock').live('click', function()
	{
			jQuery('#facemodal').show();
          	jQuery('#fade').show();	
	});
	jQuery('#closeblock').live('click', function()
	{
					jQuery('#facemodal').hide();
					jQuery('#fade').hide();	
	});
	jQuery('#closeblockokbtn').live('click', function()
	{
					jQuery('#facemodal').hide();
					jQuery('#fade').hide();	
	});

});

jQuery(function($)
		{
			jQuery('#loginblocktimeUp').live('click', function()
			{
					jQuery('#facemodaltimeUp').show();
		          	jQuery('#fade').show();	
			});
			jQuery('#closeblocktimeUp').live('click', function()
			{
					jQuery('#facemodaltimeUp').hide();
					jQuery('#fade').hide();	
			});
});




//popup login box 
jQuery(function($)
{
	jQuery('#loginblockRead').live('click', function()
	{
			jQuery('#facemodal').show();
        	jQuery('#fade').show();	
	});
	jQuery('#closeblockRead').live('click', function()
	{
					jQuery('#facemodal').hide();
					jQuery('#fade').hide();	
	});
});