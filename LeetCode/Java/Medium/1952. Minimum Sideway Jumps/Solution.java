class Solution {
    
    public  int minSideJumps(int[] obstacles) {
        int n = obstacles.length;
        Integer[][] dp = new Integer[3+1][n];
        /*for(Integer[] d:dp)
            System.out.println(Arrays.toString(d));  */
        return jump(2,0,1,obstacles,n,dp);
              
    }

    public int jump(int curr_lane,int index,int next_index,int[] obs,int n,Integer[][] dp){
        int ans = Integer.MAX_VALUE;
        if(next_index >= n){
            return 0;
        }
        if(dp[curr_lane][index] != null)
            return dp[curr_lane][index];
        if(obs[index+1] != curr_lane){
            dp[curr_lane][index] = jump(curr_lane,index+1,next_index+1,obs,n,dp);
            return dp[curr_lane][index];
        }
        else{
            for(int lane=1;lane<=3;lane++){
                if(lane != curr_lane && obs[index] != lane){
                   ans = Math.min(ans,1 + jump(lane,index,next_index,obs,n,dp));
                   dp[curr_lane][index] = ans;
                }
            }
        }
        dp[curr_lane][index] = ans;
    return ans;
    }
}