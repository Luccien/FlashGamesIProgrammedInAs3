class CheckAndSetNewShapePosition extends MovieClip{









public function checkNew(){
	
	// BASIC IDEA :  check all tiles of the shape and look if the new position is possible // if possible set all tiles to the try out = tempPosition -----
		
	// 1) make a copy of the fieldArray ----------------------------------------------
	_root.two_D_Field_Array_TEMP = new Array(_root.two_D_Field_Array.length);
	//-----_root.two_D_Field_Array_TEMP = _root.two_D_Field_Array; // ATTENTION: just copying the 2D Array does not work // it adjusts both arrays when adjusting the copy
	// the array needs to be copied by each index 
	for(var i=0;i<_root.two_D_Field_Array.length;i++){
		var tempInnerArray = new Array(_root.two_D_Field_Array[i].length);
		_root.two_D_Field_Array_TEMP[i] = tempInnerArray;
		
		for(var j=0;j<_root.two_D_Field_Array[i].length;j++){
			_root.two_D_Field_Array_TEMP[i][j] = _root.two_D_Field_Array[i][j];
			
		} // end for 2
	}// end for 1
	//-------------------------------------------------------------------------------------
	
	
	
	
	
	// 2) delete the shape which is beeing moved from the array for example an L (temp Array) --------------------------------------
	//1 first [] = row or y 
	var x_y_x_y_StonePointsArray = _root["tetrisStoneShape_" + _root.stoneWhoIsGoingDown_Number][_root.currentStoneFormation].slice(",");
	var tileAmount = x_y_x_y_StonePointsArray.length;
	
	for(var i=0;i<tileAmount; i +=2){
		var  currentRow  =  x_y_x_y_StonePointsArray[i +1] +  _root.stoneCenterHightLevel; // y
		var  currentColumn  =   x_y_x_y_StonePointsArray[i] +  _root.stoneCenterColumn;  // x
		
		_root.two_D_Field_Array_TEMP[  currentRow ][  currentColumn ] = 0;
			
	}
	//---------------------------------------------------------------------------------------------------------------------
	
	
	
	
	
	// ----------------------------------------------------------------------------------------------------------------------
	// 3) NOW put the shape in the new position
	//putShapeWithinArray();  
	test_ToPutShapeWithinArray(0,0); //    puts        _root.newPositionIsWorking = false;       if the position is not working
	// -----------------------------------------------------------------------------------------------------------------------
	
	
	
	//-------------------------------------------------------------------------------------------------------------------------
	// 4) if it doesnot work and the shape was adjusted by right or left / or rotating // than try out  1 and two positions left or 1 and two positions right
	if( _root.newPositionIsWorking == false){
		if(_root.rightOrLeftOrRotatedPushed == true){
			
			
			if(_root.directionPushed == "right"){
			
				//_root.nextPossible_Center_Column__Temp =  _root.nextPossible_Center_Column    - 1;
		 		if(test_ToPutShapeWithinArray(-1,0)){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
				// try left and right 
				//_root.nextPossible_Center_Column__Temp =  _root.nextPossible_Center_Column    - 2;
				else if(test_ToPutShapeWithinArray(-2,0)  ){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
					trace("gggggggggggggggggtttttttttttttttttttttttttt");
				}
				else if(test_ToPutShapeWithinArray(-3,0)  ){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
				
				_root.directionPushed = "nowhere";
			}
			
			
			
			else if(_root.directionPushed == "left"){
			
				// try left and right 
				//_root.nextPossible_Center_Column__Temp =  _root.nextPossible_Center_Column    + 1;
				if(test_ToPutShapeWithinArray(1,0)  ){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
						
				// try left and right 
				//_root.nextPossible_Center_Column__Temp =  _root.nextPossible_Center_Column    + 2;
				else if(test_ToPutShapeWithinArray(2,0)  ){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
					trace("gggggggggggggggggtttttttttttttttttttttttttt");
				}
				else if(test_ToPutShapeWithinArray(3,0)  ){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
					_root.directionPushed = "nowhere";
			}
			
			
			else if(_root.directionPushed == "rotation"){
				/*
				// half of the columns 
				//var halfOfTheColumns = _root.columnAmount/2;
			if(_root.hitIsOnWhichSide == "left"){	
				//if(){
				
				if(test_ToPutShapeWithinArray(-1)){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
				// try left and right 
				//_root.nextPossible_Center_Column__Temp =  _root.nextPossible_Center_Column    - 2;
				else if(test_ToPutShapeWithinArray(-2)  ){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
				else if(test_ToPutShapeWithinArray(-3)  ){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
				
				
				else if(test_ToPutShapeWithinArray(1)  ){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
						
				// try left and right 
				//_root.nextPossible_Center_Column__Temp =  _root.nextPossible_Center_Column    + 2;
				else if(test_ToPutShapeWithinArray(2)  ){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
				else if(test_ToPutShapeWithinArray(3)  ){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
				
				
				}
				
				*/
			//else if(_root.hitIsOnWhichSide == "right"){
					
					
					
				if(test_ToPutShapeWithinArray(1,0) ){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				trace("ttttt1111111");
				
				}
				
				
				// try left and right 
				//_root.nextPossible_Center_Column__Temp =  _root.nextPossible_Center_Column    + 2;
				else if(test_ToPutShapeWithinArray(2,0)  ){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
					trace("ttttttttttttttttttttttt2222222222222222222");
				}
				
				/*
				else if(test_ToPutShapeWithinArray(3)  ){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
				*/
				else if(test_ToPutShapeWithinArray(-1,0)){
					trace("ttttt   ---- 1111111");
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
				// try left and right 
				//_root.nextPossible_Center_Column__Temp =  _root.nextPossible_Center_Column    - 2;
				else if(test_ToPutShapeWithinArray(-2,0)  ){
					trace("ttttttttttttttttttttttt --- 2222222222222222222");
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
				/*else if(test_ToPutShapeWithinArray(-3)  ){
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}*/
				
				// do this if the left right does not work for the shapepe ( this is the case if it hits the ground )  
				else if(test_ToPutShapeWithinArray(0,1)  ){
					trace("xxxxxxxxxxxxx --- 1111111111");
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
				else if(test_ToPutShapeWithinArray(0,2)  ){
					trace("yyyyyyyyyyy --- 2222222222");
					//_root.nextPossible_Center_Column = _root.nextPossible_Center_Column__Temp;
				}
				// go back to the old shape and location (do nothing!! no rotation!!)
				else{
					//_root.nextPossible_Center_Row = _root.stoneCenterHightLevel; // donot make this back because of the intavall that calls 
					// this function at the same time it could be rotatet by pressing rotation
					_root.nextPossible_Center_Column = _root.stoneCenterColumn;
					_root.nextPossibleRotation = _root.currentStoneFormation;
					test_ToPutShapeWithinArray(0,0);
				}
				
				
			//}
					
					
				_root.directionPushed = "nowhere";
				
				
				
			}
			
			
			
			
			
		
		} // end  if(_root.rightOrLeftOrRotatedPushed == true){
	} // end if( _root.newPositionIsWorking == false){
	
	
	
	// -----------------------------------------------------------------------------------------------------------------------
	
	
	
	//-----------------------------------------------------------------------------
	// 5)))     finally put shape within array 
	
	putShapeWithinArray();
		
	//------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	var firstTile = (_root.myNumber) - tileAmount/2; // doubled first tile // must be new !!!
	
	
	
	
	
	
	
	
	
	
	
	
	if(_root.newPositionIsWorking == false){
		//_root.keyBoardControllOnOff = false;
		
		_root.downSpeedOnOff = false; 
		
		
		_root.theShapeHitsSomething = true; /// ??????
		
		
		
		clearInterval(_root.intervalId);
		_root.intervalId = undefined;
		// check for complete rows
		_root.myCheckForCompleteRows.checkCompleteArray();
		
		/*
		_root.nextPossible_Center_Row =0;
		_root.nextPossible_Center_Column =0;
		_root.nextPossibleRotation = 0;
		_root.stoneCenterHightLevel = 0; // ???
		_root.stoneCenterColumn = 0; // ??? 
		_root.currentStoneFormation = 0; // ???
		*/
		
		
		
		
		//_root.myCreateTetrisShapeOutOf_4_Pieces.createRandomTetrisStone();
		//_root.myStartNextTetrisShape.setIntervallForTetrisShape(); 
		
		
	
		
	}
	
	
	
	
	//-------------------------------------   if the possition is FREE !!!--------------
	else if(_root.newPositionIsWorking == true){
		// ------ new
		//clearInterval(_root.intervalId);
		//_root.intervalId = undefined;
		// ------ new
		
		// set the aktive array to the    test array values  
		_root.two_D_Field_Array = _root.two_D_Field_Array_TEMP;
		
		// if the down button is pressed (add points) ----------------------
		if(_root.keyUpWasPressed == true){
			_root.score +=_root.downPressPointsForOneRow;
		
		}
		// ----------------------------------------------------------------
		
		
		
		// go through all tiles/ stones and make them their test value possitions
		
		
		
		
		var thisShapeTileAmount = tileAmount/2;
		var lastStoneTile = firstTile + thisShapeTileAmount;
		for(var i = firstTile+1;i<lastStoneTile + 1;i++){
			var stonePiece = _root.allTetrisShape["stone" + i];
			//trace(stonePiece + "   stonePiece");
			stonePiece._x =  stonePiece.myPossible_NextPosition_Column   * _root.stone_lenght; //+ _root.field_Tetris_Clip._x;
			stonePiece._y =  stonePiece.myPossible_NextPosition_Row * _root.stone_height; //+ _root.field_Tetris_Clip._y;
			// IMPORTANT: Have the stone Number in the array
			
			_root.two_D_Field_Array_TEMP[  stonePiece.myPossible_NextPosition_Row ][  stonePiece.myPossible_NextPosition_Column ] = i;
			
			
		}// end for
		
		
		
		
		// set the values on the root to the original ones
		_root.stoneCenterHightLevel = _root.nextPossible_Center_Row;
		_root.stoneCenterColumn = _root.nextPossible_Center_Column;
		_root.currentStoneFormation = _root.nextPossibleRotation;
		
		
	
	}
	
	
	
	
	
	
	
	// ---------------------------------- last thing ---------------------- !!!!!
	// set for going out of borderlines   or hitting  stonetiles sideways!  (set back to false) 
	_root.rightOrLeftOrRotatedPushed = false;
	// ----------------------------------------------------------------------
	
	
	
		
	
	
	
	
}// end 


private var workingOrNot:Boolean; 



private function test_ToPutShapeWithinArray(columnAdjustment_P:Number,rowAdjustment_P:Number):Boolean{
	// put the shape witin the array (for testing) 
	// put the shape witin the array 
	/*
	var theColumnAdjustment =  columnAdjustment_P;
	
	if(theColumnAdjustment == 111){
		theColumnAdjustment = -1;
	}
	else if(theColumnAdjustment == 111){
		theColumnAdjustment = -1;
	}
	*/
	
	//_root.nextPossible_Center_Column   =  _root.nextPossible_Center_Column + theColumnAdjustment;//columnAdjustment_P;
	_root.nextPossible_Center_Column   =  _root.nextPossible_Center_Column + columnAdjustment_P;
	_root.nextPossible_Center_Row = _root.nextPossible_Center_Row - rowAdjustment_P;
	
	_root.newPositionIsWorking = true; // set it to true
	workingOrNot = true;
	
	var x_y_x_y_StonePointsArray = _root["tetrisStoneShape_" + _root.stoneWhoIsGoingDown_Number][_root.nextPossibleRotation].slice(",");
	
	
	// tileAmount is false variable name becouse it is double oft the tiles it is x and y position !!!!!!!!!!!!!!!!!!!!!!!!
	var tileAmount = x_y_x_y_StonePointsArray.length;
	
	
	
	
	var tileNumberCounter = 0;
	for(var i=0;i<tileAmount; i +=2){
		var nextPossibleRow =      x_y_x_y_StonePointsArray[i+1] +  _root.nextPossible_Center_Row; // y
		var nextPossibleColumn =   x_y_x_y_StonePointsArray[i] +  _root.nextPossible_Center_Column; // x
		if(_root.two_D_Field_Array_TEMP[  nextPossibleRow ][   nextPossibleColumn ] != 0){
			// the tile hits something // down // left right  (stone or border) --> through rotation or moving (all possible ways)
			_root.newPositionIsWorking = false;
			workingOrNot = false;
			//_root.nextPossible_Center_Column    = _root.nextPossible_Center_Column  - columnAdjustment_P; // befor - columnAd..// make the adjustments back in original 
			trace("--------------------------------");
			
			trace(_root.nextPossible_Center_Column+"  _root.nextPossible_Center_Column");
			trace("----------------------------------");
			
			//--  on which side is the hit
			if(nextPossibleColumn <= _root.stoneCenterColumn){
				_root.hitIsOnWhichSide = "left";
		
			}
			else{
				_root.hitIsOnWhichSide = "right";
			}
			//--
			
		
		}
	}// end for 
	
	if(workingOrNot == false){
		_root.nextPossible_Center_Column    = _root.nextPossible_Center_Column  - columnAdjustment_P; // before - columnAd..// make the adjustments back in original 
		_root.nextPossible_Center_Row = _root.nextPossible_Center_Row + rowAdjustment_P; // make the old values
	}
	
	
	//workingOrNot = _root.newPositionIsWorking;
	return workingOrNot;//_root.newPositionIsWorking;
}// end private function test_ToPutShapeWithinArray()







private function putShapeWithinArray(){
	
		
	// put the shape witin the array 
	
	_root.newPositionIsWorking = true; // set it to true
	var x_y_x_y_StonePointsArray = _root["tetrisStoneShape_" + _root.stoneWhoIsGoingDown_Number][_root.nextPossibleRotation].slice(",");
	
	
	// tileAmount is false variable name becouse it is double oft the tiles it is x and y position !!!!!!!!!!!!!!!!!!!!!!!!
	var tileAmount = x_y_x_y_StonePointsArray.length;
	
	
	
	
	var tileNumberCounter = 0;
	for(var i=0;i<tileAmount; i +=2){
		var nextPossibleRow =      x_y_x_y_StonePointsArray[i+1] +  _root.nextPossible_Center_Row; // y
		var nextPossibleColumn =   x_y_x_y_StonePointsArray[i] +  _root.nextPossible_Center_Column; // x
		if(_root.two_D_Field_Array_TEMP[  nextPossibleRow ][   nextPossibleColumn ] != 0){
			// the tile hits something // down // left right  (stone or border) --> through rotation or moving (all possible ways)
			_root.newPositionIsWorking = false;
		}
		
		
		
		
		// adjust the temp Array ------
		tileNumberCounter++;
		var firstTile = (_root.myNumber) - tileAmount/2;
				
		var currentTileNumber = firstTile + tileNumberCounter;
		_root.allTetrisShape["stone" + currentTileNumber].myPossible_NextPosition_Row = nextPossibleRow;
		_root.allTetrisShape["stone" + currentTileNumber].myPossible_NextPosition_Column = nextPossibleColumn;
		// ------
		
		
	}// end for 
	
	
		//_root.allTetrisShape.setMask(_root.maskClip);
	


}// end 














}// end class CheckAndSetNewShapePosition