class Solution {
    public int findLongestChain(int[][] pairs) {
        Arrays.sort(pairs,(a,b)->Integer.compare(a[1],b[1]));
        int n = pairs.length;
        for(int[] i:pairs)
            System.out.println(Arrays.toString(i));
        int b = Integer.MIN_VALUE;
        int c = 0;
        for(int i=0;i<n;i++){
            if(pairs[i][0] > b){
                c++;
                b = pairs[i][1];
            }
        }
        return c;
    }
}