package freemarker.template.utility;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/UnsupportedNumberClassException.class */
public class UnsupportedNumberClassException extends RuntimeException {
    private final Class fClass;

    public UnsupportedNumberClassException(Class pClass) {
        super(new StringBuffer().append("Unsupported number class: ").append(pClass.getName()).toString());
        this.fClass = pClass;
    }

    public Class getUnsupportedClass() {
        return this.fClass;
    }
}
