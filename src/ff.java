import java.util.Arrays;


public class ff {
	
	public int triangle ( int[] A ) {
		{
		int a=0;
		Arrays.sort(A);
		for(int i=0;i<A.length-2;i++){
		if( A[i]+A[i+1]>A[i+2])
		{
		a=1;
		System.out.println(a);
		}else{
		a=0;
		}
		}
		
		return a;
		
		}
	}
	
	
	public static void main(String[] args) {
		
		
		ff jk= new ff();
		
		int d[]={10,2,5,1,8,20};
		
		jk.triangle(d);
		
	}

}
