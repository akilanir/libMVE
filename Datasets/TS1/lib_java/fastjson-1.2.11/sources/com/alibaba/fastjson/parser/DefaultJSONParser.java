package com.alibaba.fastjson.parser;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.deserializer.ExtraProcessable;
import com.alibaba.fastjson.parser.deserializer.ExtraProcessor;
import com.alibaba.fastjson.parser.deserializer.ExtraTypeProvider;
import com.alibaba.fastjson.parser.deserializer.FieldDeserializer;
import com.alibaba.fastjson.parser.deserializer.FieldTypeResolver;
import com.alibaba.fastjson.parser.deserializer.JavaBeanDeserializer;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import com.alibaba.fastjson.parser.deserializer.ResolveFieldDeserializer;
import com.alibaba.fastjson.serializer.IntegerCodec;
import com.alibaba.fastjson.serializer.LongCodec;
import com.alibaba.fastjson.serializer.StringCodec;
import com.alibaba.fastjson.util.TypeUtils;
import java.io.Closeable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/DefaultJSONParser.class */
public class DefaultJSONParser implements Closeable {
    public final Object input;
    public final SymbolTable symbolTable;
    protected ParserConfig config;
    private static final Set<Class<?>> primitiveClasses = new HashSet();
    private String dateFormatPattern;
    private DateFormat dateFormat;
    public final JSONLexer lexer;
    protected ParseContext context;
    private ParseContext[] contextArray;
    private int contextArrayIndex;
    private List<ResolveTask> resolveTaskList;
    public static final int NONE = 0;
    public static final int NeedToResolve = 1;
    public static final int TypeNameRedirect = 2;
    public int resolveStatus;
    private List<ExtraTypeProvider> extraTypeProviders;
    private List<ExtraProcessor> extraProcessors;
    protected FieldTypeResolver fieldTypeResolver;

    static {
        primitiveClasses.add(Boolean.TYPE);
        primitiveClasses.add(Byte.TYPE);
        primitiveClasses.add(Short.TYPE);
        primitiveClasses.add(Integer.TYPE);
        primitiveClasses.add(Long.TYPE);
        primitiveClasses.add(Float.TYPE);
        primitiveClasses.add(Double.TYPE);
        primitiveClasses.add(Boolean.class);
        primitiveClasses.add(Byte.class);
        primitiveClasses.add(Short.class);
        primitiveClasses.add(Integer.class);
        primitiveClasses.add(Long.class);
        primitiveClasses.add(Float.class);
        primitiveClasses.add(Double.class);
        primitiveClasses.add(BigInteger.class);
        primitiveClasses.add(BigDecimal.class);
        primitiveClasses.add(String.class);
    }

    public String getDateFomartPattern() {
        return this.dateFormatPattern;
    }

    public DateFormat getDateFormat() {
        if (this.dateFormat == null) {
            this.dateFormat = new SimpleDateFormat(this.dateFormatPattern, this.lexer.getLocale());
            this.dateFormat.setTimeZone(this.lexer.getTimeZone());
        }
        return this.dateFormat;
    }

    public void setDateFormat(String dateFormat) {
        this.dateFormatPattern = dateFormat;
        this.dateFormat = null;
    }

    public void setDateFomrat(DateFormat dateFormat) {
        this.dateFormat = dateFormat;
    }

    public DefaultJSONParser(String input) {
        this(input, ParserConfig.getGlobalInstance(), JSON.DEFAULT_PARSER_FEATURE);
    }

    public DefaultJSONParser(String input, ParserConfig config) {
        this(input, new JSONScanner(input, JSON.DEFAULT_PARSER_FEATURE), config);
    }

    public DefaultJSONParser(String input, ParserConfig config, int features) {
        this(input, new JSONScanner(input, features), config);
    }

    public DefaultJSONParser(char[] input, int length, ParserConfig config, int features) {
        this(input, new JSONScanner(input, length, features), config);
    }

    public DefaultJSONParser(JSONLexer lexer) {
        this(lexer, ParserConfig.getGlobalInstance());
    }

    public DefaultJSONParser(JSONLexer lexer, ParserConfig config) {
        this((Object) null, lexer, config);
    }

    public DefaultJSONParser(Object input, JSONLexer lexer, ParserConfig config) {
        this.dateFormatPattern = JSON.DEFFAULT_DATE_FORMAT;
        this.contextArrayIndex = 0;
        this.resolveStatus = 0;
        this.extraTypeProviders = null;
        this.extraProcessors = null;
        this.fieldTypeResolver = null;
        this.lexer = lexer;
        this.input = input;
        this.config = config;
        this.symbolTable = config.symbolTable;
        int ch = lexer.getCurrent();
        if (ch == 123) {
            lexer.next();
            ((JSONLexerBase) lexer).token = 12;
        } else if (ch == 91) {
            lexer.next();
            ((JSONLexerBase) lexer).token = 14;
        } else {
            lexer.nextToken();
        }
    }

    public SymbolTable getSymbolTable() {
        return this.symbolTable;
    }

    public String getInput() {
        if (this.input instanceof char[]) {
            return new String((char[]) this.input);
        }
        return this.input.toString();
    }

    /* JADX WARN: Code restructure failed: missing block: B:101:0x0368, code lost:
    
        if (r17 != null) goto L109;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x036f, code lost:
    
        if (r0 != java.lang.Cloneable.class) goto L105;
     */
    /* JADX WARN: Code restructure failed: missing block: B:104:0x0372, code lost:
    
        r17 = new java.util.HashMap();
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x0385, code lost:
    
        if ("java.util.Collections$EmptyMap".equals(r0) == false) goto L108;
     */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x0388, code lost:
    
        r17 = java.util.Collections.emptyMap();
     */
    /* JADX WARN: Code restructure failed: missing block: B:108:0x0390, code lost:
    
        r17 = r0.newInstance();
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x03a3, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:0x03a4, code lost:
    
        r17 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x03b1, code lost:
    
        throw new com.alibaba.fastjson.JSONException("create instance error", r17);
     */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x03b2, code lost:
    
        setResolveStatus(2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:116:0x03bb, code lost:
    
        if (r6.context == null) goto L120;
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x03c2, code lost:
    
        if ((r8 instanceof java.lang.Integer) != false) goto L120;
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x03c5, code lost:
    
        popContext();
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x03cf, code lost:
    
        if (r7.size() <= 0) goto L125;
     */
    /* JADX WARN: Code restructure failed: missing block: B:122:0x03d2, code lost:
    
        r0 = com.alibaba.fastjson.util.TypeUtils.cast((java.lang.Object) r7, (java.lang.Class<java.lang.Object>) r0, r6.config);
        parseObject(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:123:0x03e9, code lost:
    
        setContext(r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:124:0x03f0, code lost:
    
        return r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:125:0x03f1, code lost:
    
        r0 = r6.config.getDeserializer(r0).deserialze(r6, r0, r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:126:0x040a, code lost:
    
        setContext(r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:127:0x0411, code lost:
    
        return r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x0328, code lost:
    
        r0.nextToken(16);
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x0338, code lost:
    
        if (r0.token() != 13) goto L115;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x033b, code lost:
    
        r0.nextToken(16);
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x0343, code lost:
    
        r17 = null;
        r0 = r6.config.getDeserializer(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x0356, code lost:
    
        if ((r0 instanceof com.alibaba.fastjson.parser.deserializer.JavaBeanDeserializer) == false) goto L100;
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x0359, code lost:
    
        r17 = ((com.alibaba.fastjson.parser.deserializer.JavaBeanDeserializer) r0).createInstance(r6, r0);
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v178, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v190, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v38, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v99, types: [java.util.Date] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object parseObject(java.util.Map r7, java.lang.Object r8) {
        /*
            Method dump skipped, instructions count: 2313
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.alibaba.fastjson.parser.DefaultJSONParser.parseObject(java.util.Map, java.lang.Object):java.lang.Object");
    }

    public ParserConfig getConfig() {
        return this.config;
    }

    public void setConfig(ParserConfig config) {
        this.config = config;
    }

    public <T> T parseObject(Class<T> cls) {
        return (T) parseObject(cls, (Object) null);
    }

    public <T> T parseObject(Type type) {
        return (T) parseObject(type, (Object) null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <T> T parseObject(Type type, Object obj) {
        int i = this.lexer.token();
        if (i == 8) {
            this.lexer.nextToken();
            return null;
        }
        if (i == 4) {
            if (type == byte[].class) {
                T t = (T) this.lexer.bytesValue();
                this.lexer.nextToken();
                return t;
            }
            if (type == char[].class) {
                String stringVal = this.lexer.stringVal();
                this.lexer.nextToken();
                return (T) stringVal.toCharArray();
            }
        }
        try {
            return (T) this.config.getDeserializer(type).deserialze(this, type, obj);
        } catch (JSONException e) {
            throw e;
        } catch (Throwable th) {
            throw new JSONException(th.getMessage(), th);
        }
    }

    public <T> List<T> parseArray(Class<T> clazz) {
        List<T> array = new ArrayList<>();
        parseArray((Class<?>) clazz, (Collection) array);
        return array;
    }

    public void parseArray(Class<?> clazz, Collection array) {
        parseArray((Type) clazz, array);
    }

    public void parseArray(Type type, Collection array) {
        parseArray(type, array, null);
    }

    public void parseArray(Type type, Collection array, Object fieldName) {
        ObjectDeserializer deserializer;
        Object val;
        String value;
        if (this.lexer.token() == 21 || this.lexer.token() == 22) {
            this.lexer.nextToken();
        }
        if (this.lexer.token() != 14) {
            throw new JSONException("exepct '[', but " + JSONToken.name(this.lexer.token()) + ", " + this.lexer.info());
        }
        if (Integer.TYPE == type) {
            deserializer = IntegerCodec.instance;
            this.lexer.nextToken(2);
        } else if (String.class == type) {
            deserializer = StringCodec.instance;
            this.lexer.nextToken(4);
        } else {
            deserializer = this.config.getDeserializer(type);
            this.lexer.nextToken(deserializer.getFastMatchToken());
        }
        ParseContext context = this.context;
        setContext(array, fieldName);
        int i = 0;
        while (true) {
            try {
                if (this.lexer.isEnabled(Feature.AllowArbitraryCommas)) {
                    while (this.lexer.token() == 16) {
                        this.lexer.nextToken();
                    }
                }
                if (this.lexer.token() != 15) {
                    if (Integer.TYPE == type) {
                        Object val2 = IntegerCodec.instance.deserialze(this, null, null);
                        array.add(val2);
                    } else if (String.class == type) {
                        if (this.lexer.token() == 4) {
                            value = this.lexer.stringVal();
                            this.lexer.nextToken(16);
                        } else {
                            Object obj = parse();
                            if (obj == null) {
                                value = null;
                            } else {
                                value = obj.toString();
                            }
                        }
                        array.add(value);
                    } else {
                        if (this.lexer.token() == 8) {
                            this.lexer.nextToken();
                            val = null;
                        } else {
                            val = deserializer.deserialze(this, type, Integer.valueOf(i));
                        }
                        array.add(val);
                        checkListResolve(array);
                    }
                    if (this.lexer.token() == 16) {
                        this.lexer.nextToken(deserializer.getFastMatchToken());
                    }
                    i++;
                } else {
                    this.lexer.nextToken(16);
                    return;
                }
            } finally {
                setContext(context);
            }
        }
    }

    public Object[] parseArray(Type[] types) {
        Object value;
        if (this.lexer.token() == 8) {
            this.lexer.nextToken(16);
            return null;
        }
        if (this.lexer.token() != 14) {
            throw new JSONException("syntax error : " + this.lexer.tokenName());
        }
        Object[] list = new Object[types.length];
        if (types.length == 0) {
            this.lexer.nextToken(15);
            if (this.lexer.token() != 15) {
                throw new JSONException("syntax error");
            }
            this.lexer.nextToken(16);
            return new Object[0];
        }
        this.lexer.nextToken(2);
        for (int i = 0; i < types.length; i++) {
            if (this.lexer.token() == 8) {
                value = null;
                this.lexer.nextToken(16);
            } else {
                Type type = types[i];
                if (type == Integer.TYPE || type == Integer.class) {
                    if (this.lexer.token() == 2) {
                        value = Integer.valueOf(this.lexer.intValue());
                        this.lexer.nextToken(16);
                    } else {
                        Object value2 = parse();
                        value = TypeUtils.cast(value2, type, this.config);
                    }
                } else if (type == String.class) {
                    if (this.lexer.token() == 4) {
                        value = this.lexer.stringVal();
                        this.lexer.nextToken(16);
                    } else {
                        Object value3 = parse();
                        value = TypeUtils.cast(value3, type, this.config);
                    }
                } else {
                    boolean isArray = false;
                    Class<?> componentType = null;
                    if (i == types.length - 1 && (type instanceof Class)) {
                        Class<?> clazz = (Class) type;
                        isArray = clazz.isArray();
                        componentType = clazz.getComponentType();
                    }
                    if (isArray && this.lexer.token() != 14) {
                        List<Object> varList = new ArrayList<>();
                        ObjectDeserializer derializer = this.config.getDeserializer(componentType);
                        int fastMatch = derializer.getFastMatchToken();
                        if (this.lexer.token() != 15) {
                            while (true) {
                                Object item = derializer.deserialze(this, type, null);
                                varList.add(item);
                                if (this.lexer.token() != 16) {
                                    break;
                                }
                                this.lexer.nextToken(fastMatch);
                            }
                            if (this.lexer.token() != 15) {
                                throw new JSONException("syntax error :" + JSONToken.name(this.lexer.token()));
                            }
                        }
                        value = TypeUtils.cast(varList, type, this.config);
                    } else {
                        value = this.config.getDeserializer(type).deserialze(this, type, null);
                    }
                }
            }
            list[i] = value;
            if (this.lexer.token() == 15) {
                break;
            }
            if (this.lexer.token() != 16) {
                throw new JSONException("syntax error :" + JSONToken.name(this.lexer.token()));
            }
            if (i == types.length - 1) {
                this.lexer.nextToken(15);
            } else {
                this.lexer.nextToken(2);
            }
        }
        if (this.lexer.token() != 15) {
            throw new JSONException("syntax error");
        }
        this.lexer.nextToken(16);
        return list;
    }

    public void parseObject(Object object) {
        Object fieldValue;
        Class<?> clazz = object.getClass();
        JavaBeanDeserializer beanDeser = null;
        ObjectDeserializer deserizer = this.config.getDeserializer(clazz);
        if (deserizer instanceof JavaBeanDeserializer) {
            beanDeser = (JavaBeanDeserializer) deserizer;
        }
        if (this.lexer.token() != 12 && this.lexer.token() != 16) {
            throw new JSONException("syntax error, expect {, actual " + this.lexer.tokenName());
        }
        while (true) {
            String key = this.lexer.scanSymbol(this.symbolTable);
            if (key == null) {
                if (this.lexer.token() == 13) {
                    this.lexer.nextToken(16);
                    return;
                } else if (this.lexer.token() != 16 || !this.lexer.isEnabled(Feature.AllowArbitraryCommas)) {
                }
            }
            FieldDeserializer fieldDeser = null;
            if (beanDeser != null) {
                fieldDeser = beanDeser.getFieldDeserializer(key);
            }
            if (fieldDeser == null) {
                if (!this.lexer.isEnabled(Feature.IgnoreNotMatch)) {
                    throw new JSONException("setter not found, class " + clazz.getName() + ", property " + key);
                }
                this.lexer.nextTokenWithColon();
                parse();
                if (this.lexer.token() == 13) {
                    this.lexer.nextToken();
                    return;
                }
            } else {
                Class<?> fieldClass = fieldDeser.fieldInfo.fieldClass;
                Type fieldType = fieldDeser.fieldInfo.fieldType;
                if (fieldClass == Integer.TYPE) {
                    this.lexer.nextTokenWithColon(2);
                    fieldValue = IntegerCodec.instance.deserialze(this, fieldType, null);
                } else if (fieldClass == String.class) {
                    this.lexer.nextTokenWithColon(4);
                    fieldValue = StringCodec.deserialze(this);
                } else if (fieldClass == Long.TYPE) {
                    this.lexer.nextTokenWithColon(2);
                    fieldValue = LongCodec.instance.deserialze(this, fieldType, null);
                } else {
                    ObjectDeserializer fieldValueDeserializer = this.config.getDeserializer(fieldClass, fieldType);
                    this.lexer.nextTokenWithColon(fieldValueDeserializer.getFastMatchToken());
                    fieldValue = fieldValueDeserializer.deserialze(this, fieldType, null);
                }
                fieldDeser.setValue(object, fieldValue);
                if (this.lexer.token() != 16 && this.lexer.token() == 13) {
                    this.lexer.nextToken(16);
                    return;
                }
            }
        }
    }

    public Object parseArrayWithType(Type collectionType) {
        if (this.lexer.token() == 8) {
            this.lexer.nextToken();
            return null;
        }
        Type[] actualTypes = ((ParameterizedType) collectionType).getActualTypeArguments();
        if (actualTypes.length != 1) {
            throw new JSONException("not support type " + collectionType);
        }
        Type actualTypeArgument = actualTypes[0];
        if (actualTypeArgument instanceof Class) {
            List<Object> array = new ArrayList<>();
            parseArray((Class<?>) actualTypeArgument, (Collection) array);
            return array;
        }
        if (actualTypeArgument instanceof WildcardType) {
            WildcardType wildcardType = (WildcardType) actualTypeArgument;
            Type upperBoundType = wildcardType.getUpperBounds()[0];
            if (Object.class.equals(upperBoundType)) {
                if (wildcardType.getLowerBounds().length == 0) {
                    return parse();
                }
                throw new JSONException("not support type : " + collectionType);
            }
            List<Object> array2 = new ArrayList<>();
            parseArray((Class<?>) upperBoundType, (Collection) array2);
            return array2;
        }
        if (actualTypeArgument instanceof TypeVariable) {
            TypeVariable<?> typeVariable = (TypeVariable) actualTypeArgument;
            Type[] bounds = typeVariable.getBounds();
            if (bounds.length != 1) {
                throw new JSONException("not support : " + typeVariable);
            }
            Type boundType = bounds[0];
            if (boundType instanceof Class) {
                List<Object> array3 = new ArrayList<>();
                parseArray((Class<?>) boundType, (Collection) array3);
                return array3;
            }
        }
        if (actualTypeArgument instanceof ParameterizedType) {
            ParameterizedType parameterizedType = (ParameterizedType) actualTypeArgument;
            List<Object> array4 = new ArrayList<>();
            parseArray(parameterizedType, array4);
            return array4;
        }
        throw new JSONException("TODO : " + collectionType);
    }

    public void acceptType(String typeName) {
        JSONLexer lexer = this.lexer;
        lexer.nextTokenWithColon();
        if (lexer.token() != 4) {
            throw new JSONException("type not match error");
        }
        if (typeName.equals(lexer.stringVal())) {
            lexer.nextToken();
            if (lexer.token() == 16) {
                lexer.nextToken();
                return;
            }
            return;
        }
        throw new JSONException("type not match error");
    }

    public int getResolveStatus() {
        return this.resolveStatus;
    }

    public void setResolveStatus(int resolveStatus) {
        this.resolveStatus = resolveStatus;
    }

    public Object getObject(String path) {
        for (int i = 0; i < this.contextArrayIndex; i++) {
            if (path.equals(this.contextArray[i].toString())) {
                return this.contextArray[i].object;
            }
        }
        return null;
    }

    public void checkListResolve(Collection array) {
        if (this.resolveStatus == 1) {
            if (array instanceof List) {
                int index = array.size() - 1;
                List list = (List) array;
                ResolveTask task = getLastResolveTask();
                task.fieldDeserializer = new ResolveFieldDeserializer(this, list, index);
                task.ownerContext = this.context;
                setResolveStatus(0);
                return;
            }
            ResolveTask task2 = getLastResolveTask();
            task2.fieldDeserializer = new ResolveFieldDeserializer(array);
            task2.ownerContext = this.context;
            setResolveStatus(0);
        }
    }

    public void checkMapResolve(Map object, Object fieldName) {
        if (this.resolveStatus == 1) {
            ResolveFieldDeserializer fieldResolver = new ResolveFieldDeserializer(object, fieldName);
            ResolveTask task = getLastResolveTask();
            task.fieldDeserializer = fieldResolver;
            task.ownerContext = this.context;
            setResolveStatus(0);
        }
    }

    public Object parseObject(Map object) {
        return parseObject(object, (Object) null);
    }

    public JSONObject parseObject() {
        JSONObject object = new JSONObject(this.lexer.isEnabled(Feature.OrderedField));
        return (JSONObject) parseObject((Map) object);
    }

    public final void parseArray(Collection array) {
        parseArray(array, (Object) null);
    }

    public final void parseArray(Collection array, Object fieldName) {
        Object value;
        JSONLexer lexer = this.lexer;
        if (lexer.token() == 21 || lexer.token() == 22) {
            lexer.nextToken();
        }
        if (lexer.token() != 14) {
            throw new JSONException("syntax error, expect [, actual " + JSONToken.name(lexer.token()) + ", pos " + lexer.pos());
        }
        lexer.nextToken(4);
        ParseContext context = this.context;
        setContext(array, fieldName);
        int i = 0;
        while (true) {
            try {
                if (lexer.isEnabled(Feature.AllowArbitraryCommas)) {
                    while (lexer.token() == 16) {
                        lexer.nextToken();
                    }
                }
                switch (lexer.token()) {
                    case 2:
                        value = lexer.integerValue();
                        lexer.nextToken(16);
                        break;
                    case 3:
                        if (lexer.isEnabled(Feature.UseBigDecimal)) {
                            value = lexer.decimalValue(true);
                        } else {
                            value = lexer.decimalValue(false);
                        }
                        lexer.nextToken(16);
                        break;
                    case 4:
                        String stringLiteral = lexer.stringVal();
                        lexer.nextToken(16);
                        if (lexer.isEnabled(Feature.AllowISO8601DateFormat)) {
                            JSONScanner iso8601Lexer = new JSONScanner(stringLiteral);
                            if (iso8601Lexer.scanISO8601DateIfMatch()) {
                                value = iso8601Lexer.getCalendar().getTime();
                            } else {
                                value = stringLiteral;
                            }
                            iso8601Lexer.close();
                            break;
                        } else {
                            value = stringLiteral;
                            break;
                        }
                    case 5:
                    case 9:
                    case 10:
                    case 11:
                    case JSONToken.RBRACE /* 13 */:
                    case 16:
                    case JSONToken.COLON /* 17 */:
                    case JSONToken.IDENTIFIER /* 18 */:
                    case JSONToken.FIELD_NAME /* 19 */:
                    case 21:
                    case 22:
                    default:
                        value = parse();
                        break;
                    case JSONToken.TRUE /* 6 */:
                        value = Boolean.TRUE;
                        lexer.nextToken(16);
                        break;
                    case JSONToken.FALSE /* 7 */:
                        value = Boolean.FALSE;
                        lexer.nextToken(16);
                        break;
                    case JSONToken.NULL /* 8 */:
                        value = null;
                        lexer.nextToken(4);
                        break;
                    case JSONToken.LBRACE /* 12 */:
                        JSONObject object = new JSONObject(lexer.isEnabled(Feature.OrderedField));
                        value = parseObject(object, Integer.valueOf(i));
                        break;
                    case 14:
                        Collection items = new JSONArray();
                        parseArray(items, Integer.valueOf(i));
                        if (lexer.isEnabled(Feature.UseObjectArray)) {
                            value = items.toArray();
                            break;
                        } else {
                            value = items;
                            break;
                        }
                    case JSONToken.RBRACKET /* 15 */:
                        lexer.nextToken(16);
                        setContext(context);
                        return;
                    case JSONToken.EOF /* 20 */:
                        throw new JSONException("unclosed jsonArray");
                    case 23:
                        value = null;
                        lexer.nextToken(4);
                        break;
                }
                array.add(value);
                checkListResolve(array);
                if (lexer.token() == 16) {
                    lexer.nextToken(4);
                }
                i++;
            } catch (Throwable th) {
                setContext(context);
                throw th;
            }
        }
    }

    public ParseContext getContext() {
        return this.context;
    }

    public List<ResolveTask> getResolveTaskList() {
        if (this.resolveTaskList == null) {
            this.resolveTaskList = new ArrayList(2);
        }
        return this.resolveTaskList;
    }

    public void addResolveTask(ResolveTask task) {
        if (this.resolveTaskList == null) {
            this.resolveTaskList = new ArrayList(2);
        }
        this.resolveTaskList.add(task);
    }

    public ResolveTask getLastResolveTask() {
        return this.resolveTaskList.get(this.resolveTaskList.size() - 1);
    }

    public List<ExtraProcessor> getExtraProcessors() {
        if (this.extraProcessors == null) {
            this.extraProcessors = new ArrayList(2);
        }
        return this.extraProcessors;
    }

    public List<ExtraTypeProvider> getExtraTypeProviders() {
        if (this.extraTypeProviders == null) {
            this.extraTypeProviders = new ArrayList(2);
        }
        return this.extraTypeProviders;
    }

    public FieldTypeResolver getFieldTypeResolver() {
        return this.fieldTypeResolver;
    }

    public void setFieldTypeResolver(FieldTypeResolver fieldTypeResolver) {
        this.fieldTypeResolver = fieldTypeResolver;
    }

    public void setContext(ParseContext context) {
        if (this.lexer.isEnabled(Feature.DisableCircularReferenceDetect)) {
            return;
        }
        this.context = context;
    }

    public void popContext() {
        if (this.lexer.isEnabled(Feature.DisableCircularReferenceDetect)) {
            return;
        }
        this.context = this.context.parent;
        this.contextArray[this.contextArrayIndex - 1] = null;
        this.contextArrayIndex--;
    }

    public ParseContext setContext(Object object, Object fieldName) {
        if (this.lexer.isEnabled(Feature.DisableCircularReferenceDetect)) {
            return null;
        }
        return setContext(this.context, object, fieldName);
    }

    public ParseContext setContext(ParseContext parent, Object object, Object fieldName) {
        if (this.lexer.isEnabled(Feature.DisableCircularReferenceDetect)) {
            return null;
        }
        this.context = new ParseContext(parent, object, fieldName);
        addContext(this.context);
        return this.context;
    }

    private void addContext(ParseContext context) {
        int i = this.contextArrayIndex;
        this.contextArrayIndex = i + 1;
        if (this.contextArray == null) {
            this.contextArray = new ParseContext[8];
        } else if (i >= this.contextArray.length) {
            int newLen = (this.contextArray.length * 3) / 2;
            ParseContext[] newArray = new ParseContext[newLen];
            System.arraycopy(this.contextArray, 0, newArray, 0, this.contextArray.length);
            this.contextArray = newArray;
        }
        this.contextArray[i] = context;
    }

    public Object parse() {
        return parse(null);
    }

    public Object parseKey() {
        if (this.lexer.token() == 18) {
            String value = this.lexer.stringVal();
            this.lexer.nextToken(16);
            return value;
        }
        return parse(null);
    }

    public Object parse(Object fieldName) {
        JSONLexer lexer = this.lexer;
        switch (lexer.token()) {
            case 1:
            case 5:
            case 10:
            case 11:
            case JSONToken.RBRACE /* 13 */:
            case JSONToken.RBRACKET /* 15 */:
            case 16:
            case JSONToken.COLON /* 17 */:
            case JSONToken.IDENTIFIER /* 18 */:
            case JSONToken.FIELD_NAME /* 19 */:
            default:
                throw new JSONException("syntax error, " + lexer.info());
            case 2:
                Number intValue = lexer.integerValue();
                lexer.nextToken();
                return intValue;
            case 3:
                Object value = lexer.decimalValue(lexer.isEnabled(Feature.UseBigDecimal));
                lexer.nextToken();
                return value;
            case 4:
                String stringLiteral = lexer.stringVal();
                lexer.nextToken(16);
                if (lexer.isEnabled(Feature.AllowISO8601DateFormat)) {
                    JSONScanner iso8601Lexer = new JSONScanner(stringLiteral);
                    try {
                        if (iso8601Lexer.scanISO8601DateIfMatch()) {
                            Date time = iso8601Lexer.getCalendar().getTime();
                            iso8601Lexer.close();
                            return time;
                        }
                        iso8601Lexer.close();
                    } catch (Throwable th) {
                        iso8601Lexer.close();
                        throw th;
                    }
                }
                return stringLiteral;
            case JSONToken.TRUE /* 6 */:
                lexer.nextToken();
                return Boolean.TRUE;
            case JSONToken.FALSE /* 7 */:
                lexer.nextToken();
                return Boolean.FALSE;
            case JSONToken.NULL /* 8 */:
                lexer.nextToken();
                return null;
            case 9:
                lexer.nextToken(18);
                if (lexer.token() != 18) {
                    throw new JSONException("syntax error");
                }
                lexer.nextToken(10);
                accept(10);
                long time2 = lexer.integerValue().longValue();
                accept(2);
                accept(11);
                return new Date(time2);
            case JSONToken.LBRACE /* 12 */:
                JSONObject object = new JSONObject(lexer.isEnabled(Feature.OrderedField));
                return parseObject(object, fieldName);
            case 14:
                JSONArray array = new JSONArray();
                parseArray(array, fieldName);
                if (lexer.isEnabled(Feature.UseObjectArray)) {
                    return array.toArray();
                }
                return array;
            case JSONToken.EOF /* 20 */:
                if (lexer.isBlankInput()) {
                    return null;
                }
                throw new JSONException("unterminated json string, " + lexer.info());
            case 21:
                lexer.nextToken();
                HashSet<Object> set = new HashSet<>();
                parseArray(set, fieldName);
                return set;
            case 22:
                lexer.nextToken();
                TreeSet<Object> treeSet = new TreeSet<>();
                parseArray(treeSet, fieldName);
                return treeSet;
            case 23:
                lexer.nextToken();
                return null;
        }
    }

    public void config(Feature feature, boolean state) {
        this.lexer.config(feature, state);
    }

    public boolean isEnabled(Feature feature) {
        return this.lexer.isEnabled(feature);
    }

    public JSONLexer getLexer() {
        return this.lexer;
    }

    public final void accept(int token) {
        JSONLexer lexer = this.lexer;
        if (lexer.token() == token) {
            lexer.nextToken();
            return;
        }
        throw new JSONException("syntax error, expect " + JSONToken.name(token) + ", actual " + JSONToken.name(lexer.token()));
    }

    public final void accept(int token, int nextExpectToken) {
        JSONLexer lexer = this.lexer;
        if (lexer.token() == token) {
            lexer.nextToken(nextExpectToken);
        } else {
            throwException(token);
        }
    }

    public void throwException(int token) {
        throw new JSONException("syntax error, expect " + JSONToken.name(token) + ", actual " + JSONToken.name(this.lexer.token()));
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        JSONLexer lexer = this.lexer;
        try {
            if (lexer.isEnabled(Feature.AutoCloseSource) && lexer.token() != 20) {
                throw new JSONException("not close json text, token : " + JSONToken.name(lexer.token()));
            }
        } finally {
            lexer.close();
        }
    }

    public void handleResovleTask(Object value) {
        Object refValue;
        if (this.resolveTaskList == null) {
            return;
        }
        int size = this.resolveTaskList.size();
        for (int i = 0; i < size; i++) {
            ResolveTask task = this.resolveTaskList.get(i);
            String ref = task.referenceValue;
            Object object = null;
            if (task.ownerContext != null) {
                object = task.ownerContext.object;
            }
            if (ref.startsWith("$")) {
                refValue = getObject(ref);
            } else {
                refValue = task.context.object;
            }
            FieldDeserializer fieldDeser = task.fieldDeserializer;
            if (fieldDeser != null) {
                fieldDeser.setValue(object, refValue);
            }
        }
    }

    /* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/DefaultJSONParser$ResolveTask.class */
    public static class ResolveTask {
        public final ParseContext context;
        public final String referenceValue;
        public FieldDeserializer fieldDeserializer;
        public ParseContext ownerContext;

        public ResolveTask(ParseContext context, String referenceValue) {
            this.context = context;
            this.referenceValue = referenceValue;
        }
    }

    public void parseExtra(Object object, String key) {
        Object parseObject;
        JSONLexer lexer = this.lexer;
        lexer.nextTokenWithColon();
        Type type = null;
        if (this.extraTypeProviders != null) {
            for (ExtraTypeProvider extraProvider : this.extraTypeProviders) {
                type = extraProvider.getExtraType(object, key);
            }
        }
        if (type == null) {
            parseObject = parse();
        } else {
            parseObject = parseObject(type);
        }
        Object value = parseObject;
        if (object instanceof ExtraProcessable) {
            ExtraProcessable extraProcessable = (ExtraProcessable) object;
            extraProcessable.processExtra(key, value);
        } else if (this.extraProcessors != null) {
            for (ExtraProcessor process : this.extraProcessors) {
                process.processExtra(object, key, value);
            }
        }
    }
}
