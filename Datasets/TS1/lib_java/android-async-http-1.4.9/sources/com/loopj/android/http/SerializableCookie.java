package com.loopj.android.http;

import cz.msebera.android.httpclient.cookie.Cookie;
import cz.msebera.android.httpclient.impl.cookie.BasicClientCookie;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Date;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/SerializableCookie.class */
public class SerializableCookie implements Serializable {
    private static final long serialVersionUID = 6374381828722046732L;
    private final transient Cookie cookie;
    private transient BasicClientCookie clientCookie;

    public SerializableCookie(Cookie cookie) {
        this.cookie = cookie;
    }

    public Cookie getCookie() {
        BasicClientCookie basicClientCookie = this.cookie;
        if (this.clientCookie != null) {
            basicClientCookie = this.clientCookie;
        }
        return basicClientCookie;
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        out.writeObject(this.cookie.getName());
        out.writeObject(this.cookie.getValue());
        out.writeObject(this.cookie.getComment());
        out.writeObject(this.cookie.getDomain());
        out.writeObject(this.cookie.getExpiryDate());
        out.writeObject(this.cookie.getPath());
        out.writeInt(this.cookie.getVersion());
        out.writeBoolean(this.cookie.isSecure());
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        String key = (String) in.readObject();
        String value = (String) in.readObject();
        this.clientCookie = new BasicClientCookie(key, value);
        this.clientCookie.setComment((String) in.readObject());
        this.clientCookie.setDomain((String) in.readObject());
        this.clientCookie.setExpiryDate((Date) in.readObject());
        this.clientCookie.setPath((String) in.readObject());
        this.clientCookie.setVersion(in.readInt());
        this.clientCookie.setSecure(in.readBoolean());
    }
}
