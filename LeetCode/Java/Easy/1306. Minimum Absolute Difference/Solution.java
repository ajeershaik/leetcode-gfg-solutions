class Solution {
    public List<List<Integer>> minimumAbsDifference(int[] arr) {
    int n = arr.length;
    Arrays.sort(arr);
    int min = min(arr,n);
    System.out.println(min);
    List<List<Integer>> list = new ArrayList<>();
	int left = 0;
	int right = 1;
	while(right<n)
    {
	    if(Math.abs(arr[left]-arr[right]) == min){
			ArrayList<Integer> al = new ArrayList<>();
			al.add(arr[left]);
			al.add(arr[right]);
			list.add(al);	
		}
		right++;
		left++;
	}
	    return list;
    }

    public static int min(int[] arr,int n){
		int min = Integer.MAX_VALUE;
		for(int i=0;i<n-1;i++){
			min = Math.min(min,Math.abs(arr[i]-arr[i+1]));
		}
		return min;
	}
}