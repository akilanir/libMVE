package org.apache.http.entity.mime;

/* loaded from: httpmime-4.2.1.jar:org/apache/http/entity/mime/MinimalField.class */
public class MinimalField {
    private final String name;
    private final String value;

    MinimalField(String name, String value) {
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
