package org.jsoup.nodes;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import org.jsoup.SerializationException;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Document;

/* loaded from: jsoup-1.9.2.jar:org/jsoup/nodes/Attribute.class */
public class Attribute implements Map.Entry<String, String>, Cloneable {
    private static final String[] booleanAttributes = {"allowfullscreen", "async", "autofocus", "checked", "compact", "declare", "default", "defer", "disabled", "formnovalidate", "hidden", "inert", "ismap", "itemscope", "multiple", "muted", "nohref", "noresize", "noshade", "novalidate", "nowrap", "open", "readonly", "required", "reversed", "seamless", "selected", "sortable", "truespeed", "typemustmatch"};
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
        StringBuilder accum = new StringBuilder();
        try {
            html(accum, new Document("").outputSettings());
            return accum.toString();
        } catch (IOException exception) {
            throw new SerializationException(exception);
        }
    }

    protected void html(Appendable accum, Document.OutputSettings out) throws IOException {
        accum.append(this.key);
        if (!shouldCollapseAttribute(out)) {
            accum.append("=\"");
            Entities.escape(accum, this.value, out, true, false, false);
            accum.append('\"');
        }
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

    protected final boolean shouldCollapseAttribute(Document.OutputSettings out) {
        return ("".equals(this.value) || this.value.equalsIgnoreCase(this.key)) && out.syntax() == Document.OutputSettings.Syntax.html && isBooleanAttribute();
    }

    protected boolean isBooleanAttribute() {
        return Arrays.binarySearch(booleanAttributes, this.key) >= 0;
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
        return this.value == null ? attribute.value == null : this.value.equals(attribute.value);
    }

    @Override // java.util.Map.Entry
    public int hashCode() {
        int result = this.key != null ? this.key.hashCode() : 0;
        return (31 * result) + (this.value != null ? this.value.hashCode() : 0);
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public Attribute m5clone() {
        try {
            return (Attribute) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }
}
