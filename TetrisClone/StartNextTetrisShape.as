class StartNextTetrisShape extends MovieClip{
	
	
	
	public function setIntervallForTetrisShape(){
		//_root.theShapeHitsSomething = false;
		
	if(_root.keyBoardControllOnOff == true){
		
		_root.lookKeyBoardForStonesGoingDown = true;
		
		_root.keyUpWasPressed = false;
		_root.downSpeedOnOff = true;
		_root.hitSpaceBar = false;
		
		
		trace(_root.keyUpWasPressed + "   _root.keyUpWasPressed");
		trace(_root.intervalId  +  "   _root.intervalId")
		
		clearInterval(_root.intervalId);
		_root.intervalId = undefined;
		
		
		//_root.intervalId = setInterval(_root.myStartNextTetrisShape, "setTetrisDown", Number( _root.allLevelSpeed[_root.levelNumber] ) );
		if(_root.allLevelSpeed[_root.levelNumber]){
				_root.intervalId = setInterval(_root.myStartNextTetrisShape, "setTetrisDown", Number( _root.allLevelSpeed[_root.levelNumber] ) );
			}
			else{
				var lastLinesIndex = _root.allLevelSpeed.length -1;
				_root.intervalId = setInterval(_root.myStartNextTetrisShape, "setTetrisDown", Number( _root.allLevelSpeed[lastLinesIndex] ) );
			}
		
		
		_root.keyUpWasPressed = false;
			
					
					
	}// end if(_root.keyBoardControllOnOff == true){
	}
	
	
	public function setTetrisDown(){
				
		
		_root.nextPossible_Center_Row = _root.stoneCenterHightLevel + 1;
		_root.nextPossible_Center_Column = _root.stoneCenterColumn;
		_root.nextPossibleRotation = _root.currentStoneFormation;
		
		_root.myCheckAndSetNewShapePosition.checkNew();
		
		//trace(_root.two_D_Field_Array + "   _root.two_D_Field_Array");
		
		
	}// end function setTetrisDown()
	
		
	
}// end class StartNextTetrisShape extends MovieClip{