package com.koushikdutta.ion.gson;

import com.google.gson.JsonObject;
import java.nio.charset.Charset;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/gson/GsonObjectParser.class */
public class GsonObjectParser extends GsonParser<JsonObject> {
    public GsonObjectParser() {
        super(JsonObject.class);
    }

    public GsonObjectParser(Charset charset) {
        super(JsonObject.class, charset);
    }
}
