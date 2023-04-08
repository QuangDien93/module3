package codegym.simple_canculator;

public class Calculator {
    public static  double calculate (double first, double second, char operate){
        switch (operate){
            case '+':
                return first + second;
            case '-':
                return first - second;
            case '*':
                return first * second;
            case '/':
                if(second != 0)
                    return first / second;
                else
                    throw new RuntimeException("Can't divide by zero");
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
