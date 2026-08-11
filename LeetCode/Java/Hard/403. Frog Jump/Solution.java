class Solution {
    public boolean canCross(int[] stones) {
       
       int n = stones.length;
       if(n <= 2 && stones[1] != 1){
           return false;
       }
       if (n == 1) return true;
       if (stones[1] != 1) return false;
       HashMap<Integer,Integer> hm = new HashMap<>();
       for(int i=0;i<n;i++){
            hm.put(stones[i],i);
       }
       System.out.println(hm);
       
       Boolean[][] dp = new Boolean[n][n + 1];
       return jump(1,1,hm,hm.get(1),n,dp);
       
    }

    public static boolean jump(int curr_pos,int last_jump,HashMap<Integer,Integer> hm,int index,int n,Boolean dp[][]){
        if(index == n-1){
            return true;
        }
        
        if(dp[index][last_jump] != null){
            return dp[index][last_jump];
        }

        for(int k=last_jump-1;k<=last_jump+1;k++){
            if(k>0){
                int next_pos = curr_pos+k;
                if(hm.containsKey(next_pos)){
                    int next_index = hm.get(next_pos);
                    if(jump(next_pos,k,hm,next_index,n,dp)){
                        dp[next_index][k] = true;
                        return true;
                    }
                }
            }
        }
        dp[index][last_jump] = false;
        return false;
    }
}