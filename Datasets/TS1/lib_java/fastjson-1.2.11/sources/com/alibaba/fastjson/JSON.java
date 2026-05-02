package com.alibaba.fastjson;

import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.Feature;
import com.alibaba.fastjson.parser.JSONLexer;
import com.alibaba.fastjson.parser.ParserConfig;
import com.alibaba.fastjson.parser.deserializer.ExtraProcessor;
import com.alibaba.fastjson.parser.deserializer.ExtraTypeProvider;
import com.alibaba.fastjson.parser.deserializer.FieldTypeResolver;
import com.alibaba.fastjson.parser.deserializer.ParseProcess;
import com.alibaba.fastjson.serializer.JSONSerializer;
import com.alibaba.fastjson.serializer.JavaBeanSerializer;
import com.alibaba.fastjson.serializer.ObjectSerializer;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializeFilter;
import com.alibaba.fastjson.serializer.SerializeWriter;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.util.IOUtils;
import com.alibaba.fastjson.util.TypeUtils;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Writer;
import java.lang.reflect.Array;
import java.lang.reflect.Type;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/JSON.class */
public abstract class JSON implements JSONStreamAware, JSONAware {
    public static int DEFAULT_PARSER_FEATURE;
    public static String DEFFAULT_DATE_FORMAT;
    public static int DEFAULT_GENERATE_FEATURE;
    public static final String VERSION = "1.2.11";
    private static final ThreadLocal<byte[]> bytesLocal;
    private static final ThreadLocal<char[]> charsLocal;
    public static TimeZone defaultTimeZone = TimeZone.getDefault();
    public static Locale defaultLocale = Locale.getDefault();
    public static String DEFAULT_TYPE_KEY = "@type";
    static final SerializeFilter[] emptyFilters = new SerializeFilter[0];

    static {
        int features = 0 | Feature.AutoCloseSource.getMask();
        DEFAULT_PARSER_FEATURE = features | Feature.InternFieldNames.getMask() | Feature.UseBigDecimal.getMask() | Feature.AllowUnQuotedFieldNames.getMask() | Feature.AllowSingleQuotes.getMask() | Feature.AllowArbitraryCommas.getMask() | Feature.SortFeidFastMatch.getMask() | Feature.IgnoreNotMatch.getMask();
        DEFFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
        int features2 = 0 | SerializerFeature.QuoteFieldNames.getMask();
        DEFAULT_GENERATE_FEATURE = features2 | SerializerFeature.SkipTransientField.getMask() | SerializerFeature.WriteEnumUsingName.getMask() | SerializerFeature.SortField.getMask();
        bytesLocal = new ThreadLocal<>();
        charsLocal = new ThreadLocal<>();
    }

    public static Object parse(String text) {
        return parse(text, DEFAULT_PARSER_FEATURE);
    }

    public static Object parse(String text, int features) {
        if (text == null) {
            return null;
        }
        DefaultJSONParser parser = new DefaultJSONParser(text, ParserConfig.getGlobalInstance(), features);
        Object value = parser.parse();
        parser.handleResovleTask(value);
        parser.close();
        return value;
    }

    public static Object parse(byte[] input, Feature... features) {
        char[] chars = allocateChars(input.length);
        int len = IOUtils.decodeUTF8(input, 0, input.length, chars);
        return parse(new String(chars, 0, len), features);
    }

    public static Object parse(byte[] input, int off, int len, CharsetDecoder charsetDecoder, Feature... features) {
        if (input == null || input.length == 0) {
            return null;
        }
        int featureValues = DEFAULT_PARSER_FEATURE;
        for (Feature feature : features) {
            featureValues = Feature.config(featureValues, feature, true);
        }
        return parse(input, off, len, charsetDecoder, featureValues);
    }

    public static Object parse(byte[] input, int off, int len, CharsetDecoder charsetDecoder, int features) {
        charsetDecoder.reset();
        int scaleLength = (int) (len * charsetDecoder.maxCharsPerByte());
        char[] chars = allocateChars(scaleLength);
        ByteBuffer byteBuf = ByteBuffer.wrap(input, off, len);
        CharBuffer charBuf = CharBuffer.wrap(chars);
        IOUtils.decode(charsetDecoder, byteBuf, charBuf);
        int position = charBuf.position();
        DefaultJSONParser parser = new DefaultJSONParser(chars, position, ParserConfig.getGlobalInstance(), features);
        Object value = parser.parse();
        parser.handleResovleTask(value);
        parser.close();
        return value;
    }

    public static Object parse(String text, Feature... features) {
        int featureValues = DEFAULT_PARSER_FEATURE;
        for (Feature feature : features) {
            featureValues = Feature.config(featureValues, feature, true);
        }
        return parse(text, featureValues);
    }

    public static JSONObject parseObject(String text, Feature... features) {
        return (JSONObject) parse(text, features);
    }

    public static JSONObject parseObject(String text) {
        Object obj = parse(text);
        if (obj instanceof JSONObject) {
            return (JSONObject) obj;
        }
        return (JSONObject) toJSON(obj);
    }

    public static <T> T parseObject(String str, TypeReference<T> typeReference, Feature... featureArr) {
        return (T) parseObject(str, typeReference.type, ParserConfig.global, DEFAULT_PARSER_FEATURE, featureArr);
    }

    public static <T> T parseObject(String str, Class<T> cls, Feature... featureArr) {
        return (T) parseObject(str, cls, ParserConfig.global, (ParseProcess) null, DEFAULT_PARSER_FEATURE, featureArr);
    }

    public static <T> T parseObject(String str, Class<T> cls, ParseProcess parseProcess, Feature... featureArr) {
        return (T) parseObject(str, cls, ParserConfig.global, parseProcess, DEFAULT_PARSER_FEATURE, featureArr);
    }

    public static <T> T parseObject(String str, Type type, Feature... featureArr) {
        return (T) parseObject(str, type, ParserConfig.global, DEFAULT_PARSER_FEATURE, featureArr);
    }

    public static <T> T parseObject(String str, Type type, ParseProcess parseProcess, Feature... featureArr) {
        return (T) parseObject(str, type, ParserConfig.global, parseProcess, DEFAULT_PARSER_FEATURE, featureArr);
    }

    public static <T> T parseObject(String str, Type type, int i, Feature... featureArr) {
        if (str == null) {
            return null;
        }
        for (Feature feature : featureArr) {
            i = Feature.config(i, feature, true);
        }
        DefaultJSONParser defaultJSONParser = new DefaultJSONParser(str, ParserConfig.getGlobalInstance(), i);
        T t = (T) defaultJSONParser.parseObject(type);
        defaultJSONParser.handleResovleTask(t);
        defaultJSONParser.close();
        return t;
    }

    public static <T> T parseObject(String str, Type type, ParserConfig parserConfig, Feature... featureArr) {
        return (T) parseObject(str, type, parserConfig, (ParseProcess) null, DEFAULT_PARSER_FEATURE, featureArr);
    }

    public static <T> T parseObject(String str, Type type, ParserConfig parserConfig, int i, Feature... featureArr) {
        return (T) parseObject(str, type, parserConfig, (ParseProcess) null, i, featureArr);
    }

    public static <T> T parseObject(String str, Type type, ParserConfig parserConfig, ParseProcess parseProcess, int i, Feature... featureArr) {
        if (str == null) {
            return null;
        }
        if (featureArr != null) {
            for (Feature feature : featureArr) {
                i |= feature.mask;
            }
        }
        DefaultJSONParser defaultJSONParser = new DefaultJSONParser(str, parserConfig, i);
        if (parseProcess != null) {
            if (parseProcess instanceof ExtraTypeProvider) {
                defaultJSONParser.getExtraTypeProviders().add((ExtraTypeProvider) parseProcess);
            }
            if (parseProcess instanceof ExtraProcessor) {
                defaultJSONParser.getExtraProcessors().add((ExtraProcessor) parseProcess);
            }
            if (parseProcess instanceof FieldTypeResolver) {
                defaultJSONParser.setFieldTypeResolver((FieldTypeResolver) parseProcess);
            }
        }
        T t = (T) defaultJSONParser.parseObject(type, (Object) null);
        defaultJSONParser.handleResovleTask(t);
        defaultJSONParser.close();
        return t;
    }

    public static <T> T parseObject(byte[] bArr, Type type, Feature... featureArr) {
        return (T) parseObject(bArr, 0, bArr.length, IOUtils.UTF8, type, featureArr);
    }

    public static <T> T parseObject(byte[] bArr, int i, int i2, Charset charset, Type type, Feature... featureArr) {
        String str;
        if (charset == null) {
            charset = IOUtils.UTF8;
        }
        if (charset == IOUtils.UTF8) {
            char[] allocateChars = allocateChars(bArr.length);
            str = new String(allocateChars, 0, IOUtils.decodeUTF8(bArr, i, i2, allocateChars));
        } else {
            str = new String(bArr, i, i2, charset);
        }
        return (T) parseObject(str, type, featureArr);
    }

    public static <T> T parseObject(byte[] bArr, int i, int i2, CharsetDecoder charsetDecoder, Type type, Feature... featureArr) {
        charsetDecoder.reset();
        char[] allocateChars = allocateChars((int) (i2 * charsetDecoder.maxCharsPerByte()));
        ByteBuffer wrap = ByteBuffer.wrap(bArr, i, i2);
        CharBuffer wrap2 = CharBuffer.wrap(allocateChars);
        IOUtils.decode(charsetDecoder, wrap, wrap2);
        return (T) parseObject(allocateChars, wrap2.position(), type, featureArr);
    }

    public static <T> T parseObject(char[] cArr, int i, Type type, Feature... featureArr) {
        if (cArr == null || cArr.length == 0) {
            return null;
        }
        int i2 = DEFAULT_PARSER_FEATURE;
        for (Feature feature : featureArr) {
            i2 = Feature.config(i2, feature, true);
        }
        DefaultJSONParser defaultJSONParser = new DefaultJSONParser(cArr, i, ParserConfig.getGlobalInstance(), i2);
        T t = (T) defaultJSONParser.parseObject(type);
        defaultJSONParser.handleResovleTask(t);
        defaultJSONParser.close();
        return t;
    }

    public static <T> T parseObject(InputStream inputStream, Type type, Feature... featureArr) throws IOException {
        return (T) parseObject(inputStream, IOUtils.UTF8, type, featureArr);
    }

    public static <T> T parseObject(InputStream inputStream, Charset charset, Type type, Feature... featureArr) throws IOException {
        if (charset == null) {
            charset = IOUtils.UTF8;
        }
        byte[] allocateBytes = allocateBytes(65536);
        int i = 0;
        while (true) {
            int read = inputStream.read(allocateBytes, i, allocateBytes.length - i);
            if (read != -1) {
                i += read;
                if (i == allocateBytes.length) {
                    byte[] bArr = new byte[(allocateBytes.length * 3) / 2];
                    System.arraycopy(allocateBytes, 0, bArr, 0, allocateBytes.length);
                    allocateBytes = bArr;
                }
            } else {
                return (T) parseObject(allocateBytes, 0, i, charset, type, featureArr);
            }
        }
    }

    public static <T> T parseObject(String str, Class<T> cls) {
        return (T) parseObject(str, (Class) cls, new Feature[0]);
    }

    public static JSONArray parseArray(String text) {
        JSONArray array;
        if (text == null) {
            return null;
        }
        DefaultJSONParser parser = new DefaultJSONParser(text, ParserConfig.getGlobalInstance());
        JSONLexer lexer = parser.lexer;
        if (lexer.token() == 8) {
            lexer.nextToken();
            array = null;
        } else if (lexer.token() == 20) {
            array = null;
        } else {
            array = new JSONArray();
            parser.parseArray(array);
            parser.handleResovleTask(array);
        }
        parser.close();
        return array;
    }

    public static <T> List<T> parseArray(String text, Class<T> clazz) {
        List<T> list;
        if (text == null) {
            return null;
        }
        DefaultJSONParser parser = new DefaultJSONParser(text, ParserConfig.getGlobalInstance());
        JSONLexer lexer = parser.lexer;
        int token = lexer.token();
        if (token == 8) {
            lexer.nextToken();
            list = null;
        } else if (token == 20 && lexer.isBlankInput()) {
            list = null;
        } else {
            list = new ArrayList<>();
            parser.parseArray((Class<?>) clazz, (Collection) list);
            parser.handleResovleTask(list);
        }
        parser.close();
        return list;
    }

    public static List<Object> parseArray(String text, Type[] types) {
        List<Object> list;
        if (text == null) {
            return null;
        }
        DefaultJSONParser parser = new DefaultJSONParser(text, ParserConfig.getGlobalInstance());
        Object[] objectArray = parser.parseArray(types);
        if (objectArray == null) {
            list = null;
        } else {
            list = Arrays.asList(objectArray);
        }
        parser.handleResovleTask(list);
        parser.close();
        return list;
    }

    public static String toJSONString(Object object) {
        return toJSONString(object, emptyFilters, new SerializerFeature[0]);
    }

    public static String toJSONString(Object object, SerializerFeature... features) {
        return toJSONString(object, DEFAULT_GENERATE_FEATURE, features);
    }

    public static String toJSONString(Object object, int defaultFeatures, SerializerFeature... features) {
        SerializeWriter out = new SerializeWriter((Writer) null, defaultFeatures, features);
        try {
            JSONSerializer serializer = new JSONSerializer(out);
            serializer.write(object);
            String serializeWriter = out.toString();
            out.close();
            return serializeWriter;
        } catch (Throwable th) {
            out.close();
            throw th;
        }
    }

    public static String toJSONStringWithDateFormat(Object object, String dateFormat, SerializerFeature... features) {
        return toJSONString(object, SerializeConfig.globalInstance, null, dateFormat, DEFAULT_GENERATE_FEATURE, features);
    }

    public static String toJSONString(Object object, SerializeFilter filter, SerializerFeature... features) {
        return toJSONString(object, SerializeConfig.globalInstance, new SerializeFilter[]{filter}, null, DEFAULT_GENERATE_FEATURE, features);
    }

    public static String toJSONString(Object object, SerializeFilter[] filters, SerializerFeature... features) {
        return toJSONString(object, SerializeConfig.globalInstance, filters, null, DEFAULT_GENERATE_FEATURE, features);
    }

    public static byte[] toJSONBytes(Object object, SerializerFeature... features) {
        return toJSONBytes(object, DEFAULT_GENERATE_FEATURE, features);
    }

    public static byte[] toJSONBytes(Object object, int defaultFeatures, SerializerFeature... features) {
        return toJSONBytes(object, SerializeConfig.globalInstance, defaultFeatures, features);
    }

    public static String toJSONString(Object object, SerializeConfig config, SerializerFeature... features) {
        return toJSONString(object, config, (SerializeFilter) null, features);
    }

    public static String toJSONString(Object object, SerializeConfig config, SerializeFilter filter, SerializerFeature... features) {
        return toJSONString(object, config, new SerializeFilter[]{filter}, null, DEFAULT_GENERATE_FEATURE, features);
    }

    public static String toJSONString(Object object, SerializeConfig config, SerializeFilter[] filters, SerializerFeature... features) {
        return toJSONString(object, config, filters, null, DEFAULT_GENERATE_FEATURE, features);
    }

    public static String toJSONString(Object object, SerializeConfig config, SerializeFilter[] filters, String dateFormat, int defaultFeatures, SerializerFeature... features) {
        SerializeWriter out = new SerializeWriter(null, defaultFeatures, features);
        try {
            JSONSerializer serializer = new JSONSerializer(out, config);
            if (dateFormat != null && dateFormat.length() != 0) {
                serializer.setDateFormat(dateFormat);
                serializer.config(SerializerFeature.WriteDateUseDateFormat, true);
            }
            if (filters != null) {
                for (SerializeFilter filter : filters) {
                    serializer.addFilter(filter);
                }
            }
            serializer.write(object);
            String serializeWriter = out.toString();
            out.close();
            return serializeWriter;
        } catch (Throwable th) {
            out.close();
            throw th;
        }
    }

    public static String toJSONStringZ(Object object, SerializeConfig mapping, SerializerFeature... features) {
        return toJSONString(object, mapping, emptyFilters, null, 0, features);
    }

    public static byte[] toJSONBytes(Object object, SerializeConfig config, SerializerFeature... features) {
        return toJSONBytes(object, config, DEFAULT_GENERATE_FEATURE, features);
    }

    public static byte[] toJSONBytes(Object object, SerializeConfig config, int defaultFeatures, SerializerFeature... features) {
        SerializeWriter out = new SerializeWriter(null, defaultFeatures, features);
        try {
            JSONSerializer serializer = new JSONSerializer(out, config);
            serializer.write(object);
            byte[] bytes = out.toBytes(IOUtils.UTF8);
            out.close();
            return bytes;
        } catch (Throwable th) {
            out.close();
            throw th;
        }
    }

    public static String toJSONString(Object object, boolean prettyFormat) {
        if (!prettyFormat) {
            return toJSONString(object);
        }
        return toJSONString(object, SerializerFeature.PrettyFormat);
    }

    public static void writeJSONStringTo(Object object, Writer writer, SerializerFeature... features) {
        writeJSONString(writer, object, features);
    }

    public static void writeJSONString(Writer writer, Object object, SerializerFeature... features) {
        writeJSONString(writer, object, DEFAULT_GENERATE_FEATURE, features);
    }

    public static void writeJSONString(Writer writer, Object object, int defaultFeatures, SerializerFeature... features) {
        SerializeWriter out = new SerializeWriter(writer, defaultFeatures, features);
        try {
            JSONSerializer serializer = new JSONSerializer(out);
            serializer.write(object);
            out.close();
        } catch (Throwable th) {
            out.close();
            throw th;
        }
    }

    public static final int writeJSONString(OutputStream os, Object object, SerializerFeature... features) throws IOException {
        return writeJSONString(os, object, DEFAULT_GENERATE_FEATURE, features);
    }

    public static final int writeJSONString(OutputStream os, Object object, int defaultFeatures, SerializerFeature... features) throws IOException {
        return writeJSONString(os, IOUtils.UTF8, object, SerializeConfig.globalInstance, null, null, defaultFeatures, features);
    }

    public static final int writeJSONString(OutputStream os, Charset charset, Object object, SerializerFeature... features) throws IOException {
        return writeJSONString(os, charset, object, SerializeConfig.globalInstance, null, null, DEFAULT_GENERATE_FEATURE, features);
    }

    public static final int writeJSONString(OutputStream os, Charset charset, Object object, SerializeConfig config, SerializeFilter[] filters, String dateFormat, int defaultFeatures, SerializerFeature... features) throws IOException {
        SerializeWriter writer = new SerializeWriter(null, defaultFeatures, features);
        try {
            JSONSerializer serializer = new JSONSerializer(writer, config);
            if (dateFormat != null && dateFormat.length() != 0) {
                serializer.setDateFormat(dateFormat);
                serializer.config(SerializerFeature.WriteDateUseDateFormat, true);
            }
            if (filters != null) {
                for (SerializeFilter filter : filters) {
                    serializer.addFilter(filter);
                }
            }
            serializer.write(object);
            int len = writer.writeToEx(os, charset);
            writer.close();
            return len;
        } catch (Throwable th) {
            writer.close();
            throw th;
        }
    }

    public String toString() {
        return toJSONString();
    }

    @Override // com.alibaba.fastjson.JSONAware
    public String toJSONString() {
        SerializeWriter out = new SerializeWriter();
        try {
            new JSONSerializer(out).write(this);
            return out.toString();
        } finally {
            out.close();
        }
    }

    @Override // com.alibaba.fastjson.JSONStreamAware
    public void writeJSONString(Appendable appendable) {
        SerializeWriter out = new SerializeWriter();
        try {
            try {
                new JSONSerializer(out).write(this);
                appendable.append(out.toString());
                out.close();
            } catch (IOException e) {
                throw new JSONException(e.getMessage(), e);
            }
        } catch (Throwable th) {
            out.close();
            throw th;
        }
    }

    public static Object toJSON(Object javaObject) {
        return toJSON(javaObject, SerializeConfig.globalInstance);
    }

    public static Object toJSON(Object javaObject, ParserConfig parserConfig) {
        return toJSON(javaObject, SerializeConfig.globalInstance);
    }

    public static Object toJSON(Object javaObject, SerializeConfig config) {
        if (javaObject == null) {
            return null;
        }
        if (javaObject instanceof JSON) {
            return javaObject;
        }
        if (javaObject instanceof Map) {
            Map<Object, Object> map = (Map) javaObject;
            JSONObject json = new JSONObject(map.size());
            for (Map.Entry<Object, Object> entry : map.entrySet()) {
                Object key = entry.getKey();
                String jsonKey = TypeUtils.castToString(key);
                Object jsonValue = toJSON(entry.getValue());
                json.put(jsonKey, jsonValue);
            }
            return json;
        }
        if (javaObject instanceof Collection) {
            Collection<Object> collection = (Collection) javaObject;
            JSONArray array = new JSONArray(collection.size());
            for (Object item : collection) {
                Object jsonValue2 = toJSON(item);
                array.add(jsonValue2);
            }
            return array;
        }
        Class<?> clazz = javaObject.getClass();
        if (clazz.isEnum()) {
            return ((Enum) javaObject).name();
        }
        if (clazz.isArray()) {
            int len = Array.getLength(javaObject);
            JSONArray array2 = new JSONArray(len);
            for (int i = 0; i < len; i++) {
                Object item2 = Array.get(javaObject, i);
                Object jsonValue3 = toJSON(item2);
                array2.add(jsonValue3);
            }
            return array2;
        }
        if (ParserConfig.isPrimitive(clazz)) {
            return javaObject;
        }
        ObjectSerializer serializer = config.getObjectWriter(clazz);
        if (serializer instanceof JavaBeanSerializer) {
            JavaBeanSerializer javaBeanSerializer = (JavaBeanSerializer) serializer;
            JSONObject json2 = new JSONObject();
            try {
                Map<String, Object> values = javaBeanSerializer.getFieldValuesMap(javaObject);
                for (Map.Entry<String, Object> entry2 : values.entrySet()) {
                    json2.put(entry2.getKey(), toJSON(entry2.getValue()));
                }
                return json2;
            } catch (Exception e) {
                throw new JSONException("toJSON error", e);
            }
        }
        return null;
    }

    public static <T> T toJavaObject(JSON json, Class<T> cls) {
        return (T) TypeUtils.cast((Object) json, (Class) cls, ParserConfig.getGlobalInstance());
    }

    public <T> T toJavaObject(Class<T> cls) {
        return (T) TypeUtils.cast((Object) this, (Class) cls, ParserConfig.getGlobalInstance());
    }

    private static byte[] allocateBytes(int length) {
        byte[] chars = bytesLocal.get();
        if (chars == null) {
            if (length <= 65536) {
                chars = new byte[65536];
                bytesLocal.set(chars);
            } else {
                chars = new byte[length];
            }
        } else if (chars.length < length) {
            chars = new byte[length];
        }
        return chars;
    }

    private static char[] allocateChars(int length) {
        char[] chars = charsLocal.get();
        if (chars == null) {
            if (length <= 65536) {
                chars = new char[65536];
                charsLocal.set(chars);
            } else {
                chars = new char[length];
            }
        } else if (chars.length < length) {
            chars = new char[length];
        }
        return chars;
    }
}
