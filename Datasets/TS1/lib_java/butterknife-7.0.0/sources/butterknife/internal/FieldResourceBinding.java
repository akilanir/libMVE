package butterknife.internal;

/* loaded from: butterknife-7.0.0.jar:butterknife/internal/FieldResourceBinding.class */
final class FieldResourceBinding {
    private final int id;
    private final String name;
    private final String method;

    FieldResourceBinding(int id, String name, String method) {
        this.id = id;
        this.name = name;
        this.method = method;
    }

    public int getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public String getMethod() {
        return this.method;
    }
}
