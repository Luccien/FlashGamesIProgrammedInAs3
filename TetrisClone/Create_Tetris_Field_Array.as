class Create_Tetris_Field_Array extends MovieClip{
	
	
	
	// here the fild with startx , starty is created an also the array to move the stones
	public function Create_Tetris_Field_Array(){
		
		// make visible tetris field the right side
		//_root.field_Tetris_Clip._width = _root.columnAmount * _root.stone_lenght;
		//_root.field_Tetris_Clip._height = _root.rowAmount * _root.stone_height;
		trace(_root.columnAmount * _root.stone_lenght  + " field width");
		trace(_root.rowAmount * _root.stone_height +  " field height");
		
		
		
		
		
		
		// create 2-D Array for the Tetris Game:
		_root.two_D_Field_Array = new Array();
		
		for(var i = 0;i<_root.rowAmount;i++){
			//for(var j = 0;j<_root.rowAmount;j++){
			var inner_Array = new Array(_root.columnAmount);
			_root.two_D_Field_Array.push(inner_Array);
			for(var j = 0;j<_root.columnAmount;j++){
				_root.two_D_Field_Array[i][j] = 0;
			}// end for 
			
		}// end for 1
		
		
		
		
		
		
		
		
		//trace(_root.two_D_Field_Array + "    _root.two_D_Field_Array");
		
				
	}// end KONSTRUKTOR

	
	
	
/*			
_root.rowAmount = 20;
_root.columnAmount = 10;

_root.stone_lenght = 15;
_root.stone_height = 15;
_root.previewX = 300;
_root.previewY = 300;
_root.stoneInPreviewX = 30;
_root.stoneInPreviewY = 3;
*/		
		
	//}// end public function Create_Tetris_Field_Array()
	
	
	
	
	
	
	
	
	
	
}// end class create_Tetris_Field_Array extends MovieClip{