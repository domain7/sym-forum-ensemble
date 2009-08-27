<?php

	Class ConfigurationAccessor{
		
		public static function driver(){
			if(class_exists('Administration')){
				return Administration::instance()->Configuration;
			}
			
			return Frontend::instance()->Configuration; 
		}
		
		public static function get($name=NULL, $index=NULL) {
			return self::driver()->get($name, $index);
		}

		public static function set($name, $val, $index=NULL) {
			return self::driver()->set($name, $val, $index);			
		}
	
		public static function remove($name, $index=NULL){
			return self::driver()->remove($name, $index);			
		}
	
		public static function setArray(array $array){
			return self::driver()->setArray($array);			
		}
	
		public static function flush(){
			return self::driver()->flush();			
		}
	
		public static function create(){
			return self::driver()->create();			
		}
	
	}