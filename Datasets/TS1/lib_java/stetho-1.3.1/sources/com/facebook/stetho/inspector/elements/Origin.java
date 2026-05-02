package com.facebook.stetho.inspector.elements;

import com.facebook.stetho.json.annotation.JsonValue;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/Origin.class */
public enum Origin {
    INJECTED("injected"),
    USER_AGENT("user-agent"),
    INSPECTOR("inspector"),
    REGULAR("regular");

    private final String mValue;

    Origin(String value) {
        this.mValue = value;
    }

    @JsonValue
    public String getProtocolValue() {
        return this.mValue;
    }
}
