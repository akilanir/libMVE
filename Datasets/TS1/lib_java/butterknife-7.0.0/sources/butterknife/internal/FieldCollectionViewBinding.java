package butterknife.internal;

/* loaded from: butterknife-7.0.0.jar:butterknife/internal/FieldCollectionViewBinding.class */
final class FieldCollectionViewBinding implements ViewBinding {
    private final String name;
    private final String type;
    private final Kind kind;
    private final boolean required;

    /* loaded from: butterknife-7.0.0.jar:butterknife/internal/FieldCollectionViewBinding$Kind.class */
    enum Kind {
        ARRAY,
        LIST
    }

    FieldCollectionViewBinding(String name, String type, Kind kind, boolean required) {
        this.name = name;
        this.type = type;
        this.kind = kind;
        this.required = required;
    }

    public String getName() {
        return this.name;
    }

    public String getType() {
        return this.type;
    }

    public Kind getKind() {
        return this.kind;
    }

    public boolean isRequired() {
        return this.required;
    }

    @Override // butterknife.internal.ViewBinding
    public String getDescription() {
        return "field '" + this.name + "'";
    }
}
