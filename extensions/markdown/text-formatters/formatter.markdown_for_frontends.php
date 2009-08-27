<?php

	Class formatterMarkdown_For_Frontends extends TextFormatter{

		private static $_parser;

		function about(){
			return array(
						 'name' => 'Markdown Text Formatter (For Front Ends)',
						 'version' => '1.0',
						 'release-date' => '2009-05-08',
						 'author' => array('name' => 'Alistair Kearney',
										   'website' => 'http://www.pointybeard.com',
										   'email' => 'alistair@pointybeard.com'),
						 'description' => 'Write entries in the Markdown format. Wrapper for the PHP Markdown text-to-HTML conversion tool written by Michel Fortin. Does additional processing to protect against malicious front-end activity.'
				 		);
		}
				
		function run($string){
			
			if(!self::$_parser){
				include_once(EXTENSIONS . '/markdown/lib/markdown.php');
				self::$_parser = new Markdown_Parser();
			}
			
			self::$_parser->no_entities = true;
			
			
			
			return stripslashes(self::$_parser->transform($string));
		}		
		
	}

