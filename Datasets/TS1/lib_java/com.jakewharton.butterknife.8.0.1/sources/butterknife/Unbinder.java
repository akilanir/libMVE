package butterknife;

/* loaded from: com.jakewharton.butterknife.8.0.1.jar:butterknife/Unbinder.class */
public interface Unbinder {
    public static final Unbinder EMPTY = new Unbinder() { // from class: butterknife.Unbinder.1
        @Override // butterknife.Unbinder
        public void unbind() {
        }
    };

    void unbind();
}
