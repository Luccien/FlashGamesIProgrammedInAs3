class CreateTetrisShapeOutOf_4_Pieces extends MovieClip{

	
	
	private var randomStoneTyp:Number;
	private var randomStoneColour:Number;
	private var stonePreviewBackGround:MovieClip;
	private var stonePiece:MovieClip;
		
	
	
	
	
	
	public function CreateTetrisShapeOutOf_4_Pieces(){
	
	   
		//_root.stoneCenterColumn = 0;
		_root.stoneCenterHightLevel = _root.nextPossible_Center_Row__START;// 0;
		//_root.stoneCenterColumn = _root.nextPossible_Center_Row__START; // ??? 
		
		
		stonePreviewBackGround = _root.attachMovie("stonePreviewBackGround","stonePreviewBackGround",_root.getNextHighestDepth());
		stonePreviewBackGround._x = _root.previewX; 
		stonePreviewBackGround._y = _root.previewY;
		
		// ---------------------------------------
		
		_root.attachMovie("allTetrisShape", "allTetrisShape", _root.getNextHighestDepth()  );
		
		_root.allTetrisShape._x = _root.field_Tetris_Clip._x;
		_root.allTetrisShape._y = _root.field_Tetris_Clip._y -  (_root.invisibleHeight * _root.stone_height);
				
		
		var maskClip = _root.attachMovie("mask", "maskClip", _root.getNextHighestDepth()  );
		maskClip._width =  _root.stone_lenght * _root.columnAmount +40;
		maskClip._height = (_root.stone_height - _root.invisibleHeight) * _root.rowAmount + 15; // + 15 adjusted because it did not work right
		maskClip._x = _root.field_Tetris_Clip._x-5; //- 5 adjusted because it did not work right
		maskClip._y = _root.field_Tetris_Clip._y-5; //- 5 adjusted because it did not work right
		
		
			
		_root.allTetrisShape.setMask(_root.maskClip);
		
		//_root.mask
		
		// --------------------------------------
		
		
		
		
		
		// counter for the shapes
		_root.currentStoneShape = 0;
				
		//-----------
		// ---------- Stick Shape ---------
		_root.tetrisStoneShape_1 = new Array(); // adjust with number 1.2.3.4...
		
		
		// clockwise the 4 formationa for rotating
		// on 2,2  x,y  center point   
		//_root.formation_x_y_x_y___1 = [2,0,   2,1,  2,2,  2,3];
		_root.formation_x_y_x_y___1 = [0,0,  1,0,  2,0,  3,0];
		_root.formation_x_y_x_y___2 = [2,-2,   2,-1,  2,0,  2,1];
		_root.formation_x_y_x_y___3 = [1,0,  2,0,  3,0,  4,0];  
		_root.formation_x_y_x_y___4 = [2,-1,  2,0,  2,1,  2,2];
		
		/*
		_root.formation_x_y_x_y___1 = [0,2,  1,2,  2,2,  3,2];
		_root.formation_x_y_x_y___2 = [2,0,   2,1,  2,2,  2,3];
		_root.formation_x_y_x_y___3 = [1,2,  2,2,  3,2,  4,2];  
		_root.formation_x_y_x_y___4 = [2,1,  2,2,  2,3,  2,4];
		*/
		
		
		_root.howManyFormation = 4;	// adjust to the number of formations
		
		// make an 2-D Array with every formation in it 
		_root.currentStoneShape++;
		for(var i=1;i<_root.howManyFormation+1;i++){
			_root["tetrisStoneShape_" + _root.currentStoneShape].push(_root["formation_x_y_x_y___"+i]);
		}
		//-----------
		
		
		
		
		
		//-----------
		
		//--- E similar shape : 
		_root.tetrisStoneShape_2 = new Array(); // adjust with number 1.2.3.4...
		
		// clockwise the 4 formationa for rotating
		// on 1,1  x,y  center point 
		
		_root.formation_x_y_x_y___1 = [1,0,  0,0,  2,0,  1,1];
		_root.formation_x_y_x_y___2 = [1,0,  0,0,  1,1,  1,-1];
		_root.formation_x_y_x_y___3 = [1,0,   0,0,  2,0,  1,-1];
		_root.formation_x_y_x_y___4 = [1,0,  2,0,  1,-1,  1,1];  
		
		/*
		_root.formation_x_y_x_y___1 = [1,1,  0,1,  2,1,  1,2];
		_root.formation_x_y_x_y___2 = [1,1,  0,1,  1,2,  1,0];
		_root.formation_x_y_x_y___3 = [1,1,   0,1,  2,1,  1,0];
		_root.formation_x_y_x_y___4 = [1,1,  2,1,  1,0,  1,2]; 
		*/
		
		_root.howManyFormation = 4;	// adjust to the number of formations
		
		// make an 2-D Array with every formation in it 
		_root.currentStoneShape++;
		for(var i=1;i<_root.howManyFormation+1;i++){
			_root["tetrisStoneShape_" + _root.currentStoneShape].push(_root["formation_x_y_x_y___"+i]);
		}
		//-----------
		
		
		//-----------
		
		//--- L similar shape (1) : 
		_root.tetrisStoneShape_3 = new Array(); // adjust with number 1.2.3.4...
		
		// clockwise the 4 formationa for rotating
		// on 1,1  x,y  center point 
		
		_root.formation_x_y_x_y___1 = [1,0,  0,0,  2,0,  0,1]; 
		_root.formation_x_y_x_y___2 = [1,0,  1,-1,  1,1,  0,-1];
		_root.formation_x_y_x_y___3 = [1,0,  0,0,  2,0,  2,-1];
		_root.formation_x_y_x_y___4 = [1,0,  1,-1,  1,1,  2,1];
		
		
		
		_root.howManyFormation = 4;	// adjust to the number of formations
		
		// make an 2-D Array with every formation in it 
		_root.currentStoneShape++;
		for(var i=1;i<_root.howManyFormation+1;i++){
			_root["tetrisStoneShape_" + _root.currentStoneShape].push(_root["formation_x_y_x_y___"+i]);
		}
		//-----------
		
		
		
		
		//--- L similar shape (2) : 
		_root.tetrisStoneShape_4 = new Array(); // adjust with number 1.2.3.4...
		
		// clockwise the 4 formationa for rotating
		// on 1,1  x,y  center point 
		
		_root.formation_x_y_x_y___1 = [1,0,  0,0,  2,0,  2,1];
		_root.formation_x_y_x_y___2 = [1,0,  1,-1,  1,1,  0,1];
		_root.formation_x_y_x_y___3 = [1,0,  0,0,  2,0,  0,-1];  
		_root.formation_x_y_x_y___4 = [1,0,  1,-1,  1,1,  2,-1];
		
		
		
		
		_root.howManyFormation = 4;	// adjust to the number of formations
		
		// make an 2-D Array with every formation in it 
		_root.currentStoneShape++;
		for(var i=1;i<_root.howManyFormation+1;i++){
			_root["tetrisStoneShape_" + _root.currentStoneShape].push(_root["formation_x_y_x_y___"+i]);
		}
		//-----------
		
		
		
		
		
		//--- Z similar shape (1) : 
		_root.tetrisStoneShape_5 = new Array(); // adjust with number 1.2.3.4...
		
		// clockwise the 4 formationa for rotating
		// on 1,1  x,y  center point 
		_root.formation_x_y_x_y___1 = [1,0,  0,0,  1,1,  2,1];
		_root.formation_x_y_x_y___2 = [1,0,  1,-1,  0,0,  0,1];  
		_root.formation_x_y_x_y___3 = [1,0,  2,0,  1,-1,  0,-1];
		_root.formation_x_y_x_y___4 = [1,0,  2,0,  1,1,  2,-1];
		
		_root.howManyFormation = 4;	// adjust to the number of formations
		
		// make an 2-D Array with every formation in it 
		_root.currentStoneShape++;
		for(var i=1;i<_root.howManyFormation+1;i++){
			_root["tetrisStoneShape_" + _root.currentStoneShape].push(_root["formation_x_y_x_y___"+i]);
		}
		//-----------
		
		
		//--- Z similar shape (2) : 
		_root.tetrisStoneShape_6 = new Array(); // adjust with number 1.2.3.4...
		
		// clockwise the 4 formationa for rotating
		// on 1,1  x,y  center point 
		_root.formation_x_y_x_y___1 = [1,0,  2,0,  1,1,  0,1];
		_root.formation_x_y_x_y___2 = [1,0,  0,0,  1,1,  0,-1];  
		_root.formation_x_y_x_y___3 = [1,0,  0,0,  1,-1,  2,-1];
		_root.formation_x_y_x_y___4 = [1,0,  1,-1,  2,0,  2,1];
		
		_root.howManyFormation = 4;	// adjust to the number of formations
		
		// make an 2-D Array with every formation in it 
		_root.currentStoneShape++;
		for(var i=1;i<_root.howManyFormation+1;i++){
			_root["tetrisStoneShape_" + _root.currentStoneShape].push(_root["formation_x_y_x_y___"+i]);
		}
		//-----------
		
		
		
		//--- CUBE similar shape : 
		_root.tetrisStoneShape_7 = new Array(); // adjust with number 1.2.3.4...
		
		// clockwise the 4 formationa for rotating
		// on 1,1  x,y  center point 
		_root.formation_x_y_x_y___1 = [1,0,  1,1,  2,0,  2,1];
		_root.formation_x_y_x_y___2 = [1,0,  1,1,  2,0,  2,1];  
		_root.formation_x_y_x_y___3 = [1,0,  1,1,  2,0,  2,1];
		_root.formation_x_y_x_y___4 = [1,0,  1,1,  2,0,  2,1];
		
		/*
		_root.formation_x_y_x_y___1 = [0,0,  0,1,  1,0,  1,1];
		_root.formation_x_y_x_y___2 = [0,0,  0,1,  1,0,  1,1];  
		_root.formation_x_y_x_y___3 = [0,0,  0,1,  1,0,  1,1];
		_root.formation_x_y_x_y___4 = [0,0,  0,1,  1,0,  1,1];
		*/
		
		_root.howManyFormation = 4;	// adjust to the number of formations
		
		// make an 2-D Array with every formation in it 
		_root.currentStoneShape++;
		for(var i=1;i<_root.howManyFormation+1;i++){
			_root["tetrisStoneShape_" + _root.currentStoneShape].push(_root["formation_x_y_x_y___"+i]);
		}
		//-----------
		
		
		
		
		
		
	}// Constructor
	
	
		
		
		
		
		
	
	public function createRandomTetrisStone(){
		
		//_root.currentStoneFormation = 1; // to have the bar and L turned sideways
		
		
		// the first call
		if(!_root.previewStone_Number){
			_root.shapeFromArrayINDEX = 1;
			// the first stone
			_root.stoneWhoIsGoingDown_Number = Number(_root.theNextTetrisShapeNumber_array_RANDOM[0]);//Math.round(Math.random()*6) +1;
			_root.stoneWhoIsGoingDown_Colour = Number(_root.theNextTetrisShapeNumber_array_RANDOM[0]);//_root.stoneWhoIsGoingDown_Number;
			// the first preview
			_root.previewStone_Number = 1;//Number(_root.theNextTetrisShapeNumber_array_RANDOM[1]);//Math.round(Math.random()*6) +1;
			_root.previewStone_Colour =  1;//Number(_root.theNextTetrisShapeNumber_array_RANDOM[1]);//_root.previewStone_Number;
		}
		
		// all calls after the first call
		else{
			_root.shapeFromArrayINDEX++;
			if( !  Number( _root.theNextTetrisShapeNumber_array_RANDOM[_root.shapeFromArrayINDEX + 1]  )   ){
				_root.myProduceNotTotallyRandomArray_ForFollowingTetrisShapes.produceNewArrayIfAllNumbersAreUsed();
				
				
				_root.shapeFromArrayINDEX = 0;
			}
			
			
			// make the preview the next stone
			_root.stoneWhoIsGoingDown_Number = _root.previewStone_Number;//Math.round(Math.random()*6) +1;
			_root.stoneWhoIsGoingDown_Colour = _root.previewStone_Number;//_root.stoneWhoIsGoingDown_Number;
		
			// make a new preview shape/ stone
			_root.previewStone_Number =   Number(_root.theNextTetrisShapeNumber_array_RANDOM[_root.shapeFromArrayINDEX + 1]); //Math.round(Math.random()*6) +1;
			_root.previewStone_Colour =  _root.previewStone_Number;
		
		}
		
		//_root.previewStone_Number = 2;//Math.round (Math.random () * 6);
		//_root.previewStone_Colour = 1;//Math.round (Math.random () * 6);
		
		
		
		setRandomStoneToPreview();
		setRandomStoneToStart();
		
		
	}// end createRandomTetrisStone()
	
	
	
	
	
	
	
	
	
	private function setRandomStoneToPreview(){
		
		_root.stonePreviewBackGround.removeMovieClip();
		var previewClip = _root.attachMovie("stonePreviewBackGround","stonePreviewBackGround",10); // attention nextHighestDepth
		previewClip._x = _root.previewX;
		previewClip._y = _root.previewY;
		var x_y_x_y_StonePointsArray = _root["tetrisStoneShape_" + _root.previewStone_Number][0].slice(",");
		
		
		
		for (var i = 0; i < x_y_x_y_StonePointsArray.length; i = i+2)
		{
			var myNumber = _root.stonePreviewBackGround.getNextHighestDepth();
			stonePiece = _root.stonePreviewBackGround.attachMovie("stones","stone"+myNumber ,myNumber );
			stonePiece.gotoAndStop(_root.previewStone_Colour+1);
			
			// get the first shape 
			var column = x_y_x_y_StonePointsArray[i];
			var row = x_y_x_y_StonePointsArray[i+1];
			
			
			trace(_root.previewStone_Colour +  "           _root.previewStone_Colour"  );
			stonePiece._x =  column * _root.stone_lenght + _root.stoneInPreviewX  +    Number(_root.previewPositions_X[_root.previewStone_Colour -1]);
			stonePiece._y =  row * _root.stone_height + _root.stoneInPreviewY     +    Number(_root.previewPositions_Y[_root.previewStone_Colour -1]);
			
			
			
			
			
		}// end for
		
				
	}// end private function setRandomStoneToPreview(){
	
	
	
	
	
	
	
	//_root.stoneCenterHightLevel = _root.nextPossible_Center_Row__START;
	private function setRandomStoneToStart(){
		
		_root.stoneCenterColumn = _root.stoneColumnStartPosition;  
		//_root.nextPossible_Center_Row = _root.nextPossible_Center_Row__START;
		
		_root.currentStoneFormation = 0;
		
		var x_y_x_y_StonePointsArray = _root["tetrisStoneShape_" + _root.stoneWhoIsGoingDown_Number][_root.currentStoneFormation].slice(",");
		_root.allStoneNumbersForTheShapeGoingDown = new Array();
		
		
		
		// to set to true if it hits another shape
		var hitsAnotherShape = false;
		
		for (var i = 0; i < x_y_x_y_StonePointsArray.length; i = i+2)
		{
			var myNumber = _root.myNumber = _root.allTetrisShape.getNextHighestDepth();
			if(myNumber == 0){
				trace("depth 0");
				myNumber = 1;
			}
			
			//trace(myNumber + "   my Number");
			//_root.gameOverClip.swapDepths(_root.getNextHighestDepth()); // import to leave it swapDepths to have the 0 position out
			stonePiece = _root.allTetrisShape.attachMovie("stones","stone"+myNumber ,myNumber );
			trace(stonePiece);
			
			stonePiece.gotoAndStop(_root.stoneWhoIsGoingDown_Colour+1);
			
			// get the first shape 
			var column = x_y_x_y_StonePointsArray[i] + _root.stoneCenterColumn;
			var row = x_y_x_y_StonePointsArray[i+1] + _root.stoneCenterHightLevel;
			
			stonePiece._x =  column * _root.stone_lenght; //+ _root.field_Tetris_Clip._x;
			stonePiece._y =  row * _root.stone_height; //+ _root.field_Tetris_Clip._y;
			
			//trace(myNumber);
			
			_root.allStoneNumbersForTheShapeGoingDown.push(myNumber);
			
			if(_root.two_D_Field_Array[row][column] != 0){
				hitsAnotherShape = true;
				trace(_root.two_D_Field_Array + "    startArray ääääääääääääääääää");
			}
		
	}
	//trace(_root.allStoneNumbersForTheShapeGoingDown + "  hhh");
	
	
	
			if(hitsAnotherShape == true){ //== 0 before  // if the shape hits something and is on the first position // the game is over
				
				
				trace("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
				
				_root.gameOverClip._visible = true;
				_root.gameOverClip.swapDepths(_root.getNextHighestDepth() );
				_root.gameOverClip.gotoAndPlay(2);
				//------------------
				_root.nextPossible_Center_Row = _root.nextPossible_Center_Row__START;
				_root.nextPossible_Center_Column =_root.stoneColumnStartPosition;
				_root.nextPossibleRotation = 0;
				_root.stoneCenterHightLevel = _root.nextPossible_Center_Row__START;//0; // ???
				_root.stoneCenterColumn = _root.stoneColumnStartPosition; // ??? 
				_root.currentStoneFormation = 0; // ???
			
			
				//_root.myCreateTetrisShapeOutOf_4_Pieces.createRandomTetrisStone();
				
				
				
				//------------------
				
				
				_root.keyBoardControllOnOff = false; 
				
				
				/*
				_root.gameOverClip._visible = true;
				
				//**
				_root.gameWonClip._visible = true;
				_root.gameWonClip.play();
				_root.gameWonClip.swapDepths(_root.getNextHighestDepth() );
				//**
				
				_root.gameOverClip.swapDepths(_root.getNextHighestDepth() );
				
				
				
				//------------------
				_root.nextPossible_Center_Row = _root.nextPossible_Center_Row__START;
				_root.nextPossible_Center_Column =_root.stoneColumnStartPosition;
				_root.nextPossibleRotation = 0;
				_root.stoneCenterHightLevel = _root.nextPossible_Center_Row__START;//0; // ???
				_root.stoneCenterColumn = _root.stoneColumnStartPosition; // ??? 
				_root.currentStoneFormation = 0; // ???
			
			
				//_root.myCreateTetrisShapeOutOf_4_Pieces.createRandomTetrisStone();
				
				
				
				//------------------
				
				
				_root.keyBoardControllOnOff = false; 
				*/
			}
	
	
	
	
	
	}// end private function setRandomStoneToStart(){
	
	
	
	
	
	
	
	
	
	
	
	
}// end createTetrisStoneOutOf4pieces()