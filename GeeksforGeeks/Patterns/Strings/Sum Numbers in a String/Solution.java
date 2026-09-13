class Solution {
    public static int findSum(String s) {
        // code here
        int sum = 0;
        int n = s.length();
        int main_sum = 0;
        for(int i=0;i<n;i++){
            char ch = s.charAt(i);
            if(Character.isDigit(ch)){
                sum = sum*10 + (ch-'0');
            }
            else {
                main_sum = main_sum + sum;
                sum = 0;
            }
        }
        if(sum>0){
            main_sum = main_sum + sum;
            sum = 0;
        }
        return main_sum;
    }
}