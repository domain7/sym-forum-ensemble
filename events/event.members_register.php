<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventmembers_register extends Event{

		const ROOTELEMENT = 'members-register';

		public $eParamFILTERS = array(
			'member-lock-role',
				'member-lock-activation',
				'etm-members-register'
		);

		public static function about(){
			return array(
				'name' => 'Members: Register',
				'author' => array(
					'name' => 'Stephen Bau',
					'website' => 'http://home/sym/forum-update',
					'email' => 'bauhouse@gmail.com'),
				'version' => '1.0',
				'release-date' => '2011-06-19T04:31:54+00:00',
				'trigger-condition' => 'action[members-register]'
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
        <pre class="XML"><code>&lt;members-register result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/members-register></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;members-register result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/members-register></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;members-register result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
  ...
&lt;/members-register></code></pre>
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
  &lt;label>Email
    &lt;input name="fields[email]" type="text" />
  &lt;/label>
  &lt;label>Role
    &lt;select name="fields[role]">
      &lt;option value="1">Public&lt;/option>
      &lt;option value="2">Inactive&lt;/option>
      &lt;option value="3">Member&lt;/option>
      &lt;option value="4">Administrator&lt;/option>
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
      &lt;optgroup label="Africa">
        &lt;option value="Africa/Abidjan">Abidjan +00:00&lt;/option>
        &lt;option value="Africa/Accra">Accra +00:00&lt;/option>
        &lt;option value="Africa/Addis_Ababa">Addis Ababa +03:00&lt;/option>
        &lt;option value="Africa/Algiers">Algiers +01:00&lt;/option>
        &lt;option value="Africa/Asmara">Asmara +03:00&lt;/option>
        &lt;option value="Africa/Bamako">Bamako +00:00&lt;/option>
        &lt;option value="Africa/Bangui">Bangui +01:00&lt;/option>
        &lt;option value="Africa/Banjul">Banjul +00:00&lt;/option>
        &lt;option value="Africa/Bissau">Bissau +00:00&lt;/option>
        &lt;option value="Africa/Blantyre">Blantyre +02:00&lt;/option>
        &lt;option value="Africa/Brazzaville">Brazzaville +01:00&lt;/option>
        &lt;option value="Africa/Bujumbura">Bujumbura +02:00&lt;/option>
        &lt;option value="Africa/Cairo">Cairo +03:00&lt;/option>
        &lt;option value="Africa/Casablanca">Casablanca +00:00&lt;/option>
        &lt;option value="Africa/Ceuta">Ceuta +02:00&lt;/option>
        &lt;option value="Africa/Conakry">Conakry +00:00&lt;/option>
        &lt;option value="Africa/Dakar">Dakar +00:00&lt;/option>
        &lt;option value="Africa/Dar_es_Salaam">Dar es Salaam +03:00&lt;/option>
        &lt;option value="Africa/Djibouti">Djibouti +03:00&lt;/option>
        &lt;option value="Africa/Douala">Douala +01:00&lt;/option>
        &lt;option value="Africa/El_Aaiun">El Aaiun +00:00&lt;/option>
        &lt;option value="Africa/Freetown">Freetown +00:00&lt;/option>
        &lt;option value="Africa/Gaborone">Gaborone +02:00&lt;/option>
        &lt;option value="Africa/Harare">Harare +02:00&lt;/option>
        &lt;option value="Africa/Johannesburg">Johannesburg +02:00&lt;/option>
        &lt;option value="Africa/Kampala">Kampala +03:00&lt;/option>
        &lt;option value="Africa/Khartoum">Khartoum +03:00&lt;/option>
        &lt;option value="Africa/Kigali">Kigali +02:00&lt;/option>
        &lt;option value="Africa/Kinshasa">Kinshasa +01:00&lt;/option>
        &lt;option value="Africa/Lagos">Lagos +01:00&lt;/option>
        &lt;option value="Africa/Libreville">Libreville +01:00&lt;/option>
        &lt;option value="Africa/Lome">Lome +00:00&lt;/option>
        &lt;option value="Africa/Luanda">Luanda +01:00&lt;/option>
        &lt;option value="Africa/Lubumbashi">Lubumbashi +02:00&lt;/option>
        &lt;option value="Africa/Lusaka">Lusaka +02:00&lt;/option>
        &lt;option value="Africa/Malabo">Malabo +01:00&lt;/option>
        &lt;option value="Africa/Maputo">Maputo +02:00&lt;/option>
        &lt;option value="Africa/Maseru">Maseru +02:00&lt;/option>
        &lt;option value="Africa/Mbabane">Mbabane +02:00&lt;/option>
        &lt;option value="Africa/Mogadishu">Mogadishu +03:00&lt;/option>
        &lt;option value="Africa/Monrovia">Monrovia +00:00&lt;/option>
        &lt;option value="Africa/Nairobi">Nairobi +03:00&lt;/option>
        &lt;option value="Africa/Ndjamena">Ndjamena +01:00&lt;/option>
        &lt;option value="Africa/Niamey">Niamey +01:00&lt;/option>
        &lt;option value="Africa/Nouakchott">Nouakchott +00:00&lt;/option>
        &lt;option value="Africa/Ouagadougou">Ouagadougou +00:00&lt;/option>
        &lt;option value="Africa/Porto-Novo">Porto-Novo +01:00&lt;/option>
        &lt;option value="Africa/Sao_Tome">Sao Tome +00:00&lt;/option>
        &lt;option value="Africa/Tripoli">Tripoli +02:00&lt;/option>
        &lt;option value="Africa/Tunis">Tunis +01:00&lt;/option>
        &lt;option value="Africa/Windhoek">Windhoek +01:00&lt;/option>
      &lt;/optgroup>
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
        &lt;option value="America/Asuncion">Asuncion -04:00&lt;/option>
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
      &lt;optgroup label="Antarctica">
        &lt;option value="Antarctica/Casey">Casey +08:00&lt;/option>
        &lt;option value="Antarctica/Davis">Davis +07:00&lt;/option>
        &lt;option value="Antarctica/DumontDUrville">DumontDUrville +10:00&lt;/option>
        &lt;option value="Antarctica/Macquarie">Macquarie +11:00&lt;/option>
        &lt;option value="Antarctica/Mawson">Mawson +05:00&lt;/option>
        &lt;option value="Antarctica/McMurdo">McMurdo +12:00&lt;/option>
        &lt;option value="Antarctica/Palmer">Palmer -04:00&lt;/option>
        &lt;option value="Antarctica/Rothera">Rothera -03:00&lt;/option>
        &lt;option value="Antarctica/South_Pole">South Pole +12:00&lt;/option>
        &lt;option value="Antarctica/Syowa">Syowa +03:00&lt;/option>
        &lt;option value="Antarctica/Vostok">Vostok +06:00&lt;/option>
      &lt;/optgroup>
      &lt;optgroup label="Arctic">
        &lt;option value="Arctic/Longyearbyen">Longyearbyen +02:00&lt;/option>
      &lt;/optgroup>
      &lt;optgroup label="Asia">
        &lt;option value="Asia/Aden">Aden +03:00&lt;/option>
        &lt;option value="Asia/Almaty">Almaty +06:00&lt;/option>
        &lt;option value="Asia/Amman">Amman +03:00&lt;/option>
        &lt;option value="Asia/Anadyr">Anadyr +12:00&lt;/option>
        &lt;option value="Asia/Aqtau">Aqtau +05:00&lt;/option>
        &lt;option value="Asia/Aqtobe">Aqtobe +05:00&lt;/option>
        &lt;option value="Asia/Ashgabat">Ashgabat +05:00&lt;/option>
        &lt;option value="Asia/Baghdad">Baghdad +03:00&lt;/option>
        &lt;option value="Asia/Bahrain">Bahrain +03:00&lt;/option>
        &lt;option value="Asia/Baku">Baku +05:00&lt;/option>
        &lt;option value="Asia/Bangkok">Bangkok +07:00&lt;/option>
        &lt;option value="Asia/Beirut">Beirut +03:00&lt;/option>
        &lt;option value="Asia/Bishkek">Bishkek +06:00&lt;/option>
        &lt;option value="Asia/Brunei">Brunei +08:00&lt;/option>
        &lt;option value="Asia/Choibalsan">Choibalsan +08:00&lt;/option>
        &lt;option value="Asia/Chongqing">Chongqing +08:00&lt;/option>
        &lt;option value="Asia/Colombo">Colombo +05:30&lt;/option>
        &lt;option value="Asia/Damascus">Damascus +03:00&lt;/option>
        &lt;option value="Asia/Dhaka">Dhaka +06:00&lt;/option>
        &lt;option value="Asia/Dili">Dili +09:00&lt;/option>
        &lt;option value="Asia/Dubai">Dubai +04:00&lt;/option>
        &lt;option value="Asia/Dushanbe">Dushanbe +05:00&lt;/option>
        &lt;option value="Asia/Gaza">Gaza +03:00&lt;/option>
        &lt;option value="Asia/Harbin">Harbin +08:00&lt;/option>
        &lt;option value="Asia/Ho_Chi_Minh">Ho Chi Minh +07:00&lt;/option>
        &lt;option value="Asia/Hong_Kong">Hong Kong +08:00&lt;/option>
        &lt;option value="Asia/Hovd">Hovd +07:00&lt;/option>
        &lt;option value="Asia/Irkutsk">Irkutsk +09:00&lt;/option>
        &lt;option value="Asia/Jakarta">Jakarta +07:00&lt;/option>
        &lt;option value="Asia/Jayapura">Jayapura +09:00&lt;/option>
        &lt;option value="Asia/Jerusalem">Jerusalem +03:00&lt;/option>
        &lt;option value="Asia/Kabul">Kabul +04:30&lt;/option>
        &lt;option value="Asia/Kamchatka">Kamchatka +12:00&lt;/option>
        &lt;option value="Asia/Karachi">Karachi +05:00&lt;/option>
        &lt;option value="Asia/Kashgar">Kashgar +08:00&lt;/option>
        &lt;option value="Asia/Kathmandu">Kathmandu +05:45&lt;/option>
        &lt;option value="Asia/Kolkata">Kolkata +05:30&lt;/option>
        &lt;option value="Asia/Krasnoyarsk">Krasnoyarsk +08:00&lt;/option>
        &lt;option value="Asia/Kuala_Lumpur">Kuala Lumpur +08:00&lt;/option>
        &lt;option value="Asia/Kuching">Kuching +08:00&lt;/option>
        &lt;option value="Asia/Kuwait">Kuwait +03:00&lt;/option>
        &lt;option value="Asia/Macau">Macau +08:00&lt;/option>
        &lt;option value="Asia/Magadan">Magadan +12:00&lt;/option>
        &lt;option value="Asia/Makassar">Makassar +08:00&lt;/option>
        &lt;option value="Asia/Manila">Manila +08:00&lt;/option>
        &lt;option value="Asia/Muscat">Muscat +04:00&lt;/option>
        &lt;option value="Asia/Nicosia">Nicosia +03:00&lt;/option>
        &lt;option value="Asia/Novokuznetsk">Novokuznetsk +07:00&lt;/option>
        &lt;option value="Asia/Novosibirsk">Novosibirsk +07:00&lt;/option>
        &lt;option value="Asia/Omsk">Omsk +07:00&lt;/option>
        &lt;option value="Asia/Oral">Oral +05:00&lt;/option>
        &lt;option value="Asia/Phnom_Penh">Phnom Penh +07:00&lt;/option>
        &lt;option value="Asia/Pontianak">Pontianak +07:00&lt;/option>
        &lt;option value="Asia/Pyongyang">Pyongyang +09:00&lt;/option>
        &lt;option value="Asia/Qatar">Qatar +03:00&lt;/option>
        &lt;option value="Asia/Qyzylorda">Qyzylorda +06:00&lt;/option>
        &lt;option value="Asia/Rangoon">Rangoon +06:30&lt;/option>
        &lt;option value="Asia/Riyadh">Riyadh +03:00&lt;/option>
        &lt;option value="Asia/Sakhalin">Sakhalin +11:00&lt;/option>
        &lt;option value="Asia/Samarkand">Samarkand +05:00&lt;/option>
        &lt;option value="Asia/Seoul">Seoul +09:00&lt;/option>
        &lt;option value="Asia/Shanghai">Shanghai +08:00&lt;/option>
        &lt;option value="Asia/Singapore">Singapore +08:00&lt;/option>
        &lt;option value="Asia/Taipei">Taipei +08:00&lt;/option>
        &lt;option value="Asia/Tashkent">Tashkent +05:00&lt;/option>
        &lt;option value="Asia/Tbilisi">Tbilisi +04:00&lt;/option>
        &lt;option value="Asia/Tehran">Tehran +04:30&lt;/option>
        &lt;option value="Asia/Thimphu">Thimphu +06:00&lt;/option>
        &lt;option value="Asia/Tokyo">Tokyo +09:00&lt;/option>
        &lt;option value="Asia/Ulaanbaatar">Ulaanbaatar +08:00&lt;/option>
        &lt;option value="Asia/Urumqi">Urumqi +08:00&lt;/option>
        &lt;option value="Asia/Vientiane">Vientiane +07:00&lt;/option>
        &lt;option value="Asia/Vladivostok">Vladivostok +11:00&lt;/option>
        &lt;option value="Asia/Yakutsk">Yakutsk +10:00&lt;/option>
        &lt;option value="Asia/Yekaterinburg">Yekaterinburg +06:00&lt;/option>
        &lt;option value="Asia/Yerevan">Yerevan +05:00&lt;/option>
      &lt;/optgroup>
      &lt;optgroup label="Atlantic">
        &lt;option value="Atlantic/Azores">Azores +00:00&lt;/option>
        &lt;option value="Atlantic/Bermuda">Bermuda -03:00&lt;/option>
        &lt;option value="Atlantic/Canary">Canary +01:00&lt;/option>
        &lt;option value="Atlantic/Cape_Verde">Cape Verde -01:00&lt;/option>
        &lt;option value="Atlantic/Faroe">Faroe +01:00&lt;/option>
        &lt;option value="Atlantic/Madeira">Madeira +01:00&lt;/option>
        &lt;option value="Atlantic/Reykjavik">Reykjavik +00:00&lt;/option>
        &lt;option value="Atlantic/South_Georgia">South Georgia -02:00&lt;/option>
        &lt;option value="Atlantic/St_Helena">St Helena +00:00&lt;/option>
        &lt;option value="Atlantic/Stanley">Stanley -04:00&lt;/option>
      &lt;/optgroup>
      &lt;optgroup label="Australia">
        &lt;option value="Australia/Adelaide">Adelaide +09:30&lt;/option>
        &lt;option value="Australia/Brisbane">Brisbane +10:00&lt;/option>
        &lt;option value="Australia/Broken_Hill">Broken Hill +09:30&lt;/option>
        &lt;option value="Australia/Currie">Currie +10:00&lt;/option>
        &lt;option value="Australia/Darwin">Darwin +09:30&lt;/option>
        &lt;option value="Australia/Eucla">Eucla +08:45&lt;/option>
        &lt;option value="Australia/Hobart">Hobart +10:00&lt;/option>
        &lt;option value="Australia/Lindeman">Lindeman +10:00&lt;/option>
        &lt;option value="Australia/Lord_Howe">Lord Howe +10:30&lt;/option>
        &lt;option value="Australia/Melbourne">Melbourne +10:00&lt;/option>
        &lt;option value="Australia/Perth">Perth +08:00&lt;/option>
        &lt;option value="Australia/Sydney">Sydney +10:00&lt;/option>
      &lt;/optgroup>
      &lt;optgroup label="Europe">
        &lt;option value="Europe/Amsterdam">Amsterdam +02:00&lt;/option>
        &lt;option value="Europe/Andorra">Andorra +02:00&lt;/option>
        &lt;option value="Europe/Athens">Athens +03:00&lt;/option>
        &lt;option value="Europe/Belgrade">Belgrade +02:00&lt;/option>
        &lt;option value="Europe/Berlin">Berlin +02:00&lt;/option>
        &lt;option value="Europe/Bratislava">Bratislava +02:00&lt;/option>
        &lt;option value="Europe/Brussels">Brussels +02:00&lt;/option>
        &lt;option value="Europe/Bucharest">Bucharest +03:00&lt;/option>
        &lt;option value="Europe/Budapest">Budapest +02:00&lt;/option>
        &lt;option value="Europe/Chisinau">Chisinau +03:00&lt;/option>
        &lt;option value="Europe/Copenhagen">Copenhagen +02:00&lt;/option>
        &lt;option value="Europe/Dublin">Dublin +01:00&lt;/option>
        &lt;option value="Europe/Gibraltar">Gibraltar +02:00&lt;/option>
        &lt;option value="Europe/Guernsey">Guernsey +01:00&lt;/option>
        &lt;option value="Europe/Helsinki">Helsinki +03:00&lt;/option>
        &lt;option value="Europe/Isle_of_Man">Isle of Man +01:00&lt;/option>
        &lt;option value="Europe/Istanbul">Istanbul +03:00&lt;/option>
        &lt;option value="Europe/Jersey">Jersey +01:00&lt;/option>
        &lt;option value="Europe/Kaliningrad">Kaliningrad +03:00&lt;/option>
        &lt;option value="Europe/Kiev">Kiev +03:00&lt;/option>
        &lt;option value="Europe/Lisbon">Lisbon +01:00&lt;/option>
        &lt;option value="Europe/Ljubljana">Ljubljana +02:00&lt;/option>
        &lt;option value="Europe/London">London +01:00&lt;/option>
        &lt;option value="Europe/Luxembourg">Luxembourg +02:00&lt;/option>
        &lt;option value="Europe/Madrid">Madrid +02:00&lt;/option>
        &lt;option value="Europe/Malta">Malta +02:00&lt;/option>
        &lt;option value="Europe/Mariehamn">Mariehamn +03:00&lt;/option>
        &lt;option value="Europe/Minsk">Minsk +03:00&lt;/option>
        &lt;option value="Europe/Monaco">Monaco +02:00&lt;/option>
        &lt;option value="Europe/Moscow">Moscow +04:00&lt;/option>
        &lt;option value="Europe/Oslo">Oslo +02:00&lt;/option>
        &lt;option value="Europe/Paris">Paris +02:00&lt;/option>
        &lt;option value="Europe/Podgorica">Podgorica +02:00&lt;/option>
        &lt;option value="Europe/Prague">Prague +02:00&lt;/option>
        &lt;option value="Europe/Riga">Riga +03:00&lt;/option>
        &lt;option value="Europe/Rome">Rome +02:00&lt;/option>
        &lt;option value="Europe/Samara">Samara +04:00&lt;/option>
        &lt;option value="Europe/San_Marino">San Marino +02:00&lt;/option>
        &lt;option value="Europe/Sarajevo">Sarajevo +02:00&lt;/option>
        &lt;option value="Europe/Simferopol">Simferopol +03:00&lt;/option>
        &lt;option value="Europe/Skopje">Skopje +02:00&lt;/option>
        &lt;option value="Europe/Sofia">Sofia +03:00&lt;/option>
        &lt;option value="Europe/Stockholm">Stockholm +02:00&lt;/option>
        &lt;option value="Europe/Tallinn">Tallinn +03:00&lt;/option>
        &lt;option value="Europe/Tirane">Tirane +02:00&lt;/option>
        &lt;option value="Europe/Uzhgorod">Uzhgorod +03:00&lt;/option>
        &lt;option value="Europe/Vaduz">Vaduz +02:00&lt;/option>
        &lt;option value="Europe/Vatican">Vatican +02:00&lt;/option>
        &lt;option value="Europe/Vienna">Vienna +02:00&lt;/option>
        &lt;option value="Europe/Vilnius">Vilnius +03:00&lt;/option>
        &lt;option value="Europe/Volgograd">Volgograd +04:00&lt;/option>
        &lt;option value="Europe/Warsaw">Warsaw +02:00&lt;/option>
        &lt;option value="Europe/Zagreb">Zagreb +02:00&lt;/option>
        &lt;option value="Europe/Zaporozhye">Zaporozhye +03:00&lt;/option>
        &lt;option value="Europe/Zurich">Zurich +02:00&lt;/option>
      &lt;/optgroup>
      &lt;optgroup label="Indian">
        &lt;option value="Indian/Antananarivo">Antananarivo +03:00&lt;/option>
        &lt;option value="Indian/Chagos">Chagos +06:00&lt;/option>
        &lt;option value="Indian/Christmas">Christmas +07:00&lt;/option>
        &lt;option value="Indian/Cocos">Cocos +06:30&lt;/option>
        &lt;option value="Indian/Comoro">Comoro +03:00&lt;/option>
        &lt;option value="Indian/Kerguelen">Kerguelen +05:00&lt;/option>
        &lt;option value="Indian/Mahe">Mahe +04:00&lt;/option>
        &lt;option value="Indian/Maldives">Maldives +05:00&lt;/option>
        &lt;option value="Indian/Mauritius">Mauritius +04:00&lt;/option>
        &lt;option value="Indian/Mayotte">Mayotte +03:00&lt;/option>
        &lt;option value="Indian/Reunion">Reunion +04:00&lt;/option>
      &lt;/optgroup>
      &lt;optgroup label="Pacific">
        &lt;option value="Pacific/Apia">Apia -11:00&lt;/option>
        &lt;option value="Pacific/Auckland">Auckland +12:00&lt;/option>
        &lt;option value="Pacific/Chatham">Chatham +12:45&lt;/option>
        &lt;option value="Pacific/Chuuk">Chuuk +10:00&lt;/option>
        &lt;option value="Pacific/Easter">Easter -06:00&lt;/option>
        &lt;option value="Pacific/Efate">Efate +11:00&lt;/option>
        &lt;option value="Pacific/Enderbury">Enderbury +13:00&lt;/option>
        &lt;option value="Pacific/Fakaofo">Fakaofo -10:00&lt;/option>
        &lt;option value="Pacific/Fiji">Fiji +12:00&lt;/option>
        &lt;option value="Pacific/Funafuti">Funafuti +12:00&lt;/option>
        &lt;option value="Pacific/Galapagos">Galapagos -06:00&lt;/option>
        &lt;option value="Pacific/Gambier">Gambier -09:00&lt;/option>
        &lt;option value="Pacific/Guadalcanal">Guadalcanal +11:00&lt;/option>
        &lt;option value="Pacific/Guam">Guam +10:00&lt;/option>
        &lt;option value="Pacific/Honolulu">Honolulu -10:00&lt;/option>
        &lt;option value="Pacific/Johnston">Johnston -10:00&lt;/option>
        &lt;option value="Pacific/Kiritimati">Kiritimati +14:00&lt;/option>
        &lt;option value="Pacific/Kosrae">Kosrae +11:00&lt;/option>
        &lt;option value="Pacific/Kwajalein">Kwajalein +12:00&lt;/option>
        &lt;option value="Pacific/Majuro">Majuro +12:00&lt;/option>
        &lt;option value="Pacific/Marquesas">Marquesas -09:30&lt;/option>
        &lt;option value="Pacific/Midway">Midway -11:00&lt;/option>
        &lt;option value="Pacific/Nauru">Nauru +12:00&lt;/option>
        &lt;option value="Pacific/Niue">Niue -11:00&lt;/option>
        &lt;option value="Pacific/Norfolk">Norfolk +11:30&lt;/option>
        &lt;option value="Pacific/Noumea">Noumea +11:00&lt;/option>
        &lt;option value="Pacific/Pago_Pago">Pago Pago -11:00&lt;/option>
        &lt;option value="Pacific/Palau">Palau +09:00&lt;/option>
        &lt;option value="Pacific/Pitcairn">Pitcairn -08:00&lt;/option>
        &lt;option value="Pacific/Pohnpei">Pohnpei +11:00&lt;/option>
        &lt;option value="Pacific/Port_Moresby">Port Moresby +10:00&lt;/option>
        &lt;option value="Pacific/Rarotonga">Rarotonga -10:00&lt;/option>
        &lt;option value="Pacific/Saipan">Saipan +10:00&lt;/option>
        &lt;option value="Pacific/Tahiti">Tahiti -10:00&lt;/option>
        &lt;option value="Pacific/Tarawa">Tarawa +12:00&lt;/option>
        &lt;option value="Pacific/Tongatapu">Tongatapu +13:00&lt;/option>
        &lt;option value="Pacific/Wake">Wake +12:00&lt;/option>
        &lt;option value="Pacific/Wallis">Wallis +12:00&lt;/option>
      &lt;/optgroup>
    &lt;/select>
  &lt;/label>
  &lt;label>Email Opt-in
    &lt;input name="fields[email-opt-in]" type="checkbox" />
  &lt;/label>
  &lt;input name="action[members-register]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://home/sym/forum-update/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['members-register'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}
