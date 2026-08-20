class Solution {
    public int eraseOverlapIntervals(int[][] intervals) {
        
        Arrays.sort(intervals, (a,b)->Integer.compare(a[1],b[1]));
        int n = intervals.length;
        int free  = Integer.MIN_VALUE;
        int c = 0;
        for(int i=0;i<n;i++){
            if(intervals[i][0] < free){
                c++;
            }
            else{
                free = intervals[i][1];
            }
        }
        return c;
    }
}