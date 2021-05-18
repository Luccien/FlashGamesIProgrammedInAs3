

import flash.display.BitmapData;
class PlaceMahjongTiles_From_Template extends MovieClip{
	
	
	private var counter:Number;
	// put all mahjong tiles in a movieclip to possibly move the whole movieclip
	private var allMahjongTiles_Clip:MovieClip;
	
	
	private var imageBmp:BitmapData;
	private var imageClip:MovieClip;
	private var two_dimensional_Array:Array;
			
	//private var levelTilesArray:Array;
	private var arrayIndex:Number;
	private var row:Number;
	private var column:Number;
	private var tile:MovieClip;
	private var currentTileUpperLeft_quadrant:Number;
	
	private var theHightlevel:Number; 
	private var tileNumber:Number = 0;
	//private var randomNumber:Number;
	
	private var tilesDesignNumber:Number; /// !!!!!!
	
	private var tileStapelHight:Number;
	private var arrayTileNumber:Number;
			
	private var allDistances:Array = new Array();
	
	
	public function PlaceMahjongTiles_From_Template(){
		allMahjongTiles_Clip = _root.createEmptyMovieClip("allMahjongTiles_Clip",1); 
		
		
		// the mahjong field is devided into places(quadrants) 
		// to have half steps up/down left/right , each tile(mahjonstone) is placed on 4 places(quadrants)   
	
		// quadrants are more flexible than x,y coordinates because it allows different scales between the game and editor
		// the quadrant hight is = the tiles hight / 2 (devided by 2)
		// the quadrant length is = the tiles length / 2 (devided by 2)  
	
	
		// zum testen root variable: max quadrant werte werte , ------------------------------------------>  for testing
		_root.quadrant_Max_Horizontally = 12*2; // testing  // double the possible tiles  ----> should be delivered with all tiles array (from editor)
		_root.quadrant_Max_Vertically = 8*2; // testing     // double the possible tiles  ----->   "   "  "  "
	
		_root.startX = 3;
		_root.startY = 3;
		
		//_root.tileTotallNumber = 10;
		
		
		_root.tileSpacingForUpperTiles_X = -5;    // X spacing
		_root.tileSpacingForUpperTiles_Y = -5;	// Y spacing
	
		_root.maxTileStapelHight = 30;
		
		
		_root.tile_Length = 33;
		_root.tile_Hight = 45;
	
		/*
		_root.allTilesArray  = [
								1048,
								1065,1067,1069,1071,1073,1075,1077,1079
								
								
								];  // 48 ging nicht??
		
		*/
		
		
		/// !!!!!!!!!!!!!!!  
		/*
		_root.allTilesArray  = [1001,1003,1005,1007,1009,1011,1013,1015,
								1033,1035,1037,1039,1041,1043,1046,1048,
								1065,1067,1069,1071,1073,1075,1077,1079,
								1097,1099,1101,1103,1105,1107,1109,1111,
								
								1133,1135,1137,1139,1141,1143,1145,1147,
								1165,1167,1169,1171,1173,1175,1177,1179,
								1197,1199,								
								
								3141,4141,5141,6141,7141,8141,
								
								2013,2015,
								2048,
								2065,2067,2069,2071,2077,2079,
								2097,2099,2101,2105,2107,2111
								
								,
								2133,2135,2137,2143,2145,2147,
								2165,2173,2175,2177,2179,
								2197,2199
								
								
								
								
								
								];  // 48 ging nicht??
		
								*/
								
								
								
								
								
								//2033,2035,2039,2041,2043,2046,
								
								
								/*
								2013,2015,
								2033,2035,2039,2041,2043,2046,2048,
								2065,2067,2069,2071,2077,2079,
								2097,2099,2101,2105,2107,2111
								
								,
								2133,2135,2137,2143,2145,2147,
								2165,2173,2175,2177,2179,
								2197,2199
		
								*/
		
		
		
		
		
		trace(_root.allTilesArray.length +  " length ---");
		//_root.tile_DesignList_RANDOM   is produced    in  produceRandomTileDesignList
 		//_root.tile_DesignList_inOrder  <--- the origin from the xml or other template
		
		//---------------------------------------------------------------------------------------------------> for testing
	
	
	}// end PlaceMahjongTiles_From_Template()
	
	
	
	
	
	

	





public function goThroughTilesArray_first(){
		for(var i = 0; i< _root.allTilesArray.length; i++){
			arrayIndex = i;
			placeMahjongTiles_second();
		}
		
		// find out the highest level and make an levelArray above that // otherwise the highest is undefined and doesnot work
		makeEptyGrid_Level_Array(_root.theHighestHightLevel+1);
				
		attachButtonFunctions();
		
		_root.startScreen.startGame.onPress = function() {
			_root.myClock.startClock();
			_root.startScreen._visible = false;
	
		}

				
}// end goThroughLevelArray_second()
	



public function attachButtonFunctions(){
	
		// array to look for possible pairs (if there are no pairs ,   suggest to remix)
		//var remixCheck_Array = new Array();
		var remixCheck_Array_Numbers = new Array();
		var remixCheck_Array_Types = new Array();
		var remixCheck_Array_Types_ToSort = new Array();
		_root.klickableTilesAmount = 0;
		
		// **************// run throug all tiles and attach onPress 
		for(var i = 1; i< _root.allTilesArray.length +1; i++){
			
			tile = _root.allMahjongTiles_Clip["tileClip"+i];
			//  !!!tile.attachMovie("mouseRollOverAlpha","mouseRollOverAlpha",3);
			
			
			if(_root.myCheck_1_Tile_If_Free.checkTile(tile.myRow,tile.myColumn,tile.myHightlevel) == false){
				 delete tile.button.onRollOver;
				 delete tile.button.onRollOut;
				 delete tile.button.onReleaseOutside;
				 delete tile.button.onPress;
			}
			else{
			// fill all free tiles in this array // when all free tiles are saved in the array // look for 
			remixCheck_Array_Numbers.push(tile.myNumber);
			remixCheck_Array_Types.push(tile.myDesignTyp);
			remixCheck_Array_Types_ToSort.push(tile.myDesignTyp);
			
			// count the clickable tiles
			_root.klickableTilesAmount++;
			
			tile.button.onRollOver = function(){
				//trace(_parent.mySelf +  "   this.mySelf");
				_parent.mySelf.mouseRollOverAlpha._alpha = 40;
				
				
				//--------------------------------------- 
				_root.onRollOver_showTile.removeMovieClip();
				imageBmp = BitmapData.loadBitmap("tile"); 
	
				tile = _root.createEmptyMovieClip("onRollOver_showTile", _root.getNextHighestDepth()); 
				tile.attachBitmap(imageBmp, 1);
	
				//  OLD  tilesDesignNumber = 1; // !!!! random !!!  mak it random ................ !!!! !!!!  !!!!    <---------------------------- here
				//  OLD imageBmp = BitmapData.loadBitmap("tilesDesign" + tilesDesignNumber); 
				//imageBmp = BitmapData.loadBitmap(_root.tile_DesignList_RANDOM[(tileNumber-1)]);
				imageBmp = BitmapData.loadBitmap(_parent.mySelf.myDesignTyp);
				tile.attachBitmap(imageBmp, 2);
				
				tile._x = _root.onRollOver_showTile_X;
				tile._y = _root.onRollOver_showTile_Y;
				
				
				// score for the tile
				// find the Array index number to find the right score
				for(var i= 0;i<_root.tile_SymbolTypList.length;i++){
					if(_root.tile_SymbolTypList[i] == _parent.mySelf.myDesignTyp){
						var tileIndex = i;
						// end the loop
						i = _root.tile_SymbolTypList.length + 1000;
					}
				}
		
				//_root.score += Number(_root.tile_Score_List[tileIndex]);
				_root.show_Score_For_The_Tile = Number(_root.tile_Score_List[tileIndex]) + " " +_root.points_Text ;
				
				//_root.tile_Score_List
				//_root.show_Score_For_The_Tile = _root.tile_DesignList_RANDOM[(_parent.mySelf.myNumber-1)]; 
				//_parent.mySelf.myNumber;
				//tile1.myDesignTyp
				
				//tile.attachMovie("mouseRollOverAlpha","mouseRollOverAlpha",3);
				//----------------------------------------
				
				
				
			}// end on ROllOver
			tile.button.onRollOut = function(){
				_parent.mySelf.mouseRollOverAlpha._alpha = 0;
				_root.onRollOver_showTile.removeMovieClip();
				_root.show_Score_For_The_Tile = "";
			}// end on ROllOut
			tile.button.onReleaseOutside = function(){
				_parent.mySelf.mouseRollOverAlpha._alpha = 0;
				_root.onRollOver_showTile.removeMovieClip();
				_root.show_Score_For_The_Tile = "";
			}// end on ROllOut
			//tile.onPress = function(){
				//	this.mySelf.mouseRollOverAlpha._alpha = 0;
			//}// end on ROllOut
	
			tile.button.onPress = function(){
				trace(_parent._x);
				trace(_parent._y);
				
				// this works so it is possible to find out about if there are tiles next or obove
				/*trace("------------");
				trace(_parent.mySelf.myNumber );
				var two_dimensional_Array = _root["level_" + (_parent.mySelf.myHightlevel + 1) + "_Two_Dimensional_Array "];
				trace(two_dimensional_Array[_parent.mySelf.myRow][_parent.mySelf.myColumn]);	
				trace("------------");
				*/
				
				
				
				
				// ----------- new
				if(_root.first_Clicked_Tile_Number ==""){
					_root.first_Clicked_Tile_Number = _parent.mySelf.myNumber;
					//tile1.lastClickedTile._alpha = 50;
					var tile1 = _root.allMahjongTiles_Clip["tileClip"+_root.first_Clicked_Tile_Number];
					tile1.lastClickedTile._alpha = 50;
				}
				else if(_root.second_Clicked_Tile_Number ==""){
					_root.second_Clicked_Tile_Number = _parent.mySelf.myNumber;
					_root.myPlaceMahjongTiles_From_Template.removeTheFoundTiles();//_parent.mySelf.myNumber);
					//tile1.lastClickedTile._alpha = 50;
					
					
				
				}
				else{
					_root.first_Clicked_Tile_Number = _root.second_Clicked_Tile_Number;//this.myNumber;
					_root.second_Clicked_Tile_Number = _parent.mySelf.myNumber;
					
					
					_root.myPlaceMahjongTiles_From_Template.removeTheFoundTiles();//_parent.mySelf.myNumber);
				  ///// ---------- here :::::::
				
				} // END ELSE 	!!!!!!!!!!!
				
				
				// ------------ new
				
			
			
			
			}
	
			//*****************
		
		}// end if(_root.myCheck_1_Tile_If_Free.checkTile(tile.myRow,tile.myColumn,tile.myHightlevel == true){
		
		
		
		} // end for
		// **************//

	
	
	//**************************************
	// check now for doubled Types
	//remixCheck_Array_Numbers.push(i);
	
	// in order means alphabetic order
	var remixCheck_Array_TypesInOrder = remixCheck_Array_Types_ToSort.sort();
	trace(remixCheck_Array_TypesInOrder  +  "       remixCheck_Array_TypesInOrder");
	trace(remixCheck_Array_Types  +  "       remixCheck_Array_Types");
	
	
	// run throug sorted array and look for doubles 
	var noPair = true;
	for(var i = 0; i < remixCheck_Array_TypesInOrder.length ;i++){
		
		
		if(remixCheck_Array_TypesInOrder[i] == remixCheck_Array_TypesInOrder[i +1]){
			// stop and save at first pair
			var thePair_TypNumber = remixCheck_Array_TypesInOrder[i];
			var noPair = false;
			i = remixCheck_Array_TypesInOrder.length +100;
		}
		
	}
	
	trace(thePair_TypNumber + "  thePair_TypNumber");
	// stop run if there are no pairs ... if(i == remixCheck_Array_TypesInOrder.length)
	trace(noPair);
	
	if(noPair == true){
		/// if -----------------------------------------------!!!!!!!!!!!!! --------------->  if it is only 1 button than the other tiles must be under each other 
		//--------------------- >  no reshufle becouse it is not possible to make more reshufles
		
		if(_root.klickableTilesAmount == 1){
			if(_root.score < 0){
				_root.score = 0;
			}
			delete _root.the_clock_Clip.onEnterFrame;
			_root.stopTime = getTimer()/1000;
			_root.reshufleClip.swapDepths(_root.getNextHighestDepth);// = true;
			_root.reshufleClip._visible = true;
			_root.reshufleClip.gotoAndStop(3);
			delete _root.the_clock_Clip.onEnterFrame;
			_root.delete_All_TileButtons();
			delete _root.tip_Button.onRelease;
			delete _root.mixButton.onRelease;
			_root.tip_Button._visible = false;
			_root.mixButton._visible = false;
			//_root.endScreen.swapDepths(_root.getNextHighestDepth());
			// stop time
			delete _root.the_clock_Clip.onEnterFrame;
			
			
		}else{
		//-------------	
			delete _root.the_clock_Clip.onEnterFrame;
			_root.stopTime = getTimer()/1000;
			
			_root.reshufleClip.swapDepths(_root.getNextHighestDepth);// = true;
			_root.reshufleClip._visible = true;
		if(_root.howManyTimesReshufle < 1){
			if(_root.score < 0){
				_root.score = 0;
			}
			
			
			_root.reshufleClip.gotoAndStop(2);
			_root.delete_All_TileButtons();
			delete _root.tip_Button.onRelease;
			delete _root.mixButton.onRelease;
			_root.tip_Button._visible = false;
			_root.mixButton._visible = false;
			//_root.endScreen.swapDepths(_root.getNextHighestDepth());
			// stop time
			delete _root.the_clock_Clip.onEnterFrame;
		}
		//------------
		}// end else
		
		
		_root.howManyTimesReshufle--;
	
	
	
	}  // end if(noPair == true){
	
	trace(remixCheck_Array_Numbers + "    remixCheck_Array_Numbers");
	
	if(noPair == false){
		var counter = 0;
		// run throug unsorted array to find both tile - pair positions
		for(var i = 0; i < remixCheck_Array_TypesInOrder.length +1;i++){
		
		
		if(remixCheck_Array_Types[i] == thePair_TypNumber){
			counter++;
			_root["tip"+counter] = remixCheck_Array_Numbers[i];
			trace(i +  "   counter");
			
			//if(counter == 2){
				//i = remixCheck_Array_TypesInOrder.length +1;
				//}
			}
		}// end for
		// store tile numbers // to have them with tip
	
	}// end if  // if(noPair == false){
		//**************************************
	
	
	
	
	
	
}// end public function attachButtonFunctions()




public function removeTheFoundTiles(){//secondTileNumber:Number){
	
		
					
					
					//_root.second_Clicked_Tile_Number = secondTileNumber;//_parent.mySelf.myNumber;
					//trace(secondTileNumber  + "   secondTileNumber");
					// compare both tiles
					var tile1 = _root.allMahjongTiles_Clip["tileClip"+_root.first_Clicked_Tile_Number];
					var tile2 = _root.allMahjongTiles_Clip["tileClip"+_root.second_Clicked_Tile_Number];
					
					if(tile1.myDesignTyp == tile2.myDesignTyp & tile1.myNumber != tile2.myNumber){
						_root.onRollOver_showTile.removeMovieClip();
						_root.show_Score_For_The_Tile = "";
						
						
						
						var two_dimensional_Array = _root["level_" + (tile1.myHightlevel + 1) + "_Two_Dimensional_Array "];
						// one tile consists of 4 quadrants starting with the quadrant in the up left
						//  up left quadrant
						two_dimensional_Array[tile1.myRow][tile1.myColumn] = "";
						//  up  right quadrant 
						two_dimensional_Array[tile1.myRow][tile1.myColumn+1] = "";
						// down left
						two_dimensional_Array[tile1.myRow+1][tile1.myColumn] = "";
						// down right
						two_dimensional_Array[tile1.myRow+1][tile1.myColumn+1] = "";
						//tile1.removeMovieClip();
						
						
						var two_dimensional_Array = _root["level_" + (tile2.myHightlevel + 1) + "_Two_Dimensional_Array "];
						// one tile consists of 4 quadrants starting with the quadrant in the up left
						//  up left quadrant
						two_dimensional_Array[tile2.myRow][tile2.myColumn] = "";
						//  up  right quadrant 
						two_dimensional_Array[tile2.myRow][tile2.myColumn+1] = "";
						// down left
						two_dimensional_Array[tile2.myRow+1][tile2.myColumn] = "";
						// down right
						two_dimensional_Array[tile2.myRow+1][tile2.myColumn+1] = "";
						//tile2.removeMovieClip();
						
						//++++++++++++++++++
					
					//Check_1_Tile_If_Free.checkTile(row_P:Number,column_P:Number,level_P:Number)
					
					if(_root.myCheck_1_Tile_If_Free.checkTile(tile1.myRow,tile1.myColumn,tile1.myHightlevel) == true){
				 		//trace("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
						
						//delete tile1.button.onRollOver;
				 		//delete tile1.button.onRollOut;
				 		//delete tile1.button.onReleaseOutside;
				 		//delete tile1.button.onPress;
						// add score points relating to tile type //
						// _root.tileDirection is set by function : myCheck_1_Tile_If_Free.checkTile
						//---------------- make new tile 
						imageBmp = BitmapData.loadBitmap("tile"); 
						_root.tileClip_New_Counter++;
						var tile_New_1 = _root.allMahjongTiles_Clip.createEmptyMovieClip("tileClip_New" + _root.tileClip_New_Counter, _root.allMahjongTiles_Clip.getNextHighestDepth()); 
						tile_New_1.attachBitmap(imageBmp, 1);
						imageBmp = BitmapData.loadBitmap(tile2.myDesignTyp);
						tile_New_1.attachBitmap(imageBmp, 2);
						
						
						
						
						tile_New_1.myX = tile1._x;
						tile_New_1.myY = tile1._y;
						tile_New_1.myNewDepth = tile1.getDepth();
						tile_New_1.counter = 0;
						tile_New_1.myDesignTyp = tile1.myDesignTyp;
						
						// delete old tile
						tile1.removeMovieClip();
						tile_New_1._x = tile_New_1.myX
						tile_New_1._y = tile_New_1.myY
						tile_New_1.swapDepths(tile_New_1.myNewDepth);
						// -------------- make new tile
						
						
						
						
						
						
						if(_root.tileDirection == "Right"){
							tile_New_1.onEnterFrame = fadOut_Right;//_root.myPlaceMahjongTiles_From_Template.fadOut_Right();
						}
						else{
							tile_New_1.onEnterFrame = fadOut_Left;
						}
					}
					
					
					
					
					
					//---
					if(_root.myCheck_1_Tile_If_Free.checkTile(tile2.myRow,tile2.myColumn,tile2.myHightlevel) == true){
				 		trace("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
						
						//delete tile2.button.onRollOver;
				 		//delete tile2.button.onRollOut;
				 		//delete tile2.button.onReleaseOutside;
				 		//delete tile2.button.onPress;
						// add score points relating to tile type //
						// _root.tileDirection is set by function : myCheck_1_Tile_If_Free.checkTile
						
						//---------------- make new tile 
						imageBmp = BitmapData.loadBitmap("tile"); 
						_root.tileClip_New_Counter++;
						var tile_New_2 = _root.allMahjongTiles_Clip.createEmptyMovieClip("tileClip_New" + _root.tileClip_New_Counter, _root.allMahjongTiles_Clip.getNextHighestDepth()); 
						tile_New_2.attachBitmap(imageBmp, 1);
						imageBmp = BitmapData.loadBitmap(tile2.myDesignTyp);
						tile_New_2.attachBitmap(imageBmp, 2);
								
						tile_New_2.myX = tile2._x;
						tile_New_2.myY = tile2._y;
						tile_New_2.myNewDepth = tile2.getDepth();
						tile_New_2.counter = 0;
						tile_New_2.myDesignTyp = tile2.myDesignTyp;
						// delete old tile
						tile2.removeMovieClip();
						tile_New_2._x = tile_New_2.myX
						tile_New_2._y = tile_New_2.myY
						tile_New_2.swapDepths(tile_New_2.myNewDepth);
						// -------------- make new tile
						
						// CALCULATE SCORE ***********************************
						addScore(tile_New_2.myDesignTyp, tile_New_1._x, tile_New_1._y, tile_New_2._x,tile_New_2._y);     
						//---------------- ************************************
						
						
						if(_root.tileDirection == "Right"){
							tile_New_2.onEnterFrame = fadOut_Right;//_root.myPlaceMahjongTiles_From_Template.fadOut_Right();
						}
						else{
							tile_New_2.onEnterFrame = fadOut_Left;
						}
					}
					//++++++++++++++++++++++++++++++++++++
	

						
						
						
						
						_root.myPlaceMahjongTiles_From_Template.attachButtonFunctions();
					}// end if(tile1.myDesignTyp == tile2.myDesignTyp & tile1.myNumber != tile2.myNumber){
					// if the tiles does not match
					else{
						tile1.lastClickedTile._alpha = 0;
						tile2.lastClickedTile._alpha = 50;
					//tile1.lastClickedTile._alpha = 50;
					
					}
					
					
					// accidently clicked the same tile ends in deleting the second click
					if(tile1.myNumber == tile2.myNumber){
						// new
						tile1.lastClickedTile._alpha = 0;
						tile2.lastClickedTile._alpha = 0;
						//---
						
						_root.second_Clicked_Tile_Number ="";
						
						//new
						_root.first_Clicked_Tile_Number ="";
						//--
					}
					
						
}// end removeTheFoundTiles()



private function fadOut_Right(){
	trace("rrrrrrrrrrrrrrrrrrrrrrrr");
	
	this._x += _root.fadOutSpeed_X;
	this._alpha -=_root.fadOutSpeed_alpha;
	this.counter++;
	if(this.counter > _root.fadOutSpeed_Time){
		// score for the tile
		//_root.puzzleComplet = true;
		//this.myDesignTyp;
		
		
		this.removeMovieClip();
		delete this.onEnterFrame;
		
	}
	
	
}// end private function fadOut_Right()

private function fadOut_Left(){
	trace("lllllllllllllllllll");
	
	this._x -= _root.fadOutSpeed_X;
	this._alpha -=_root.fadOutSpeed_alpha;
	this.counter++;;
	if(this.counter > _root.fadOutSpeed_Time){
		
		// score for the tile
		//_root.puzzleComplet = true;
		
		this.removeMovieClip();
		delete this.onEnterFrame;
		
	}
	
	
}// end private function fadOut_Right()



//_root.allMahjongTiles_Clip.getNextHighestDepth()
//addScore(tile_New_2.myDesignTyp, tile_New_1._x, tile_New_1._y, tile_New_2._x,tile_New_2._y);     //scoreLittleOverTiles
private function addScore(tileDesign_P:String,tile_1_X:Number, tile_1_Y:Number, tile_2_X:Number,tile_2_Y:Number){
		// score for the tile
		// find the Array index number to find the right score
		for(var i= 0;i<_root.tile_SymbolTypList.length;i++){
			if(_root.tile_SymbolTypList[i] == tileDesign_P){
				var tileIndex = i;
				// end the loop
				i = _root.tile_SymbolTypList.length + 1000;
			}
		}
		
		_root.score += Number(_root.tile_Score_List[tileIndex]);
		
		// ---------------------------- new
		
		
		
		_root.pairsForBonus_Counter--;
		if(_root.pairsForBonus_Counter == 0){
			_root.pairsForBonus_Counter = _root.pairsForBonus;
			// restzeit zu dem score dazu
			_root.score += _root.zeit;
			_root.bonusClip.gotoAndPlay(2);
			_root.bonusClipText = _root.zeit;
			_root.bonusClip.swapDepths(_root.getNextHighestDepth());
		}
		
		//-- small bonusclips
		/*
		_root.scoreLittleOverTiles_Counter++;
		var smallBonusClip_1 = _root.allMahjongTiles_Clip.attachMovie("scoreLittleOverTiles","scoreLittleOverTiles" + _root.scoreLittleOverTiles_Counter,_root.allMahjongTiles_Clip.getNextHighestDepth());
		smallBonusClip_1.gotoAndPlay(1);
		smallBonusClip_1.scoreLittle.myScore.text =  String(_root.tile_Score_List[tileIndex]);
		smallBonusClip_1._x = tile_1_X;
		smallBonusClip_1._y = tile_1_Y;
		*/
		//--
		_root.scoreLittleOverTiles_Counter++;
		var smallBonusClip_2 = _root.allMahjongTiles_Clip.attachMovie("scoreLittleOverTiles","scoreLittleOverTiles" + _root.scoreLittleOverTiles_Counter,_root.allMahjongTiles_Clip.getNextHighestDepth());
		smallBonusClip_2.gotoAndPlay(1);
		smallBonusClip_2.scoreLittle.myScore.text =  String(_root.tile_Score_List[tileIndex]);
		smallBonusClip_2._x = tile_2_X;
		smallBonusClip_2._y = tile_2_Y;
		
		
		
		//-- small
		
		
		//---------------------------- new
		
		// look for end game :
		_root.tilesStillOnTheTable -=1;
		
		trace(_root.tilesStillOnTheTable + "       _root.tilesStillOnTheTable");
		if(_root.tilesStillOnTheTable == 0){
			_root.score +=_root.finishedBonus;
			
			
			
			
			if(_root.addRestTimeOnFinish == true){
				_root.puzzleComplet = true;
			}
			
			_root.reshufleClip._visible = false;
			_root.reshufleClip._x = 20000;
			
			//this.myDesignTyp;
			_root.finishGame();
		}
}// end private function addScore()



private function placeMahjongTiles_second(){
		
	//_root.quadrant_Max_Horizontally = 12*2; // testing  // double the possible tiles
	//_root.quadrant_Max_Vertically = 8*2;
		
	// the Rest from Modulo  23/ 24 = 0  bei 0 = last number  1/24  = 1  othervise the right number Example: trace(12 % 5);    // 2
	
	//-------------------------****
	//Example for how the quadrants are organized (the numbers are important for the tile depth)
	
	//&&&
	//-------
	// |1 17|
	// |2 18| 
	//-------
	//is one tile place with the number 1 (left up corner)// each tile has 4 quadrant numbers
	//&&&
	
	//--------
	//|1	17|	33 
	//|2	18|	34
	//--------	35	
	//3		19	36
	//4		20	37		
	//5		21	..
	//6		22	..
	//7		23	..
	//8		24
	//9		25
	//10	26	
	//11	27	
	//12	28	
	//13	29	
	//14	30	
	//15	31	
	//16	32
	//-----------------------****
	
	
	
	
	tileNumber++;
	//randomNumber = Math.round(Math.random()*_root.tileTotallNumber);
	
		
	//-------- find out the quadrant number without the level info 1000 2000 3000 4000 etc...**************
	var arrayTileNumber_Array = _root.allTilesArray[arrayIndex].split(",");;
	
	
	theHightlevel = Number(arrayTileNumber_Array[0]);
	
	/*
	for(var i = 0; i<_root.maxTileStapelHight; i++){
		arrayTileNumber -=1000;
		if(arrayTileNumber <1000){
			//tileStapelHight = i;
			theHightlevel = i;
			currentTileUpperLeft_quadrant = arrayTileNumber;
			////// trace(currentTileUpperLeft_quadrant + "  quadranteeee");
			
			// stop the for 
			i = _root.maxTileStapelHight +100;
		}
		
	}// end for
	//-------- *******************
	*/
	
	
	
	
	
	//************
	
	
	
	imageBmp = BitmapData.loadBitmap("tile"); 
	
	tile = _root.allMahjongTiles_Clip.createEmptyMovieClip("tileClip"+tileNumber, _root.allMahjongTiles_Clip.getNextHighestDepth() );//_root.allTilesArray[arrayIndex]); 
	tile.attachBitmap(imageBmp, 1);
	
	//  OLD  tilesDesignNumber = 1; // !!!! random !!!  mak it random ................ !!!! !!!!  !!!!    <---------------------------- here
	//  OLD imageBmp = BitmapData.loadBitmap("tilesDesign" + tilesDesignNumber); 
	imageBmp = BitmapData.loadBitmap(_root.tile_DesignList_RANDOM[(tileNumber-1)]);
	
	tile.attachBitmap(imageBmp, 2);
	tile.attachMovie("mouseRollOverAlpha","mouseRollOverAlpha",3);
	tile.attachMovie("tip_Clip","tip_Clip",4);
	
	
	tile.attachMovie("mouseLastClickedTile","lastClickedTile",5);
	tile.lastClickedTile._alpha = 0;
	
	tile.attachMovie("mouseRollOverDimensions","button",6);
	tile.button._alpha = 0;
	
	tile.mouseRollOverAlpha._alpha = 0;
	
	tile.myDesignTyp = _root.tile_DesignList_RANDOM[(tileNumber-1)];
	tile.mySelf = tile;
	tile.myNumber = tileNumber;
	
	
	
	
	/*
	tile.onRollOver = function(){
		this.mySelf.mouseRollOverAlpha._alpha = 40;
	}// end on ROllOver
	tile.onRollOut = function(){
		this.mySelf.mouseRollOverAlpha._alpha = 0;
	}// end on ROllOut
	tile.onReleaseOutside = function(){
		this.mySelf.mouseRollOverAlpha._alpha = 0;
	}// end on ROllOut
	//tile.onPress = function(){
	//	this.mySelf.mouseRollOverAlpha._alpha = 0;
	//}// end on ROllOut
	
	tile.onPress = function(){
		
		
		// this works so it is possible to find out about if there are tiles next or obove
		trace("------------");
		trace(this.myNumber );
		var two_dimensional_Array = _root["level_" + (this.myHightlevel + 1) + "_Two_Dimensional_Array "];
		trace(two_dimensional_Array[this.myRow][this.myColumn]);	
		trace("------------");
	}
	*/
	
	
	//*****************
	
	
		
	
	
	//*************************************
	// calculate the x and y position from the quadrant Information
	
	/// x related - column  // old
	/*column = Math.floor(currentTileUpperLeft_quadrant / _root.quadrant_Max_Vertically);
	column +=1;
	
	
	/// y related - row
	row =   currentTileUpperLeft_quadrant % _root.quadrant_Max_Vertically;
	if(row == 0){
		row = _root.quadrant_Max_Vertically; 
		column -=1;
	}*/  //OLD
		
	// new
	row = Number(arrayTileNumber_Array[1]);
	column = Number(arrayTileNumber_Array[2]);
	// new
		
	
	tile.myRow = row
	tile.myColumn = column;
	tile.myHightlevel = theHightlevel;
	
	
	tile._x = column *  (_root.tile_Length/2)   +     _root.startX 	+   _root.tileSpacingForUpperTiles_X * (theHightlevel - 1);
	
	tile._y = row * (_root.tile_Hight/2)        +      _root.startY	+   _root.tileSpacingForUpperTiles_Y * (theHightlevel - 1);
	//*************************************
	
	
	
	
	
	
	
	
	
	//1 *  (_root.tile_Length/2)   +
	//1 * (_root.tile_Hight/2)        +  
	// **************************************** Depth Change  *********************
	//_root.quadrant_Max_Horizontally = 12*2; // testing  // double the possible tiles  ----> should be delivered with all tiles array (from editor)
		//_root.quadrant_Max_Vertically = 8*2;
	//------------------------- get a new Depth for the tile (depth depends on the distance between the first tile in the left upper corner)
	
	//if it the tiles are not right above each other try to change - 203 (x) or -100 y ...
	// -103 has worked to
	var originX =   -203 *  (_root.tile_Length)     +   _root.startX 	+   _root.tileSpacingForUpperTiles_X * (theHightlevel - 1);
	var originY =    -100 * (_root.tile_Hight) + _root.startY	+   _root.tileSpacingForUpperTiles_Y * (theHightlevel - 1);
	
	
	// works with - 100
	//var originX =   -100 * 31     +   _root.startX 	+   _root.tileSpacingForUpperTiles_X * (theHightlevel - 1);
	//var originY =   -100 * 45 + _root.startY	+   _root.tileSpacingForUpperTiles_Y * (theHightlevel - 1);
	
	// calculate distance between the first and the tile right now
	var distance = Math.round(   Math.sqrt(  		(tile._x-originX)*(tile._x-originX) + (tile._y-originY)*(tile._y-originY)     	)        );
	//trace(distance  + "      dist..");
	
	///tile.swapDepths(distance);
	
	// ten thousend * theHightlevel(tile stapel) ///
	//---
	var depthChange = 100000 * (theHightlevel+1) + distance; 
	depthChange = String(depthChange);
	
	// to make sure that there is no other tile with the same Distance = add 2 string values to the number
	depthChange = depthChange + String(  Math.round(  Math.random()*8  )+1  )  +  String(  Math.round(  Math.random()*8  )+1  );
	// turn the string back to a number
	depthChange = Number(depthChange);
	//---
	
	
	// while loop to not ecidently place two tiles on the same depth
	while(_root.allMahjongTiles_Clip.getInstanceAtDepth(depthChange)){
		//---
		
		//trace("depthCHANGE ************************************************************");
		
		depthChange = 10000 * (theHightlevel+1) + distance; 
		depthChange = String(depthChange);
		// to make sure that there is no other tile with the same Distance = add 2 string values to the number
		depthChange = depthChange + String(  Math.round(  Math.random()*8  )+1  )  +  String(  Math.round(  Math.random()*8  )+1  );
		// turn the string back to a number
		depthChange = Number(depthChange);
		//---
		//depthChange = 100;
	}// end while
	
	trace("tileDepth = "  + depthChange);
	trace(tile);
	
	
	
	
	tile.swapDepths(depthChange);
	//trace(theHightlevel  +  "  hight");
	// to see the depth of the tiles
	//trace(depthChange  + "   change");
	// **************************************** Depth  Change *********************
	
	
	placeTheTileInTheGridArray(row,column,tileNumber,theHightlevel);
	
	
	if(theHightlevel > _root.theHighestHightLevel){
		_root.theHighestHightLevel = theHightlevel;
	}
	
	
	//_root.clockDepthTest = depthChange;
	
	
	
	
}// end  placeMahjongTiles_third()
	



/*
public function makeEptyGrid_Level_Array2(theHightlevel_P:Number){
	//----------------------------
	//---------------------------     level_1_two_dimensional_Array 
	
		
		/// !!!!!!!!!!!!!  +4   (_root.quadrant_Max_Vertically+4)   because  because while checking the edges ther would be fields with undefined !!!!!
		//two_dimensional_Array = _root["level_" + (theHightlevel_P + 1) + "_Two_Dimensional_Array "] = new Array(_root.quadrant_Max_Vertically+4);
		
		
		//_root.quadrant_Max_Horizontally = 12*2; // testing  // double the possible tiles  ----> should be delivered with all tiles array (from editor)
		//_root.quadrant_Max_Vertically = 8*2;
		
		for(var i=0; i<_root.quadrant_Max_Vertically+4; i++) {
 			//two_dimensional_Array[i] = new Array(_root.quadrant_Max_Horizontally+4);
 			for(var j=0; j<_root.quadrant_Max_Horizontally+4; j++) {
  				// attention index starts with 0 - so 24 indexes will stop with index number 23
				
				two_dimensional_Array[i][j] = "";//i +"-"+  j;
 				
				
			} // end for
		} // end for 
		
		
		//trace (two_dimensional_Array +   "     2darray");
	//} // end if(!two_dimensional_Array){
	
	
}// end private function makeEptyGrid_Level_Array()

*/




public function makeEptyGrid_Level_Array(theHightlevel_P:Number){
	//----------------------------
	//---------------------------     level_1_two_dimensional_Array 
	
		
		/// !!!!!!!!!!!!!  +4   (_root.quadrant_Max_Vertically+4)   because  because while checking the edges ther would be fields with undefined !!!!!
		two_dimensional_Array = _root["level_" + (theHightlevel_P + 1) + "_Two_Dimensional_Array "] = new Array(_root.quadrant_Max_Vertically+4);
		
		
		//_root.quadrant_Max_Horizontally = 12*2; // testing  // double the possible tiles  ----> should be delivered with all tiles array (from editor)
		//_root.quadrant_Max_Vertically = 8*2;
		
		for(var i=0; i<_root.quadrant_Max_Vertically+4; i++) {
 			two_dimensional_Array[i] = new Array(_root.quadrant_Max_Horizontally+4);
 			for(var j=0; j<_root.quadrant_Max_Horizontally+4; j++) {
  				// attention index starts with 0 - so 24 indexes will stop with index number 23
				
				two_dimensional_Array[i][j] = "";//i +"-"+  j;
 				
				
			} // end for
		} // end for 
		
		
		//trace (two_dimensional_Array +   "     2darray");
	//} // end if(!two_dimensional_Array){
	
	
}// end private function makeEptyGrid_Level_Array()

	

	
	
public function placeTheTileInTheGridArray(row_P:Number,column_P:Number,tileNumber_P:Number,theHightlevel_P:Number){
	
	// look if the the level array already exists
	two_dimensional_Array = _root["level_" + (theHightlevel_P + 1) + "_Two_Dimensional_Array "];
	// if the array does not exist it should be build
	if(!two_dimensional_Array){
		 makeEptyGrid_Level_Array(theHightlevel_P);
		makeEptyGrid_Level_Array(theHightlevel_P + 1);// new new new // the mistak befor was that the tiles where checked and the array above was not set // the values where undefined
		 two_dimensional_Array = _root["level_" + (theHightlevel_P + 1) + "_Two_Dimensional_Array "]; //sr 2009
	}
	// CHANGED MISTAKE !!!!!!!!!!!!!!!!!!!!!!!!!!!! ____________________________________________
	
	
	//column  row
	//_root.allMahjongTiles_Clip.createEmptyMovieClip("tileClip"+tileNumber,
	// place tile in the grid
	
	
	// one tile consists of 4 quadrants starting with the quadrant in the up left
	//  up left quadrant
	two_dimensional_Array[row_P][column_P] = tileNumber_P;
	//  up  right quadrant 
	two_dimensional_Array[row_P][column_P+1] = tileNumber_P;
	// down left
	two_dimensional_Array[row_P+1][column_P] = tileNumber_P;
	// down right
	two_dimensional_Array[row_P+1][column_P+1] = tileNumber_P;
	
	
	
	//placeCurrentTileInThe_Empty_Grid(); !!!!! later!!!!!!!!!!!!!!!!!!!!  <--------------------------------------------
	
	
	
	//----------------------------
	//---------------------------     level_1_2dimensional_Array 
	
	
	
	
	
}// end public function placeTheTileInTheGridArray






	
	


	
	
	
	

	
	
	
	
	
	
	
	
	
	
}// end class PlaceMahjongTiles_From_Tamplate {