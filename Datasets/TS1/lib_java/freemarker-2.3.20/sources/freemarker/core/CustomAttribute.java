package freemarker.core;

import freemarker.template.Template;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/CustomAttribute.class */
public class CustomAttribute {
    public static final int SCOPE_ENVIRONMENT = 0;
    public static final int SCOPE_TEMPLATE = 1;
    public static final int SCOPE_CONFIGURATION = 2;
    private final Object key = new Object();
    private final int scope;

    public CustomAttribute(int scope) {
        if (scope != 0 && scope != 1 && scope != 2) {
            throw new IllegalArgumentException();
        }
        this.scope = scope;
    }

    protected Object create() {
        return null;
    }

    public final Object get() {
        return getScopeConfigurable().getCustomAttribute(this.key, this);
    }

    public final Object get(Template t) {
        if (this.scope != 1) {
            throw new UnsupportedOperationException("This is not a template-scope attribute");
        }
        return t.getCustomAttribute(this.key, this);
    }

    public final void set(Object value) {
        getScopeConfigurable().setCustomAttribute(this.key, value);
    }

    public final void set(Object value, Template t) {
        if (this.scope != 1) {
            throw new UnsupportedOperationException("This is not a template-scope attribute");
        }
        t.setCustomAttribute(this.key, value);
    }

    private Configurable getScopeConfigurable() {
        Configurable c = Environment.getCurrentEnvironment();
        if (c == null) {
            throw new IllegalStateException("No current environment");
        }
        switch (this.scope) {
            case 0:
                return c;
            case 1:
                return c.getParent();
            case 2:
                return c.getParent().getParent();
            default:
                throw new Error();
        }
    }
}
