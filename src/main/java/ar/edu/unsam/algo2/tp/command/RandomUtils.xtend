package ar.edu.unsam.algo2.tp.command

import java.util.List
import java.util.Random

class RandomUtils {
	
	def static double getDoubleInRange(double min , Double max){
		val random = new Random()
		
		min + ( (max - min) * random.nextDouble())
	}
	
	
	def static int getIntInRange(int max){
		
		getIntInRange( 0 , max)
		
	}
	
	def static int getIntInRange(int min , int max){
		val random = new Random()
		
		min + ( random.nextInt(max - min) )
	}
	
	def static <T> T getRandomElementInList(List<T> list){
		return list.get( RandomUtils.getIntInRange( list.length ) )
	}
	
}