<?php

Class Generate_activation_codeEmailTemplate extends EmailTemplate{

		
	public $datasources = Array(
 			'etm_member',);
	public $layouts = Array(
 			'plain' => 'template.plain.xsl',);
	public $subject = 'Here is your activation code for {$website-name}';
	public $reply_to_name = '';
	public $reply_to_email_address = '';
	public $recipients = '{/data/etm-member/entry/name} <{/data/etm-member/entry/email}>';
	
	public $editable = true;

	public $about = Array(
		'name' => 'Generate Activation Code',
		'version' => '1.0',
		'author' => array(
			'name' => 'Stephen Bau',
			'website' => 'http://home/sym/forum-update',
			'email' => 'bauhouse@gmail.com'
		),
		'release-date' => '2011-06-19T04:01:48+00:00'
	);	
}