class Solution {
    public int maxSubArray(int[] nums) {
        int sum = 0;
        int sum1 = -999999;
        int max = -999999;
        for(int i=0;i<nums.length;i++){
            sum = sum+nums[i];
            if(sum<0){
                sum = 0;
                if(nums[i]<0){
                    sum1 = Math.max(sum1,nums[i]);
                }
            }
            else if(sum>max){
                max = sum;
            }else{
                continue;
            }
        }
        return Math.max(max,sum1);
    }
}