<?php

	require_once(TOOLKIT . '/class.event.php');
	
	Class eventedit_member extends Event{
		
		const ROOTELEMENT = 'edit-member';

		public static function about(){
			return array(
					 'name' => 'Edit Member',
					 'author' => array(
							'name' => 'Allen Chang',
							'website' => 'http://symphony.local:8888',
							'email' => 'allen@symphony21.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-01T17:30:02+00:00',
					 'trigger-condition' => 'action[edit-member]');	
		}

		public static function getSource(){
			return '1';
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;edit-member result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/edit-member></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;edit-member result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/edit-member></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Name
    &lt;input name="fields[name]" type="text" />
  &lt;/label>
  &lt;div class="group">
    &lt;label>Username
      &lt;input name="fields[username-and-password][username]" type="text" />
    &lt;/label>
    &lt;label>Password
      &lt;input name="fields[username-and-password][password]" type="password" />
    &lt;/label>
  &lt;/div>
  &lt;label>Email Address
    &lt;input name="fields[email-address]" type="text" />
  &lt;/label>
  &lt;label>Role
    &lt;select name="fields[role]">
      &lt;option value="1">Guest&lt;/option>
      &lt;option value="2">Administrator&lt;/option>
      &lt;option value="3">Symphonian&lt;/option>
      &lt;option value="4">Inactive&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Location
    &lt;input name="fields[location]" type="text" />
  &lt;/label>
  &lt;label>Email Opt-in
    &lt;input name="fields[email-opt-in]" type="checkbox" />
  &lt;/label>
  &lt;input name="action[edit-member]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://symphony.local:8888/success/" /></code></pre>';
		}
		
		public static function showInRolePermissions(){
			return true;
		}
		
		public function load(){			
			if(isset($_POST['action']['edit-member'])) return $this->__trigger();
		}
		
		protected function __trigger(){
			
			$Members = Frontend::instance()->ExtensionManager->create('members');
			$Members->initialiseCookie();

			if($Members->isLoggedIn() !== true || $_POST['id'] != (int)$Members->Member->get('id')){
				// Oi! you can't be here
				redirect(URL . '/forbidden/');
				exit();
			}
			
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}		

	}

