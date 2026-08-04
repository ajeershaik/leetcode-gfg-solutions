class Solution {
    public int maxArea(int[] height) {
        
        int left = 0;
        int right = height.length-1;
        int max = 0;
        while(left < right){
            if(height[left] < height[right]){
                int diff = right - left;
                int left_el = height[left];
                int lw = diff*left_el;
                max = Math.max(max,lw);
                left++;
            }
            else{
                int diff = right - left;
                int right_el = height[right];
                int rw = diff*right_el;
                max = Math.max(max,rw);
                right--;
            }
        }
        return max;
    }
}