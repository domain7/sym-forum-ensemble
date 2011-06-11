$(document).ready(function() {

	var clearMePrevious = '';
	var exampleClass = false;
	var commentControl = 0;

	// clear input on focus
	$('.clear-on-focus').focus(function()
	{	
		if($(this).val()==$(this).attr('title'))
		{
			clearMePrevious = $(this).val();
			$(this).val('');
		}
	});
	
	// if field is empty afterward, add text again
	// if field doesn't have a class of example, add it in
	$('.clear-on-focus').blur(function()
	{
		if($(this).val()=='')
		{
			$(this).val(clearMePrevious);

			if(!($(this).is('.example')) && exampleClass)
			{
				$(this).addClass("example");
			}
		}
	});

	// confirmation box appears when button is clicked
	$('.confirm').click(function()
	{
		message = $(this).attr('title');
		var answer = confirm(message);
		return answer // answer is a boolean
	});

	// clear 
	$('.example').focus(function()
	{	
		$(this).removeClass("example");
		exampleClass = true;
	});

	// Character Limiting
	$(function()
	{
		$('.limit').keydown(function()
		{
			limitChars('wmd-input', 500, 'charlimitinfo');
		})
		$('.limit').keyup(function()
		{
			limitChars('wmd-input', 500, 'charlimitinfo');
		})
	});

	// Toggle Comment Options 
	$('#toggle-admin-controls').click(function()
	{	
		if(commentControl == 0)
		{
			$('.comment-options').fadeIn();
			commentControl = 1;
			return false;
		}
		else
		{
			$('.comment-options').fadeOut();
			commentControl = 0;
			return false;
		}
	});
});

function limitChars(textid, limit, infodiv)
{
	var text = $('#'+textid).val(); 
	var textlength = text.length;
	if(textlength > limit)
	{
		$('#' + infodiv).html('0');
		$('#'+textid).val(text.substr(0,limit));
		return false;
	}
	else
	{
		$('#' + infodiv).html(limit - textlength);
		return true;
	}
}