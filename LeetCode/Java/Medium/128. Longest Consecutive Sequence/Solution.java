class Solution {
    public int longestConsecutive(int[] nums) {
        Arrays.sort(nums);
        int n = nums.length;
        int seq = 1;
        int max = 1;
        for(int i=1;i<n;i++){
            int diff = Math.abs(nums[i]-nums[i-1]);
            if(diff <=1 && diff >= 0){
                if(diff == 0){
                    continue;
                }
                else{
                    seq++;
                }
            }
            else{
                max = Math.max(max,seq);
                seq = 1;
            }
        }
        max = Math.max(max,seq);
        return max;
        
    }
}