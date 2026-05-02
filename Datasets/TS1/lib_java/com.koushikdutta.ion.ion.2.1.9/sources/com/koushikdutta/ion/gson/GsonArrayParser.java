package com.koushikdutta.ion.gson;

import com.google.gson.JsonArray;
import java.nio.charset.Charset;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/gson/GsonArrayParser.class */
public class GsonArrayParser extends GsonParser<JsonArray> {
    public GsonArrayParser() {
        super(JsonArray.class);
    }

    public GsonArrayParser(Charset charset) {
        super(JsonArray.class, charset);
    }
}
