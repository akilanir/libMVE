package retrofit.converter;

import com.google.gson.Gson;
import com.google.gson.JsonParseException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import retrofit.mime.MimeUtil;
import retrofit.mime.TypedInput;
import retrofit.mime.TypedOutput;

/* loaded from: retrofit-1.9.0.jar:retrofit/converter/GsonConverter.class */
public class GsonConverter implements Converter {
    private final Gson gson;
    private String charset;

    public GsonConverter(Gson gson) {
        this(gson, "UTF-8");
    }

    public GsonConverter(Gson gson, String charset) {
        this.gson = gson;
        this.charset = charset;
    }

    @Override // retrofit.converter.Converter
    public Object fromBody(TypedInput body, Type type) throws ConversionException {
        String charset = this.charset;
        if (body.mimeType() != null) {
            charset = MimeUtil.parseCharset(body.mimeType(), charset);
        }
        InputStreamReader isr = null;
        try {
            try {
                isr = new InputStreamReader(body.in(), charset);
                Object fromJson = this.gson.fromJson(isr, type);
                if (isr != null) {
                    try {
                        isr.close();
                    } catch (IOException e) {
                    }
                }
                return fromJson;
            } catch (Throwable th) {
                if (isr != null) {
                    try {
                        isr.close();
                    } catch (IOException e2) {
                    }
                }
                throw th;
            }
        } catch (JsonParseException e3) {
            throw new ConversionException((Throwable) e3);
        } catch (IOException e4) {
            throw new ConversionException(e4);
        }
    }

    @Override // retrofit.converter.Converter
    public TypedOutput toBody(Object object) {
        try {
            return new JsonTypedOutput(this.gson.toJson(object).getBytes(this.charset), this.charset);
        } catch (UnsupportedEncodingException e) {
            throw new AssertionError(e);
        }
    }

    /* loaded from: retrofit-1.9.0.jar:retrofit/converter/GsonConverter$JsonTypedOutput.class */
    private static class JsonTypedOutput implements TypedOutput {
        private final byte[] jsonBytes;
        private final String mimeType;

        JsonTypedOutput(byte[] jsonBytes, String encode) {
            this.jsonBytes = jsonBytes;
            this.mimeType = "application/json; charset=" + encode;
        }

        @Override // retrofit.mime.TypedOutput
        public String fileName() {
            return null;
        }

        @Override // retrofit.mime.TypedOutput
        public String mimeType() {
            return this.mimeType;
        }

        @Override // retrofit.mime.TypedOutput
        public long length() {
            return this.jsonBytes.length;
        }

        @Override // retrofit.mime.TypedOutput
        public void writeTo(OutputStream out) throws IOException {
            out.write(this.jsonBytes);
        }
    }
}
