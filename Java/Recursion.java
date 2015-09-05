public class Recursion
{
    static int increment = 1;
    static String[] argument = new String[1];
    static int limit = 10;
     
    public static void main(String[] args)
    {
       if(increment==0)
       {
       limit = Integer.parseInt(new String(args[0]));
       }
       if(increment<limit)
       {
       System.out.println ("Hello World");
       increment++;
       argument[0] = new Integer(increment).toString();
       main(argument);
       }
    }
}