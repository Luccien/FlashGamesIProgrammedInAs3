class Return_2_D_ArrayWithEntries
	{

private var two_dimensional_Array:Array;




public function return_2_D_Array(verticalEntries:Number,horizontalEntries:Number){
		
		
		two_dimensional_Array = new Array(verticalEntries);
		
		for(var i=0; i<verticalEntries; i++) {
 			two_dimensional_Array[i] = new Array(horizontalEntries);
 			for(var j=0; j<horizontalEntries; j++) {
  				
				
				two_dimensional_Array[i][j] = 0;//i+"-"+j;
 				
				
			} // end for
		} // end for 
		
		//trace(two_dimensional_Array);
		return two_dimensional_Array;
		
	}// end return_2_D_Array





}// end class