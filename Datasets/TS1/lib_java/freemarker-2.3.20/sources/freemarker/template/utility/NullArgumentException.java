package freemarker.template.utility;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/NullArgumentException.class */
public class NullArgumentException extends IllegalArgumentException {
    public NullArgumentException(String argumentName) {
        super(new StringBuffer().append("The \"").append(argumentName).append("\" argument can't be null").toString());
    }

    public static void check(String argumentName, Object argumentValue) {
        if (argumentValue == null) {
            throw new NullArgumentException(argumentName);
        }
    }
}
