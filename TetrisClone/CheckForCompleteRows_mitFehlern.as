class CheckForCompleteRows extends MovieClip{
	
	
	
	
	public function checkCompleteArray(){
		
		var arrayWithCompleteRows = new Array();
		
		
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
			
			// runs more than once?????????? in one call ????  
			trace("ja");
			
			// --- SCORE AND LINES   for COMPLETE ROWS *******
			/*_root.score += arrayWithCompleteRows.length *    (_root.levelNumber +1)  * _root.scoreForALine;
			_root.scoreForA_1_Line = 20;
			_root.scoreForA_2_Line = 40;
			_root.scoreForA_3_Line = 60;
			_root.scoreForA_4_Line = 80;
			*/
			
			if(arrayWithCompleteRows.length == 1){
				var totalAddedScore = (_root.levelNumber +1)  * _root.scoreForA_1_Line;
			}
			else if(arrayWithCompleteRows.length == 2){
				var totalAddedScore = (_root.levelNumber +1)  * _root.scoreForA_2_Line;
			}
			else if(arrayWithCompleteRows.length == 3){
				var totalAddedScore = (_root.levelNumber +1)  * _root.scoreForA_3_Line;
			}
			else if(arrayWithCompleteRows.length > 3){
				var totalAddedScore = (_root.levelNumber +1)  * _root.scoreForA_4_Line;
			}
			
			_root.linesLeftTextField = Number(_root.linesLeftTextField) - Number(arrayWithCompleteRows.length);
			_root.linesLeft_TOTALL_TextField = Number(_root.linesLeft_TOTALL_TextField) - Number(arrayWithCompleteRows.length);
			
			// when the level goe up add the lines extra score to ----
			if(_root.linesLeftTextField < 1){
				var linesEreasedInNextLevel =  (_root.linesLeftTextField) * -1;
				if(arrayWithCompleteRows.length == 1){
					 totalAddedScore += linesEreasedInNextLevel  * _root.scoreForA_1_Line;
				}
				else if(arrayWithCompleteRows.length == 2){
					 totalAddedScore += linesEreasedInNextLevel  * (_root.scoreForA_2_Line/2);
				}
				else if(arrayWithCompleteRows.length == 3){
					 totalAddedScore += linesEreasedInNextLevel  * (_root.scoreForA_3_Line/3);
				}
				else if(arrayWithCompleteRows.length > 3){
					 totalAddedScore += linesEreasedInNextLevel  * (_root.scoreForA_4_Line/4);
				}
			
			}// end if(_root.linesLeftTextField < 1){
			
			//------------------------------------------------------------
			
			
			
			_root.score += totalAddedScore;
			// attach Mini Score Clip---- for each row that is solved
			var miniScore = _root.allTetrisShape.attachMovie("lineScoreMini_Clip","lineScoreMini_Clip" + _root.allTetrisShape.getNextHighestDepth(), _root.allTetrisShape.getNextHighestDepth());
		 	miniScore.lineScoreMini.miniScore.text = "+  " +   totalAddedScore; 
			// miniScore._x = 40;
			 //miniScore._y = 40;
			miniScore._x =  _root.stoneCenterColumn *                  _root.stone_lenght;// +          _root.field_Tetris_Clip._x;
			miniScore._y =  Number(arrayWithCompleteRows[0] ) *       _root.stone_height;// +         _root.field_Tetris_Clip._y;
			
			
			
			
			
			// --- ********************************************
			
			
			
			
			/*
			if(_root.linesLeftTextField < 1){
				//var linesLeftTemp = _root.linesLeftTextField;
				_root.nextLevel();
				//_root.linesLeftTextField = Number(_root.linesLeftTextField) + Number(linesLeftTemp); // if there are lines that should count for the next Level
				
			}
			*/
			
			
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
			
			if(_root.linesLeftTextField < 1){
				//var linesLeftTemp = _root.linesLeftTextField;
				_root.nextLevel();
				//_root.linesLeftTextField = Number(_root.linesLeftTextField) + Number(linesLeftTemp); // if there are lines that should count for the next Level
				
			}
			
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