<?php
	
	class Extension_ProfileDevKit extends Extension {
	/*-------------------------------------------------------------------------
		Definition:
	-------------------------------------------------------------------------*/
		
		public static $active = false;
		
		public function about() {
			return array(
				'name'			=> 'Profile DevKit',
				'version'		=> '1.0.1',
				'release-date'	=> '2009-05-20',
				'author'		=> array(
					'name'			=> 'Rowan Lewis',
					'website'		=> 'http://pixelcarnage.com/',
					'email'			=> 'rowan@pixelcarnage.com'
				)
			);
		}
		
		public function getSubscribedDelegates() {
			return array(
				array(
					'page'		=> '/frontend/',
					'delegate'	=> 'FrontendDevKitResolve',
					'callback'	=> 'frontendDevKitResolve'
				),
				array(
					'page'		=> '/frontend/',
					'delegate'	=> 'ManipulateDevKitNavigation',
					'callback'	=> 'manipulateDevKitNavigation'
				)
			);
		}
		
		public function frontendDevKitResolve($context) {
			if (isset($_GET['profile'])) {
				require_once(EXTENSIONS . '/profiledevkit/content/content.profile.php');
				
				$context['devkit'] = new Content_ProfileDevkit();
				self::$active = true;
			}
		}
		
		public function manipulateDevKitNavigation($context) {
			$xml = $context['xml'];
			$item = $xml->createElement('item');
			$item->setAttribute('name', __('Profile'));
			$item->setAttribute('handle', 'profile');
			$item->setAttribute('active', (self::$active ? 'yes' : 'no'));
			
			$xml->documentElement->appendChild($item);
		}
	}
	
?>