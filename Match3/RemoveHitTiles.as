class RemoveHitTiles
	{	



private var allConnectedTilesWithSameTyp_Number:Array;
private var allConnectedTilesWithSameTyp_Row:Array;
private var allConnectedTilesWithSameTyp_Column:Array;
private var tile_Row_ToMoveDown:Number;

private var checkIfItIsTheTileNumber:Number;
private var theDesiredTileNumber:Number;

//private var mySortAnArray_And_SortOtherArraysTheSameWay:SortAnArray_And_SortOtherArraysTheSameWay;




// KONSTRUKTOR 
public function RemoveHitTiles(){
	//mySortAnArray_And_SortOtherArraysTheSameWay = new SortAnArray_And_SortOtherArraysTheSameWay;
}
// KONSTRUKTOR 












public function removeVisibleTiles_AndTilesInArray(allConnectedTilesWithSameTyp_Number_P:Array,allConnectedTilesWithSameTyp_Row_P:Array,allConnectedTilesWithSameTyp_Column_P:Array){
	allConnectedTilesWithSameTyp_Number = allConnectedTilesWithSameTyp_Number_P;
	allConnectedTilesWithSameTyp_Row = allConnectedTilesWithSameTyp_Row_P;
	allConnectedTilesWithSameTyp_Column= allConnectedTilesWithSameTyp_Column_P;
	
	trace(_root.myCreateAllRandomTiles.randomGridPairArray + "  -----+++1");
	trace(_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen + "  -----+++111111111111111");
	
	
	
	
	for(var i=0;i<allConnectedTilesWithSameTyp_Number.length;i++){
		//_root.clipForAllTilesOnScreen["tileClip" + Number(allConnectedTilesWithSameTyp_Number[i])]._alpha -=30; 
		 
		 var clip = _root.clipForAllTilesOnScreen["tileClip" + Number(allConnectedTilesWithSameTyp_Number[i])];
		
		
		clip.myHowManyTimesToSolve--;// NEW NEW 
		
		// number for counting
		if(clip.myHowManyTimesToSolve ==0){ // NEW NEW 
		
		
		//_root.clipForAllTilesOnScreen["tileClip" + Number(allConnectedTilesWithSameTyp_Number[i])].picClip._alpha =0; 
		  //_root.clipForAllTilesOnScreen["tileClip" + Number(allConnectedTilesWithSameTyp_Number[i])].splashClip.play();
		//_root.
		var newSplashDepth = _root.clipForAllTilesOnScreen.getNextHighestDepth();
		var splashClipOnDelete = _root.clipForAllTilesOnScreen.attachMovie("splashClipOnDelete","splashClipOnDelete"+newSplashDepth,newSplashDepth);
		splashClipOnDelete._x = clip._x;
		splashClipOnDelete._y = clip._y;
		_root.myCreateAllRandomTiles.randomGridPairArray[   allConnectedTilesWithSameTyp_Row[i]  ][   allConnectedTilesWithSameTyp_Column[i]  ] = 0;
		_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[   allConnectedTilesWithSameTyp_Row[i]  ][   allConnectedTilesWithSameTyp_Column[i]  ] = 0;
		clip.removeMovieClip();
		
		}// NEW NEW 
	}
	
	/*
	mySortAnArray_And_SortOtherArraysTheSameWay.putTileListInOrder(3, allConnectedTilesWithSameTyp_Number, allConnectedTilesWithSameTyp_Row , allConnectedTilesWithSameTyp_Column  );
	allConnectedTilesWithSameTyp_Number = mySortAnArray_And_SortOtherArraysTheSameWay.getSortedArray_1();
	allConnectedTilesWithSameTyp_Row = mySortAnArray_And_SortOtherArraysTheSameWay.getSortedArray_2();
	allConnectedTilesWithSameTyp_Column = mySortAnArray_And_SortOtherArraysTheSameWay.getSortedArray_3();
	*/
	
	
	// becouse there are two Arrays which run through the same function the _root.directionToMoveRight must be same 
	_root.directionToMoveRightTEMP = _root.directionToMoveRight;
	_root.myCreateAllRandomTiles.randomGridPairArray  = deleteTheHitTiles(_root.myCreateAllRandomTiles.randomGridPairArray);
	_root.directionToMoveRight = _root.directionToMoveRightTEMP;
	_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen  = deleteTheHitTiles(_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen);
	
	
	//setTilesAboveDown(); -------------------
	//setTilesAboveDown();
	
	trace(_root.myCreateAllRandomTiles.randomGridPairArray + "  ---2");
	trace(_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen + "  ---222222");
	
	// (_root.myCreateAllRandomTiles.randomGridPairArray)  do not (199988765432)
	_root.myCreateAllRandomTiles.myPrintTilesOnScreen.moveTheTilesOnScreen(199988765432);//_root.myCreateAllRandomTiles.randomGridPairArray);
	
	//_root.onEnterFrame = this.waitForDroppingTilesFromAbove;
	// wait and then all rows above 
	
}// end removeVisibleTiles_AndTilesInArray()
	
	
	
	
/*
public function waitForDroppingTilesFromAbove(){
	setTilesAboveDown();
}
*/	
	

	
	
private function deleteTheHitTiles(array2D:Array):Array{
	
	
	var howManyColumsAreAlreadyEmpty = howManyColumsAreAlreadyEmptyBeforeDeleteOfSingleTile();
	trace(howManyColumsAreAlreadyEmpty + "   uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
	
	//trace(array2D + "   ääääääääääääääääoooo");
	// run through all array and delete the "0" 
	for(var i=0;i<array2D.length;i++){
		
		for(var k=0;k<array2D[i].length;k++){
			
			
			
			//for (var q = 0; q < vegetables.length; q++) {
          		if (array2D[i][k] == "0"){ 
		  			
					trace(array2D[i] +  "   1");
					array2D[i].splice(k, 1);
					//array2D[i].push("0");
					
					trace("jjjaaaa");
					trace(array2D[i] +  "   2");
					k = -1;// for k start over
		  		}
				
				
				
			//}
			
	
		}
		
		// if a column is down // get the array out of there 
		if(array2D[i].length == 0){
			array2D.splice(i, 1);
			i=-1;// for i start over
		}// end if
		else{
			var zerosOnTopMissing = _root.howManyTiles_Horizontal - array2D[i].length;
		
				
			for(var w=0;w<zerosOnTopMissing;w++){
				trace(array2D[i].length + "ok to short");
				array2D[i].push("0");
					
			}
			trace(array2D[i].length + " array hight");
		}// end else
	
	
	
	
	}
	
	 
	var completeColumnsMissing = _root.howManyTiles_Vertical  - array2D.length;
	//completeColumnsMissing = completeColumnsMissing - howManyColumsAreAlreadyEmpty;
	
	// howManyColumsAreAlreadyEmpty is checked before the hit tiles are removed : so
	// one ones how many columns are empty anyways -> othervise the already empty columns would move the tiles left right ... without 
	// having a tile removed
	if(howManyColumsAreAlreadyEmpty != 0){
		_root.directionToMoveRight = !_root.directionToMoveRight;
	}
	
		
		trace(array2D + "   ...array...aaaaaaaaaaaaaaaaaaaaaaaaa");
		//------------- all columns go to right
		
		for(var w=0;w<completeColumnsMissing;w++){
			
			if(_root.directionToMoveRight == true){
				var nextIndex = array2D.length;
				array2D[nextIndex] = new Array(_root.howManyTiles_Horizontal);
				_root.directionToMoveRight = false;
			}
			else{
				var nextIndex = 0;
				var emptyArray = new Array(_root.howManyTiles_Horizontal);
				array2D.unshift(emptyArray);
				_root.directionToMoveRight = true;
			}
			
			
			
			for(var q=0;q<_root.howManyTiles_Horizontal;q++){
				array2D[nextIndex][q] = 0;
			}
		}
		
		//------------- all columns go to right
		
		trace(array2D + "   ...array...bbbbbbbbbbbbbbbbb");
		
		
		//unshift(); array add the first entrance
		
		
		
		
		
		//------------- all columns go to left
		/*
		for(var w=0;w<completeColumnsMissing;w++){
			for(var q=0;q<array2D.length;q++){
				array2D[q] = array2D[q+1];
			}
			
			
		}// end for
		
		trace(array2D + "   ...array...cccccccccccccccccc");
		*/
		
		//------------- all columns go to left
		
		
		
		
	//trace(array2D + "   äääääääääääoooo");
	return array2D;
}// end  deleteTheHitTiles()
	
	
	
	
private function howManyColumsAreAlreadyEmptyBeforeDeleteOfSingleTile():Number{
	var emptyColumnsCounter = 0;
	
	var array2D = _root.myCreateAllRandomTiles.randomGridPairArray;
	for(var i=0;i<array2D.length;i++){
		var columnIsEmpty = true;
		for(var k=0;k<array2D[i].length;k++){
			if(array2D[i][k] != "0"){
				columnIsEmpty = false;
			}// if
		}// for 2
		if(columnIsEmpty == true){
			emptyColumnsCounter++;
		}// if
	}// for 1
	
	return emptyColumnsCounter;
}// end public function howManyColumsAreAlreadyEmptyBeforeDeleteOfSingleTile():Number

	
	
	
	
	
	
	
	
	

public function setTilesAboveDown(){
	// run through all removed tiles
	for(var i=0;i<allConnectedTilesWithSameTyp_Number.length;i++){
		
		
		
		/*
		// find where the tile (  row  )  is because tiles have been moved down and the old values in rowArray are not correct after one tiles has been moved down
		for(var q=0;q<allConnectedTilesWithSameTyp_Number.length;q++){
			
			theDesiredTileNumber = Number(allConnectedTilesWithSameTyp_Number[q]);
			trace(allConnectedTilesWithSameTyp_Number[q] + "ffffffffffffffff");
			for(var z=0; z<_root.howManyTiles_Vertical; z++) {
				
				checkIfItIsTheTileNumber = Number(_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[   z  ][   allConnectedTilesWithSameTyp_Column[i]] );
				trace(checkIfItIsTheTileNumber + "hhhhhhhhhhhhhhhhhhhh");
				
				if(checkIfItIsTheTileNumber == theDesiredTileNumber){
					tile_Row_ToMoveDown =  checkIfItIsTheTileNumber;//Number(allConnectedTilesWithSameTyp_Row[i]) -1;
					trace(tile_Row_ToMoveDown + "   tile_Row_ToMoveDownüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüüü");
				}
			}
			
		}// end for
		*/
		
		
		// run through all tiles above
		// the first tile to move is the one above the active one
		tile_Row_ToMoveDown =  Number(allConnectedTilesWithSameTyp_Row[i]) -1;
		//   --------trace( allConnectedTilesWithSameTyp_Row[i]+ "ggg aa");
		
		
		
		// in the while loop just one tile is moved down // the for loop var i  loops through all tiles 
		while(tile_Row_ToMoveDown > -1){
			//_root.myCreateAllRandomTiles.randomGridPairArray[   tile_Row_ToMoveDown  ][   allConnectedTilesWithSameTyp_Column[i]  ]= 0;
			//_root.clipForAllTilesOnScreen["tileClip" + Number(allConnectedTilesWithSameTyp_Number[i])].picClip._alpha =10; 
			
			//_root.myCreateAllRandomTiles.randomGridPairArray[   allConnectedTilesWithSameTyp_Row[i]  ][   allConnectedTilesWithSameTyp_Column[i]  ]  = _root.myCreateAllRandomTiles.randomGridPairArray[   tile_Row_ToMoveDown  ][   allConnectedTilesWithSameTyp_Column[i]  ];
			//_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[   allConnectedTilesWithSameTyp_Row[i]  ][   allConnectedTilesWithSameTyp_Column[i]  ]  = _root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[   tile_Row_ToMoveDown  ][   allConnectedTilesWithSameTyp_Column[i]  ];
			
			
			_root.myCreateAllRandomTiles.randomGridPairArray[   tile_Row_ToMoveDown+1  ][   allConnectedTilesWithSameTyp_Column[i]  ]  = _root.myCreateAllRandomTiles.randomGridPairArray[   tile_Row_ToMoveDown  ][   allConnectedTilesWithSameTyp_Column[i]  ];
			_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[   tile_Row_ToMoveDown+1  ][   allConnectedTilesWithSameTyp_Column[i]  ]  = _root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[   tile_Row_ToMoveDown  ][   allConnectedTilesWithSameTyp_Column[i]  ];
			
			
			//-------
			var tile = _root.clipForAllTilesOnScreen["tileClip" + _root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[   tile_Row_ToMoveDown+1  ][   allConnectedTilesWithSameTyp_Column[i]  ]    ];
			//trace(tile + "   tilllllll  " + tile.myRow);
			
			tile.myRow++;// = tile_Row_ToMoveDown+1;
			
			
			
			for(var k=0;k<allConnectedTilesWithSameTyp_Number.length;k++){
				allConnectedTilesWithSameTyp_Row[k] = 1 + Number(allConnectedTilesWithSameTyp_Row[k]);
			}
			
			
			
			//trace(tile + "   tilllllll  " + tile.myRow);
			tile_Row_ToMoveDown--;
			//--------
			
			//+++++trace(tile_Row_ToMoveDown + "  tile_Row_ToMoveDown");
		}// end while
		
		
		// the top row must become 0 ..
		_root.myCreateAllRandomTiles.randomGridPairArray[  0  ][   allConnectedTilesWithSameTyp_Column[i]  ]  = 0;
		_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[   0  ][   allConnectedTilesWithSameTyp_Column[i]  ]  = 0;
		
		
		
	}
	
}// end function setTilesAboveDown()
	
	
	
	
	
	
	
}// end class