class Mix_Remaining_Tiles_WITHOUTmixingToPreventTileErrors extends MovieClip{
	
	private var tile:MovieClip;
	
	
	public function mixTiles(){
		
		trace("okkkkk");
		// delete the gridLevelArrays // make them new at the end
		for(var i=1;i<_root.theHighestHightLevel+1;i++){
			//_root["level_" + (theHightlevel_P + 1) + "_Two_Dimensional_Array "];
			_root.myPlaceMahjongTiles_From_Template.makeEptyGrid_Level_Array(i-1);
			//trace(_root["level_" + i  + "_Two_Dimensional_Array "]);// = undefined;
		}
		
		
		
		//var _root.myRandomNumberArray.randomNumberArrayFromZeroToN(_root.allTilesArray.length);
		var tileNumberList_in_Order = new Array();
		
		
		for(var i = 1; i< _root.allTilesArray.length+1; i++){
			tile = _root.allMahjongTiles_Clip["tileClip"+i]; 
			//trace(tile); // 84
			
			// if this tile still exists
			if(tile){
				tileNumberList_in_Order.push(tile.myNumber);
			}
			
		}// end for
		//trace(tileNumberList_in_Order);
		
		
		// make random array to change the order of the tiles
		var randomNumberArray = _root.myRandomNumberArray.randomNumberArrayFromZeroToN(tileNumberList_in_Order.length);
		
		for(var i = 0; i< tileNumberList_in_Order.length; i++){
			// make the tile values of tile 2  temporary  values of tile 1
			var tile_1 = _root.allMahjongTiles_Clip["tileClip"+tileNumberList_in_Order[  i  ]    ]; 
			//  CHANGED 09-05-25 var tile_2 = _root.allMahjongTiles_Clip["tileClip"+tileNumberList_in_Order[   randomNumberArray[i]    ]   ];
			var tile_2 = _root.allMahjongTiles_Clip["tileClip"+tileNumberList_in_Order[   [i]    ]   ];
			
			
			
			tile_1.myDepth_TEMP = tile_2.getDepth();
			tile_2.swapDepths(_root.allMahjongTiles_Clip.getNextHighestDepth());
			
			tile_1.myX_TEMP = tile_2._x;
			tile_1.myY_TEMP = tile_2._y;
			tile_1.myRow_TEMP = tile_2.myRow;
			tile_1.myColumn_TEMP = tile_2.myColumn;
			tile_1.myHightlevel_TEMP = tile_2.myHightlevel;
			//tile_1.myDesignTyp_TEMP = tile_2.myDesignTyp;
			//tile_1.mySelf_TEMP = tile_2.mySelf;
			//tile_1.myNumber_TEMP = tile_2.myNumber;
		}// end for
		
		// change the the temp values now
		for(var i = 0; i< tileNumberList_in_Order.length; i++){
			var tile_1 = _root.allMahjongTiles_Clip["tileClip"+tileNumberList_in_Order[  i  ]    ]; 
			
			tile_1.swapDepths(tile_1.myDepth_TEMP);
			tile_1._x = tile_1.myX_TEMP;
			tile_1._y = tile_1.myY_TEMP;
			
			tile_1.myRow 			= tile_1.myRow_TEMP;
			tile_1.myColumn 		= tile_1.myColumn_TEMP;
			tile_1.myHightlevel 	= tile_1.myHightlevel_TEMP;
			//tile_1.myDesignTyp 		= tile_1.myDesignTyp_TEMP
			//tile_1.mySelf 			= tile_1.mySelf_TEMP; // the button need to stay itself
			//tile_1.myNumber 		= tile_1.myNumber_TEMP;
			
			
			// place each tile back in the tileLevelGridArray  // tileArrays are cleared with the start of this function
			_root.myPlaceMahjongTiles_From_Template.placeTheTileInTheGridArray(tile_1.myRow ,tile_1.myColumn,tile_1.myNumber ,tile_1.myHightlevel);
			
			//var two_dimensional_Array = _root["level_" + (theHightlevel_P + 1) + "_Two_Dimensional_Array "];
			
		
		}// end for
			
	
	
	
	}// end public function mixTiles
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}// end Mix_Remaining_Tiles