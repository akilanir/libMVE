package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.options.SerializeOptions;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

/* loaded from: xmpcore-5.1.2.jar:com/adobe/xmp/impl/XMPSerializerHelper.class */
public class XMPSerializerHelper {
    public static void serialize(XMPMetaImpl xmp, OutputStream out, SerializeOptions options) throws XMPException {
        SerializeOptions options2 = options != null ? options : new SerializeOptions();
        if (options2.getSort()) {
            xmp.sort();
        }
        new XMPSerializerRDF().serialize(xmp, out, options2);
    }

    public static String serializeToString(XMPMetaImpl xmp, SerializeOptions options) throws XMPException {
        SerializeOptions options2 = options != null ? options : new SerializeOptions();
        options2.setEncodeUTF16BE(true);
        ByteArrayOutputStream out = new ByteArrayOutputStream(2048);
        serialize(xmp, out, options2);
        try {
            return out.toString(options2.getEncoding());
        } catch (UnsupportedEncodingException e) {
            return out.toString();
        }
    }

    public static byte[] serializeToBuffer(XMPMetaImpl xmp, SerializeOptions options) throws XMPException {
        ByteArrayOutputStream out = new ByteArrayOutputStream(2048);
        serialize(xmp, out, options);
        return out.toByteArray();
    }
}
