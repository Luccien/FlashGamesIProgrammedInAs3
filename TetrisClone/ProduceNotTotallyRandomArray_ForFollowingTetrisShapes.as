class ProduceNotTotallyRandomArray_ForFollowingTetrisShapes{	
	
	private var mySendORDEREDarray_ReturnsRANDOMarray:SendORDEREDarray_ReturnsRANDOMarray; 
	private var howManyTimesTheSameShapePossible:Number;
	private var howManyShapes:Number;
	private var theNextTetrisShapeNumber_array_InOrder:Array;
	
	// KONSTRUKTOR
	public function ProduceNotTotallyRandomArray_ForFollowingTetrisShapes(){
		mySendORDEREDarray_ReturnsRANDOMarray = new SendORDEREDarray_ReturnsRANDOMarray(); 
		howManyTimesTheSameShapePossible = 3; // 3
		howManyShapes = 7;
		theNextTetrisShapeNumber_array_InOrder = new Array();
		
		makeAnSortedArray();
		trace(theNextTetrisShapeNumber_array_InOrder + " ordered array");
		//_root.theNextTetrisShapeNumber_array_RANDOM = myRandomNumberArray(theNextTetrisShapeNumber_array_InOrder.length);
		_root.theNextTetrisShapeNumber_array_RANDOM = mySendORDEREDarray_ReturnsRANDOMarray.returnMeRandomArray(theNextTetrisShapeNumber_array_InOrder);
		trace(_root.theNextTetrisShapeNumber_array_RANDOM +  " random Order");
		
		
		//trace(theNextTetrisShapeNumber_array_InOrder + " ordered array")
	}// KONSTRUKTOR
	
	
	public function produceNewArrayIfAllNumbersAreUsed(){
		
		makeAnSortedArray();
		trace(theNextTetrisShapeNumber_array_InOrder + " ordered array");
		//_root.theNextTetrisShapeNumber_array_RANDOM = myRandomNumberArray(theNextTetrisShapeNumber_array_InOrder.length);
		_root.theNextTetrisShapeNumber_array_RANDOM = mySendORDEREDarray_ReturnsRANDOMarray.returnMeRandomArray(theNextTetrisShapeNumber_array_InOrder);
		trace(_root.theNextTetrisShapeNumber_array_RANDOM +  " random Order");
		
		
	}
	
	
	
	
	private function makeAnSortedArray(){
		for(var i = 0;i<howManyTimesTheSameShapePossible;i++){
			
			// there are seven shapes from 1-7
			for(var j=1;j < howManyShapes+1; j++){
				theNextTetrisShapeNumber_array_InOrder.push(j)
				
			}// end for 2
			
			
		}// end for 1
				
	}// end 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}// end class