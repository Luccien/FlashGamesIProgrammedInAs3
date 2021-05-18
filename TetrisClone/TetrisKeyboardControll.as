class TetrisKeyboardControll  extends MovieClip{
	
	
private var stonePiece:MovieClip;
	
	
public function TetrisKeyboardControll(){
	
	
	_root.columnAdjustment = 0; // ??????
	_root.keyUpWasPressed = false;
	_root.hitSpaceBar = false;
	_root.theShapeHitsSomething = false;
	
	
	var keyListener_obj:Object = new Object();
	//trace("g");
	var keyListener_obj_2:Object = new Object();
	
	
	

	
	
	
	
	
	
	keyListener_obj.onKeyDown = function() {
		
		if(Key.getCode() == 19){//27){// 19){
			
			// set pause
			if(_root.pauseClip._visible == false){
				
				/*
				// stop clock 
				_root.stopTime = getTimer()/1000;
				delete _root.the_clock_Clip.onEnterFrame;
				
				// stop clock
				*/
				
				_root.pauseWasReleased = false;
				_root.pauseClip._visible = true;
				_root.pauseClip.swapDepths(_root.getNextHighestDepth);
				_root.pauseClip.gotoAndPlay(2);
				
				clearInterval(_root.intervalId);
				_root.intervalId = undefined;
				_root.keyBoardControllOnOff = false;
			
			}
			// release Pause
			else if(_root.pauseWasReleased == true & _root.pauseClip._visible == true){
				/*
				// start clock 
				_root.timeStopDuration = getTimer()/1000 - _root.stopTime;
				_root.startZeit2 += _root.timeStopDuration;
				_root.the_clock_Clip.onEnterFrame  = _root.myClock.stopUhr;
				
				// start clock
				*/
				_root.pauseWasReleased = false;
				_root.pauseClip._visible = false;
				
				if(_root.allLevelSpeed[_root.levelNumber]){
					_root.intervalId = setInterval(_root.myStartNextTetrisShape, "setTetrisDown", Number( _root.allLevelSpeed[_root.levelNumber] ) );
				}
				_root.keyBoardControllOnOff = true;
				
				
				// variables from StartNextTetrisShape  : if(_root.keyBoardControllOnOff == true){
				_root.lookKeyBoardForStonesGoingDown = true;
				_root.keyUpWasPressed = false;
				_root.downSpeedOnOff = true;
				_root.hitSpaceBar = false;
				//----
				
				trace(_root.keyBoardControllOnOff + "    _root.keyBoardControllOnOff ");
			}
			
			/*
			//_root.intervalId = setInterval(_root.myStartNextTetrisShape, "setTetrisDown", Number( _root.allLevelSpeed[_root.levelNumber] ) );
			if(_root.allLevelSpeed[_root.levelNumber]){
				_root.intervalId = setInterval(_root.myStartNextTetrisShape, "setTetrisDown", Number( _root.allLevelSpeed[_root.levelNumber] ) );
			}
			*/
			
		}// end pause
		
		
		
		
		
		
		
		
		if(_root.keyBoardControllOnOff == true & _root.lookKeyBoardForStonesGoingDown == true){
		
		
		
		trace(Key.getCode() +"ok");
		
		trace(_root.hitSpaceBar  + "  _root.hitSpaceBar");
		
		
		
		// space key to set tetris shape down
		
		
		//if(Key.getCode() == 32){
			//if(Key._pressed(Key.SPACE)){
			if(Key.isDown(Key.SPACE)){
			
			
			
			
			if(_root.hitSpaceBar == false){
				_root.hitSpaceBar = true;
				_root.theShapeHitsSomething = false;
				
				// while to check the shape position  on each step one further down  until   the shape hits an object 
				while(_root.theShapeHitsSomething == false){
				trace("------------------------------------------------------------------------------------------");
				_root.score +=_root.downPressPointsForOneRow;
				//for(var i=0;i<20;i++){
					_root.nextPossible_Center_Row = _root.stoneCenterHightLevel + 1;
					_root.nextPossible_Center_Column = _root.stoneCenterColumn;
					_root.nextPossibleRotation = _root.currentStoneFormation;
					_root.myCheckAndSetNewShapePosition.checkNew();
				}// end while
			
				_root.theShapeHitsSomething = false;
			}// end if
			
			
			
		}// end if(Key.getCode() == 38){
		
		
		
		
		
		
		
		
		// down key to speed tiles up
		
		else if(Key.isDown(Key.DOWN)){
		//else if(Key.getCode() == 40){  
			if(_root.downSpeedOnOff == true){
			
			if(_root.keyUpWasPressed == false){
				_root.keyUpWasPressed = true;
				trace(" qqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
				
				clearInterval(_root.intervalId);
				_root.intervalId = undefined;
				_root.intervalId = setInterval(_root.myStartNextTetrisShape, "setTetrisDown", Number(_root.downPressSpeed ) );
				_root.myStartNextTetrisShape.setTetrisDown();
				
				
			}// end if(_root.downSpeedOnOff == true){
			}
		
		}// end 
		
		
		
		
		// left
		else if(Key.isDown(Key.LEFT)){
		//else if(Key.getCode() == 37){ // else
			// set for going out of borderlines   or hitting  stonetiles sideways! 
			_root.rightOrLeftOrRotatedPushed = true;
			_root.directionPushed = "left";
			
			_root.nextPossible_Center_Row = _root.stoneCenterHightLevel;
			_root.nextPossible_Center_Column = _root.stoneCenterColumn -1;
			_root.nextPossibleRotation = _root.currentStoneFormation;
		
			_root.myCheckAndSetNewShapePosition.checkNew();
			
			
		}
		
		// right
		if(Key.isDown(Key.RIGHT)){
		//else if(Key.getCode() == 39){
			// set for going out of borderlines   or hitting  stonetiles sideways! 
			_root.rightOrLeftOrRotatedPushed = true;
			_root.directionPushed = "right";
			
			_root.nextPossible_Center_Row = _root.stoneCenterHightLevel;
			_root.nextPossible_Center_Column = _root.stoneCenterColumn +1;
			_root.nextPossibleRotation = _root.currentStoneFormation;
		
			_root.myCheckAndSetNewShapePosition.checkNew();
			
		}
		
		
		
		
		
		
		// rotate clockwise
		else if(Key.getCode() == 38){
		  // set for going out of borderlines   or hitting  stonetiles sideways! 
			_root.rightOrLeftOrRotatedPushed = true;
		  	_root.directionPushed = "rotation";
		  
		  _root.nextPossible_Center_Row = _root.stoneCenterHightLevel;
			_root.nextPossible_Center_Column = _root.stoneCenterColumn;
			_root.nextPossibleRotation = _root.currentStoneFormation +1;
			if(_root.nextPossibleRotation == 4){  // adjust for stones with more formations
				_root.nextPossibleRotation = 0;
			}
		
			_root.myCheckAndSetNewShapePosition.checkNew();
		  
		  
		
			
		} // end if(Key.getCode() == 39){
			
			// rotate clockwise
		else if(Key.getCode() == 83){
		  // set for going out of borderlines   or hitting  stonetiles sideways! 
			_root.rightOrLeftOrRotatedPushed = true;
		  	_root.directionPushed = "rotation";
		  
		  _root.nextPossible_Center_Row = _root.stoneCenterHightLevel;
			_root.nextPossible_Center_Column = _root.stoneCenterColumn;
			_root.nextPossibleRotation = _root.currentStoneFormation +1;
			if(_root.nextPossibleRotation == 4){  // adjust for stones with more formations
				_root.nextPossibleRotation = 0;
			}
		
			_root.myCheckAndSetNewShapePosition.checkNew();
		  
		  
		
			
		} // end if(Key.getCode() == 39){
			
		
		// rotate counterclockwise
		else if(Key.getCode() == 65){
		  // set for going out of borderlines   or hitting  stonetiles sideways! 
			_root.rightOrLeftOrRotatedPushed = true;
		  	_root.directionPushed = "rotation";
		  
		  _root.nextPossible_Center_Row = _root.stoneCenterHightLevel;
			_root.nextPossible_Center_Column = _root.stoneCenterColumn;
			_root.nextPossibleRotation = _root.currentStoneFormation -1;
			trace("_root.nextPossibleRotation" + _root.nextPossibleRotation);
			if(_root.nextPossibleRotation == -1){  // adjust for stones with more formations
				_root.nextPossibleRotation = 3;
			}
		
			_root.myCheckAndSetNewShapePosition.checkNew();
		  
		  
		
			
		} // end if(Key.getCode() == 39){
		
		
		
	
	}// end if(_root.keyBoardControllOnOff == true){
	};
	
	
	
	
	Key.addListener(keyListener_obj);
	
	
	
	
	keyListener_obj_2.onKeyUp = function() {
		//if(_root.keyBoardControllOnOff == true & _root.lookKeyBoardForStonesGoingDown == true){
		
		
		trace("oooooooooooooo immer");
		if(_root.pauseWasReleased == false & _root.pauseClip._visible == true){
			
			_root.pauseWasReleased = true;
		
		}
		
		
		if(_root.keyBoardControllOnOff == true & _root.lookKeyBoardForStonesGoingDown == true){
		if(_root.hitSpaceBar == true){
			
			_root.hitSpaceBar = false;
		}
		
		
		if(_root.downSpeedOnOff == true){
		//**
		if(_root.keyUpWasPressed == true){
			
			_root.keyUpWasPressed = false;
			trace(" jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
			
			
			clearInterval(_root.intervalId);
			_root.intervalId = undefined;
			
			
			if(_root.allLevelSpeed[_root.levelNumber]){
				_root.intervalId = setInterval(_root.myStartNextTetrisShape, "setTetrisDown", Number( _root.allLevelSpeed[_root.levelNumber] ) );
			}
			else{
				var lastLinesIndex = _root.allLevelSpeed.length -1;
				_root.intervalId = setInterval(_root.myStartNextTetrisShape, "setTetrisDown", Number( _root.allLevelSpeed[lastLinesIndex] ) );
			}
			
			
			
		}
		//**
		}// end if(_root.downSpeedOnOff == true){
	
	
	}// end if(_root.keyBoardControllOnOff == true){
	}
	Key.addListener(keyListener_obj_2);
	
	
	
	
}// end TetrisKeyboardControll()  // KONSTUKTOR

	
	
	
	
	
	
	
	
	
}// end TetrisKeyboardControll


