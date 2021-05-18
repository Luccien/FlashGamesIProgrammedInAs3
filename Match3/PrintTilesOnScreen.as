import flash.display.BitmapData;

class PrintTilesOnScreen
	{
		
		private var mySendORDEREDarray_ReturnsRANDOMarray:SendORDEREDarray_ReturnsRANDOMarray;
		
		public var myCheckFor3OrMoreTilesNextToEachOther:CheckFor3OrMoreTilesNextToEachOther;
		public var arrayWithAllNumbersOnScreen:Array;
		
		
		
		private var splashClip:MovieClip;
		private var pictureClip:MovieClip;
		private var tile:MovieClip;
		private var imageBmp:BitmapData;
		private var depth:Number;
		private var myReturn_2_D_ArrayWithEntries:Return_2_D_ArrayWithEntries;
		
		
		
		
		// KONSTRUKTOR ///
		public function PrintTilesOnScreen(){
			
			mySendORDEREDarray_ReturnsRANDOMarray = new SendORDEREDarray_ReturnsRANDOMarray();
			myCheckFor3OrMoreTilesNextToEachOther = new CheckFor3OrMoreTilesNextToEachOther();
			myReturn_2_D_ArrayWithEntries = new Return_2_D_ArrayWithEntries();
			//arrayWithAllNumbersOnScreen = new Array();???
			arrayWithAllNumbersOnScreen = myReturn_2_D_ArrayWithEntries.return_2_D_Array(_root.howManyTiles_Vertical,_root.howManyTiles_Horizontal);
			//trace(" ok    " + arrayWithAllNumbersOnScreen);
		}
		// KONSTRUKTOR //
		
		
		
		//myPrintTilesOnScreen.setTheTilesOnScreenFromAbove(randomGridPairArray);
		
		
		// this function runs with building a new level and not with setting a new single tile
		public function setTheTilesOnScreen(randomGridPairArray:Array){
		_root.tileCounter = 0;
		for(var i=0; i<_root.howManyTiles_Vertical; i++) {
 			for(var j=0; j<_root.howManyTiles_Horizontal; j++) {
				
				//tileNumber++;
				//_root.tileCounter++;
				placeSingleTileOnScreen(randomGridPairArray,i,j);
				
				
				
				
			}// end for 1
		}// end for 2
		
		prepareRandomArraysForDifferentSpecialTileTypes();
		
		//trace(" ok    " + arrayWithAllNumbersOnScreen);
		//trace(counter +"     all tiles")
	}// end
		
		
		
		
	//deleteFoundTiles()	
		
	
	
	
	
	private function prepareRandomArraysForDifferentSpecialTileTypes(){
		
		
		var allPossibleTiles_Array_STRAIGHT = new Array();
		//_root.howManyDifferentTileTypes = 15;
		
		for(var i=1;i<_root.tileCounter+1;i++){
			allPossibleTiles_Array_STRAIGHT.push(i);
		}
		trace(allPossibleTiles_Array_STRAIGHT + "    2222straight");
		
			
		_root.allPossibleTiles_Array_RANDOM = new Array();
		_root.allPossibleTiles_Array_RANDOM = mySendORDEREDarray_ReturnsRANDOMarray.returnMeRandomArray(allPossibleTiles_Array_STRAIGHT);
		trace(_root.allPossibleTiles_Array_RANDOM +  "     222mixxxxed");
		
		
		setTilesOnSpecialFrame();
	}// end prepareRandomArraysForDifferentSpecialTileTypes()
	
	
	
	
	private function setTilesOnSpecialFrame(){
		trace("opppss");
		for(var i=0; i<_root.pSpecial_Amount_1+1; i++) {
				
				var theTileNumber = _root.allPossibleTiles_Array_RANDOM[i];
				trace(theTileNumber + " gggo   " + _root.clipForAllTilesOnScreen["tileClip"+ theTileNumber].picClip);
				_root.clipForAllTilesOnScreen["tileClip"+ theTileNumber].picClip.p.gotoAndStop(2);
				var tile = _root.clipForAllTilesOnScreen["tileClip"+ theTileNumber]
				
				tile.myTyp = 1;
				tile.myHowManyTimesToSolve = 2;
				
		}// end for 1
	}// end  setTilesOnSpecialFrame()
	
	
	
	
	
	
	
	
	
	
		
	public function placeSingleTileOnScreen(randomGridPairArray:Array,i:Number,j:Number){
		
		
		
		if(randomGridPairArray[i][j] != 0){
				_root.tileCounter++;
				trace(_root.tileCounter);
				
				
				depth = _root.clipForAllTilesOnScreen.getNextHighestDepth();
				if(depth == 0){
					depth = 1;
					
				}
				//depth = 1;
				
				
				// OLD OLD with bitmap// imageBmp = BitmapData.loadBitmap( "p" + randomGridPairArray[i][j]);
				
				
				tile = _root.clipForAllTilesOnScreen.createEmptyMovieClip("tileClip"+_root.tileCounter,  depth );//_root.allTilesArray[arrayIndex]); 
				// make picturclip within tile clip
				pictureClip = tile.createEmptyMovieClip("picClip",1);
				
				//  OLD !!!!! pictureClip.attachMovie("p" + randomGridPairArray[i][j],"p" + randomGridPairArray[i][j],1);
				pictureClip.attachMovie("p" + randomGridPairArray[i][j],"p",1);
				// OLD OLD with bitmap// pictureClip.attachBitmap(imageBmp, 1);
				trace(pictureClip.p + "   ooopq");
				
				
				
				splashClip = tile.attachMovie("splashClip","splashClip",2);
				
				
				
				// ------------------------ here !!!
				tile._y = -j*_root.pictureWidth; // tile._x = _root.startX + j*_root.pictureWidth;  /// xxx
				tile._x = -i*_root.pictureHight;
				
				//tile._y = _root.startX - j*_root.pictureWidth; // tile._x = _root.startX + j*_root.pictureWidth;  /// xxx
				//tile._x = _root.startY - i*_root.pictureHight; // tile._y = _root.startY + i*_root.pictureHight;  /// yyy
				// -------------------------- here !!!
				
				tile.accelerator2 = _root.acceleratorStart;
				tile.accelerator = _root.acceleratorStart;
				tile.checked = false;
				tile.myNumber = _root.tileCounter;
				tile.myTyp = randomGridPairArray[i][j];
				tile.myRow = i;
				tile.myColumn = j;
				tile.myHowManyTimesToSolve = 1;
				
				arrayWithAllNumbersOnScreen[i][j] = _root.tileCounter;
				
				//----
				//array with the tilenumbers
				
				//---
				
				
				//-------------
				tile.refereceToPrintTilesOnScreen = this;
				
				tile.onRelease = function(){
					this.refereceToPrintTilesOnScreen.myCheckFor3OrMoreTilesNextToEachOther.checkForPairs(this);
				}
				//tile._y = 0;
				//tile.onEnterFrame = lookAt;
				//tile.myself = tile;
				//trace(tile._x + "      tile._y ");
				//-----------
		}// end if(randomGridPairArray[i][j] != 0){
	}// end placeSingleTileOnScreen()
		
	//public var myself:MovieClip;
	
	
	/*
	public function lookAt(){
		trace(this.myself._x + "   " + this.myself._y);
		
	}// end 
	*/	
		
		
	//////////////////////////////////////////////////////////////////////////
	////////////////////////   MOVE TILES WITHOUT DRIFTING TILES //////////////////////
	
	// for tiles who are on screen already
	public function moveTheTilesOnScreenWithoutDrifting(randomGridPairArray:Array){
		
		//trace(arrayWithAllNumbersOnScreen + "    arrayWithAllNumbersOnScreen");
		
		
		
		for(var i=0; i<_root.howManyTiles_Vertical; i++) {
 			for(var j=0; j<_root.howManyTiles_Horizontal; j++) {
				
				var tileID = arrayWithAllNumbersOnScreen[i][j];
				//trace(tileID + "    tileID");
				if(tileID != 0){
					tile = _root.clipForAllTilesOnScreen["tileClip" + tileID  ];
					// target positions :
					tile.myRow = i;
					tile.myColumn = j;
					
					//trace(tile.myRow + "   row   " + i);
					//trace(tile.myColumn + "   column   " + j);
					
					
					tile._y = -j*_root.pictureWidth;  // x ?????????
					tile._x = -i*_root.pictureHight;
					
					//tile._y = _root.startX - j*_root.pictureWidth;  // x ?????????
					//tile._x = _root.startY - i*_root.pictureHight;  // y ???????
					
					
					//trace(tile + "    " +tile._x + "   xy    "+tile._y);
				}
				
				//tile = _root.clipForAllTilesOnScreen["tileClip" + randomGridPairArray[i][j]  ];
				
			}
		}
		
		
		
	}// end 
		
		
		
		
		
		
	///////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////
		
		
		
		
		
	public var waitClip:MovieClip;
	public var waitTimer:Number; 
	public var mySelf:MovieClip;
		
	// for tiles who are on screen already
	public function moveTheTilesOnScreen(randomGridPairArray:Array){
		
		trace(arrayWithAllNumbersOnScreen + "    arrayWithAllNumbersOnScreen");
		
		
		
		for(var i=0; i<_root.howManyTiles_Vertical; i++) {
 			for(var j=0; j<_root.howManyTiles_Horizontal; j++) {
				
				var tileID = arrayWithAllNumbersOnScreen[i][j];
				//trace(tileID + "    tileID");
				if(tileID != 0){
					tile = _root.clipForAllTilesOnScreen["tileClip" + tileID  ];
					// target positions :
					tile.myRow = i;
					tile.myColumn = j;
					
					//trace(tile.myRow + "   row   " + i);
					//trace(tile.myColumn + "   column   " + j);
					
					
					//---------- new
					if(tile.accelerator == undefined){
						tile.accelerator = _root.acceleratorStart;
					}
					if(tile.accelerator2 == undefined){
						tile.accelerator2 = _root.acceleratorStart;
					}
					//------------ new
					
					//tile._y = _root.startX - j*_root.pictureWidth;  // x ?????????
					//tile._x = _root.startY - i*_root.pictureHight;  // y ???????
					
					tile.targetY = -j*_root.pictureWidth;
					tile.targetX = -i*_root.pictureHight;
					//tile.targetY = _root.startX - j*_root.pictureWidth;
					//tile.targetX = _root.startY - i*_root.pictureHight;
					
					//var nextDepth = _root.getNextHighestDepth;
					
					//waitClip = _root.createEmptyMovieClip("waitClip",1);//+nextDepth,nextDepth);
					
					_root.waitClip.mySelf = _root.waitClip;
					_root.waitClip.waitTimer = _root.waitOnHitTiles;
					
					//if(_root.waitClip.onEnterFrame == false){
					_root.waitClip.onEnterFrame = wait;
					//}
					/*
					waitClip = _root.createEmptyMovieClip("waitClip",1);//+nextDepth,nextDepth);
					waitClip.waitTimer = _root.waitOnHitTiles;
					waitClip.mySelf = waitClip;
					waitClip.onEnterFrame = wait;
					*/
					//trace(tile + "    " +tile._x + "   xy    "+tile._y);
				}
				
				//tile = _root.clipForAllTilesOnScreen["tileClip" + randomGridPairArray[i][j]  ];
				
			}
		}
		
		
		
	}// end 
		
		
	public function wait(){
		//_root.waiting = true;
		
		trace("waiting");
		this.waitTimer--;
		if(this.waitTimer < 0){
			trace("wait Is Over");
			
			_root.myCreateAllRandomTiles.myPrintTilesOnScreen.startMovingTiles();
			delete this.mySelf.onEnterFrame;
						
		}
		
	}// end public function wait()
	
	
	
	
	
	
	
	
	
	
	
	public function startMovingTiles(){
		
		trace("jupi");
		for(var i=0; i<_root.howManyTiles_Vertical; i++) {
 			for(var j=0; j<_root.howManyTiles_Horizontal; j++) {
				
				var tileID = arrayWithAllNumbersOnScreen[i][j];
				//trace(tileID + "    tileID");
				if(tileID != 0){
					tile = _root.clipForAllTilesOnScreen["tileClip" + tileID  ];
					// target positions :
					tile.myRow = i;
					tile.myColumn = j;
					
					//trace(tile.myRow + "   row   " + i);
					//trace(tile.myColumn + "   column   " + j);
					
					//tile._y = _root.startX - j*_root.pictureWidth;  // x ?????????
					//tile._x = _root.startY - i*_root.pictureHight;  // y ???????
					//tile.targetY = _root.startX - j*_root.pictureWidth;
					//tile.targetX = _root.startY - i*_root.pictureHight;
					tile.targetY = -j*_root.pictureWidth;
					tile.targetX = -i*_root.pictureHight;
					
					
					
					/*if(tile.accelerator != _root.acceleratorStart){
						//_root.accelerator +=_root.accelleratorAdd;
					}
					else{
						tile.accelerator = _root.acceleratorStart;
					}*/
					
					var tileDiv = tile.targetY - tile._y;
					if(tileDiv < 0){
						tile.tileDirectionUpDown = "up";
					}
					else{
						tile.tileDirectionUpDown = "down";
					}
					
					var tileDiv = tile.targetX - tile._x;
					if(tileDiv < 0){
						tile.tileDirectionLeftRight = "left";
					}
					else{
						tile.tileDirectionLeftRight  = "right";
					}
					
					
					tile.mySelf = tile;
					tile.onEnterFrame = _root.myCreateAllRandomTiles.myPrintTilesOnScreen.movingOneTileDown;
					
					
					
										
				}
				
				//tile = _root.clipForAllTilesOnScreen["tileClip" + randomGridPairArray[i][j]  ];
				
			}// for 2
		}// for 1
				
		
		
	}// end startMovingTiles
	
	
	
	
	public function movingOneTileDown(){
		//_root.waiting = true;
		this.mySelf.ready1 = false;
		this.mySelf.ready2 = false;
		trace("jjjjj");
		//trace(this.mySelf);
		//this.mySelf._x = this.mySelf.targetX;
		//this.mySelf._y = this.mySelf.targetY;
			
		if(this.mySelf.tileDirectionUpDown == "down"){
			this.mySelf._y += this.mySelf.accelerator;
			this.mySelf.accelerator +=_root.accelleratorAdd; 
		
		
			if(this.mySelf._y > this.mySelf.targetY){
				this.mySelf._y = this.mySelf.targetY;
				this.mySelf.accelerator = _root.acceleratorStart;
				this.mySelf.ready1 = true;
				//delete this.mySelf.onEnterFrame;
			}
		}
		
		else if(this.mySelf.tileDirectionUpDown == "up"){
			this.mySelf._y -= this.mySelf.accelerator;
			this.mySelf.accelerator +=_root.accelleratorAdd; 
		
		
			if(this.mySelf._y < this.mySelf.targetY){
				this.mySelf._y = this.mySelf.targetY;
				this.mySelf.accelerator = _root.acceleratorStart;
				this.mySelf.ready1 = true;
				//delete this.mySelf.onEnterFrame;
				
			}
		}
		
		trace(this.mySelf.tileDirectionLeftRight );
		////////////////////////////////
		if(this.mySelf.tileDirectionLeftRight  == "right"){
			this.mySelf._x += this.mySelf.accelerator2;
			this.mySelf.accelerator2 +=_root.accelleratorAdd; 
		
		
			if(this.mySelf._x > this.mySelf.targetX){
				this.mySelf._x = this.mySelf.targetX;
				this.mySelf.accelerator2 = _root.acceleratorStart;
				this.mySelf.ready2 = true;
				//delete this.mySelf.onEnterFrame;
			}
		}
		else if(this.mySelf.tileDirectionLeftRight  == "left"){
			this.mySelf._x -= this.mySelf.accelerator2;
			this.mySelf.accelerator2 +=_root.accelleratorAdd; 
		
		
			if(this.mySelf._x < this.mySelf.targetX){
				this.mySelf._x = this.mySelf.targetX;
				this.mySelf.accelerator2 = _root.acceleratorStart;
				this.mySelf.ready2 = true;
				//delete this.mySelf.onEnterFrame;
			}
		}
		
		
		if(this.mySelf.ready1 == true & this.mySelf.ready2 == true){
			//_root.waiting = false;
			delete this.mySelf.onEnterFrame;
		}
		
		
		
		
		
		
		
		//tile._y = _root.startX - j*_root.pictureWidth;  // x ?????????
					//tile._x = _root.startY - i*_root.pictureHight;  // y ???????
					//tile.targetY = _root.startX - j*_root.pictureWidth;
					//tile.targetX = _root.startY - i*_root.pictureHight;
		
		/*
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
					
					
					
					*/
					
					////////////////////////////////////////////////////
		
		
	}// end public function movingOneTileDown()
	
	
	
	
	
	
	
		
		
		
		
	}// end class