class Solution {
    public long countSubstrings(String s, char c) {
        char[] freq = new char[26] ;
        int n = s.length();
        long cnt = 0;
        for(int i=0;i<n;i++){
            if(s.charAt(i) == c){
                cnt = cnt+freq[s.charAt(i)-'a']+1;
                freq[s.charAt(i)-'a']++;
            }
        }
        return cnt;
    }
}