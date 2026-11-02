class Solution {
    public int nthDay(int d, int n) {
        // code here
        int rem  = n%7;
        if(rem<= d){
            return d-rem;
        }
        else{
            int days = 7-rem;
            return d+days;
        }
    }
}