class Clock extends MovieClip{

	private var clock_Clip:MovieClip;

	
	
	public function startClock(){
		//_root.countDownFrom = 1000; // !!! Attention variable is defined on _root
		
		_root.startZeit2 = getTimer()/1000;
		
		// einen clip andem die Stopuhr hängt 
		clock_Clip = _root.createEmptyMovieClip("the_clock_Clip", _root.getNextHighestDepth() );
		clock_Clip.onEnterFrame = stopUhr;
				
	}





public function stopUhr(){
	_root.allSek = Math.round(getTimer()/1000 - _root.startZeit2);
	
	_root.allSek = _root.countDownFrom - _root.allSek;
	//------------------------------
	// wenns auf null kommt dann wird GameOver gestartet
	//_root.zeit = _root.allSek;
	
	if(_root.allSek <= 0){
		_root.allSek == 0;
		_root.gameOver();
		delete this.onEnterFrame;
		
	}
	
	_root.my_hours = int(_root.allSek / (60*60));
	if(_root.my_hours < 10){
		_root.my_hours = "0" + _root.my_hours;
	}
	
	
	_root.minuten = _root.allSek % 3600;
	_root.minuten = int(_root.minuten / 60);
	if(_root.minuten < 10){
		_root.minuten = "0" + _root.minuten;
	}
	
	_root.sek = _root.allSek % 60;
	if(_root.sek < 10){
		_root.sek = "0" + _root.sek;
	}	
	
	if(_root.my_hours == "00"){
		//_root.zeit = _root.minuten + ":" + _root.sek;
		_root.zeit = _root.allSek;
	}
	else{
		//_root.zeit = _root.my_hours + ":" + _root.minuten + ":" + _root.sek;
		_root.zeit = _root.allSek;
	}
	
}// function stopUhr()




}// end class