package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.cookie.ClientCookie;
import cz.msebera.android.httpclient.cookie.SetCookie;
import cz.msebera.android.httpclient.util.Args;
import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/cookie/BasicClientCookie.class */
public class BasicClientCookie implements SetCookie, ClientCookie, Cloneable, Serializable {
    private static final long serialVersionUID = -3869795591041535538L;
    private final String name;
    private Map<String, String> attribs;
    private String value;
    private String cookieComment;
    private String cookieDomain;
    private Date cookieExpiryDate;
    private String cookiePath;
    private boolean isSecure;
    private int cookieVersion;

    public BasicClientCookie(String name, String value) {
        Args.notNull(name, "Name");
        this.name = name;
        this.attribs = new HashMap();
        this.value = value;
    }

    @Override // cz.msebera.android.httpclient.cookie.Cookie
    public String getName() {
        return this.name;
    }

    @Override // cz.msebera.android.httpclient.cookie.Cookie
    public String getValue() {
        return this.value;
    }

    @Override // cz.msebera.android.httpclient.cookie.SetCookie
    public void setValue(String value) {
        this.value = value;
    }

    @Override // cz.msebera.android.httpclient.cookie.Cookie
    public String getComment() {
        return this.cookieComment;
    }

    @Override // cz.msebera.android.httpclient.cookie.SetCookie
    public void setComment(String comment) {
        this.cookieComment = comment;
    }

    @Override // cz.msebera.android.httpclient.cookie.Cookie
    public String getCommentURL() {
        return null;
    }

    @Override // cz.msebera.android.httpclient.cookie.Cookie
    public Date getExpiryDate() {
        return this.cookieExpiryDate;
    }

    @Override // cz.msebera.android.httpclient.cookie.SetCookie
    public void setExpiryDate(Date expiryDate) {
        this.cookieExpiryDate = expiryDate;
    }

    @Override // cz.msebera.android.httpclient.cookie.Cookie
    public boolean isPersistent() {
        return null != this.cookieExpiryDate;
    }

    @Override // cz.msebera.android.httpclient.cookie.Cookie
    public String getDomain() {
        return this.cookieDomain;
    }

    @Override // cz.msebera.android.httpclient.cookie.SetCookie
    public void setDomain(String domain) {
        if (domain != null) {
            this.cookieDomain = domain.toLowerCase(Locale.ENGLISH);
        } else {
            this.cookieDomain = null;
        }
    }

    @Override // cz.msebera.android.httpclient.cookie.Cookie
    public String getPath() {
        return this.cookiePath;
    }

    @Override // cz.msebera.android.httpclient.cookie.SetCookie
    public void setPath(String path) {
        this.cookiePath = path;
    }

    @Override // cz.msebera.android.httpclient.cookie.Cookie
    public boolean isSecure() {
        return this.isSecure;
    }

    @Override // cz.msebera.android.httpclient.cookie.SetCookie
    public void setSecure(boolean secure) {
        this.isSecure = secure;
    }

    @Override // cz.msebera.android.httpclient.cookie.Cookie
    public int[] getPorts() {
        return null;
    }

    @Override // cz.msebera.android.httpclient.cookie.Cookie
    public int getVersion() {
        return this.cookieVersion;
    }

    @Override // cz.msebera.android.httpclient.cookie.SetCookie
    public void setVersion(int version) {
        this.cookieVersion = version;
    }

    @Override // cz.msebera.android.httpclient.cookie.Cookie
    public boolean isExpired(Date date) {
        Args.notNull(date, "Date");
        return this.cookieExpiryDate != null && this.cookieExpiryDate.getTime() <= date.getTime();
    }

    public void setAttribute(String name, String value) {
        this.attribs.put(name, value);
    }

    @Override // cz.msebera.android.httpclient.cookie.ClientCookie
    public String getAttribute(String name) {
        return this.attribs.get(name);
    }

    @Override // cz.msebera.android.httpclient.cookie.ClientCookie
    public boolean containsAttribute(String name) {
        return this.attribs.get(name) != null;
    }

    public Object clone() throws CloneNotSupportedException {
        BasicClientCookie clone = (BasicClientCookie) super.clone();
        clone.attribs = new HashMap(this.attribs);
        return clone;
    }

    public String toString() {
        return "[version: " + Integer.toString(this.cookieVersion) + "][name: " + this.name + "][value: " + this.value + "][domain: " + this.cookieDomain + "][path: " + this.cookiePath + "][expiry: " + this.cookieExpiryDate + "]";
    }
}
