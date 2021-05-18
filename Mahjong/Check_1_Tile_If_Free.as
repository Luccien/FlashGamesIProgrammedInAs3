class Check_1_Tile_If_Free extends MovieClip{
	
		

		
		
		
	public function checkTile(row_P:Number,column_P:Number,level_P:Number):Boolean{
	
			
		//  1)  check if there is a tile above
		// if tile is not free the function stops
		if( checkTilesAbove_Free(row_P,column_P,level_P) == false){
			// tiele is not free
			return false;
		}
		
		//   2) check if there is a tile left
		else if( checkTiles_Left_Or_Right_Free(row_P,column_P,level_P) == false){
			// tile is not free
			return false;
		}
		else{
			// the tile is free
			return true;
		}
			
		
	}// end public function checkTile():Boolean
	
	

	
	
	
	// ABOVE
	private function checkTilesAbove_Free(row_P:Number,column_P:Number,level_P:Number):Boolean{
	
		var level_Above_two_dimensional_Array = _root["level_" + (level_P + 2) + "_Two_Dimensional_Array "];
		//trace(two_dimensional_Array[this.myrow_P][this.myColumn]);	
		
		
		// one tile consists of 4 quadrants starting with the quadrant in the up left
		//  up left quadrant
		if(level_Above_two_dimensional_Array[row_P][column_P] != "" ){ // || level_Above_two_dimensional_Array[row_P][column_P] != undefined){
			// there is at least one tile which is above // not free
			//trace("1   " + level_Above_two_dimensional_Array[row_P][column_P]);
			return false;
		
		}
		//  up  right quadrant 
		else if(level_Above_two_dimensional_Array[row_P][column_P+1] != "" ){ //|| level_Above_two_dimensional_Array[row_P][column_P+1] == undefined){
			// there is at least one tile which is above
			//trace("2   "  + level_Above_two_dimensional_Array[row_P][column_P+1]);
			return false;
		
		}
		// down left
		else if(level_Above_two_dimensional_Array[row_P+1][column_P] != ""){  // || level_Above_two_dimensional_Array[row_P+1][column_P] == undefined){
			// there is at least one tile which is above
			//trace("3");
			return false;
		
		}
		// down right
		else if(level_Above_two_dimensional_Array[row_P+1][column_P+1] != ""){// || level_Above_two_dimensional_Array[row_P+1][column_P+1] == undefined){
			// there is at least one tile which is above
			//trace("4");
			return false;
		
		}
		
		else{
			// the tile is free
			return true;
		}
		
		
		
	
	}// end checkTilesAbove_Free
	
	
	
	
	
	
	
	// LEFT RIGHT
	private function checkTiles_Left_Or_Right_Free(row_P:Number,column_P:Number,level_P:Number){
		var two_dimensional_Array = _root["level_" + (level_P + 1) + "_Two_Dimensional_Array "];
		
		
		
		// LEFT
		// one tile consists of 4 quadrants starting with the quadrant in the up left
		//  up left quadrant
		if(two_dimensional_Array[row_P][column_P-1] != ""){
			// there is at least one tile which is above // not free
			//return false;     // her it would stop the function but it needs to check the RIGHT side too 
		
		}
		//  down left quadrant
		else if(two_dimensional_Array[row_P+1][column_P-1] != ""){
			// there is at least one tile which is above // not free
			//return false;     // her it would stop the function but it needs to check the RIGHT side too 
		
		}
		else{
			// the tile is free
			//-------
			// here it sets the direction for which way the tile has to slide out ...
			//if(_root.secondTile_Is_Clickes == true){
				//_root.secondTileDirection = "Left";
			//}
			//else{
				_root.tileDirection = "Left";
			//}
			//-------
			
			
			return true;
			
		}
		
		
		
		
		// RIGHT
		// one tile consists of 4 quadrants starting with the quadrant in the up left
		//  up right quadrant
		if(two_dimensional_Array[row_P][column_P+2] != ""){
			// there is at least one tile which is above // not free
			return false;
		
		}
		//  down right quadrant
		if(two_dimensional_Array[row_P+1][column_P+2] != ""){
			// there is at least one tile which is above // not free
			return false;
		
		}
		
		else{
			// the tile is free
			//-------
			// here it sets the direction for which way the tile has to slide out ...
			//if(_root.secondTile_Is_Clickes == true){
				//_root.secondTileDirection = "Right";
			//}
			//else{
				_root.tileDirection = "Right";
			//}
			//-------
			
			return true;
			
		}
		
		
		
		
		
	}// end private function checkTiles_Left_Or_Right_Free(row_P_P:Number,column_P:Number,level_P:Number){
	
	
	
	
	
	

	
	
}// end class Check_1_Tile_If_Free extends MovieClip