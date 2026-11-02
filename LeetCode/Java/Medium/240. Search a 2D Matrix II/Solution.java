class Solution {
    public boolean searchMatrix(int[][] matrix, int target) {
        int n = matrix.length;
        for(int i=0;i<n;i++){
            int[] arr = new int[matrix[i].length];
            for(int j=0;j<matrix[i].length;j++){
                arr[j] = matrix[i][j];
            }
            System.out.println(Arrays.toString(arr));
            if(binarySearch(arr,arr.length,target)){
                return true;
            }
        }
        return false;
    }
    public boolean binarySearch(int[] arr,int n,int target){
        int low = 0;
        int high = n-1;
        while(low<=high){
            int mid = low+(high-low)/2;
            if(arr[mid] == target){
                return true;
            }
            else if(arr[mid] > target){
                high = mid-1;
            }
            else{
                low = mid+1;
            }
        }
        return false;
    }
}