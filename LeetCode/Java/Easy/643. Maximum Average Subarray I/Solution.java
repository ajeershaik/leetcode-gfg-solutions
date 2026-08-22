class Solution {
    public double findMaxAverage(int[] nums, int k) {
        double sum = 0;
        for(int i=0;i<k;i++){
            sum = sum+nums[i];
        }
        double max = sum/k;

        for(int i=1;i<=nums.length-k;i++){
            sum = sum - nums[i-1];
            sum = sum + nums[i+k-1];
            double max1 = sum/k;
            max = Math.max(max,max1);
        }
        return max;
    }
}