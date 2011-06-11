<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventmembers_update_password extends Event{

		const ROOTELEMENT = 'members-update-password';

		public $eParamFILTERS = array(
			'member-update-password'
		);

		public static function about(){
			return array(
				'name' => 'Members: Update Password',
				'author' => array(
					'name' => 'Stephen Bau',
					'website' => 'http://home/domain7/team-members',
					'email' => 'stephen@domain7.com'),
				'version' => '1.0',
				'release-date' => '2011-04-04T02:18:53+00:00',
				'trigger-condition' => 'action[members-update-password]'
			);
		}

		public static function getSource(){
			return '1';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;members-update-password result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/members-update-password></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;members-update-password result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/members-update-password></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;members-update-password result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient username was invalid&lt;/filter>
  ...
&lt;/members-update-password></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Name
    &lt;input name="fields[name]" type="text" />
  &lt;/label>
  &lt;label>Username
    &lt;input name="fields[username]" type="text" />
  &lt;/label>
  &lt;fieldset>
    &lt;label>Password
      &lt;input name="fields[password][password]" type="password" />
    &lt;/label>
    &lt;label>Password Confirm
      &lt;input name="fields[password][confirm]" type="password" />
    &lt;/label>
  &lt;/fieldset>
  &lt;label>Email Address
    &lt;input name="fields[email-address]" type="text" />
  &lt;/label>
  &lt;label>Role
    &lt;select name="fields[role]">
      &lt;option value="Public">Public&lt;/option>
      &lt;option value="Inactive">Inactive&lt;/option>
      &lt;option value="Member">Member&lt;/option>
      &lt;option value="Administrator">Administrator&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Activation
    &lt;input name="fields[activation]" type="text" />
  &lt;/label>
  &lt;label>Website
    &lt;input name="fields[website]" type="text" />
  &lt;/label>
  &lt;label>Location
    &lt;input name="fields[location]" type="text" />
  &lt;/label>
  &lt;label>City
    &lt;input name="fields[city]" type="text" />
  &lt;/label>
  &lt;label>Timezone
    &lt;select name="fields[timezone]">
      &lt;option value="">&lt;/option>
      &lt;optgroup label="America">
        &lt;option value="America/Adak">Adak -09:00&lt;/option>
        &lt;option value="America/Anchorage">Anchorage -08:00&lt;/option>
        &lt;option value="America/Anguilla">Anguilla -04:00&lt;/option>
        &lt;option value="America/Antigua">Antigua -04:00&lt;/option>
        &lt;option value="America/Araguaina">Araguaina -03:00&lt;/option>
        &lt;option value="America/Argentina/Buenos_Aires">Buenos Aires -03:00&lt;/option>
        &lt;option value="America/Argentina/Catamarca">Catamarca -03:00&lt;/option>
        &lt;option value="America/Argentina/Cordoba">Cordoba -03:00&lt;/option>
        &lt;option value="America/Argentina/Jujuy">Jujuy -03:00&lt;/option>
        &lt;option value="America/Argentina/La_Rioja">La Rioja -03:00&lt;/option>
        &lt;option value="America/Argentina/Mendoza">Mendoza -03:00&lt;/option>
        &lt;option value="America/Argentina/Rio_Gallegos">Rio Gallegos -03:00&lt;/option>
        &lt;option value="America/Argentina/Salta">Salta -03:00&lt;/option>
        &lt;option value="America/Argentina/San_Juan">San Juan -03:00&lt;/option>
        &lt;option value="America/Argentina/San_Luis">San Luis -03:00&lt;/option>
        &lt;option value="America/Argentina/Tucuman">Tucuman -03:00&lt;/option>
        &lt;option value="America/Argentina/Ushuaia">Ushuaia -03:00&lt;/option>
        &lt;option value="America/Aruba">Aruba -04:00&lt;/option>
        &lt;option value="America/Asuncion">Asuncion -03:00&lt;/option>
        &lt;option value="America/Atikokan">Atikokan -05:00&lt;/option>
        &lt;option value="America/Bahia">Bahia -03:00&lt;/option>
        &lt;option value="America/Bahia_Banderas">Bahia Banderas -05:00&lt;/option>
        &lt;option value="America/Barbados">Barbados -04:00&lt;/option>
        &lt;option value="America/Belem">Belem -03:00&lt;/option>
        &lt;option value="America/Belize">Belize -06:00&lt;/option>
        &lt;option value="America/Blanc-Sablon">Blanc-Sablon -04:00&lt;/option>
        &lt;option value="America/Boa_Vista">Boa Vista -04:00&lt;/option>
        &lt;option value="America/Bogota">Bogota -05:00&lt;/option>
        &lt;option value="America/Boise">Boise -06:00&lt;/option>
        &lt;option value="America/Cambridge_Bay">Cambridge Bay -06:00&lt;/option>
        &lt;option value="America/Campo_Grande">Campo Grande -04:00&lt;/option>
        &lt;option value="America/Cancun">Cancun -05:00&lt;/option>
        &lt;option value="America/Caracas">Caracas -04:30&lt;/option>
        &lt;option value="America/Cayenne">Cayenne -03:00&lt;/option>
        &lt;option value="America/Cayman">Cayman -05:00&lt;/option>
        &lt;option value="America/Chicago">Chicago -05:00&lt;/option>
        &lt;option value="America/Chihuahua">Chihuahua -06:00&lt;/option>
        &lt;option value="America/Costa_Rica">Costa Rica -06:00&lt;/option>
        &lt;option value="America/Cuiaba">Cuiaba -04:00&lt;/option>
        &lt;option value="America/Curacao">Curacao -04:00&lt;/option>
        &lt;option value="America/Danmarkshavn">Danmarkshavn +00:00&lt;/option>
        &lt;option value="America/Dawson">Dawson -07:00&lt;/option>
        &lt;option value="America/Dawson_Creek">Dawson Creek -07:00&lt;/option>
        &lt;option value="America/Denver">Denver -06:00&lt;/option>
        &lt;option value="America/Detroit">Detroit -04:00&lt;/option>
        &lt;option value="America/Dominica">Dominica -04:00&lt;/option>
        &lt;option value="America/Edmonton">Edmonton -06:00&lt;/option>
        &lt;option value="America/Eirunepe">Eirunepe -04:00&lt;/option>
        &lt;option value="America/El_Salvador">El Salvador -06:00&lt;/option>
        &lt;option value="America/Fortaleza">Fortaleza -03:00&lt;/option>
        &lt;option value="America/Glace_Bay">Glace Bay -03:00&lt;/option>
        &lt;option value="America/Godthab">Godthab -02:00&lt;/option>
        &lt;option value="America/Goose_Bay">Goose Bay -03:00&lt;/option>
        &lt;option value="America/Grand_Turk">Grand Turk -04:00&lt;/option>
        &lt;option value="America/Grenada">Grenada -04:00&lt;/option>
        &lt;option value="America/Guadeloupe">Guadeloupe -04:00&lt;/option>
        &lt;option value="America/Guatemala">Guatemala -06:00&lt;/option>
        &lt;option value="America/Guayaquil">Guayaquil -05:00&lt;/option>
        &lt;option value="America/Guyana">Guyana -04:00&lt;/option>
        &lt;option value="America/Halifax">Halifax -03:00&lt;/option>
        &lt;option value="America/Havana">Havana -04:00&lt;/option>
        &lt;option value="America/Hermosillo">Hermosillo -07:00&lt;/option>
        &lt;option value="America/Indiana/Indianapolis">Indianapolis -04:00&lt;/option>
        &lt;option value="America/Indiana/Knox">Knox -05:00&lt;/option>
        &lt;option value="America/Indiana/Marengo">Marengo -04:00&lt;/option>
        &lt;option value="America/Indiana/Petersburg">Petersburg -04:00&lt;/option>
        &lt;option value="America/Indiana/Tell_City">Tell City -05:00&lt;/option>
        &lt;option value="America/Indiana/Vevay">Vevay -04:00&lt;/option>
        &lt;option value="America/Indiana/Vincennes">Vincennes -04:00&lt;/option>
        &lt;option value="America/Indiana/Winamac">Winamac -04:00&lt;/option>
        &lt;option value="America/Inuvik">Inuvik -06:00&lt;/option>
        &lt;option value="America/Iqaluit">Iqaluit -04:00&lt;/option>
        &lt;option value="America/Jamaica">Jamaica -05:00&lt;/option>
        &lt;option value="America/Juneau">Juneau -08:00&lt;/option>
        &lt;option value="America/Kentucky/Louisville">Louisville -04:00&lt;/option>
        &lt;option value="America/Kentucky/Monticello">Monticello -04:00&lt;/option>
        &lt;option value="America/La_Paz">La Paz -04:00&lt;/option>
        &lt;option value="America/Lima">Lima -05:00&lt;/option>
        &lt;option value="America/Los_Angeles">Los Angeles -07:00&lt;/option>
        &lt;option value="America/Maceio">Maceio -03:00&lt;/option>
        &lt;option value="America/Managua">Managua -06:00&lt;/option>
        &lt;option value="America/Manaus">Manaus -04:00&lt;/option>
        &lt;option value="America/Marigot">Marigot -04:00&lt;/option>
        &lt;option value="America/Martinique">Martinique -04:00&lt;/option>
        &lt;option value="America/Matamoros">Matamoros -05:00&lt;/option>
        &lt;option value="America/Mazatlan">Mazatlan -06:00&lt;/option>
        &lt;option value="America/Menominee">Menominee -05:00&lt;/option>
        &lt;option value="America/Merida">Merida -05:00&lt;/option>
        &lt;option value="America/Mexico_City">Mexico City -05:00&lt;/option>
        &lt;option value="America/Miquelon">Miquelon -02:00&lt;/option>
        &lt;option value="America/Moncton">Moncton -03:00&lt;/option>
        &lt;option value="America/Monterrey">Monterrey -05:00&lt;/option>
        &lt;option value="America/Montevideo">Montevideo -03:00&lt;/option>
        &lt;option value="America/Montreal">Montreal -04:00&lt;/option>
        &lt;option value="America/Montserrat">Montserrat -04:00&lt;/option>
        &lt;option value="America/Nassau">Nassau -04:00&lt;/option>
        &lt;option value="America/New_York">New York -04:00&lt;/option>
        &lt;option value="America/Nipigon">Nipigon -04:00&lt;/option>
        &lt;option value="America/Nome">Nome -08:00&lt;/option>
        &lt;option value="America/Noronha">Noronha -02:00&lt;/option>
        &lt;option value="America/North_Dakota/Center">Center -05:00&lt;/option>
        &lt;option value="America/North_Dakota/New_Salem">New Salem -05:00&lt;/option>
        &lt;option value="America/Ojinaga">Ojinaga -06:00&lt;/option>
        &lt;option value="America/Panama">Panama -05:00&lt;/option>
        &lt;option value="America/Pangnirtung">Pangnirtung -04:00&lt;/option>
        &lt;option value="America/Paramaribo">Paramaribo -03:00&lt;/option>
        &lt;option value="America/Phoenix">Phoenix -07:00&lt;/option>
        &lt;option value="America/Port-au-Prince">Port-au-Prince -05:00&lt;/option>
        &lt;option value="America/Port_of_Spain">Port of Spain -04:00&lt;/option>
        &lt;option value="America/Porto_Velho">Porto Velho -04:00&lt;/option>
        &lt;option value="America/Puerto_Rico">Puerto Rico -04:00&lt;/option>
        &lt;option value="America/Rainy_River">Rainy River -05:00&lt;/option>
        &lt;option value="America/Rankin_Inlet">Rankin Inlet -05:00&lt;/option>
        &lt;option value="America/Recife">Recife -03:00&lt;/option>
        &lt;option value="America/Regina">Regina -06:00&lt;/option>
        &lt;option value="America/Resolute">Resolute -05:00&lt;/option>
        &lt;option value="America/Rio_Branco">Rio Branco -04:00&lt;/option>
        &lt;option value="America/Santa_Isabel">Santa Isabel -07:00&lt;/option>
        &lt;option value="America/Santarem">Santarem -03:00&lt;/option>
        &lt;option value="America/Santiago">Santiago -04:00&lt;/option>
        &lt;option value="America/Santo_Domingo">Santo Domingo -04:00&lt;/option>
        &lt;option value="America/Sao_Paulo">Sao Paulo -03:00&lt;/option>
        &lt;option value="America/Scoresbysund">Scoresbysund +00:00&lt;/option>
        &lt;option value="America/Shiprock">Shiprock -06:00&lt;/option>
        &lt;option value="America/St_Barthelemy">St Barthelemy -04:00&lt;/option>
        &lt;option value="America/St_Johns">St Johns -02:30&lt;/option>
        &lt;option value="America/St_Kitts">St Kitts -04:00&lt;/option>
        &lt;option value="America/St_Lucia">St Lucia -04:00&lt;/option>
        &lt;option value="America/St_Thomas">St Thomas -04:00&lt;/option>
        &lt;option value="America/St_Vincent">St Vincent -04:00&lt;/option>
        &lt;option value="America/Swift_Current">Swift Current -06:00&lt;/option>
        &lt;option value="America/Tegucigalpa">Tegucigalpa -06:00&lt;/option>
        &lt;option value="America/Thule">Thule -03:00&lt;/option>
        &lt;option value="America/Thunder_Bay">Thunder Bay -04:00&lt;/option>
        &lt;option value="America/Tijuana">Tijuana -07:00&lt;/option>
        &lt;option value="America/Toronto">Toronto -04:00&lt;/option>
        &lt;option value="America/Tortola">Tortola -04:00&lt;/option>
        &lt;option value="America/Vancouver">Vancouver -07:00&lt;/option>
        &lt;option value="America/Whitehorse">Whitehorse -07:00&lt;/option>
        &lt;option value="America/Winnipeg">Winnipeg -05:00&lt;/option>
        &lt;option value="America/Yakutat">Yakutat -08:00&lt;/option>
        &lt;option value="America/Yellowknife">Yellowknife -06:00&lt;/option>
      &lt;/optgroup>
    &lt;/select>
  &lt;/label>
  &lt;label>Email Opt-in
    &lt;input name="fields[email-opt-in]" type="checkbox" />
  &lt;/label>
  &lt;input name="action[members-update-password]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://home/domain7/team-members/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['members-update-password'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}
