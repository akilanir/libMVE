package cz.msebera.android.httpclient.entity.mime;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/entity/mime/MinimalField.class */
public class MinimalField {
    private final String name;
    private final String value;

    public MinimalField(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return this.name;
    }

    public String getBody() {
        return this.value;
    }

    public String toString() {
        return this.name + ": " + this.value;
    }
}
