//package{
	//this class delivers a random mixed number array from 0,1,2,3 ... n   
	class RandomNumberArray
	{	
		
		private var i:Number;
		private var k:Number;
		private var straightArray:Array;
		private var randomArray:Array;
		private var randomNumber:Number;
		private var straightArrayTemp:Array = new Array(); 
		
		
		
		public function randomNumberArrayFromZeroToN(n:Number):Array
		{
				// make an straight array from 0,1,2,3, ...to n
				straightArray = new Array();
				for(i=0;i<n;i++){
					straightArray.push(i);
				}// end for 
				
				// make random array from straight array
				randomArray = new Array();
				for(i=0;i<n;i++){
					//trace(straightArray.length);
					randomNumber = Math.round(Math.random()*(straightArray.length-1));
					randomArray.push(straightArray[randomNumber]);
					straightArrayTemp = straightArray.splice(randomNumber, 1);
				}// end for

				
				return randomArray;
					
		}// end public function randomNumberArrayFromZeroToN(arrayLength:Number):Array
				
	
	
	
	
	
	
	}// end CLASS
	
//}// end package

	
	
	
	
	
	
	
	