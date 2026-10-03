class Solution {
    public int numTrees(int n) {
        if(n == 2)
            return 2;
        return n*2-1;
    }
}