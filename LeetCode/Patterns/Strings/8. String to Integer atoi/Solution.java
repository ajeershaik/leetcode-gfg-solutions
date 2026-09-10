class Solution {
    public int myAtoi(String s) {
        
        // Step 1 — Remove leading whitespace
        int i = 0;
        int n = s.length();
        while(i < n && s.charAt(i) == ' '){
            i++;
        }

        // Step 2 — Check sign
        int sign = 1;
        if(i < n && (s.charAt(i) == '-' || s.charAt(i) == '+')){
            if(s.charAt(i) == '-'){
                sign = -1;
            }
            i++;
        }

        // Step 3 — Read digits manually
        long result = 0;
        while(i < n && Character.isDigit(s.charAt(i))){
            int digit = s.charAt(i) - '0';  // ✅ char to int — no parseInt!

            result = result * 10 + digit;

            // Step 4 — Clamp if out of 32-bit range
            if(result * sign <= Integer.MIN_VALUE){
                return Integer.MIN_VALUE;  // -2147483648
            }
            if(result * sign >= Integer.MAX_VALUE){
                return Integer.MAX_VALUE;  // 2147483647
            }

            i++;
        }

        return (int)(result * sign);
    }
}