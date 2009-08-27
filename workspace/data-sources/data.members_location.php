<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcemembers_location extends Datasource{
		
		public $dsParamROOTELEMENT = 'members-location';
		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Members: Location',
					 'author' => array(
							'name' => 'Allen Chang',
							'website' => 'http://symphony.local:8888',
							'email' => 'allen@symphony21.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-01T14:05:52+00:00');	
		}
		
		public function getSource(){
			return 'static_xml';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				$xml = <<<XML
	<location>
		<item value="AFG">Afghanistan</item>
		<item value="ALB">Albania</item>
		<item value="DZA">Algeria</item>
		<item value="ASM">American Samoa</item>
		<item value="AND">Andorra</item>
		<item value="AGO">Angola</item>
		<item value="AIA">Anguilla</item>
		<item value="ATG">Antigua and Barbuda</item>
		<item value="ARG">Argentina</item>
		<item value="ARM">Armenia</item>
		<item value="ABW">Aruba</item>
		<item value="AUS">Australia</item>
		<item value="AUT">Austria</item>
		<item value="AZE">Azerbaijan</item>
		<item value="BHS">Bahamas</item>
		<item value="BHR">Bahrain</item>
		<item value="BGD">Bangladesh</item>
		<item value="BRB">Barbados</item>
		<item value="BLR">Belarus</item>
		<item value="BEL">Belgium</item>
		<item value="BLZ">Belize</item>
		<item value="BEN">Benin</item>
		<item value="BMU">Bermuda</item>
		<item value="BTN">Bhutan</item>
		<item value="BOL">Bolivia</item>
		<item value="BIH">Bosnia and Herzegovina</item>
		<item value="BWA">Botswana</item>
		<item value="BRA">Brazil</item>
		<item value="VGB">British Virgin Islands</item>
		<item value="BRN">Brunei Darussalam</item>
		<item value="BGR">Bulgaria</item>
		<item value="BFA">Burkina Faso</item>
		<item value="BDI">Burundi</item>
		<item value="KHM">Cambodia</item>
		<item value="CMR">Cameroon</item>
		<item value="CAN">Canada</item>
		<item value="CPV">Cape Verde</item>
		<item value="CYM">Cayman Islands</item>
		<item value="CAF">Central African Republic</item>
		<item value="TCD">Chad</item>
		<item value="CHL">Chile</item>
		<item value="CHN">China</item>
		<item value="COL">Colombia</item>
		<item value="COM">Comoros</item>
		<item value="COG">Congo</item>
		<item value="COK">Cook Islands</item>
		<item value="CRI">Costa Rica</item>
		<item value="CIV">Cote dIvoire</item>
		<item value="HRV">Croatia</item>
		<item value="CUB">Cuba</item>
		<item value="CYP">Cyprus</item>
		<item value="CZE">Czech Republic</item>
		<item value="PRK">Democratic Peoples Republic of Korea</item>
		<item value="COD">Democratic Republic of the Congo</item>
		<item value="DNK">Denmark</item>
		<item value="DJI">Djibouti</item>
		<item value="DMA">Dominica</item>
		<item value="DOM">Dominican Republic</item>
		<item value="TMP">East Timor</item>
		<item value="ECU">Ecuador</item>
		<item value="EGY">Egypt</item>
		<item value="SLV">El Salvador</item>
		<item value="GNQ">Equatorial Guinea</item>
		<item value="ERI">Eritrea</item>
		<item value="EST">Estonia</item>
		<item value="ETH">Ethiopia</item>
		<item value="FRO">Faeroe Islands</item>
		<item value="FLK">Falkland Islands (Malvinas)</item>
		<item value="FJI">Fiji</item>
		<item value="FIN">Finland</item>
		<item value="FRA">France</item>
		<item value="GUF">French Guiana</item>
		<item value="PYF">French Polynesia</item>
		<item value="GAB">Gabon</item>
		<item value="GMB">Gambia</item>
		<item value="GEO">Georgia</item>
		<item value="DEU">Germany</item>
		<item value="GHA">Ghana</item>
		<item value="GIB">Gibraltar</item>
		<item value="GRC">Greece</item>
		<item value="GRL">Greenland</item>
		<item value="GRD">Grenada</item>
		<item value="GLP">Guadeloupe</item>
		<item value="GUM">Guam</item>
		<item value="GTM">Guatemala</item>
		<item value="GIN">Guinea</item>
		<item value="GNB">Guinea-Bissau</item>
		<item value="GUY">Guyana</item>
		<item value="HTI">Haiti</item>
		<item value="VAT">Holy See</item>
		<item value="HND">Honduras</item>
		<item value="HKG">Hong Kong</item>
		<item value="HUN">Hungary</item>
		<item value="ISL">Iceland</item>
		<item value="IND">India</item>
		<item value="IDN">Indonesia</item>
		<item value="IRN">Iran</item>
		<item value="IRQ">Iraq</item>
		<item value="IRL">Ireland</item>
		<item value="ISR">Israel</item>
		<item value="ITA">Italy</item>
		<item value="JAM">Jamaica</item>
		<item value="JPN">Japan</item>
		<item value="JOR">Jordan</item>
		<item value="KAZ">Kazakhstan</item>
		<item value="KEN">Kenya</item>
		<item value="KIR">Kiribati</item>
		<item value="KWT">Kuwait</item>
		<item value="KGZ">Kyrgyzstan</item>
		<item value="LAO">Lao Peoples Democratic Republic</item>
		<item value="LVA">Latvia</item>
		<item value="LBN">Lebanon</item>
		<item value="LSO">Lesotho</item>
		<item value="LBR">Liberia</item>
		<item value="LBY">Libyan Arab Jamahiriya</item>
		<item value="LIE">Liechtenstein</item>
		<item value="LTU">Lithuania</item>
		<item value="LUX">Luxembourg</item>
		<item value="MAC">Macao Special Administrative Region of China</item>
		<item value="MDG">Madagascar</item>
		<item value="MWI">Malawi</item>
		<item value="MYS">Malaysia</item>
		<item value="MDV">Maldives</item>
		<item value="MLI">Mali</item>
		<item value="MLT">Malta</item>
		<item value="MHL">Marshall Islands</item>
		<item value="MTQ">Martinique</item>
		<item value="MRT">Mauritania</item>
		<item value="MUS">Mauritius</item>
		<item value="MEX">Mexico</item>
		<item value="FSM">Micronesia Federated States of,</item>
		<item value="MCO">Monaco</item>
		<item value="MNG">Mongolia</item>
		<item value="MSR">Montserrat</item>
		<item value="MAR">Morocco</item>
		<item value="MOZ">Mozambique</item>
		<item value="MMR">Myanmar</item>
		<item value="NAM">Namibia</item>
		<item value="NRU">Nauru</item>
		<item value="NPL">Nepal</item>
		<item value="NLD">Netherlands</item>
		<item value="ANT">Netherlands Antilles</item>
		<item value="NCL">New Caledonia</item>
		<item value="NZL">New Zealand</item>
		<item value="NIC">Nicaragua</item>
		<item value="NER">Niger</item>
		<item value="NGA">Nigeria</item>
		<item value="NIU">Niue</item>
		<item value="NFK">Norfolk Island</item>
		<item value="MNP">Northern Mariana Islands</item>
		<item value="NOR">Norway</item>
		<item value="PSE">Occupied Palestinian Territory</item>
		<item value="OMN">Oman</item>
		<item value="PAK">Pakistan</item>
		<item value="PLW">Palau</item>
		<item value="PAN">Panama</item>
		<item value="PNG">Papua New Guinea</item>
		<item value="PRY">Paraguay</item>
		<item value="PER">Peru</item>
		<item value="PHL">Philippines</item>
		<item value="PCN">Pitcairn</item>
		<item value="POL">Poland</item>
		<item value="PRT">Portugal</item>
		<item value="PRI">Puerto Rico</item>
		<item value="QAT">Qatar</item>
		<item value="KOR">Republic of Korea</item>
		<item value="MDA">Republic of Moldova</item>
		<item value="REU">Reunion</item>
		<item value="ROM">Romania</item>
		<item value="RUS">Russian Federation</item>
		<item value="RWA">Rwanda</item>
		<item value="SHN">Saint Helena</item>
		<item value="KNA">Saint Kitts and Nevis</item>
		<item value="LCA">Saint Lucia</item>
		<item value="SPM">Saint Pierre and Miquelon</item>
		<item value="VCT">Saint Vincent and the Grenadines</item>
		<item value="WSM">Samoa</item>
		<item value="SMR">San Marino</item>
		<item value="STP">Sao Tome and Principe</item>
		<item value="SAU">Saudi Arabia</item>
		<item value="SEN">Senegal</item>
		<item value="YUG">Serbia and Montenegro</item>
		<item value="SYC">Seychelles</item>
		<item value="SLE">Sierra Leone</item>
		<item value="SGP">Singapore</item>
		<item value="SVK">Slovakia</item>
		<item value="SVN">Slovenia</item>
		<item value="SLB">Solomon Islands</item>
		<item value="SOM">Somalia</item>
		<item value="ZAF">South Africa</item>
		<item value="ESP">Spain</item>
		<item value="LKA">Sri Lanka</item>
		<item value="SDN">Sudan</item>
		<item value="SUR">Suriname</item>
		<item value="SJM">Svalbard and Jan Mayen Islands</item>
		<item value="SWZ">Swaziland</item>
		<item value="SWE">Sweden</item>
		<item value="CHE">Switzerland</item>
		<item value="SYR">Syrian Arab Republic</item>
		<item value="TWN">Taiwan</item>
		<item value="TJK">Tajikistan</item>
		<item value="THA">Thailand</item>
		<item value="MKD">The former Yugoslav Republic of Macedonia</item>
		<item value="TGO">Togo</item>
		<item value="TKL">Tokelau</item>
		<item value="TON">Tonga</item>
		<item value="TTO">Trinidad and Tobago</item>
		<item value="TUN">Tunisia</item>
		<item value="TUR">Turkey</item>
		<item value="TKM">Turkmenistan</item>
		<item value="TCA">Turks and Caicos Islands</item>
		<item value="TUV">Tuvalu</item>
		<item value="UGA">Uganda</item>
		<item value="UKR">Ukraine</item>
		<item value="ARE">United Arab Emirates</item>
		<item value="GBR">United Kingdom</item>
		<item value="TZA">United Republic of Tanzania</item>
		<item value="VIR">United States Virgin Islands</item>
		<item value="USA">United States</item>
		<item value="URY">Uruguay</item>
		<item value="UZB">Uzbekistan</item>
		<item value="VUT">Vanuatu</item>
		<item value="VEN">Venezuela</item>
		<item value="VNM">Viet Nam</item>
		<item value="WLF">Wallis and Futuna Islands</item>
		<item value="ESH">Western Sahara</item>
		<item value="YEM">Yemen</item>
		<item value="ZMB">Zambia</item>
		<item value="ZWE">Zimbabwe</item>
	</location>
XML;
			$result = self::CRLF . '	' . trim($xml) . self::CRLF;
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}	

			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

