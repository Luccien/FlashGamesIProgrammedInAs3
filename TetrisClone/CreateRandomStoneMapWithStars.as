class CreateRandomStoneMapWithStars extends MovieClip{
	
	
	
	private var mySendORDEREDarray_ReturnsRANDOMarray:SendORDEREDarray_ReturnsRANDOMarray;  
	//private var allColumnNumbersArray:Array;
	private var allColumnNumbersStraightArray:Array;
	private var allColumnNumbersRandomArray:Array;
	
	private var allRowNumbersStraightArray_STARS:Array;
	private var allRowNumbersRandomArray_STARS:Array;
	
	
	
	// KONSTRUKTOR
	public function CreateRandomStoneMapWithStars(){
		mySendORDEREDarray_ReturnsRANDOMarray = new SendORDEREDarray_ReturnsRANDOMarray();
		
		if(_root.starModusOnOff == false){
			_root.starAmount = "";
		}
	}// end KONSTRUKTOR
	
	
	
	
	
	
	
	
	
	public function makeRandomRows(){
		if(_root.starModusOnOff == true){
				makeAnSortedArrayForTheRows_InWhichThe_STARS_CouldBe();
				allRowNumbersRandomArray_STARS = undefined;
				allRowNumbersRandomArray_STARS = new Array();
				allRowNumbersRandomArray_STARS = mySendORDEREDarray_ReturnsRANDOMarray.returnMeRandomArray(allRowNumbersStraightArray_STARS);
			}
				
		
		for(var i=_root.rowAmount-_root.rowAmountForRandomStones; i< _root.rowAmount; i++){
			//_root.starAmount = 6;
			//_root.starModusOnOff = true;
			
			
			
			
			// 1) make for each row an array for the stones in the row 
			makeAnSortedArray();
			allColumnNumbersRandomArray = undefined;
			allColumnNumbersRandomArray = new Array();
			allColumnNumbersRandomArray = mySendORDEREDarray_ReturnsRANDOMarray.returnMeRandomArray(allColumnNumbersStraightArray);
			// 2) randomly choose the numbers of stones in the row     2-4  =  2        +   2 
			
			
			var stoneNumberInTheRow = Math.round(    Math.random()* (_root.columnMaxStones - _root.columnMinStones)     ) ;
			stoneNumberInTheRow += _root.columnMinStones;
			trace(stoneNumberInTheRow);
			
			
			//for(var j=0;j <_root.columnAmount-1;j++){
			for(var j=0;j <stoneNumberInTheRow;j++){
				
				var myNumber = _root.allTetrisShape.getNextHighestDepth();
				if(myNumber == 0){
					trace("depth 0");
					myNumber = 1;
				}
			
				
				var stonePiece = _root.allTetrisShape.attachMovie("stones","stone"+myNumber ,myNumber );
								
				var color = Math.round(  (Math.random()*6) ) +2 ;
				trace(color + "  color");
				
				// star modus ---
				if(_root.starModusOnOff == true & j == 0){ // j == 0   a star should only be in the first random choosen column  of each row  
					// if the row is in the array within the first entraces -> check to _root.starAmount -1 than put the star on the screen
					if(checkTheRandomRowsForRowNumber(i) ){
						color = 9; //allRowNumbersRandomArray_STARS
					}
				}
				// star modus
				
				
				stonePiece.gotoAndStop(    color   );
				stonePiece.colour = color;
				// get the first shape 
				//var column = j;
				// take the rundom number there to put the stone from (which column) from the random array
				var column = j;//allColumnNumbersRandomArray[j]; just for testing !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
				
				var row = i;
				stonePiece._x =  column * _root.stone_lenght; //+ _root.field_Tetris_Clip._x;
				stonePiece._y =  row * _root.stone_height; //+ _root.field_Tetris_Clip._y;
				_root.two_D_Field_Array[  row ][   column ] = myNumber;
				
				
			}// end for _root.column
		
		
		
		
		}// end for row
		
		
		
	}// end public function makeRandomRows()
	
	
	private function checkTheRandomRowsForRowNumber(row:Number):Boolean{
		var rowIsWithinTheArray = false;
		
		for(var i=0;i<_root.starAmount; i++){
			if(row ==     Number(allRowNumbersRandomArray_STARS[i] )   ){
				rowIsWithinTheArray = true;
			}
		
		}
		
		
		return rowIsWithinTheArray;
		
	}// end checkTheRandomRowsForRowNumber
	
	
	
	
	
	private function makeAnSortedArrayForTheRows_InWhichThe_STARS_CouldBe(){
		allRowNumbersStraightArray_STARS = undefined;
			allRowNumbersStraightArray_STARS = new Array();
		
		
		for(var i=_root.rowAmount-_root.rowAmountForRandomStones; i< _root.rowAmount; i++){
			allRowNumbersStraightArray_STARS.push(i);
			
		}// end for 1
	}
	
	
	
	
	
	
	
	
	private function makeAnSortedArray(){
			allColumnNumbersStraightArray = undefined;
			allColumnNumbersStraightArray = new Array();
		
		
		for(var i = 0;i<_root.columnAmount;i++){
			allColumnNumbersStraightArray.push(i);
			
		}// end for 1
				
	}// end 
	
	
	
	
	
	
	
	
	
}// end class CreateRandomStoneMapWithStars extends MovieClip{