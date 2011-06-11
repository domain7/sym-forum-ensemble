<?php

Class Reset_passwordEmailTemplate extends EmailTemplate{

		
	public $datasources = Array(
 			'etm_member',);
	public $layouts = Array(
 			'plain' => 'template.plain.xsl',);
	public $subject = 'Reset your password for {$website-name}';
	public $reply_to_name = '';
	public $reply_to_email_address = '';
	public $recipients = '{/data/etm-member/entry/name} <{/data/etm-member/entry/email}>';
	
	public $editable = true;

	public $about = Array(
		'name' => 'Reset Password',
		'version' => '1.0',
		'author' => array(
			'name' => 'Stephen Bau',
			'website' => 'http://home/sym/forum-update',
			'email' => 'bauhouse@gmail.com'
		),
		'release-date' => '2011-06-11T23:10:38+00:00'
	);	
}