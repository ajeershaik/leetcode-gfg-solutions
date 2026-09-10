class Solution {
    public int myAtoi(String s) {
        String s1 = s.stripLeading();
        int n = s1.length();
        StringBuilder result = new StringBuilder();
        int dc = 0;
        for(int i=0;i<n;i++){
            char ch = s1.charAt(i);
            if(Character.isLetter(ch) || (dc >0 && ch =='-' || ch =='+')){
                if(result.length() == 0){
                    return 0;
                }
                else{
                    return Integer.valueOf(String.valueOf(result));
                }
            }
            else{
                
                if(ch!='-' || ch!='+') 
                {
                    dc++;
                }
                if(ch != 0)
                {
                    result.append(ch);
                }
            }
        }
        return Integer.valueOf(String.valueOf(result));
    }
}