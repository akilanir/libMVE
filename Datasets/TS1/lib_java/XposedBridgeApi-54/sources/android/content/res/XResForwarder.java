package android.content.res;

/* loaded from: XposedBridgeApi-54.jar:android/content/res/XResForwarder.class */
public class XResForwarder {
    private final Resources res;
    private final int id;

    public XResForwarder(Resources res, int id) {
        this.res = res;
        this.id = id;
    }

    public Resources getResources() {
        return this.res;
    }

    public int getId() {
        return this.id;
    }
}
