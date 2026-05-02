package butterknife.internal;

/* loaded from: butterknife-6.0.0.jar:butterknife/internal/ViewBinding.class */
final class ViewBinding implements Binding {
    private final String name;
    private final String type;
    private final boolean required;

    ViewBinding(String name, String type, boolean required) {
        this.name = name;
        this.type = type;
        this.required = required;
    }

    public String getName() {
        return this.name;
    }

    public String getType() {
        return this.type;
    }

    @Override // butterknife.internal.Binding
    public String getDescription() {
        return "field '" + this.name + "'";
    }

    public boolean isRequired() {
        return this.required;
    }
}
