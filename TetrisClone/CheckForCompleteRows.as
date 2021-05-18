class CheckForCompleteRows extends MovieClip{
	
	private var belowZeroMeansLevelsAreLeft:Number;
	private var rowsLeftForNextLevel:Number;
	private var rowsForThisLevel:Number;
	private var totalAddedScore:Number;
	private var arrayWithCompleteRows:Array;
	
	public function checkCompleteArray(){
		
		arrayWithCompleteRows = new Array();
		
		
		for(var i = 0;i<_root.rowAmount;i++){
			
			var numberOfStonesInThe_i_row = 0;
			for(var j = 0;j<_root.columnAmount;j++){
				
				
				if(_root.two_D_Field_Array[i][j] != 0){
					
					numberOfStonesInThe_i_row++;
					if(numberOfStonesInThe_i_row == _root.columnAmount){
						arrayWithCompleteRows.push(i);
					}
					
				}
			} // end for _root.columnAmount
			
		}// end for _root.rowAmount
		
		
		trace(arrayWithCompleteRows.length  + "   array lenth"); // 0 array length with first 
		if(arrayWithCompleteRows.length == 0){ 
			
			
			if(_root.stoneCenterHightLevel == _root.nextPossible_Center_Row__START){ //== 0 before  // if the shape hits something and is on the first position // the game is over
				
				_root.gameOverClip.gotoAndPlay(2);
				_root.gameOverClip._visible = true;
				_root.gameOverClip.swapDepths(_root.getNextHighestDepth() );
				
				_root.keyBoardControllOnOff = false; 
				
			}
			
			if(_root.stoneCenterHightLevel == _root.nextPossible_Center_Row__START){ //== 0 before  // if the shape hits something and is on the first position // the game is over
				_root.gameOverClip._visible = true;
				_root.gameOverClip.swapDepths(_root.getNextHighestDepth() );
				
				//------------------
				_root.nextPossible_Center_Row = _root.nextPossible_Center_Row__START;
				_root.nextPossible_Center_Column =_root.stoneColumnStartPosition;
				_root.nextPossibleRotation = 0;
				_root.stoneCenterHightLevel = _root.nextPossible_Center_Row__START;//0; // ???
				_root.stoneCenterColumn = _root.stoneColumnStartPosition; // ??? 
				_root.currentStoneFormation = 0; // ???
			
			
				_root.myCreateTetrisShapeOutOf_4_Pieces.createRandomTetrisStone();
				
				
				
				//------------------
				
				
				_root.keyBoardControllOnOff = false; 
				
			}
			
			
			
			else{ // the shape is set and the next shape will be started
				
				_root.nextPossible_Center_Row = _root.nextPossible_Center_Row__START;
				_root.nextPossible_Center_Column =_root.stoneColumnStartPosition;
				_root.nextPossibleRotation = 0;
				_root.stoneCenterHightLevel = _root.nextPossible_Center_Row__START;//0; // ???
				_root.stoneCenterColumn = _root.stoneColumnStartPosition; // ??? 
				_root.currentStoneFormation = 0; // ???
			
			
				_root.myCreateTetrisShapeOutOf_4_Pieces.createRandomTetrisStone();
				_root.myStartNextTetrisShape.setIntervallForTetrisShape();
			}
			
		
		}
		
		
		
		// COMPLETE ROWS:::::::::::::::::::::
		if(arrayWithCompleteRows.length > 0){
			
			
			
			
			//_root.linesLeftTextField = Number(_root.linesLeftTextField) - Number(arrayWithCompleteRows.length); // this later !!!!!!!!!!!!!
			//_root.linesLeft_TOTALL_TextField = Number(_root.linesLeft_TOTALL_TextField) - Number(arrayWithCompleteRows.length); // this later diese erst später !!!!!!!!!!!
			
			//_root.levelNumber_TEMP = _root.levelNumber;
			// ((1))   find out if there are to long rows // rows above the last game row ----------
			_root.allRowsToSubtract_TEMP = arrayWithCompleteRows.length;
			if(_root.linesLeft_TOTALL_TextField < _root.allRowsToSubtract_TEMP){
				_root.allRowsToSubtract_TEMP = Number(_root.linesLeft_TOTALL_TextField);
		
			}
			trace(_root.allRowsToSubtract_TEMP + "  _root.allRowsToSubtract_TEMP");
			// -----------
			
	
		// ((2)) 
		// how many rows in this Level have been solved
		belowZeroMeansLevelsAreLeft = _root.linesLeftTextField - _root.allRowsToSubtract_TEMP;
		trace(belowZeroMeansLevelsAreLeft + "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");	
	
	
		if(belowZeroMeansLevelsAreLeft < 1){  /// important smaller 1 not 0 !!!!!!!!!!!
			// if there are more rows than only in this Level
			rowsLeftForNextLevel = -1 *  belowZeroMeansLevelsAreLeft;
			rowsForThisLevel = _root.linesLeftTextField;
		}
		else{
			// if the rows are only in this level
			rowsForThisLevel = _root.allRowsToSubtract_TEMP;
			rowsLeftForNextLevel = 0;
		}
		// ((3)) run through the score funktion just the actual Level
		_root.levelNumber_TEMP = _root.levelNumber;
		_root.scoreAdd_TEMP = 0;
		storeTheTempScoreForOnlyTheRowsWhichBelongToTheLevelNumber(_root.levelNumber_TEMP +1 ,rowsForThisLevel);
	
	
	
		
		
		// jump 1 level
		// ((4)) // if there was more rows than in the first level  // the left rows must be culculated in the next level  ---------------------
		if(rowsLeftForNextLevel > 0){
			seeHowManyRowsInCurrentLevelAreEffected();
		}
		
		
		
		// -------------------
		
		
	
		// jump 2 levels
		// ((4)) // if there was more rows than in the first level  // the left rows must be culculated in the next level  ---------------------
		if(rowsLeftForNextLevel > 0){
			seeHowManyRowsInCurrentLevelAreEffected();
		}
	
		// -------------------
	
	
		// jump 3 levels 
		// ((4)) // if there was more rows than in the first level  // the left rows must be culculated in the next level  ---------------------
		if(rowsLeftForNextLevel > 0){
			seeHowManyRowsInCurrentLevelAreEffected();
		}
	
		// -------------------
	
	
		// jump 4 levels 
		// ((4)) // if there was more rows than in the first level  // the left rows must be culculated in the next level  ---------------------
		if(rowsLeftForNextLevel > 0){
			seeHowManyRowsInCurrentLevelAreEffected();
		}
	
		// -------------------
		
		
		
		
		// the three variables to set after the rows animation is over
		_root.linesLeftTextField_TEMP = belowZeroMeansLevelsAreLeft; // put linesLeft Later on this varaiable 
		
		_root.linesLeft_TOTALL_TextField_TEMP = _root.linesLeft_TOTALL_TextField - _root.allRowsToSubtract_TEMP;
		
		//trace(_root.linesLeft_TOTALL_TextField +  "   -   "   +   _root.allRowsToSubtract_TEMP  +"    qqqqqqqqqqqqqqqqqqqqqqqqqqq");
		//_root.levelNumber_TEMP = _root.levelNumber_TEMP;
	
		//-------NN
		if(_root.linesLeftTextField_TEMP == 0){
			_root.levelNumber_TEMP++
			if(Number( _root.allLinesToNextLevel[_root.levelNumber_TEMP] ) ){
				_root.linesLeftTextField_TEMP = Number( _root.allLinesToNextLevel[_root.levelNumber_TEMP] );
			}
		}
		//------NN	
			
			
			
			
			
			//------------------------------------------------------------
			totalAddedScore = _root.scoreAdd_TEMP; 
			
			
			_root.score += totalAddedScore;
			// attach Mini Score Clip---- for each row that is solved
			var miniScore = _root.allTetrisShape.attachMovie("lineScoreMini_Clip","lineScoreMini_Clip" + _root.allTetrisShape.getNextHighestDepth(), _root.allTetrisShape.getNextHighestDepth());
		 	miniScore.lineScoreMini.miniScore.text = "+  " +   totalAddedScore; 
			// miniScore._x = 40;
			 //miniScore._y = 40;
			miniScore._x =  _root.stoneCenterColumn *                  _root.stone_lenght;// +          _root.field_Tetris_Clip._x;
			miniScore._y =  Number(arrayWithCompleteRows[0] ) *       _root.stone_height;// +         _root.field_Tetris_Clip._y;
			
			
			
			
			
			
			
			
			
			
			
			
			
			// --- SCORE AND LINES   for COMPLETE ROWS
						
						
						
						
						
						
			// if there is a row which is full // then: 
			_root.arrayWithCompleteRows = new Array();
			
			//for(var i=0;i<arrayWithCompleteRows){
			_root.arrayWithCompleteRows = arrayWithCompleteRows;
			//}
			trace(_root.arrayWithCompleteRows  + "     _root.arrayWithCompleteRows");
			// 1) erase the stonetileClips 
			eraseStoneClips(arrayWithCompleteRows);
		
			// 2) adjust the array / erase the rows / ARRAY: let the upper rows down  // later
			//eraseTheRowsAndSetAllRowsAboveDown(arrayWithCompleteRows); // off
			
			
			// 3) go throug all array and set the stones on new position  // later
			//setAllVisibleStonesOnTheirNewPosition(); // off
			
		}
	
	
	}// checkCompleteArray()
	
	
	
	
	
	
	
	


private function seeHowManyRowsInCurrentLevelAreEffected(){
	// rise the level
		_root.levelNumber_TEMP++;
		// how many rows in this Level have been solved
		belowZeroMeansLevelsAreLeft = Number( _root.allLinesToNextLevel[_root.levelNumber_TEMP] ) - rowsLeftForNextLevel;
		if(belowZeroMeansLevelsAreLeft < 1){
			// if there are more rows than only in this Level
			rowsLeftForNextLevel = -1 *  belowZeroMeansLevelsAreLeft;
			rowsForThisLevel = Number( _root.allLinesToNextLevel[_root.levelNumber_TEMP] );			
		}
		else{
			// if the rows are only in this level
			rowsForThisLevel = rowsLeftForNextLevel;
			rowsLeftForNextLevel = 0;
		}
	
		storeTheTempScoreForOnlyTheRowsWhichBelongToTheLevelNumber(_root.levelNumber_TEMP +1 ,rowsForThisLevel);
	
	
	
}





private function storeTheTempScoreForOnlyTheRowsWhichBelongToTheLevelNumber(realLevelNumber_P:Number , rowsForThisLevel_P:Number){
			
			if(rowsForThisLevel_P == 1){
				_root.scoreAdd_TEMP  += realLevelNumber_P  * _root.scoreForA_1_Line;
				
			}
			else if(rowsForThisLevel_P == 2){
				_root.scoreAdd_TEMP  += realLevelNumber_P  * _root.scoreForA_2_Line;
			}
			else if(rowsForThisLevel_P == 3){
				_root.scoreAdd_TEMP  += realLevelNumber_P  * _root.scoreForA_3_Line;
			}
			else if(rowsForThisLevel_P > 3){
				_root.scoreAdd_TEMP += realLevelNumber_P  * _root.scoreForA_4_Line;
			}
	
			trace(_root.scoreAdd_TEMP +"äääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääää");
	
}// end  storeTheTempScoreForOnlyTheRowsWhichBelongToTheLevelNumber






	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	private function eraseStoneClips(arrayWithCompleteRows_P:Array){
		// go through all rows which are in the array: arrayWithCompleteRows_P
		for(var i = 0;i<arrayWithCompleteRows_P.length;i++){
			var row = Number (arrayWithCompleteRows_P[i] ) ;
			
			/*
			// attach Mini Score Clip---- for each row that is solved
			var miniScore = _root.attachMovie("lineScoreMini_Clip","lineScoreMini_Clip" + _root.getNextHighestDepth(), _root.getNextHighestDepth());
		 	miniScore.lineScoreMini.miniScore.text = "+  " +    (_root.levelNumber +1)  * _root.scoreForALine;;
			// miniScore._x = 40;
			 //miniScore._y = 40;
			miniScore._x =  _root.stoneCenterColumn * _root.stone_lenght + _root.field_Tetris_Clip._x;
			miniScore._y =  row * _root.stone_height + _root.field_Tetris_Clip._y;
			*/ 
			 
			 //------------------------------
			 		
			
		
			
			for(var j = 0;j<_root.columnAmount;j++){
				_root.allTetrisShape["stone" + _root.two_D_Field_Array[ row ][j]  ].gotoAndStop("hitFlashing");//removeMovieClip(); // erase clips
				//_root["stone" + _root.two_D_Field_Array[ row ][j]  ].removeMovieClip(); // erase clips
			} // end for
		
		
		
		}// end for
		_root.lookKeyBoardForStonesGoingDown = false;
		_root.onEnterFrame = waitForFlashingRows; // must be on
		
	}// end  private function eraseStonClips
	
	
	
	
	
	
	
	private function waitForFlashingRows(){
		_root.flashingCounter--;
		trace("ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
		
		if(_root.flashingCounter < 0){
			trace("ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
			
			
			
			//-----
			for(var i = 0;i<_root.arrayWithCompleteRows.length;i++){
		
		
			var row = Number (_root.arrayWithCompleteRows[i] ) ;
			for(var j = 0;j<_root.columnAmount;j++){
				
				//----- star code
				if(_root.starModusOnOff == true){
					
					//stonePiece.colour = _root.stoneWhoIsGoingDown_Colour+1;
					//trace(_root.allTetrisShape["stone" + _root.two_D_Field_Array[ row ][j]  ] +  "  currrentFRAMEEEEEEEE");
					if(_root.allTetrisShape["stone" + _root.two_D_Field_Array[ row ][j]  ].colour == 9){; // erase clips
						_root.starAmount--;
						//_root.score += _root.starExtraScore;
						//_root.allTetrisShape.attachMovie.starClip.gotoAndPlay();
						if(_root.starAmount == 0){
							// game wonn
							_root.wonGame();
						}
						
					}
				}
				// ------ star code 
				
				_root.allTetrisShape["stone" + _root.two_D_Field_Array[ row ][j]  ].removeMovieClip(); // erase clips
			} // end for
		
		
		
			}// end for
			//------
			
			// 2) adjust the array / erase the rows / ARRAY: let the upper rows down  // later
			_root.myCheckForCompleteRows.eraseTheRowsAndSetAllRowsAboveDown(_root.arrayWithCompleteRows);
			_root.flashingCounter = _root.flashingCounter_Start;
			
			///----- new
			_root.accelerator = _root.acceleratorStart;
			_root.accelleratorAdd = _root.accelleratorAddStart; 
			_root.onEnterFrame = _root.myCheckForCompleteRows.tryAllShapeToSlideDown;
			// ----- new 
			
			/*
			
			
			
			// 3) go throug all array and set the stones on new position  // later
			_root.myCheckForCompleteRows.setAllVisibleStonesOnTheirNewPosition();
			
			
			
			
			// throw next stone shape:
			_root.nextPossible_Center_Row =0;
			_root.nextPossible_Center_Column =0;
			_root.nextPossibleRotation = 0;
			_root.stoneCenterHightLevel = 0; // ???
			_root.stoneCenterColumn = 0; // ??? 
			_root.currentStoneFormation = 0; // ???
			_root.myCreateTetrisShapeOutOf_4_Pieces.createRandomTetrisStone();
			_root.myStartNextTetrisShape.setIntervallForTetrisShape();
			
			delete this.onEnterFrame;
			
			*/
			
		}
		
	}// end 
	
	
	
	private function tryAllShapeToSlideDown(){//slideAllAboveShapesDown(){
		// slide all stones above the highest row the row amount down
		
		
		
		var stonesToMoveDownLeft = false;
		// cycle through all shapes
		for(var i = 0;i<_root.rowAmount;i++){
			
			
			for(var j = 0;j<_root.columnAmount;j++){
				
				
				if(_root.two_D_Field_Array[i][j] != 0){
				//---------------------------------------------------	
				
				
				var stone = _root.allTetrisShape["stone" + _root.two_D_Field_Array[i][j] ];
				//trace(stone  +  "   stone ...");
				var targetPositionY = i * _root.stone_height;
				
				if(stone._y != targetPositionY){
					stonesToMoveDownLeft = true;
					stone._y += _root.accelerator;
					_root.accelerator +=_root.accelleratorAdd;
					trace(_root.accelerator + "   _root.accelerator");
					
					if(stone._y > targetPositionY){
						stone._y =  i * _root.stone_height;
					}
				}
				
				//stone._x =  j * _root.stone_lenght; //+ _root.field_Tetris_Clip._x;
				//stone._y =  i * _root.stone_height;// + _root.field_Tetris_Clip._y;
					
					
					
				//---------------------------------------------------	
				}
			} // end for _root.columnAmount
			
		}// end for _root.rowAmount
		
		
		// all stones have moved down if:
		if(stonesToMoveDownLeft == false){
			
			//if(_root.linesLeftTextField < 1){
				//var linesLeftTemp = _root.linesLeftTextField;
				//_root.nextLevel(); // start this function in any case!!!
				if(arrayWithCompleteRows.length > 0){
					_root.myCheckForCompleteRows.setTEMP_TextFieldValues();
					trace("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
				}
				//_root.linesLeftTextField = Number(_root.linesLeftTextField) + Number(linesLeftTemp); // if there are lines that should count for the next Level
				
			//}
			
			if(_root.allLevelBeat == true){
				//_root.onEnterFrame = waitForEndClip...
				delete this.onEnterFrame;
			}
			else{
			
				trace(" okkkk");
				// have next stone from above
				// delete this
				// throw next stone shape:
				_root.nextPossible_Center_Row = _root.nextPossible_Center_Row__START;
				_root.nextPossible_Center_Column = _root.stoneColumnStartPosition;//0;
				_root.nextPossibleRotation = 0;
				_root.stoneCenterHightLevel = _root.nextPossible_Center_Row__START; //0; // ???
				_root.stoneCenterColumn = _root.stoneColumnStartPosition; //_root.nextPossible_Center_Row__START; // ??? 
				_root.currentStoneFormation = 0; // ???
				_root.myCreateTetrisShapeOutOf_4_Pieces.createRandomTetrisStone();
				_root.myStartNextTetrisShape.setIntervallForTetrisShape();
			
				delete this.onEnterFrame;
			
			}
			
		}
		
		
	}// end private function slideAllAboveShapesDown(){
	
	
	
	private function setTEMP_TextFieldValues(){
			trace("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
			
			
		_root.linesLeftTextField =    _root.linesLeftTextField_TEMP;
		trace(_root.linesLeftTextField + "lllllllllllllllllllllllllllllllllllllllllllll");
		_root.linesLeft_TOTALL_TextField = _root.linesLeft_TOTALL_TextField_TEMP;
		
		
		
		
		// if level number is different from previous the level has --- raised  LEVEL UP---
		if(_root.levelNumber != _root.levelNumber_TEMP){
			
			var howManyLevelUp = _root.levelNumber_TEMP - _root.levelNumber;
			
			//trace(_root.scoreForNextLevel * howManyLevelUp + _root.score + " &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
			var tempScore = (_root.scoreForNextLevel * howManyLevelUp) + _root.score;
			trace(tempScore + " &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
			_root.score = 0 + tempScore;
			trace(_root.score + " &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&222222");
			//_root.score = _root.score + _root.scoreForNextLevel * howManyLevelUp;
			
			_root.nextLevelClip._visible = true;
			_root.nextLevelClip.gotoAndPlay(1);
			_root.nextLevelClip.swapDepths(_root.getNextHighestDepth()); 
			
			
			_root.levelNumber = _root.levelNumber_TEMP;
			_root.levelTextField = _root.levelNumber +1;
			
			// prevent level from last level turning to 0
			/*
			if(_root.levelNumber < 1){
				_root.levelNumber = _root.allLevelSpeed.length -1;
				_root.levelTextField = _root.allLevelSpeed.length;
			}*/
			
		}
		// ------------
		// last Level : Row reached
		if(_root.linesLeft_TOTALL_TextField == 0){ // game is won !!! WON WON WON WON 
			
			//_root.levelTextField = 0;
			_root.linesLeftTextField = 0;
		
			_root.allLevelBeat = true;
			_root.gameWonClip._visible = true;
			_root.gameWonClip.swapDepths(_root.getNextHighestDepth() );
			_root.gameWonClip.gotoAndPlay(2);
		
			_root.keyBoardControllOnOff = false;
			_root.linesLeftTextField = 0;
			_root.linesLeft_TOTALL_TextField = 0; 
			clearInterval(_root.intervalId);
			_root.intervalId = undefined;
			
		}
		
	
	
	}// end setTEMP_TextFieldValues()
	
	
	
	
	private function eraseTheRowsAndSetAllRowsAboveDown(arrayWithCompleteRows_P:Array){
		// go through all rows which are in the array: arrayWithCompleteRows_P
		for(var i = 0;i<arrayWithCompleteRows_P.length;i++){
			
			var row = Number (arrayWithCompleteRows_P[i] ) ;
			for(var j = 0;j<_root.columnAmount;j++){
				  // 1) erase entries
				  _root.two_D_Field_Array[row][j] = 0;  // erase array entries in the row 
				
				
					
			} // end for
			
			// take the rows above and take them one down
			var startRow = row; // because rows go from top to bottom    (top) 0,1,2- 20 (bottom)
			setTheRowsOneRowDown(startRow,arrayWithCompleteRows_P);
		
		}// end for
	}// end private function eraseTheRowsAndSetAllRowsAboveDown()
	
	
	
	
	
	
	private function setTheRowsOneRowDown(startRow_P:Number,arrayWithCompleteRows_P:Array){
		for(var i=startRow_P;i >0;i--){
			//trace(_root.two_D_Field_Array[i] + "   llll");
			
			for(var j = 0;j<_root.columnAmount;j++){
				_root.two_D_Field_Array[i][j] = _root.two_D_Field_Array[i-1][j];
				
			} // end for j
		}// end for i
				
		
	}// end private function setTheRowsOneRowDown()
	
	
	
	
	
	
	/*
	
	private function setAllVisibleStonesOnTheirNewPosition(){
		
		
		for(var i=0; i<_root.two_D_Field_Array.length ;i++){
			for(var j=0; j<_root.two_D_Field_Array[i].length ;j++){
				
				
				var stone = _root.allTetrisShape["stone" + _root.two_D_Field_Array[i][j] ];
				//trace(stone  +  "   stone ...");
				stone._x =  j * _root.stone_lenght; //+ _root.field_Tetris_Clip._x;
				stone._y =  i * _root.stone_height;// + _root.field_Tetris_Clip._y;
		
			} // end for j
		}// end for i
		
	}// end private function setAllVisibleStonesOnTheirNewPosition()
	
	*/
	
	
	
	
	
	
	
	
	
	
	
}// end CheckForCompleteRows extends MovieClip