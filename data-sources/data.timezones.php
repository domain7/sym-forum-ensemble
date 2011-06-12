<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcetimezones extends Datasource{

		public $dsParamROOTELEMENT = 'timezones';

		

		

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Timezones',
				'author' => array(
					'name' => 'Stephen Bau',
					'website' => 'http://home/sym/forum-update',
					'email' => 'bauhouse@gmail.com'),
				'version' => '1.0',
				'release-date' => '2011-06-12T00:33:32+00:00'
			);
		}

		public function getSource(){
			return 'static_xml';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$this->dsSTATIC = '<timezone value=\'America/Adak\'>Adak -09:00</timezone>
<timezone value=\'America/Anchorage\'>Anchorage -08:00</timezone>
<timezone value=\'America/Anguilla\'>Anguilla -04:00</timezone>
<timezone value=\'America/Antigua\'>Antigua -04:00</timezone>
<timezone value=\'America/Araguaina\'>Araguaina -03:00</timezone>
<timezone value=\'America/Argentina/Buenos_Aires\'>Buenos Aires -03:00</timezone>
<timezone value=\'America/Argentina/Catamarca\'>Catamarca -03:00</timezone>
<timezone value=\'America/Argentina/Cordoba\'>Cordoba -03:00</timezone>
<timezone value=\'America/Argentina/Jujuy\'>Jujuy -03:00</timezone>
<timezone value=\'America/Argentina/La_Rioja\'>La Rioja -03:00</timezone>
<timezone value=\'America/Argentina/Mendoza\'>Mendoza -03:00</timezone>
<timezone value=\'America/Argentina/Rio_Gallegos\'>Rio Gallegos -03:00</timezone>
<timezone value=\'America/Argentina/Salta\'>Salta -03:00</timezone>
<timezone value=\'America/Argentina/San_Juan\'>San Juan -03:00</timezone>
<timezone value=\'America/Argentina/San_Luis\'>San Luis -03:00</timezone>
<timezone value=\'America/Argentina/Tucuman\'>Tucuman -03:00</timezone>
<timezone value=\'America/Argentina/Ushuaia\'>Ushuaia -03:00</timezone>
<timezone value=\'America/Aruba\'>Aruba -04:00</timezone>
<timezone value=\'America/Asuncion\'>Asuncion -03:00</timezone>
<timezone value=\'America/Atikokan\'>Atikokan -05:00</timezone>
<timezone value=\'America/Bahia\'>Bahia -03:00</timezone>
<timezone value=\'America/Bahia_Banderas\'>Bahia Banderas -05:00</timezone>
<timezone value=\'America/Barbados\'>Barbados -04:00</timezone>
<timezone value=\'America/Belem\'>Belem -03:00</timezone>
<timezone value=\'America/Belize\'>Belize -06:00</timezone>
<timezone value=\'America/Blanc-Sablon\'>Blanc-Sablon -04:00</timezone>
<timezone value=\'America/Boa_Vista\'>Boa Vista -04:00</timezone>
<timezone value=\'America/Bogota\'>Bogota -05:00</timezone>
<timezone value=\'America/Boise\'>Boise -06:00</timezone>
<timezone value=\'America/Cambridge_Bay\'>Cambridge Bay -06:00</timezone>
<timezone value=\'America/Campo_Grande\'>Campo Grande -04:00</timezone>
<timezone value=\'America/Cancun\'>Cancun -05:00</timezone>
<timezone value=\'America/Caracas\'>Caracas -04:30</timezone>
<timezone value=\'America/Cayenne\'>Cayenne -03:00</timezone>
<timezone value=\'America/Cayman\'>Cayman -05:00</timezone>
<timezone value=\'America/Chicago\'>Chicago -05:00</timezone>
<timezone value=\'America/Chihuahua\'>Chihuahua -06:00</timezone>
<timezone value=\'America/Costa_Rica\'>Costa Rica -06:00</timezone>
<timezone value=\'America/Cuiaba\'>Cuiaba -04:00</timezone>
<timezone value=\'America/Curacao\'>Curacao -04:00</timezone>
<timezone value=\'America/Danmarkshavn\'>Danmarkshavn +00:00</timezone>
<timezone value=\'America/Dawson\'>Dawson -07:00</timezone>
<timezone value=\'America/Dawson_Creek\'>Dawson Creek -07:00</timezone>
<timezone value=\'America/Denver\'>Denver -06:00</timezone>
<timezone value=\'America/Detroit\'>Detroit -04:00</timezone>
<timezone value=\'America/Dominica\'>Dominica -04:00</timezone>
<timezone value=\'America/Edmonton\'>Edmonton -06:00</timezone>
<timezone value=\'America/Eirunepe\'>Eirunepe -04:00</timezone>
<timezone value=\'America/El_Salvador\'>El Salvador -06:00</timezone>
<timezone value=\'America/Fortaleza\'>Fortaleza -03:00</timezone>
<timezone value=\'America/Glace_Bay\'>Glace Bay -03:00</timezone>
<timezone value=\'America/Godthab\'>Godthab -02:00</timezone>
<timezone value=\'America/Goose_Bay\'>Goose Bay -03:00</timezone>
<timezone value=\'America/Grand_Turk\'>Grand Turk -04:00</timezone>
<timezone value=\'America/Grenada\'>Grenada -04:00</timezone>
<timezone value=\'America/Guadeloupe\'>Guadeloupe -04:00</timezone>
<timezone value=\'America/Guatemala\'>Guatemala -06:00</timezone>
<timezone value=\'America/Guayaquil\'>Guayaquil -05:00</timezone>
<timezone value=\'America/Guyana\'>Guyana -04:00</timezone>
<timezone value=\'America/Halifax\'>Halifax -03:00</timezone>
<timezone value=\'America/Havana\'>Havana -04:00</timezone>
<timezone value=\'America/Hermosillo\'>Hermosillo -07:00</timezone>
<timezone value=\'America/Indiana/Indianapolis\'>Indianapolis -04:00</timezone>
<timezone value=\'America/Indiana/Knox\'>Knox -05:00</timezone>
<timezone value=\'America/Indiana/Marengo\'>Marengo -04:00</timezone>
<timezone value=\'America/Indiana/Petersburg\'>Petersburg -04:00</timezone>
<timezone value=\'America/Indiana/Tell_City\'>Tell City -05:00</timezone>
<timezone value=\'America/Indiana/Vevay\'>Vevay -04:00</timezone>
<timezone value=\'America/Indiana/Vincennes\'>Vincennes -04:00</timezone>
<timezone value=\'America/Indiana/Winamac\'>Winamac -04:00</timezone>
<timezone value=\'America/Inuvik\'>Inuvik -06:00</timezone>
<timezone value=\'America/Iqaluit\'>Iqaluit -04:00</timezone>
<timezone value=\'America/Jamaica\'>Jamaica -05:00</timezone>
<timezone value=\'America/Juneau\'>Juneau -08:00</timezone>
<timezone value=\'America/Kentucky/Louisville\'>Louisville -04:00</timezone>
<timezone value=\'America/Kentucky/Monticello\'>Monticello -04:00</timezone>
<timezone value=\'America/La_Paz\'>La Paz -04:00</timezone>
<timezone value=\'America/Lima\'>Lima -05:00</timezone>
<timezone value=\'America/Los_Angeles\'>Los Angeles -07:00</timezone>
<timezone value=\'America/Maceio\'>Maceio -03:00</timezone>
<timezone value=\'America/Managua\'>Managua -06:00</timezone>
<timezone value=\'America/Manaus\'>Manaus -04:00</timezone>
<timezone value=\'America/Marigot\'>Marigot -04:00</timezone>
<timezone value=\'America/Martinique\'>Martinique -04:00</timezone>
<timezone value=\'America/Matamoros\'>Matamoros -05:00</timezone>
<timezone value=\'America/Mazatlan\'>Mazatlan -06:00</timezone>
<timezone value=\'America/Menominee\'>Menominee -05:00</timezone>
<timezone value=\'America/Merida\'>Merida -05:00</timezone>
<timezone value=\'America/Mexico_City\'>Mexico City -05:00</timezone>
<timezone value=\'America/Miquelon\'>Miquelon -02:00</timezone>
<timezone value=\'America/Moncton\'>Moncton -03:00</timezone>
<timezone value=\'America/Monterrey\'>Monterrey -05:00</timezone>
<timezone value=\'America/Montevideo\'>Montevideo -03:00</timezone>
<timezone value=\'America/Montreal\'>Montreal -04:00</timezone>
<timezone value=\'America/Montserrat\'>Montserrat -04:00</timezone>
<timezone value=\'America/Nassau\'>Nassau -04:00</timezone>
<timezone value=\'America/New_York\'>New York -04:00</timezone>
<timezone value=\'America/Nipigon\'>Nipigon -04:00</timezone>
<timezone value=\'America/Nome\'>Nome -08:00</timezone>
<timezone value=\'America/Noronha\'>Noronha -02:00</timezone>
<timezone value=\'America/North_Dakota/Center\'>Center -05:00</timezone>
<timezone value=\'America/North_Dakota/New_Salem\'>New Salem -05:00</timezone>
<timezone value=\'America/Ojinaga\'>Ojinaga -06:00</timezone>
<timezone value=\'America/Panama\'>Panama -05:00</timezone>
<timezone value=\'America/Pangnirtung\'>Pangnirtung -04:00</timezone>
<timezone value=\'America/Paramaribo\'>Paramaribo -03:00</timezone>
<timezone value=\'America/Phoenix\'>Phoenix -07:00</timezone>
<timezone value=\'America/Port-au-Prince\'>Port-au-Prince -05:00</timezone>
<timezone value=\'America/Port_of_Spain\'>Port of Spain -04:00</timezone>
<timezone value=\'America/Porto_Velho\'>Porto Velho -04:00</timezone>
<timezone value=\'America/Puerto_Rico\'>Puerto Rico -04:00</timezone>
<timezone value=\'America/Rainy_River\'>Rainy River -05:00</timezone>
<timezone value=\'America/Rankin_Inlet\'>Rankin Inlet -05:00</timezone>
<timezone value=\'America/Recife\'>Recife -03:00</timezone>
<timezone value=\'America/Regina\'>Regina -06:00</timezone>
<timezone value=\'America/Resolute\'>Resolute -05:00</timezone>
<timezone value=\'America/Rio_Branco\'>Rio Branco -04:00</timezone>
<timezone value=\'America/Santa_Isabel\'>Santa Isabel -07:00</timezone>
<timezone value=\'America/Santarem\'>Santarem -03:00</timezone>
<timezone value=\'America/Santiago\'>Santiago -04:00</timezone>
<timezone value=\'America/Santo_Domingo\'>Santo Domingo -04:00</timezone>
<timezone value=\'America/Sao_Paulo\'>Sao Paulo -03:00</timezone>
<timezone value=\'America/Scoresbysund\'>Scoresbysund +00:00</timezone>
<timezone value=\'America/Shiprock\'>Shiprock -06:00</timezone>
<timezone value=\'America/St_Barthelemy\'>St Barthelemy -04:00</timezone>
<timezone value=\'America/St_Johns\'>St Johns -02:30</timezone>
<timezone value=\'America/St_Kitts\'>St Kitts -04:00</timezone>
<timezone value=\'America/St_Lucia\'>St Lucia -04:00</timezone>
<timezone value=\'America/St_Thomas\'>St Thomas -04:00</timezone>
<timezone value=\'America/St_Vincent\'>St Vincent -04:00</timezone>
<timezone value=\'America/Swift_Current\'>Swift Current -06:00</timezone>
<timezone value=\'America/Tegucigalpa\'>Tegucigalpa -06:00</timezone>
<timezone value=\'America/Thule\'>Thule -03:00</timezone>
<timezone value=\'America/Thunder_Bay\'>Thunder Bay -04:00</timezone>
<timezone value=\'America/Tijuana\'>Tijuana -07:00</timezone>
<timezone value=\'America/Toronto\'>Toronto -04:00</timezone>
<timezone value=\'America/Tortola\'>Tortola -04:00</timezone>
<timezone value=\'America/Vancouver\'>Vancouver -07:00</timezone>
<timezone value=\'America/Whitehorse\'>Whitehorse -07:00</timezone>
<timezone value=\'America/Winnipeg\'>Winnipeg -05:00</timezone>
<timezone value=\'America/Yakutat\'>Yakutat -08:00</timezone>
<timezone value=\'America/Yellowknife\'>Yellowknife -06:00</timezone>';
include(TOOLKIT . '/data-sources/datasource.static.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
