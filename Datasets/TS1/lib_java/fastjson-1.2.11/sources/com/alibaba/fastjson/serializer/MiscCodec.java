package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONPath;
import com.alibaba.fastjson.JSONStreamAware;
import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.JSONLexer;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import com.alibaba.fastjson.util.TypeUtils;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.net.UnknownHostException;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Currency;
import java.util.Iterator;
import java.util.Locale;
import java.util.TimeZone;
import java.util.UUID;
import java.util.regex.Pattern;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/MiscCodec.class */
public class MiscCodec implements ObjectSerializer, ObjectDeserializer {
    private static Method method_paths_get;
    public static final MiscCodec instance = new MiscCodec();
    private static boolean method_paths_get_error = false;

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        String strVal;
        SerializeWriter out = serializer.out;
        if (object == null) {
            out.writeNull();
            return;
        }
        Class<?> objClass = object.getClass();
        if (objClass == SimpleDateFormat.class) {
            String pattern = ((SimpleDateFormat) object).toPattern();
            if (out.isEnabled(SerializerFeature.WriteClassName) && object.getClass() != fieldType) {
                out.write(123);
                out.writeFieldName(JSON.DEFAULT_TYPE_KEY);
                serializer.write(object.getClass().getName());
                out.writeFieldValue(',', "val", pattern);
                out.write(125);
                return;
            }
            strVal = pattern;
        } else if (objClass == Class.class) {
            Class<?> clazz = (Class) object;
            strVal = clazz.getName();
        } else {
            if (objClass == InetSocketAddress.class) {
                InetSocketAddress address = (InetSocketAddress) object;
                InetAddress inetAddress = address.getAddress();
                out.write(123);
                if (inetAddress != null) {
                    out.writeFieldName("address");
                    serializer.write(inetAddress);
                    out.write(44);
                }
                out.writeFieldName("port");
                out.writeInt(address.getPort());
                out.write(125);
                return;
            }
            if (object instanceof File) {
                strVal = ((File) object).getPath();
            } else if (object instanceof InetAddress) {
                strVal = ((InetAddress) object).getHostAddress();
            } else if (object instanceof TimeZone) {
                TimeZone timeZone = (TimeZone) object;
                strVal = timeZone.getID();
            } else {
                if (!(object instanceof Currency)) {
                    if (object instanceof JSONStreamAware) {
                        JSONStreamAware aware = (JSONStreamAware) object;
                        aware.writeJSONString(out);
                        return;
                    } else if (object instanceof Iterator) {
                        Iterator<?> it = (Iterator) object;
                        writeIterator(serializer, out, it);
                        return;
                    } else {
                        if (object instanceof Iterable) {
                            Iterator<?> it2 = ((Iterable) object).iterator();
                            writeIterator(serializer, out, it2);
                            return;
                        }
                        throw new JSONException("not support class : " + objClass);
                    }
                }
                Currency currency = (Currency) object;
                strVal = currency.getCurrencyCode();
            }
        }
        out.writeString(strVal);
    }

    protected void writeIterator(JSONSerializer serializer, SerializeWriter out, Iterator<?> it) {
        int i = 0;
        out.write(91);
        while (it.hasNext()) {
            if (i != 0) {
                out.write(44);
            }
            Object item = it.next();
            serializer.write(item);
            i++;
        }
        out.write(93);
    }

    /* JADX WARN: Type inference failed for: r0v72, types: [T, java.text.SimpleDateFormat] */
    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        Object parse;
        String str;
        JSONLexer jSONLexer = defaultJSONParser.lexer;
        if (type == InetSocketAddress.class) {
            if (jSONLexer.token() == 8) {
                jSONLexer.nextToken();
                return null;
            }
            defaultJSONParser.accept(12);
            InetAddress inetAddress = null;
            int i = 0;
            while (true) {
                String stringVal = jSONLexer.stringVal();
                jSONLexer.nextToken(17);
                if (stringVal.equals("address")) {
                    defaultJSONParser.accept(17);
                    inetAddress = (InetAddress) defaultJSONParser.parseObject((Class) InetAddress.class);
                } else if (stringVal.equals("port")) {
                    defaultJSONParser.accept(17);
                    if (jSONLexer.token() != 2) {
                        throw new JSONException("port is not int");
                    }
                    i = jSONLexer.intValue();
                    jSONLexer.nextToken();
                } else {
                    defaultJSONParser.accept(17);
                    defaultJSONParser.parse();
                }
                if (jSONLexer.token() == 16) {
                    jSONLexer.nextToken();
                } else {
                    defaultJSONParser.accept(13);
                    return (T) new InetSocketAddress(inetAddress, i);
                }
            }
        } else {
            if (defaultJSONParser.resolveStatus == 2) {
                defaultJSONParser.resolveStatus = 0;
                defaultJSONParser.accept(16);
                if (jSONLexer.token() == 4) {
                    if (!"val".equals(jSONLexer.stringVal())) {
                        throw new JSONException("syntax error");
                    }
                    jSONLexer.nextToken();
                    defaultJSONParser.accept(17);
                    parse = defaultJSONParser.parse();
                    defaultJSONParser.accept(13);
                } else {
                    throw new JSONException("syntax error");
                }
            } else {
                parse = defaultJSONParser.parse();
            }
            if (parse == null) {
                str = null;
            } else if (parse instanceof String) {
                str = (String) parse;
            } else {
                throw new JSONException("expect string");
            }
            if (str == null || str.length() == 0) {
                return null;
            }
            if (type == UUID.class) {
                return (T) UUID.fromString(str);
            }
            if (type == URI.class) {
                return (T) URI.create(str);
            }
            if (type == URL.class) {
                try {
                    return (T) new URL(str);
                } catch (MalformedURLException e) {
                    throw new JSONException("create url error", e);
                }
            }
            if (type == Pattern.class) {
                return (T) Pattern.compile(str);
            }
            if (type == Locale.class) {
                String[] split = str.split("_");
                if (split.length == 1) {
                    return (T) new Locale(split[0]);
                }
                if (split.length == 2) {
                    return (T) new Locale(split[0], split[1]);
                }
                return (T) new Locale(split[0], split[1], split[2]);
            }
            if (type == SimpleDateFormat.class) {
                ?? r0 = (T) new SimpleDateFormat(str, jSONLexer.getLocale());
                r0.setTimeZone(jSONLexer.getTimeZone());
                return r0;
            }
            if (type == InetAddress.class || type == Inet4Address.class || type == Inet6Address.class) {
                try {
                    return (T) InetAddress.getByName(str);
                } catch (UnknownHostException e2) {
                    throw new JSONException("deserialize inet adress error", e2);
                }
            }
            if (type == File.class) {
                return (T) new File(str);
            }
            if (type == TimeZone.class) {
                return (T) TimeZone.getTimeZone(str);
            }
            if (type instanceof ParameterizedType) {
                type = ((ParameterizedType) type).getRawType();
            }
            if (type == Class.class) {
                return (T) TypeUtils.loadClass(str, defaultJSONParser.getConfig().getDefaultClassLoader());
            }
            if (type == Charset.class) {
                return (T) Charset.forName(str);
            }
            if (type == Currency.class) {
                return (T) Currency.getInstance(str);
            }
            if (type == JSONPath.class) {
                return (T) new JSONPath(str);
            }
            String typeName = type.getTypeName();
            if (typeName.equals("java.nio.file.Path")) {
                try {
                    if (method_paths_get == null && !method_paths_get_error) {
                        method_paths_get = TypeUtils.loadClass("java.nio.file.Paths").getMethod("get", String.class, String[].class);
                    }
                    if (method_paths_get != null) {
                        return (T) method_paths_get.invoke(null, str, new String[0]);
                    }
                    throw new JSONException("Path deserialize erorr");
                } catch (IllegalAccessException e3) {
                    throw new JSONException("Path deserialize erorr", e3);
                } catch (NoSuchMethodException e4) {
                    method_paths_get_error = true;
                } catch (InvocationTargetException e5) {
                    throw new JSONException("Path deserialize erorr", e5);
                }
            }
            throw new JSONException("MiscCodec not support " + typeName);
        }
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 4;
    }
}
