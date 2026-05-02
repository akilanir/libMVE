package butterknife.internal;

/* loaded from: butterknife-7.0.1.jar:butterknife/internal/FieldViewBinding.class */
final class FieldViewBinding implements ViewBinding {
    private final String name;
    private final String type;
    private final boolean required;

    FieldViewBinding(String name, String type, boolean required) {
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

    @Override // butterknife.internal.ViewBinding
    public String getDescription() {
        return "field '" + this.name + "'";
    }

    public boolean isRequired() {
        return this.required;
    }

    public boolean requiresCast() {
        return !"android.view.View".equals(this.type);
    }
}
