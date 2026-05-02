package org.jsoup.nodes;

import java.util.Map;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Document;

/* loaded from: jsoup-1.7.3.jar:org/jsoup/nodes/Attribute.class */
public class Attribute implements Map.Entry<String, String>, Cloneable {
    private String key;
    private String value;

    public Attribute(String key, String value) {
        Validate.notEmpty(key);
        Validate.notNull(value);
        this.key = key.trim().toLowerCase();
        this.value = value;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Map.Entry
    public String getKey() {
        return this.key;
    }

    public void setKey(String key) {
        Validate.notEmpty(key);
        this.key = key.trim().toLowerCase();
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Map.Entry
    public String getValue() {
        return this.value;
    }

    @Override // java.util.Map.Entry
    public String setValue(String value) {
        Validate.notNull(value);
        String old = this.value;
        this.value = value;
        return old;
    }

    public String html() {
        return this.key + "=\"" + Entities.escape(this.value, new Document("").outputSettings()) + "\"";
    }

    protected void html(StringBuilder accum, Document.OutputSettings out) {
        accum.append(this.key).append("=\"").append(Entities.escape(this.value, out)).append("\"");
    }

    public String toString() {
        return html();
    }

    public static Attribute createFromEncoded(String unencodedKey, String encodedValue) {
        String value = Entities.unescape(encodedValue, true);
        return new Attribute(unencodedKey, value);
    }

    protected boolean isDataAttribute() {
        return this.key.startsWith("data-") && this.key.length() > "data-".length();
    }

    @Override // java.util.Map.Entry
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Attribute)) {
            return false;
        }
        Attribute attribute = (Attribute) o;
        if (this.key != null) {
            if (!this.key.equals(attribute.key)) {
                return false;
            }
        } else if (attribute.key != null) {
            return false;
        }
        return this.value != null ? this.value.equals(attribute.value) : attribute.value == null;
    }

    @Override // java.util.Map.Entry
    public int hashCode() {
        int result = this.key != null ? this.key.hashCode() : 0;
        return (31 * result) + (this.value != null ? this.value.hashCode() : 0);
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public Attribute m3clone() {
        try {
            return (Attribute) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }
}
