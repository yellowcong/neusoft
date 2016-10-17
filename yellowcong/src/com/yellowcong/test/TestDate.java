package com.yellowcong.test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.junit.Test;

public class TestDate {

	//随机数目
	List<Integer> date = new ArrayList<Integer>();
	private void getRandomIds(int length
			){
		
		
		Random rand = new Random( );
		for(int i=length;i>=1;i--){
			Integer result = rand.nextInt(length);
			if(date.contains(result)){
				this.getRandomIds(i);
			}else{
				date.add(result);
			}
		}
				
		
	}
		
	@Test
	public void testStr(){
		this.getRandomIds(3);
		for(Integer in:date){
			System.out.println(in);
		}
	}
	@Test
	public void testSStr2(){
		int n = 4;
        int randArr[]=new int[n];  
        int i=0;  
        while(i<n){  
            int rand=(new Random().nextInt(n)+1);  
            boolean isRandExist=false;  
            for(int j=0;j<randArr.length;j++){  
                if(randArr[j]==rand){  
                    isRandExist=true;  
                    break;  
                }  
            }  
            if(isRandExist==false){  
                randArr[i]=rand;  
                i++;  
            }             
        } 
        System.out.println(Arrays.toString(randArr));  
	}

	
	@Test
	public void testDate(){
		Integer [] date = this.randomQuestion(10);
		for(Integer da:date){
			System.out.println(da);
		}
	}
	@Test
	public void test2(){
		shuffle();
	}
    public static void shuffle(){  
        int[] x = {1,2,3,4,5,6,7,8,9};  
        List list = new ArrayList();  
        for(int i = 0;i < x.length;i++){  
            System.out.print(x[i]+", ");  
            list.add(x[i]);  
        }  
        System.out.println();  
          
        Collections.shuffle(list);  
          
        Iterator ite = list.iterator();  
        while(ite.hasNext()){  
            System.out.print(ite.next().toString()+", ");  
        }  
    } 
	private Integer [] randomQuestion(Integer n){
		Integer randArr[]=new Integer[n];  
        int i=0;  
        while(i<n){  
            int rand=(new Random().nextInt(n)+1);  
            boolean isRandExist=false;  
            for(int j=0;j<randArr.length;j++){  
                if(randArr[j]==rand){  
                    isRandExist=true;  
                    break;  
                }  
            }  
            if(isRandExist==false){  
                randArr[i]=rand;  
                i++;  
            }             
        }
        return randArr;
	}
	
	/** 
	 * 随机指定范围内N个不重复的数 
	 * 最简单最基本的方法 
	 * @param min 指定范围最小值 
	 * @param max 指定范围最大值 
	 * @param n 随机数个数 
	 */  
	public static int[] randomCommon(int min, int max, int n){  
	    max = max+1;
		if (n > (max - min + 1) || max < min) {  
	           return null;  
	       }  
	    int[] result = new int[n];  
	    int count = 0;  
	    while(count < n) {  
	        int num = (int) (Math.random() * (max - min)) + min;  
	        boolean flag = true;  
	        for (int j = 0; j < n; j++) {  
	            if(num == result[j]){  
	                flag = false;  
	                break;  
	            }  
	        }  
	        if(flag){  
	            result[count] = num;  
	            count++;  
	        }  
	    }  
	    return result;  
	}  
}
