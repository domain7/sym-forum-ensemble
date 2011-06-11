<?php

Class Members_registerEmailTemplate extends EmailTemplate{

		
	public $datasources = Array(
 			'etm_member',);
	public $layouts = Array(
 			'plain' => 'template.plain.xsl',);
	public $subject = '{$website-name}: Thank you for registering';
	public $reply_to_name = '';
	public $reply_to_email_address = '';
	public $recipients = '{/data/etm-member/entry/name} <{/data/etm-member/entry/email}>';
	
	public $editable = true;

	public $about = Array(
		'name' => 'Members: Register',
		'version' => '1.0',
		'author' => array(
			'name' => 'Stephen Bau',
			'website' => 'http://home/sym/forum-update',
			'email' => 'bauhouse@gmail.com'
		),
		'release-date' => '2011-06-11T22:59:06+00:00'
	);	
}