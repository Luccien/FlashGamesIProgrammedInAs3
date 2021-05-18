
//import flash.display.BitmapData;

class CreateAllRandomTiles
	{	
	public var randomGridPairArray:Array;
	public var myPrintTilesOnScreen:PrintTilesOnScreen;
	
	
	private var mySendORDEREDarray_ReturnsRANDOMarray:SendORDEREDarray_ReturnsRANDOMarray;
	private var imageClip:MovieClip;
	private var tileNumber:Number;
	private var allPositionsInOrder:Array;
	private var allPositionsRandom:Array;
	private var two_dimensional_Array:Array;
	private var randomPosition_Array:Array;
	private var randomPosition_Column:Number;
	private var randomPosition_Row:Number;
	private var myReturn_2_D_ArrayWithEntries:Return_2_D_ArrayWithEntries;
	
	
	
	// KONSTRUKTOR
	public function CreateAllRandomTiles(){
		myPrintTilesOnScreen = new PrintTilesOnScreen();
		myReturn_2_D_ArrayWithEntries = new Return_2_D_ArrayWithEntries();
		
		searchDirectionArray_InOrder = new Array();
		searchDirectionArray_InOrder.push("1");
		searchDirectionArray_InOrder.push("2");
		searchDirectionArray_InOrder.push("3");
		searchDirectionArray_InOrder.push("4");
		
		
		mySendORDEREDarray_ReturnsRANDOMarray = new SendORDEREDarray_ReturnsRANDOMarray();
		
		
		tileNumber = 0;
		
		
		putAllPositionsInArrayAndMakeRandom();
	} // end // KONSTRUKTOR
	
	
	
	
	
	
	// 1) first get all positions in an array    1/1  1/2  1/3  2/1 ...
	
	// 2 ) than randomly mixt the array
	
	
	public function putAllPositionsInArrayAndMakeRandom(){
		allPositionsInOrder = new Array();
		allPositionsRandom = new Array();
		
		
		
		
		for(var i=0;i<_root.howManyTiles_Vertical;i++){
			for(var j=0;j<_root.howManyTiles_Horizontal;j++){
				allPositionsInOrder.push(i+"_"+j);
			
			}// end for 2
		}// end for 1
		//_root.howManyTiles_Horizontal = 15;
		//_root.howManyTiles_Vertical = 15;
		trace(allPositionsInOrder);
		trace("----------------------------");
		allPositionsRandom = mySendORDEREDarray_ReturnsRANDOMarray.returnMeRandomArray(allPositionsInOrder);
		trace(allPositionsRandom);
		trace("----------------------------");
		//makeEmptyTileGrid();
		//trace(two_dimensional_Array);
		myReturn_2_D_ArrayWithEntries.return_2_D_Array(_root.howManyTiles_Vertical,_root.howManyTiles_Horizontal);
		
		
		makeAnRandomArrayToChooseTileTypesFrom();
		
		//---
		makeRandomGridPairArray();
		//takeFirstPositionsToSetPairs();
		//---
		trace(randomGridPairArray);
		
		myPrintTilesOnScreen.setTheTilesOnScreen(randomGridPairArray);
		//setTheTilesOnScreen();
	}// end public function putAllPositionsInArrayToMix(){
	
	
	
	
	
	
	
	private var alleRandomTileTypes_Array_STRAIGHT:Array;
	//private var alleRandomTileTypes_Array_RANDOM:Array;
	
	
	
	
	
	private function makeAnRandomArrayToChooseTileTypesFrom(){
		
		alleRandomTileTypes_Array_STRAIGHT = new Array();
		//_root.howManyDifferentTileTypes = 15;
		
		for(var i=1;i<_root.howManyDifferentTileTypes+1;i++){
			alleRandomTileTypes_Array_STRAIGHT.push(i);
		}
		trace(alleRandomTileTypes_Array_STRAIGHT + "    straight");
		
			
		_root.alleRandomTileTypes_Array_RANDOM = new Array();
		_root.alleRandomTileTypes_Array_RANDOM = mySendORDEREDarray_ReturnsRANDOMarray.returnMeRandomArray(alleRandomTileTypes_Array_STRAIGHT);
		trace(_root.alleRandomTileTypes_Array_RANDOM +  "     mixxxxed");
	}// end 
	
	
	
	
	
	/*
	private function prepareRandomArraysForDifferentSpecialTileTypes(){
		// ------------------------------------------------------------
		var allPossibleTiles = _root.highestRow * _root.howManyTiles_Horizontal
		
		var allPossibleTiles_Array_STRAIGHT = new Array();
		//_root.howManyDifferentTileTypes = 15;
		
		for(var i=1;i<allPossibleTiles+1;i++){
			allPossibleTiles_Array_STRAIGHT.push(i);
		}
		trace(allPossibleTiles_Array_STRAIGHT + "    2222straight");
		
			
		_root.allPossibleTiles_Array_RANDOM = new Array();
		_root.allPossibleTiles_Array_RANDOM = mySendORDEREDarray_ReturnsRANDOMarray.returnMeRandomArray(allPossibleTiles_Array_STRAIGHT);
		trace(_root.allPossibleTiles_Array_RANDOM +  "     222mixxxxed");
		// ------------------------------------------------------------
		
		setTilesOnSpecialFrame();
	}// end prepareRandomArraysForDifferentSpecialTileTypes()
	
	
	
	
	private function setTilesOnSpecialFrame(){
		for(var k=1; k<_root.pSpecial_Amount_1+1; k++) {
			var counter = 1;
			
			//--------------------
			for(var i=0; i<_root.howManyTiles_Vertical; i++) {
				for(var j=0; j<_root.howManyTiles_Horizontal; j++) {
					if(counter == Number(_root.allPossibleTiles_Array_RANDOM[k]) ){
						randomGridPairArray[i][j] = 101;
						
					}
				
				
					counter++;
				}// end for 3
			}// end for 2
			//----------------------
		}// end for 1
	}// end  setTilesOnSpecialFrame()
	*/
	
	
	
	
	// 3 create an 3 D Array which represents the tile grid
	private function makeRandomGridPairArray(){
		
		
		
		
		
		//var tileCounter = 1;
		
		randomGridPairArray = new Array(_root.howManyTiles_Vertical);
		
		for(var i=0; i<_root.howManyTiles_Vertical; i++) {
 			randomGridPairArray[i] = new Array(_root.howManyTiles_Horizontal);
 			for(var j=0; j<_root.howManyTiles_Horizontal; j++) {
  				
				/*
				if(i == 0 & j ==3){
					randomGridPairArray[i][j] = 0;//0;//i+"-"+j;
 					randomGridPairArray[i][j] = 0;  // <------- here 
				}
				else{
					*/
					
					
				if(j>_root.highestRow-1){
					randomGridPairArray[i][j] = 0;
				}
				else{
				
					///!!!  randomGridPairArray[i][j] = Math.round(Math.random()*_root.differentTileAmount) + 1;//0;//i+"-"+j;
 					
					//randomGridPairArray[i][j] = _root.alleRandomTileTypes_Array_RANDOM[(Math.round(Math.random()*_root.differentTileAmount) + 1)];
					
					//var _root.pSpecial_Amount_1 = _root.pSpecial_1_Amount_Array[_root.levelNr -1];
					/*
					trace(_root.pSpecial_Amount_1 + " iiiooo");   // ________________ > here above on start make random array with all possible tiles  _root.howManyTiles_Vertical * _root.howManyTiles_Horizontal
					if(_root.pSpecial_Amount_1 > 0){
						randomGridPairArray[i][j] = 101;
						trace(randomGridPairArray[i][j] + " oookk");
					}
					else{*/
							randomGridPairArray[i][j] = Math.round(Math.random()*_root.differentTileAmount) + 1;
					//}
					//_root.pSpecial_Amount_1--; 
				
				}
				
				
				
			} // end for
		} // end for 
		
		
		
		// -------------------------------------------------------------
		// prepare an random array for the special tile positions
		//prepareRandomArraysForDifferentSpecialTileTypes();
				
		//--------------------------------------------------------------
		
		
			//trace(two_dimensional_Array);
	}// end private makeEmptyGridTileGrid()
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 4) take the first e.g. 40 positions to set 8 pairs  of each different tile       10 * 14 =  140 Tiles
	// _root.pair_1_HowManyPairs = 8;    _root.pair_2_HowManyPairs = 8;
	// root.howManyPairsAllTogether
	
	
	
	
	
	// 1)   one number for the first tile : 
	// 2) function to look to make pairs
	// 3) function to set the rest
	
	
	
	
	private function takeFirstPositionsToSetPairs(){
		
		
		randomPosition_Array = new Array();
		
		
		for(var i=0; i<_root.howManyPairsOnStart;i++){
			
			randomPosition_Array = allPositionsRandom[i].split("_");
			
			randomPosition_Row = Number(randomPosition_Array[0]);
			randomPosition_Column = Number(randomPosition_Array[1]); 
			
			
			// look if the position next to it is free
			tryIfAPairISPossible(randomPosition_Row,randomPosition_Column,2);
			//randomGridPairArray[randomPosition_Row][randomPosition_Column] = 5; 
		}
		
		
		
		
		
	}// end private function takeFirstPositionsToSetPairs()
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	private var searchDirectionArray_InOrder:Array;
	private var searchDirectionArray_Random:Array;
	private var theIndex:Number;
	private var theDirection:Number;
	
	private function tryIfAPairISPossible(row_P,column_P,tileCharacter_P){
		
		// place tile in position
		if(randomGridPairArray[row_P][column_P] == 0){
			randomGridPairArray[row_P][column_P] = tileCharacter_P; 
		}
		
		// look if next to tile is a free position
		// try with the first direction in the random array (1,2,3,4 left right up down)
		/*
		searchDirectionArray_InOrder = new Array();
		searchDirectionArray_InOrder.push("1");
		searchDirectionArray_InOrder.push("2");
		searchDirectionArray_InOrder.push("3");
		searchDirectionArray_InOrder.push("4");
		*/
		searchDirectionArray_Random = mySendORDEREDarray_ReturnsRANDOMarray.returnMeRandomArray(searchDirectionArray_InOrder);
		//  
		theIndex = -1;
		for(var i=0;i<5;i++){
			theIndex++;
			theDirection =  Number(searchDirectionArray_Random[theIndex]);
			trace(theIndex + "  index");
			if(theDirection == 1){
				if(randomGridPairArray[row_P][column_P + 1] == 0){
					randomGridPairArray[row_P][column_P + 1] = tileCharacter_P;
					i=10; // stops for loop
					trace("1");
				}
				
			}
			else if(theDirection == 2){
				if(randomGridPairArray[row_P][column_P - 1] == 0){
					randomGridPairArray[row_P][column_P - 1] = tileCharacter_P;
					i=10; // stops for loop
					trace("2");
				}
			}
			
			else if(theDirection == 3){
				if(randomGridPairArray[row_P+1][column_P] == 0){
					randomGridPairArray[row_P+1][column_P] = tileCharacter_P;
					i=10; // stops for loop
					trace("3");
				}
			}
			
			else if(theDirection == 4){
				if(randomGridPairArray[row_P-1][column_P] == 0){
					randomGridPairArray[row_P-1][column_P] = tileCharacter_P;
					i=10; // stops for loop
					trace("4");
				}
			}
			
			
		}// end for
		
	}// end private function tryIfAPairISPossible(row_P,column_P){
	
	
	
	
	
	// 5 than set the remainig tiles randomly sothat there are no pairs 
	
	// 6 than take the button function 
	
	
	
	
	




}// end Class  createAllRandomTiles