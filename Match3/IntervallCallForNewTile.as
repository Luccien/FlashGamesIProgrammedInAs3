import flash.display.BitmapData;



class IntervallCallForNewTile
	{	
	
	
	//private var splashClip:MovieClip;
	//private var pictureClip:MovieClip;
	//private var tile:MovieClip;
	private var imageBmp:BitmapData;
	//private var depth:Number;
	
	
	
	// Konstruktor
	public function IntervallCallForNewTile(){
		placeTheTilePreviewContainer();
	
	}// end 
	// Konstruktor
	
	
	private function placeTheTilePreviewContainer(){
		for(var i=0;i<_root.howManyTiles_Vertical;i++){
			_root.tileCounter++;
			// old var depth = _root.getNextHighestDepth();
			//var container = _root.createEmptyMovieClip("preview_container"+i,depth);
			// old var container = _root.createEmptyMovieClip("preview_container"+i,depth);
			var container = _root.createEmptyMovieClip("preview_container"+i,_root.tileCounter);
			//container.createEmptyMovieClip("preview_Clip",1);
			container.attachMovie("frame","frame",2);
			container._x = _root.previewX;
			container._y = _root.previewY;
			container._x += (_root.pictureHight + _root.previewFrameExtraPixel) * i;
		}
	}// end private function placeTheTilePreviewContainer()
	
	
	public function checkForRandomNewTile(){
		trace("new tile");
		
	// functiontobe calles by intervall 
	// 1) look how many rows there are for the 
	//var howManyTilesForOneRow = _root.howManyTiles_Vertical;
	// 2) look how many rows there are already in the array
	//var howManyTilesAlready = _root.newTilesArray.length;
	// 3) if row is full and there are no more tiles dropping put row underneath the other rows
	
	if(_root.newTilesArray.length < _root.howManyTiles_Vertical){
		var randomTileTyp =    Math.round(Math.random()*_root.differentTileAmount) + 1;
		
		//  OLD FOR RANDOM PICTURES // var randomTileTyp =    _root.alleRandomTileTypes_Array_RANDOM[(Math.round(Math.random()*_root.differentTileAmount) + 1)];
		_root.newTilesArray.push(randomTileTyp);
		// place the tile on preview screen
		// OLD OLD with bitmap// imageBmp = BitmapData.loadBitmap( "p" + randomTileTyp);
		var container = _root["preview_container"+ (_root.newTilesArray.length -1)];
		container.createEmptyMovieClip("preview_Clip",1);
		
		
		
	
		
		container.preview_Clip.attachMovie("p" + randomTileTyp,"p" + randomTileTyp,1);
		
		//container.preview_Clip.attachBitmap(imageBmp, 1);
		
		
	}// if 
	else{
		//_root.onEnterFrame = waitOnPlacingThePictures;  !!!!!
		
		//_root.intervalId = setInterval(_root.myIntervallCallForNewTile, "checkForRandomNewTile", 800);
		
		clearInterval(_root.intervalId); // stop intervall
		_root.waitOnNewRowClip.onEnterFrame = _root.myIntervallCallForNewTile.waitOnNewRow; // wait for dropping tiles
		
		
		
		
		
		//if(_root.waitClip.onEnterFrame == false & tilesFalling == false)
		
		//place The complete Tile row underneath
		
		// ---------------------------
		//delete the pictures
		/*
		for(var i=0;i<_root.howManyTiles_Vertical;i++){
			var clip = _root["preview_container"+i].preview_Clip;
			trace(clip+ " delete Clip");
			clip.removeMovieClip();
			
		}
		_root.myPlaceNewRow.placeTheAlreadyGenerateddRow();
		_root.newTilesArray = new Array();
		//-------------------------
		*/
	} // else 
	
	
	
	}// end checkForRandomNewTile()
	
	
	
	
	public function waitOnNewRow(){
		trace("waitttttttttttttttttttt  " + _root.waitClip.onEnterFrame);
		var tilesFalling = true;
		
		if(!_root.waitClip.onEnterFrame){
			tilesFalling = false;
			
			// try out if one tile is with an onEnterFrame
			for(var i=0; i<_root.howManyTiles_Vertical; i++) {
 			for(var j=0; j<_root.howManyTiles_Horizontal; j++) {
				
				var tileID = _root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[i][j];
				//trace(tileID + "    tileID");
				if(tileID != 0){
					
					var tile = _root.clipForAllTilesOnScreen["tileClip" + tileID  ];
					trace(tile + "           tile     tile  tile     lllllllllllllllll");
					if(tile.onEnterFrame){
						tilesFalling = true;
						trace(tile.onEnterFrame + "    wwwwwwwww")
					}// if 3
				} // if 2
			
			}// for 2
			}// for 1 
			// ---------------------------------------------------------------------------------------------------------
			// let the new row go on .....
			if(tilesFalling == false){
				
				_root.rowsLeftForNextLevel--;
				trace(_root.rowsLeftForNextLevel + " nbnnnn");
				
				
				
				
				if(_root.myPlaceNewRow.lookIfTilesReachTheTop_GameOver() == true){
					/*
					// ---- delete preview
					for(var i=0;i<_root.howManyTiles_Vertical;i++){
						var clip = _root["preview_container"+i].preview_Clip;
						trace(clip+ " delete Clip");
						clip.removeMovieClip();
			
					}
					_root.newTilesArray = new Array();
					// ---- delete preview
					*/
					
					
					delete _root.waitOnNewRowClip.onEnterFrame;
					_root.gameOver();
					
				
				}
				
				else if(_root.rowsLeftForNextLevel == 0){
						// ---- delete preview
						for(var i=0;i<_root.howManyTiles_Vertical;i++){
							var clip = _root["preview_container"+i].preview_Clip;
							trace(clip+ " delete Clip");
							clip.removeMovieClip();
			
						}
						_root.newTilesArray = new Array();
						// ---- delete preview
						
						delete _root.waitOnNewRowClip.onEnterFrame;
						trace("    nextLevel ???")
						_root.nextLevel();
						//nextLevelClip
						// +++++++++++ level up   +++ 
						
					}
				
				
				else{
					//delete the pictures ///////////////////
					for(var i=0;i<_root.howManyTiles_Vertical;i++){
						var clip = _root["preview_container"+i].preview_Clip;
						trace(clip+ " delete Clip");
						clip.removeMovieClip();
			
					}
					_root.myPlaceNewRow.placeTheAlreadyGenerateddRow();
					_root.newTilesArray = new Array();// delete the old array
					// ---- delete preview
				
				
					/*
					_root.rowsLeftForNextLevel--;
					if(_root.rowsLeftForNextLevel == 0){
						_root.nextLevel();
						//nextLevelClip
						// +++++++++++ level up   +++ 
					}
					*/
				
					_root.intervalId = setInterval(_root.myIntervallCallForNewTile, "checkForRandomNewTile", _root.intervalSpeed);
					delete _root.waitOnNewRowClip.onEnterFrame;
				
				///////////////////////////////////////////////////////////
				}// else
			
			}// end if ------------------------------------------------------------------------------------------------
			
			
		}// if 3  (_root.waitClip.onEnterFrame == false){
		
		
	}// end public function waitOnNewRow(){
	
	
	
	
	
	
	/*
	private function placeATileInPreview(){
		depth = _root.clipForAllTilesOnScreen.getNextHighestDepth();
				if(depth == 0){
					depth = 1;
				}
				
				imageBmp = BitmapData.loadBitmap( "p" + randomGridPairArray[i][j]);
	
				tile = _root.clipForAllTilesOnScreen.createEmptyMovieClip("tileClip"+depth,  depth );//_root.allTilesArray[arrayIndex]); 
				// make picturclip within tile clip
				pictureClip = tile.createEmptyMovieClip("picClip",1);
				pictureClip.attachBitmap(imageBmp, 1);
				//tile.attachBitmap(imageBmp, 1);
				splashClip = tile.attachMovie("splashClip","splashClip",2);
		
		
	}
	*/
	
	
	
	
	
	
	}// end class IntervallCallForNewTile