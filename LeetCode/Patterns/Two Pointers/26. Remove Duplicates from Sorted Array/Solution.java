class Solution {
    public int removeDuplicates(int[] nums) {

        int n = nums.length;
        int c = 0;
        int prev = -1;
        for(int i=0;i<n;i++){
            if(prev != nums[i]){
                nums[c] = nums[i];
                c++;
                prev = nums[i];
            }
        }
        return c;
        
    }
}