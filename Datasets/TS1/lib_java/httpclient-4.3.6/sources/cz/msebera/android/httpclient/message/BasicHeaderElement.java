package cz.msebera.android.httpclient.message;

import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.NameValuePair;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.LangUtils;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/message/BasicHeaderElement.class */
public class BasicHeaderElement implements HeaderElement, Cloneable {
    private final String name;
    private final String value;
    private final NameValuePair[] parameters;

    public BasicHeaderElement(String name, String value, NameValuePair[] parameters) {
        this.name = (String) Args.notNull(name, "Name");
        this.value = value;
        if (parameters != null) {
            this.parameters = parameters;
        } else {
            this.parameters = new NameValuePair[0];
        }
    }

    public BasicHeaderElement(String name, String value) {
        this(name, value, null);
    }

    @Override // cz.msebera.android.httpclient.HeaderElement
    public String getName() {
        return this.name;
    }

    @Override // cz.msebera.android.httpclient.HeaderElement
    public String getValue() {
        return this.value;
    }

    @Override // cz.msebera.android.httpclient.HeaderElement
    public NameValuePair[] getParameters() {
        return (NameValuePair[]) this.parameters.clone();
    }

    @Override // cz.msebera.android.httpclient.HeaderElement
    public int getParameterCount() {
        return this.parameters.length;
    }

    @Override // cz.msebera.android.httpclient.HeaderElement
    public NameValuePair getParameter(int index) {
        return this.parameters[index];
    }

    @Override // cz.msebera.android.httpclient.HeaderElement
    public NameValuePair getParameterByName(String name) {
        Args.notNull(name, "Name");
        NameValuePair found = null;
        NameValuePair[] nameValuePairArr = this.parameters;
        int length = nameValuePairArr.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            NameValuePair current = nameValuePairArr[i];
            if (!current.getName().equalsIgnoreCase(name)) {
                i++;
            } else {
                found = current;
                break;
            }
        }
        return found;
    }

    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (object instanceof HeaderElement) {
            BasicHeaderElement that = (BasicHeaderElement) object;
            return this.name.equals(that.name) && LangUtils.equals(this.value, that.value) && LangUtils.equals((Object[]) this.parameters, (Object[]) that.parameters);
        }
        return false;
    }

    public int hashCode() {
        int hash = LangUtils.hashCode(17, this.name);
        int hash2 = LangUtils.hashCode(hash, this.value);
        for (NameValuePair parameter : this.parameters) {
            hash2 = LangUtils.hashCode(hash2, parameter);
        }
        return hash2;
    }

    public String toString() {
        StringBuilder buffer = new StringBuilder();
        buffer.append(this.name);
        if (this.value != null) {
            buffer.append("=");
            buffer.append(this.value);
        }
        for (NameValuePair parameter : this.parameters) {
            buffer.append("; ");
            buffer.append(parameter);
        }
        return buffer.toString();
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
