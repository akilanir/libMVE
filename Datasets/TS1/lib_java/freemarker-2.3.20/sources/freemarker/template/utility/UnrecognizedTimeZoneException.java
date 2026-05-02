package freemarker.template.utility;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/UnrecognizedTimeZoneException.class */
public class UnrecognizedTimeZoneException extends Exception {
    private final String timeZoneName;

    public UnrecognizedTimeZoneException(String timeZoneName) {
        super(new StringBuffer().append("Unrecognized time zone: ").append(StringUtil.jQuote(timeZoneName)).toString());
        this.timeZoneName = timeZoneName;
    }

    public String getTimeZoneName() {
        return this.timeZoneName;
    }
}
