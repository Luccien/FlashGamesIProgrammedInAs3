class CheckFor3OrMoreTilesNextToEachOther
	{	

	private var origin_Typ:Number;
	private var myRow:Number;
	private var myColumn:Number;
	private var allConnectedTilesWithSameTyp_Number:Array;
	private var allConnectedTilesWithSameTyp_Row:Array;
	private var allConnectedTilesWithSameTyp_Column:Array;
	private var myTestTyp:Number;
	private var my_Test_Row:Number;
	private var my_Test_Column:Number;
	private var myTest_Number:Number;
	private var myRemoveHitTiles:RemoveHitTiles;
	
	
	// KONSTRUKTOR
	public function CheckFor3OrMoreTilesNextToEachOther(){
		myRemoveHitTiles = new RemoveHitTiles();
	}
	// KONSTRUKTOR
	
	
	
	
	
	
	// start from the selected Tile
	public function checkForPairs(object:MovieClip){
		//trace(object.myNumber);
		
		// origin_Typ is the type number of the tile beeing clicked / or choosen
		origin_Typ = Number(_root.myCreateAllRandomTiles.randomGridPairArray[object.myRow][object.myColumn]);
		
		
		
		// 1) make an arry for the tiles to check
		allConnectedTilesWithSameTyp_Row = new Array();
		allConnectedTilesWithSameTyp_Row.push(object.myRow);
		
		
		allConnectedTilesWithSameTyp_Column = new Array();
		allConnectedTilesWithSameTyp_Column.push(object.myColumn);
		
		allConnectedTilesWithSameTyp_Number = new Array();
		allConnectedTilesWithSameTyp_Number.push(object.myNumber);
		
		
		
		// for loop with runs through allConnectedTiles Array //
		// save object ??   Row Column is needed   // Number to check if it is already in list
		// better check : on off if it is in the list ....
		
		
		
		// when a new tile is found to be connected with otheres the arrays are pushed +1 so the length is +1 and the for loop runs one more
		for(var i=0;i<allConnectedTilesWithSameTyp_Number.length;i++){
		
		
		
		
			
		
			myRow = Number(allConnectedTilesWithSameTyp_Row[i]);
			myColumn = Number(allConnectedTilesWithSameTyp_Column[i]);
			
			
			//-----------------------  (1)
			my_Test_Row = myRow +1;
			my_Test_Column = myColumn;
			myTestTyp = Number(_root.myCreateAllRandomTiles.randomGridPairArray[my_Test_Row][my_Test_Column]);
			
			
			if(origin_Typ ==  myTestTyp){
				
				
				myTest_Number =  Number(_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[my_Test_Row][my_Test_Column] );
				// see if myTest_Number is not in Array already
				
				if(myNumberIsNotInArray(myTest_Number) ){
					allConnectedTilesWithSameTyp_Row.push(my_Test_Row);
					allConnectedTilesWithSameTyp_Column.push(my_Test_Column);
					allConnectedTilesWithSameTyp_Number.push(  myTest_Number   );
					
				}
				
			
			}
			//-----------------------------
			
			
			//-----------------------  (2)
			my_Test_Row = myRow -1;
			my_Test_Column = myColumn;
			myTestTyp = Number(_root.myCreateAllRandomTiles.randomGridPairArray[my_Test_Row][my_Test_Column]);
			
			if(origin_Typ ==  myTestTyp){
				
				
				myTest_Number =  Number(_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[my_Test_Row][my_Test_Column] );
				// see if myTest_Number is not in Array already
				
				if(myNumberIsNotInArray(myTest_Number) ){
					allConnectedTilesWithSameTyp_Number.push(  myTest_Number   );
					allConnectedTilesWithSameTyp_Row.push(my_Test_Row);
					allConnectedTilesWithSameTyp_Column.push(my_Test_Column);
					
				}
				
			}
			//-----------------------------
			
			
			
			
			//-----------------------  (3)
			my_Test_Row = myRow;
			my_Test_Column = myColumn + 1;
			myTestTyp = Number(_root.myCreateAllRandomTiles.randomGridPairArray[my_Test_Row][my_Test_Column]);
			
			if(origin_Typ ==  myTestTyp){
				
				
				myTest_Number =  Number(_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[my_Test_Row][my_Test_Column] );
				// see if myTest_Number is not in Array already
				
				if(myNumberIsNotInArray(myTest_Number) ){
					allConnectedTilesWithSameTyp_Number.push(  myTest_Number   );
					allConnectedTilesWithSameTyp_Row.push(my_Test_Row);
					allConnectedTilesWithSameTyp_Column.push(my_Test_Column);
					
				}
				
			
			}
			//-----------------------------
			
			
			
			//-----------------------  (4)
			my_Test_Row = myRow;
			my_Test_Column = myColumn - 1;
			myTestTyp = Number(_root.myCreateAllRandomTiles.randomGridPairArray[my_Test_Row][my_Test_Column]);
			
			if(origin_Typ ==  myTestTyp){
				
				
				myTest_Number =  Number(_root.myCreateAllRandomTiles.myPrintTilesOnScreen.arrayWithAllNumbersOnScreen[my_Test_Row][my_Test_Column] );
				// see if myTest_Number is not in Array already
				
				if(myNumberIsNotInArray(myTest_Number) ){
					allConnectedTilesWithSameTyp_Number.push(  myTest_Number   );
					allConnectedTilesWithSameTyp_Row.push(my_Test_Row);
					allConnectedTilesWithSameTyp_Column.push(my_Test_Column);
					
				}
				
			
			}
			//-----------------------------
						
			
			
		}
		
	if(allConnectedTilesWithSameTyp_Number.length > 2){
		myRemoveHitTiles.removeVisibleTiles_AndTilesInArray(allConnectedTilesWithSameTyp_Number,allConnectedTilesWithSameTyp_Row,allConnectedTilesWithSameTyp_Column);
		_root.score += 100 * allConnectedTilesWithSameTyp_Number.length;
	}
	else{
		_root.score -=50; // new row....
		_root.scoreMinusClip.gotoAndPlay(1);
		//_root.clipForAllTilesOnScreen["tileClip" + Number(allConnectedTilesWithSameTyp_Number[i])].splashClip.play();
		// show at score that the points are going down
	}
	
	/*
	for(var i=0;i<allConnectedTilesWithSameTyp_Number.length;i++){
		//_root.clipForAllTilesOnScreen["tileClip" + Number(allConnectedTilesWithSameTyp_Number[i])]._alpha -=30; 
		_root.clipForAllTilesOnScreen["tileClip" + Number(allConnectedTilesWithSameTyp_Number[i])].picClip._alpha =0; 
		_root.clipForAllTilesOnScreen["tileClip" + Number(allConnectedTilesWithSameTyp_Number[i])].splashClip.play();
	
	}
	*/
	
	
	}// end checkForPairs(object:MovieClip)
	
	
	
	
	
	private function myNumberIsNotInArray(myTest_Number_P:Number):Boolean{
		var noDoubleEntriesWhereFound = true;
		for(var j=0;j<allConnectedTilesWithSameTyp_Number.length;j++){
			if(myTest_Number_P == Number(allConnectedTilesWithSameTyp_Number[j])  ){
				noDoubleEntriesWhereFound = false;
			}
			
		}// end for
		return noDoubleEntriesWhereFound;
		
	}// end function myNumberIsNotInArray(myTest_Number_P){
	
	
	
	
	
	
	

	
	
	
	
	
	
}// end class CheckFor3OrMoreTilesNextToEachOther