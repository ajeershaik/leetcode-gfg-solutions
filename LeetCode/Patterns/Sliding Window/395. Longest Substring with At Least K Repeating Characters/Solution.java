class Solution {
    public int longestSubstring(String s, int k) {
        HashMap<Character,Integer> hm = new HashMap<>();
        int n = s.length();
        for(int i=0;i<n;i++){
            hm.put(s.charAt(i),hm.getOrDefault(s.charAt(i),0)+1);
        }
        System.out.println(hm);
        int len = 0;
        int max = Integer.MIN_VALUE;
        for(int i=0;i<n;i++){
            int freq = hm.get(s.charAt(i));
            if(freq >= k){
                len = len+1;
                max = Math.max(len,max);
            }
            else{
                len = 0;
            }
        }
        System.out.println(max);
        return max;
    }
}