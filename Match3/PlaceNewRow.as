class PlaceNewRow
	{	
	//private var array2D:Array;
	
	
	
	public function deleteAllTiles(){
		for(var i=0; i<_root.howManyTiles_Vertical; i++) {
 			for(var j=0; j<_root.howManyTiles_Horizontal; j++) {
				
				var tileID = _root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[i][j];
				//trace(tileID + "    tileID");
				// --------- if deletion does not work
				_root.myCreateAllRandomTiles.randomGridPairArray[i][j] = 0;
				_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[i][j] = 0;
				// --------- if deletion does not work
				
				if(tileID != 0){
					
					var tile = _root.clipForAllTilesOnScreen["tileClip" + tileID  ];
					tile.removeMovieClip();
					
				} // if
			} // for 2
		}// for 1
		
		
		// delete the arrays 
		//_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen = new Array();
		//_root.myCreateAllRandomTiles.randomGridPairArray = new Array();
	}// end public function deleteAllTiles()
	
	
	
	
	
	
	public function deleteAllButtons(){
		for(var i=0; i<_root.howManyTiles_Vertical; i++) {
 			for(var j=0; j<_root.howManyTiles_Horizontal; j++) {
				
				var tileID = _root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[i][j];
				//trace(tileID + "    tileID");
				if(tileID != 0){
					
					var tile = _root.clipForAllTilesOnScreen["tileClip" + tileID  ];
					delete tile.onRelease;
					delete tile.onPress;
					delete tile.onReleaseOutside;
					delete tile.onEnterFrame;
				} // if
			} // for 2
		}// for 1
		
	}// end public function deleteAllButtons()
	
	
	
	
	public function lookIfTilesReachTheTop_GameOver():Boolean{
		var array2D = _root.myCreateAllRandomTiles.randomGridPairArray;
		for(var i=0;i<array2D.length;i++){
			trace(array2D[i][array2D[i].length-1] + "   game Over?" );
			if(array2D[i][array2D[i].length-1] != 0){
				return true;
			}
		}
		
	}// public function lookIfTilesReachTheTop()
	
	
	
	
	
	
	public function placeTheAlreadyGenerateddRow(){
			//trace(_root.myCreateAllRandomTiles.randomGridPairArray);
			//trace(_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen);
		//array2D = new Array();
		var array2D = _root.myCreateAllRandomTiles.randomGridPairArray;
		trace(array2D + "   sdfefwefwefwef...................");
		
		
		for(var i=0;i<array2D.length;i++){
			
			var startPosition = array2D[i].length -1;
			
			//trace(array2D[i][0] + )
			
			
			for(var k=startPosition;k>0;k--){
				_root.myCreateAllRandomTiles.randomGridPairArray[i][k] = _root.myCreateAllRandomTiles.randomGridPairArray[i][k-1];
				_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[i][k] = _root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[i][k -1];
			}
		}
		
		trace(array2D + "   sdfefwefwefwef...................");
		
		
		// ----------------------------------------------
		/*
		for(var i=0;i<array2D.length;i++){
			//for(var k=0;k<array2D[i].length;k++){
			_root.myCreateAllRandomTiles.randomGridPairArray[i][0] = Math.round(Math.random()*3) + 1;;
			//_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[i][k] = _root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[i][k -1];
			_root.myCreateAllRandomTiles.myPrintTilesOnScreen.placeSingleTileOnScreen(_root.myCreateAllRandomTiles.randomGridPairArray,i,1);
			
			//}
		}
		*/
		
		for(var i=0;i<array2D.length;i++){
			//for(var k=0;k<array2D[i].length;k++){
			_root.myCreateAllRandomTiles.randomGridPairArray[i][0] = _root.newTilesArray[array2D.length-i-1];//Math.round(Math.random()*_root.differentTileAmount) + 1;;
			//_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[i][k] = _root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[i][k -1];
			_root.myCreateAllRandomTiles.myPrintTilesOnScreen.placeSingleTileOnScreen(_root.myCreateAllRandomTiles.randomGridPairArray,i,0);
			
			//}
		}
		
		
		// ------------------------------------------------
		//_root.myCreateAllRandomTiles.myPrintTilesOnScreen.moveTheTilesOnScreen(199988765432);
		_root.myCreateAllRandomTiles.myPrintTilesOnScreen.moveTheTilesOnScreenWithoutDrifting(199988765432);
	}// end public function placeTheAlreadyGenerateddRow()
	
	
	
	
	
	
	
	
	
	
	}// end class PlaceNewRow