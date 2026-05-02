package com.alibaba.fastjson.parser.deserializer;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.Feature;
import com.alibaba.fastjson.parser.JSONLexer;
import com.alibaba.fastjson.parser.JSONLexerBase;
import com.alibaba.fastjson.parser.ParseContext;
import com.alibaba.fastjson.parser.ParserConfig;
import com.alibaba.fastjson.util.FieldInfo;
import com.alibaba.fastjson.util.JavaBeanInfo;
import com.alibaba.fastjson.util.TypeUtils;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/deserializer/JavaBeanDeserializer.class */
public class JavaBeanDeserializer implements ObjectDeserializer {
    private final FieldDeserializer[] fieldDeserializers;
    protected final FieldDeserializer[] sortedFieldDeserializers;
    protected final Class<?> clazz;
    public final JavaBeanInfo beanInfo;

    public JavaBeanDeserializer(ParserConfig config, Class<?> clazz) {
        this(config, clazz, clazz);
    }

    public JavaBeanDeserializer(ParserConfig config, Class<?> clazz, Type type) {
        this.clazz = clazz;
        this.beanInfo = JavaBeanInfo.build(clazz, type);
        this.sortedFieldDeserializers = new FieldDeserializer[this.beanInfo.sortedFields.length];
        int size = this.beanInfo.sortedFields.length;
        for (int i = 0; i < size; i++) {
            FieldInfo fieldInfo = this.beanInfo.sortedFields[i];
            FieldDeserializer fieldDeserializer = config.createFieldDeserializer(config, this.beanInfo, fieldInfo);
            this.sortedFieldDeserializers[i] = fieldDeserializer;
        }
        this.fieldDeserializers = new FieldDeserializer[this.beanInfo.fields.length];
        int size2 = this.beanInfo.fields.length;
        for (int i2 = 0; i2 < size2; i2++) {
            FieldInfo fieldInfo2 = this.beanInfo.fields[i2];
            FieldDeserializer fieldDeserializer2 = getFieldDeserializer(fieldInfo2.name);
            this.fieldDeserializers[i2] = fieldDeserializer2;
        }
    }

    public FieldDeserializer getFieldDeserializer(String key) {
        if (key == null) {
            return null;
        }
        int low = 0;
        int high = this.sortedFieldDeserializers.length - 1;
        while (low <= high) {
            int mid = (low + high) >>> 1;
            String fieldName = this.sortedFieldDeserializers[mid].fieldInfo.name;
            int cmp = fieldName.compareTo(key);
            if (cmp < 0) {
                low = mid + 1;
            } else if (cmp > 0) {
                high = mid - 1;
            } else {
                return this.sortedFieldDeserializers[mid];
            }
        }
        return null;
    }

    public Object createInstance(DefaultJSONParser parser, Type type) {
        Object object;
        if ((type instanceof Class) && this.clazz.isInterface()) {
            Class<?> clazz = (Class) type;
            ClassLoader loader = Thread.currentThread().getContextClassLoader();
            JSONObject obj = new JSONObject();
            Object proxy = Proxy.newProxyInstance(loader, new Class[]{clazz}, obj);
            return proxy;
        }
        if (this.beanInfo.defaultConstructor == null) {
            return null;
        }
        try {
            Constructor<?> constructor = this.beanInfo.defaultConstructor;
            if (this.beanInfo.defaultConstructorParameterSize == 0) {
                object = constructor.newInstance(new Object[0]);
            } else {
                ParseContext context = parser.getContext();
                object = constructor.newInstance(context.object);
            }
            if (parser != null && parser.lexer.isEnabled(Feature.InitStringFieldAsEmpty)) {
                for (FieldInfo fieldInfo : this.beanInfo.fields) {
                    if (fieldInfo.fieldClass == String.class) {
                        try {
                            fieldInfo.set(object, "");
                        } catch (Exception e) {
                            throw new JSONException("create instance error, class " + this.clazz.getName(), e);
                        }
                    }
                }
            }
            return object;
        } catch (Exception e2) {
            throw new JSONException("create instance error, class " + this.clazz.getName(), e2);
        }
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        return (T) deserialze(defaultJSONParser, type, obj, null);
    }

    public <T> T deserialzeArrayMapping(DefaultJSONParser defaultJSONParser, Type type, Object obj, Object obj2) {
        Enum<?> scanEnum;
        JSONLexer jSONLexer = defaultJSONParser.lexer;
        if (jSONLexer.token() != 14) {
            throw new JSONException("error");
        }
        T t = (T) createInstance(defaultJSONParser, type);
        int i = 0;
        int length = this.sortedFieldDeserializers.length;
        while (i < length) {
            char c = i == length - 1 ? ']' : ',';
            FieldDeserializer fieldDeserializer = this.sortedFieldDeserializers[i];
            Class<?> cls = fieldDeserializer.fieldInfo.fieldClass;
            if (cls == Integer.TYPE) {
                fieldDeserializer.setValue((Object) t, jSONLexer.scanInt(c));
            } else if (cls == String.class) {
                fieldDeserializer.setValue((Object) t, jSONLexer.scanString(c));
            } else if (cls == Long.TYPE) {
                fieldDeserializer.setValue(t, jSONLexer.scanLong(c));
            } else if (cls.isEnum()) {
                char current = jSONLexer.getCurrent();
                if (current == '\"' || current == 'n') {
                    scanEnum = jSONLexer.scanEnum(cls, defaultJSONParser.getSymbolTable(), c);
                } else if (current >= '0' && current <= '9') {
                    scanEnum = ((EnumDeserializer) ((DefaultFieldDeserializer) fieldDeserializer).getFieldValueDeserilizer(defaultJSONParser.getConfig())).valueOf(jSONLexer.scanInt(c));
                } else {
                    scanEnum = scanEnum(jSONLexer, c);
                }
                fieldDeserializer.setValue(t, scanEnum);
            } else if (cls == Boolean.TYPE) {
                fieldDeserializer.setValue(t, jSONLexer.scanBoolean(c));
            } else if (cls == Float.TYPE) {
                fieldDeserializer.setValue(t, Float.valueOf(jSONLexer.scanFloat(c)));
            } else if (cls == Double.TYPE) {
                fieldDeserializer.setValue(t, Double.valueOf(jSONLexer.scanDouble(c)));
            } else if (cls == Date.class && jSONLexer.getCurrent() == '1') {
                fieldDeserializer.setValue(t, new Date(jSONLexer.scanLong(c)));
            } else {
                jSONLexer.nextToken(14);
                fieldDeserializer.setValue(t, defaultJSONParser.parseObject(fieldDeserializer.fieldInfo.fieldType));
                check(jSONLexer, c == ']' ? 15 : 16);
            }
            i++;
        }
        jSONLexer.nextToken(16);
        return t;
    }

    protected void check(JSONLexer lexer, int token) {
        if (lexer.token() != token) {
            throw new JSONException("syntax error");
        }
    }

    protected Enum<?> scanEnum(JSONLexer lexer, char seperator) {
        throw new JSONException("illegal enum. " + lexer.info());
    }

    /* JADX WARN: Code restructure failed: missing block: B:267:0x06ad, code lost:
    
        throw new com.alibaba.fastjson.JSONException("syntax error, unexpect token " + com.alibaba.fastjson.parser.JSONToken.name(r0.token()));
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:151:0x0371 A[Catch: all -> 0x0811, TryCatch #0 {all -> 0x0811, blocks: (B:20:0x0055, B:22:0x0061, B:30:0x0089, B:32:0x009a, B:38:0x00b1, B:47:0x00df, B:56:0x0105, B:58:0x0114, B:63:0x0131, B:65:0x015b, B:66:0x0167, B:67:0x0173, B:68:0x0174, B:70:0x017c, B:72:0x0184, B:74:0x019a, B:77:0x01bf, B:87:0x01ff, B:99:0x023f, B:102:0x0259, B:268:0x06ae, B:105:0x0266, B:115:0x029f, B:125:0x02d8, B:135:0x0311, B:137:0x0319, B:139:0x0328, B:141:0x033d, B:142:0x034f, B:146:0x035f, B:129:0x02e7, B:132:0x0304, B:119:0x02ae, B:122:0x02cb, B:109:0x0275, B:112:0x0292, B:91:0x020e, B:94:0x022b, B:81:0x01d5, B:84:0x01f2, B:151:0x0371, B:153:0x0381, B:155:0x038f, B:273:0x06be, B:275:0x06cb, B:281:0x06ef, B:284:0x070e, B:285:0x072c, B:287:0x0736, B:291:0x076f, B:293:0x0779, B:295:0x078d, B:296:0x07b2, B:289:0x0749, B:290:0x076e, B:297:0x07b3, B:304:0x07da, B:306:0x07ec, B:307:0x07f7, B:158:0x03a0, B:163:0x03b5, B:165:0x03c8, B:167:0x03d9, B:190:0x049c, B:192:0x04ad, B:193:0x04b6, B:194:0x04b7, B:168:0x03e3, B:170:0x03ed, B:172:0x03fc, B:173:0x0406, B:175:0x041d, B:178:0x042b, B:180:0x0433, B:181:0x043d, B:183:0x0445, B:184:0x044f, B:186:0x0466, B:188:0x047d, B:189:0x049b, B:199:0x04e1, B:201:0x04e9, B:203:0x04f8, B:205:0x0515, B:207:0x051f, B:208:0x0527, B:210:0x0543, B:211:0x055a, B:216:0x057c, B:217:0x0585, B:222:0x0590, B:224:0x059d, B:225:0x05ab, B:230:0x05c0, B:256:0x0658, B:259:0x0665, B:261:0x066f, B:262:0x0679, B:264:0x0683, B:266:0x068c, B:267:0x06ad, B:233:0x05d3, B:248:0x0627, B:236:0x05ea, B:238:0x05f2, B:240:0x05fa, B:242:0x0602, B:244:0x060a, B:246:0x0612, B:247:0x061e, B:251:0x0633, B:253:0x0646, B:255:0x0650), top: B:319:0x0052, inners: #1, #2, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:220:0x058b  */
    /* JADX WARN: Removed duplicated region for block: B:224:0x059d A[Catch: all -> 0x0811, TryCatch #0 {all -> 0x0811, blocks: (B:20:0x0055, B:22:0x0061, B:30:0x0089, B:32:0x009a, B:38:0x00b1, B:47:0x00df, B:56:0x0105, B:58:0x0114, B:63:0x0131, B:65:0x015b, B:66:0x0167, B:67:0x0173, B:68:0x0174, B:70:0x017c, B:72:0x0184, B:74:0x019a, B:77:0x01bf, B:87:0x01ff, B:99:0x023f, B:102:0x0259, B:268:0x06ae, B:105:0x0266, B:115:0x029f, B:125:0x02d8, B:135:0x0311, B:137:0x0319, B:139:0x0328, B:141:0x033d, B:142:0x034f, B:146:0x035f, B:129:0x02e7, B:132:0x0304, B:119:0x02ae, B:122:0x02cb, B:109:0x0275, B:112:0x0292, B:91:0x020e, B:94:0x022b, B:81:0x01d5, B:84:0x01f2, B:151:0x0371, B:153:0x0381, B:155:0x038f, B:273:0x06be, B:275:0x06cb, B:281:0x06ef, B:284:0x070e, B:285:0x072c, B:287:0x0736, B:291:0x076f, B:293:0x0779, B:295:0x078d, B:296:0x07b2, B:289:0x0749, B:290:0x076e, B:297:0x07b3, B:304:0x07da, B:306:0x07ec, B:307:0x07f7, B:158:0x03a0, B:163:0x03b5, B:165:0x03c8, B:167:0x03d9, B:190:0x049c, B:192:0x04ad, B:193:0x04b6, B:194:0x04b7, B:168:0x03e3, B:170:0x03ed, B:172:0x03fc, B:173:0x0406, B:175:0x041d, B:178:0x042b, B:180:0x0433, B:181:0x043d, B:183:0x0445, B:184:0x044f, B:186:0x0466, B:188:0x047d, B:189:0x049b, B:199:0x04e1, B:201:0x04e9, B:203:0x04f8, B:205:0x0515, B:207:0x051f, B:208:0x0527, B:210:0x0543, B:211:0x055a, B:216:0x057c, B:217:0x0585, B:222:0x0590, B:224:0x059d, B:225:0x05ab, B:230:0x05c0, B:256:0x0658, B:259:0x0665, B:261:0x066f, B:262:0x0679, B:264:0x0683, B:266:0x068c, B:267:0x06ad, B:233:0x05d3, B:248:0x0627, B:236:0x05ea, B:238:0x05f2, B:240:0x05fa, B:242:0x0602, B:244:0x060a, B:246:0x0612, B:247:0x061e, B:251:0x0633, B:253:0x0646, B:255:0x0650), top: B:319:0x0052, inners: #1, #2, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:228:0x05bb  */
    /* JADX WARN: Removed duplicated region for block: B:251:0x0633 A[Catch: all -> 0x0811, TryCatch #0 {all -> 0x0811, blocks: (B:20:0x0055, B:22:0x0061, B:30:0x0089, B:32:0x009a, B:38:0x00b1, B:47:0x00df, B:56:0x0105, B:58:0x0114, B:63:0x0131, B:65:0x015b, B:66:0x0167, B:67:0x0173, B:68:0x0174, B:70:0x017c, B:72:0x0184, B:74:0x019a, B:77:0x01bf, B:87:0x01ff, B:99:0x023f, B:102:0x0259, B:268:0x06ae, B:105:0x0266, B:115:0x029f, B:125:0x02d8, B:135:0x0311, B:137:0x0319, B:139:0x0328, B:141:0x033d, B:142:0x034f, B:146:0x035f, B:129:0x02e7, B:132:0x0304, B:119:0x02ae, B:122:0x02cb, B:109:0x0275, B:112:0x0292, B:91:0x020e, B:94:0x022b, B:81:0x01d5, B:84:0x01f2, B:151:0x0371, B:153:0x0381, B:155:0x038f, B:273:0x06be, B:275:0x06cb, B:281:0x06ef, B:284:0x070e, B:285:0x072c, B:287:0x0736, B:291:0x076f, B:293:0x0779, B:295:0x078d, B:296:0x07b2, B:289:0x0749, B:290:0x076e, B:297:0x07b3, B:304:0x07da, B:306:0x07ec, B:307:0x07f7, B:158:0x03a0, B:163:0x03b5, B:165:0x03c8, B:167:0x03d9, B:190:0x049c, B:192:0x04ad, B:193:0x04b6, B:194:0x04b7, B:168:0x03e3, B:170:0x03ed, B:172:0x03fc, B:173:0x0406, B:175:0x041d, B:178:0x042b, B:180:0x0433, B:181:0x043d, B:183:0x0445, B:184:0x044f, B:186:0x0466, B:188:0x047d, B:189:0x049b, B:199:0x04e1, B:201:0x04e9, B:203:0x04f8, B:205:0x0515, B:207:0x051f, B:208:0x0527, B:210:0x0543, B:211:0x055a, B:216:0x057c, B:217:0x0585, B:222:0x0590, B:224:0x059d, B:225:0x05ab, B:230:0x05c0, B:256:0x0658, B:259:0x0665, B:261:0x066f, B:262:0x0679, B:264:0x0683, B:266:0x068c, B:267:0x06ad, B:233:0x05d3, B:248:0x0627, B:236:0x05ea, B:238:0x05f2, B:240:0x05fa, B:242:0x0602, B:244:0x060a, B:246:0x0612, B:247:0x061e, B:251:0x0633, B:253:0x0646, B:255:0x0650), top: B:319:0x0052, inners: #1, #2, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:258:0x0662  */
    /* JADX WARN: Removed duplicated region for block: B:259:0x0665 A[Catch: all -> 0x0811, TryCatch #0 {all -> 0x0811, blocks: (B:20:0x0055, B:22:0x0061, B:30:0x0089, B:32:0x009a, B:38:0x00b1, B:47:0x00df, B:56:0x0105, B:58:0x0114, B:63:0x0131, B:65:0x015b, B:66:0x0167, B:67:0x0173, B:68:0x0174, B:70:0x017c, B:72:0x0184, B:74:0x019a, B:77:0x01bf, B:87:0x01ff, B:99:0x023f, B:102:0x0259, B:268:0x06ae, B:105:0x0266, B:115:0x029f, B:125:0x02d8, B:135:0x0311, B:137:0x0319, B:139:0x0328, B:141:0x033d, B:142:0x034f, B:146:0x035f, B:129:0x02e7, B:132:0x0304, B:119:0x02ae, B:122:0x02cb, B:109:0x0275, B:112:0x0292, B:91:0x020e, B:94:0x022b, B:81:0x01d5, B:84:0x01f2, B:151:0x0371, B:153:0x0381, B:155:0x038f, B:273:0x06be, B:275:0x06cb, B:281:0x06ef, B:284:0x070e, B:285:0x072c, B:287:0x0736, B:291:0x076f, B:293:0x0779, B:295:0x078d, B:296:0x07b2, B:289:0x0749, B:290:0x076e, B:297:0x07b3, B:304:0x07da, B:306:0x07ec, B:307:0x07f7, B:158:0x03a0, B:163:0x03b5, B:165:0x03c8, B:167:0x03d9, B:190:0x049c, B:192:0x04ad, B:193:0x04b6, B:194:0x04b7, B:168:0x03e3, B:170:0x03ed, B:172:0x03fc, B:173:0x0406, B:175:0x041d, B:178:0x042b, B:180:0x0433, B:181:0x043d, B:183:0x0445, B:184:0x044f, B:186:0x0466, B:188:0x047d, B:189:0x049b, B:199:0x04e1, B:201:0x04e9, B:203:0x04f8, B:205:0x0515, B:207:0x051f, B:208:0x0527, B:210:0x0543, B:211:0x055a, B:216:0x057c, B:217:0x0585, B:222:0x0590, B:224:0x059d, B:225:0x05ab, B:230:0x05c0, B:256:0x0658, B:259:0x0665, B:261:0x066f, B:262:0x0679, B:264:0x0683, B:266:0x068c, B:267:0x06ad, B:233:0x05d3, B:248:0x0627, B:236:0x05ea, B:238:0x05f2, B:240:0x05fa, B:242:0x0602, B:244:0x060a, B:246:0x0612, B:247:0x061e, B:251:0x0633, B:253:0x0646, B:255:0x0650), top: B:319:0x0052, inners: #1, #2, #3 }] */
    /* JADX WARN: Type inference failed for: r0v210, types: [com.alibaba.fastjson.parser.deserializer.ObjectDeserializer] */
    /* JADX WARN: Type inference failed for: r8v0, types: [com.alibaba.fastjson.parser.DefaultJSONParser] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected <T> T deserialze(com.alibaba.fastjson.parser.DefaultJSONParser r8, java.lang.reflect.Type r9, java.lang.Object r10, java.lang.Object r11) {
        /*
            Method dump skipped, instructions count: 2088
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.alibaba.fastjson.parser.deserializer.JavaBeanDeserializer.deserialze(com.alibaba.fastjson.parser.DefaultJSONParser, java.lang.reflect.Type, java.lang.Object, java.lang.Object):java.lang.Object");
    }

    public boolean parseField(DefaultJSONParser parser, String key, Object object, Type objectType, Map<String, Object> fieldValues) {
        JSONLexer lexer = parser.lexer;
        FieldDeserializer fieldDeserializer = smartMatch(key);
        if (fieldDeserializer == null) {
            if (!lexer.isEnabled(Feature.IgnoreNotMatch)) {
                throw new JSONException("setter not found, class " + this.clazz.getName() + ", property " + key);
            }
            parser.parseExtra(object, key);
            return false;
        }
        lexer.nextTokenWithColon(fieldDeserializer.getFastMatchToken());
        fieldDeserializer.parseField(parser, object, objectType, fieldValues);
        return true;
    }

    public FieldDeserializer smartMatch(String key) {
        if (key == null) {
            return null;
        }
        FieldDeserializer fieldDeserializer = getFieldDeserializer(key);
        if (fieldDeserializer == null) {
            boolean startsWithIs = key.startsWith("is");
            FieldDeserializer[] fieldDeserializerArr = this.sortedFieldDeserializers;
            int length = fieldDeserializerArr.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                FieldDeserializer fieldDeser = fieldDeserializerArr[i];
                FieldInfo fieldInfo = fieldDeser.fieldInfo;
                Class<?> fieldClass = fieldInfo.fieldClass;
                String fieldName = fieldInfo.name;
                if (fieldName.equalsIgnoreCase(key)) {
                    fieldDeserializer = fieldDeser;
                    break;
                }
                if (!startsWithIs || ((fieldClass != Boolean.TYPE && fieldClass != Boolean.class) || !fieldName.equalsIgnoreCase(key.substring(2)))) {
                    i++;
                } else {
                    fieldDeserializer = fieldDeser;
                    break;
                }
            }
        }
        if (fieldDeserializer == null && key.indexOf(95) != -1) {
            String key2 = key.replaceAll("_", "");
            fieldDeserializer = getFieldDeserializer(key2);
            if (fieldDeserializer == null) {
                FieldDeserializer[] fieldDeserializerArr2 = this.sortedFieldDeserializers;
                int length2 = fieldDeserializerArr2.length;
                int i2 = 0;
                while (true) {
                    if (i2 >= length2) {
                        break;
                    }
                    FieldDeserializer fieldDeser2 = fieldDeserializerArr2[i2];
                    if (!fieldDeser2.fieldInfo.name.equalsIgnoreCase(key2)) {
                        i2++;
                    } else {
                        fieldDeserializer = fieldDeser2;
                        break;
                    }
                }
            }
        }
        return fieldDeserializer;
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 12;
    }

    public Object createInstance(Map<String, Object> map, ParserConfig config) throws IllegalArgumentException, IllegalAccessException, InvocationTargetException {
        Object object = null;
        if (this.beanInfo.creatorConstructor == null && this.beanInfo.buildMethod == null) {
            Object object2 = createInstance((DefaultJSONParser) null, this.clazz);
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                String key = entry.getKey();
                Object value = entry.getValue();
                FieldDeserializer fieldDeser = getFieldDeserializer(key);
                if (fieldDeser != null) {
                    Method method = fieldDeser.fieldInfo.method;
                    if (method != null) {
                        Type paramType = method.getGenericParameterTypes()[0];
                        method.invoke(object2, TypeUtils.cast(value, paramType, config));
                    } else {
                        Field field = fieldDeser.fieldInfo.field;
                        Type paramType2 = fieldDeser.fieldInfo.fieldType;
                        field.set(object2, TypeUtils.cast(value, paramType2, config));
                    }
                }
            }
            return object2;
        }
        FieldInfo[] fieldInfoList = this.beanInfo.fields;
        int size = fieldInfoList.length;
        Object[] params = new Object[size];
        for (int i = 0; i < size; i++) {
            FieldInfo fieldInfo = fieldInfoList[i];
            params[i] = map.get(fieldInfo.name);
        }
        if (this.beanInfo.creatorConstructor != null) {
            try {
                object = this.beanInfo.creatorConstructor.newInstance(params);
            } catch (Exception e) {
                throw new JSONException("create instance error, " + this.beanInfo.creatorConstructor.toGenericString(), e);
            }
        } else if (this.beanInfo.factoryMethod != null) {
            try {
                object = this.beanInfo.factoryMethod.invoke(null, params);
            } catch (Exception e2) {
                throw new JSONException("create factory method error, " + this.beanInfo.factoryMethod.toString(), e2);
            }
        }
        return object;
    }

    public Type getFieldType(int ordinal) {
        return this.sortedFieldDeserializers[ordinal].fieldInfo.fieldType;
    }

    protected Object parseRest(DefaultJSONParser parser, Type type, Object fieldName, Object instance) {
        Object value = deserialze(parser, type, fieldName, instance);
        return value;
    }

    protected JavaBeanDeserializer getSeeAlso(ParserConfig config, JavaBeanInfo beanInfo, String typeName) {
        if (beanInfo.jsonType == null) {
            return null;
        }
        for (Class<?> seeAlsoClass : beanInfo.jsonType.seeAlso()) {
            ObjectDeserializer seeAlsoDeser = config.getDeserializer(seeAlsoClass);
            if (seeAlsoDeser instanceof JavaBeanDeserializer) {
                JavaBeanDeserializer seeAlsoJavaBeanDeser = (JavaBeanDeserializer) seeAlsoDeser;
                JavaBeanInfo subBeanInfo = seeAlsoJavaBeanDeser.beanInfo;
                if (subBeanInfo.typeName.equals(typeName)) {
                    return seeAlsoJavaBeanDeser;
                }
                JavaBeanDeserializer subSeeAlso = getSeeAlso(config, subBeanInfo, typeName);
                if (subSeeAlso != null) {
                    return subSeeAlso;
                }
            }
        }
        return null;
    }

    protected static void parseArray(Collection collection, ObjectDeserializer deser, DefaultJSONParser parser, Type type, Object fieldName) {
        JSONLexerBase lexer = (JSONLexerBase) parser.lexer;
        int token = lexer.token();
        if (token == 8) {
            lexer.nextToken(16);
            token = lexer.token();
        }
        if (token != 14) {
            parser.throwException(token);
        }
        char ch = lexer.getCurrent();
        if (ch == '[') {
            lexer.next();
            lexer.setToken(14);
        } else {
            lexer.nextToken(14);
        }
        int index = 0;
        while (true) {
            Object item = deser.deserialze(parser, type, Integer.valueOf(index));
            collection.add(item);
            index++;
            if (lexer.token() != 16) {
                break;
            }
            char ch2 = lexer.getCurrent();
            if (ch2 == '[') {
                lexer.next();
                lexer.setToken(14);
            } else {
                lexer.nextToken(14);
            }
        }
        int token2 = lexer.token();
        if (token2 != 15) {
            parser.throwException(token2);
        }
        char ch3 = lexer.getCurrent();
        if (ch3 == ',') {
            lexer.next();
            lexer.setToken(16);
        } else {
            lexer.nextToken(16);
        }
    }
}
