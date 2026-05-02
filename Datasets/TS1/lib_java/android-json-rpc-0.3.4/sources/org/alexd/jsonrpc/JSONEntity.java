package org.alexd.jsonrpc;

import java.io.UnsupportedEncodingException;
import org.apache.http.Header;
import org.apache.http.entity.StringEntity;
import org.apache.http.message.BasicHeader;
import org.json.JSONObject;

/* loaded from: android-json-rpc-0.3.4.jar:org/alexd/jsonrpc/JSONEntity.class */
class JSONEntity extends StringEntity {
    public JSONEntity(JSONObject jsonObject) throws UnsupportedEncodingException {
        super(jsonObject.toString());
    }

    public JSONEntity(JSONObject jsonObject, String encoding) throws UnsupportedEncodingException {
        super(jsonObject.toString(), encoding);
        setContentEncoding(encoding);
    }

    @Override // org.apache.http.entity.AbstractHttpEntity, org.apache.http.HttpEntity
    public Header getContentType() {
        return new BasicHeader("Content-Type", "application/json");
    }
}
