package com.google.gson;

import com.google.gson.internal.C$Gson$Types;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.UnknownHostException;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.SortedSet;
import java.util.StringTokenizer;
import java.util.TimeZone;
import java.util.TreeSet;
import java.util.UUID;

/* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters.class */
final class DefaultTypeAdapters {
    private static final DefaultDateTypeAdapter DATE_TYPE_ADAPTER = new DefaultDateTypeAdapter();
    private static final DefaultJavaSqlDateTypeAdapter JAVA_SQL_DATE_TYPE_ADAPTER = new DefaultJavaSqlDateTypeAdapter();
    private static final DefaultTimeTypeAdapter TIME_TYPE_ADAPTER = new DefaultTimeTypeAdapter();
    private static final DefaultTimestampDeserializer TIMESTAMP_DESERIALIZER = new DefaultTimestampDeserializer();
    private static final EnumTypeAdapter ENUM_TYPE_ADAPTER = new EnumTypeAdapter();
    private static final UrlTypeAdapter URL_TYPE_ADAPTER = new UrlTypeAdapter();
    private static final UriTypeAdapter URI_TYPE_ADAPTER = new UriTypeAdapter();
    private static final UuidTypeAdapter UUUID_TYPE_ADAPTER = new UuidTypeAdapter();
    private static final LocaleTypeAdapter LOCALE_TYPE_ADAPTER = new LocaleTypeAdapter();
    private static final DefaultInetAddressAdapter INET_ADDRESS_ADAPTER = new DefaultInetAddressAdapter();
    private static final CollectionTypeAdapter COLLECTION_TYPE_ADAPTER = new CollectionTypeAdapter();
    private static final MapTypeAdapter MAP_TYPE_ADAPTER = new MapTypeAdapter();
    private static final BigDecimalTypeAdapter BIG_DECIMAL_TYPE_ADAPTER = new BigDecimalTypeAdapter();
    private static final BigIntegerTypeAdapter BIG_INTEGER_TYPE_ADAPTER = new BigIntegerTypeAdapter();
    private static final BooleanTypeAdapter BOOLEAN_TYPE_ADAPTER = new BooleanTypeAdapter();
    private static final ByteTypeAdapter BYTE_TYPE_ADAPTER = new ByteTypeAdapter();
    private static final CharacterTypeAdapter CHARACTER_TYPE_ADAPTER = new CharacterTypeAdapter();
    private static final DoubleDeserializer DOUBLE_TYPE_ADAPTER = new DoubleDeserializer();
    private static final FloatDeserializer FLOAT_TYPE_ADAPTER = new FloatDeserializer();
    private static final IntegerTypeAdapter INTEGER_TYPE_ADAPTER = new IntegerTypeAdapter();
    private static final LongDeserializer LONG_DESERIALIZER = new LongDeserializer();
    private static final NumberTypeAdapter NUMBER_TYPE_ADAPTER = new NumberTypeAdapter();
    private static final ShortTypeAdapter SHORT_TYPE_ADAPTER = new ShortTypeAdapter();
    private static final StringTypeAdapter STRING_TYPE_ADAPTER = new StringTypeAdapter();
    private static final StringBuilderTypeAdapter STRING_BUILDER_TYPE_ADAPTER = new StringBuilderTypeAdapter();
    private static final StringBufferTypeAdapter STRING_BUFFER_TYPE_ADAPTER = new StringBufferTypeAdapter();
    private static final GregorianCalendarTypeAdapter GREGORIAN_CALENDAR_TYPE_ADAPTER = new GregorianCalendarTypeAdapter();
    private static final ParameterizedTypeHandlerMap<JsonSerializer<?>> DEFAULT_SERIALIZERS = createDefaultSerializers();
    static final ParameterizedTypeHandlerMap<JsonSerializer<?>> DEFAULT_HIERARCHY_SERIALIZERS = createDefaultHierarchySerializers();
    private static final ParameterizedTypeHandlerMap<JsonDeserializer<?>> DEFAULT_DESERIALIZERS = createDefaultDeserializers();
    static final ParameterizedTypeHandlerMap<JsonDeserializer<?>> DEFAULT_HIERARCHY_DESERIALIZERS = createDefaultHierarchyDeserializers();
    private static final ParameterizedTypeHandlerMap<InstanceCreator<?>> DEFAULT_INSTANCE_CREATORS = createDefaultInstanceCreators();

    DefaultTypeAdapters() {
    }

    private static ParameterizedTypeHandlerMap<JsonSerializer<?>> createDefaultSerializers() {
        ParameterizedTypeHandlerMap<JsonSerializer<?>> map = new ParameterizedTypeHandlerMap<>();
        map.register(URL.class, URL_TYPE_ADAPTER);
        map.register(URI.class, URI_TYPE_ADAPTER);
        map.register(UUID.class, UUUID_TYPE_ADAPTER);
        map.register(Locale.class, LOCALE_TYPE_ADAPTER);
        map.register(Date.class, DATE_TYPE_ADAPTER);
        map.register(java.sql.Date.class, JAVA_SQL_DATE_TYPE_ADAPTER);
        map.register(Timestamp.class, DATE_TYPE_ADAPTER);
        map.register(Time.class, TIME_TYPE_ADAPTER);
        map.register(Calendar.class, GREGORIAN_CALENDAR_TYPE_ADAPTER);
        map.register(GregorianCalendar.class, GREGORIAN_CALENDAR_TYPE_ADAPTER);
        map.register(BigDecimal.class, BIG_DECIMAL_TYPE_ADAPTER);
        map.register(BigInteger.class, BIG_INTEGER_TYPE_ADAPTER);
        map.register(Boolean.class, BOOLEAN_TYPE_ADAPTER);
        map.register(Boolean.TYPE, BOOLEAN_TYPE_ADAPTER);
        map.register(Byte.class, BYTE_TYPE_ADAPTER);
        map.register(Byte.TYPE, BYTE_TYPE_ADAPTER);
        map.register(Character.class, CHARACTER_TYPE_ADAPTER);
        map.register(Character.TYPE, CHARACTER_TYPE_ADAPTER);
        map.register(Integer.class, INTEGER_TYPE_ADAPTER);
        map.register(Integer.TYPE, INTEGER_TYPE_ADAPTER);
        map.register(Number.class, NUMBER_TYPE_ADAPTER);
        map.register(Short.class, SHORT_TYPE_ADAPTER);
        map.register(Short.TYPE, SHORT_TYPE_ADAPTER);
        map.register(String.class, STRING_TYPE_ADAPTER);
        map.register(StringBuilder.class, STRING_BUILDER_TYPE_ADAPTER);
        map.register(StringBuffer.class, STRING_BUFFER_TYPE_ADAPTER);
        map.makeUnmodifiable();
        return map;
    }

    private static ParameterizedTypeHandlerMap<JsonSerializer<?>> createDefaultHierarchySerializers() {
        ParameterizedTypeHandlerMap<JsonSerializer<?>> map = new ParameterizedTypeHandlerMap<>();
        map.registerForTypeHierarchy(Enum.class, ENUM_TYPE_ADAPTER);
        map.registerForTypeHierarchy(InetAddress.class, INET_ADDRESS_ADAPTER);
        map.registerForTypeHierarchy(Collection.class, COLLECTION_TYPE_ADAPTER);
        map.registerForTypeHierarchy(Map.class, MAP_TYPE_ADAPTER);
        map.makeUnmodifiable();
        return map;
    }

    private static ParameterizedTypeHandlerMap<JsonDeserializer<?>> createDefaultDeserializers() {
        ParameterizedTypeHandlerMap<JsonDeserializer<?>> map = new ParameterizedTypeHandlerMap<>();
        map.register(URL.class, wrapDeserializer(URL_TYPE_ADAPTER));
        map.register(URI.class, wrapDeserializer(URI_TYPE_ADAPTER));
        map.register(UUID.class, wrapDeserializer(UUUID_TYPE_ADAPTER));
        map.register(Locale.class, wrapDeserializer(LOCALE_TYPE_ADAPTER));
        map.register(Date.class, wrapDeserializer(DATE_TYPE_ADAPTER));
        map.register(java.sql.Date.class, wrapDeserializer(JAVA_SQL_DATE_TYPE_ADAPTER));
        map.register(Timestamp.class, wrapDeserializer(TIMESTAMP_DESERIALIZER));
        map.register(Time.class, wrapDeserializer(TIME_TYPE_ADAPTER));
        map.register(Calendar.class, GREGORIAN_CALENDAR_TYPE_ADAPTER);
        map.register(GregorianCalendar.class, GREGORIAN_CALENDAR_TYPE_ADAPTER);
        map.register(BigDecimal.class, BIG_DECIMAL_TYPE_ADAPTER);
        map.register(BigInteger.class, BIG_INTEGER_TYPE_ADAPTER);
        map.register(Boolean.class, BOOLEAN_TYPE_ADAPTER);
        map.register(Boolean.TYPE, BOOLEAN_TYPE_ADAPTER);
        map.register(Byte.class, BYTE_TYPE_ADAPTER);
        map.register(Byte.TYPE, BYTE_TYPE_ADAPTER);
        map.register(Character.class, wrapDeserializer(CHARACTER_TYPE_ADAPTER));
        map.register(Character.TYPE, wrapDeserializer(CHARACTER_TYPE_ADAPTER));
        map.register(Double.class, DOUBLE_TYPE_ADAPTER);
        map.register(Double.TYPE, DOUBLE_TYPE_ADAPTER);
        map.register(Float.class, FLOAT_TYPE_ADAPTER);
        map.register(Float.TYPE, FLOAT_TYPE_ADAPTER);
        map.register(Integer.class, INTEGER_TYPE_ADAPTER);
        map.register(Integer.TYPE, INTEGER_TYPE_ADAPTER);
        map.register(Long.class, LONG_DESERIALIZER);
        map.register(Long.TYPE, LONG_DESERIALIZER);
        map.register(Number.class, NUMBER_TYPE_ADAPTER);
        map.register(Short.class, SHORT_TYPE_ADAPTER);
        map.register(Short.TYPE, SHORT_TYPE_ADAPTER);
        map.register(String.class, wrapDeserializer(STRING_TYPE_ADAPTER));
        map.register(StringBuilder.class, wrapDeserializer(STRING_BUILDER_TYPE_ADAPTER));
        map.register(StringBuffer.class, wrapDeserializer(STRING_BUFFER_TYPE_ADAPTER));
        map.makeUnmodifiable();
        return map;
    }

    private static ParameterizedTypeHandlerMap<JsonDeserializer<?>> createDefaultHierarchyDeserializers() {
        ParameterizedTypeHandlerMap<JsonDeserializer<?>> map = new ParameterizedTypeHandlerMap<>();
        map.registerForTypeHierarchy(Enum.class, wrapDeserializer(ENUM_TYPE_ADAPTER));
        map.registerForTypeHierarchy(InetAddress.class, wrapDeserializer(INET_ADDRESS_ADAPTER));
        map.registerForTypeHierarchy(Collection.class, wrapDeserializer(COLLECTION_TYPE_ADAPTER));
        map.registerForTypeHierarchy(Map.class, wrapDeserializer(MAP_TYPE_ADAPTER));
        map.makeUnmodifiable();
        return map;
    }

    private static ParameterizedTypeHandlerMap<InstanceCreator<?>> createDefaultInstanceCreators() {
        ParameterizedTypeHandlerMap<InstanceCreator<?>> map = new ParameterizedTypeHandlerMap<>();
        DefaultConstructorAllocator allocator = new DefaultConstructorAllocator(50);
        map.registerForTypeHierarchy(Map.class, new DefaultConstructorCreator(LinkedHashMap.class, allocator));
        DefaultConstructorCreator<List> listCreator = new DefaultConstructorCreator<>(ArrayList.class, allocator);
        DefaultConstructorCreator<Queue> queueCreator = new DefaultConstructorCreator<>(LinkedList.class, allocator);
        DefaultConstructorCreator<Set> setCreator = new DefaultConstructorCreator<>(HashSet.class, allocator);
        DefaultConstructorCreator<SortedSet> sortedSetCreator = new DefaultConstructorCreator<>(TreeSet.class, allocator);
        map.registerForTypeHierarchy(Collection.class, listCreator);
        map.registerForTypeHierarchy(Queue.class, queueCreator);
        map.registerForTypeHierarchy(Set.class, setCreator);
        map.registerForTypeHierarchy(SortedSet.class, sortedSetCreator);
        map.makeUnmodifiable();
        return map;
    }

    private static JsonDeserializer<?> wrapDeserializer(JsonDeserializer<?> deserializer) {
        return new JsonDeserializerExceptionWrapper(deserializer);
    }

    static ParameterizedTypeHandlerMap<JsonSerializer<?>> getDefaultSerializers() {
        return getDefaultSerializers(false, LongSerializationPolicy.DEFAULT);
    }

    static ParameterizedTypeHandlerMap<JsonSerializer<?>> getAllDefaultSerializers() {
        ParameterizedTypeHandlerMap<JsonSerializer<?>> defaultSerializers = getDefaultSerializers(false, LongSerializationPolicy.DEFAULT);
        defaultSerializers.register(DEFAULT_HIERARCHY_SERIALIZERS);
        return defaultSerializers;
    }

    static ParameterizedTypeHandlerMap<JsonDeserializer<?>> getAllDefaultDeserializers() {
        ParameterizedTypeHandlerMap<JsonDeserializer<?>> defaultDeserializers = getDefaultDeserializers().copyOf();
        defaultDeserializers.register(DEFAULT_HIERARCHY_DESERIALIZERS);
        return defaultDeserializers;
    }

    static ParameterizedTypeHandlerMap<JsonSerializer<?>> getDefaultSerializers(boolean serializeSpecialFloatingPointValues, LongSerializationPolicy longSerializationPolicy) {
        ParameterizedTypeHandlerMap<JsonSerializer<?>> serializers = new ParameterizedTypeHandlerMap<>();
        DoubleSerializer doubleSerializer = new DoubleSerializer(serializeSpecialFloatingPointValues);
        serializers.registerIfAbsent(Double.class, doubleSerializer);
        serializers.registerIfAbsent(Double.TYPE, doubleSerializer);
        FloatSerializer floatSerializer = new FloatSerializer(serializeSpecialFloatingPointValues);
        serializers.registerIfAbsent(Float.class, floatSerializer);
        serializers.registerIfAbsent(Float.TYPE, floatSerializer);
        LongSerializer longSerializer = new LongSerializer(longSerializationPolicy);
        serializers.registerIfAbsent(Long.class, longSerializer);
        serializers.registerIfAbsent(Long.TYPE, longSerializer);
        serializers.registerIfAbsent(DEFAULT_SERIALIZERS);
        return serializers;
    }

    static ParameterizedTypeHandlerMap<JsonDeserializer<?>> getDefaultDeserializers() {
        return DEFAULT_DESERIALIZERS;
    }

    static ParameterizedTypeHandlerMap<InstanceCreator<?>> getDefaultInstanceCreators() {
        return DEFAULT_INSTANCE_CREATORS;
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$DefaultDateTypeAdapter.class */
    static final class DefaultDateTypeAdapter implements JsonSerializer<Date>, JsonDeserializer<Date> {
        private final DateFormat enUsFormat;
        private final DateFormat localFormat;
        private final DateFormat iso8601Format;

        DefaultDateTypeAdapter() {
            this(DateFormat.getDateTimeInstance(2, 2, Locale.US), DateFormat.getDateTimeInstance(2, 2));
        }

        DefaultDateTypeAdapter(String datePattern) {
            this(new SimpleDateFormat(datePattern, Locale.US), new SimpleDateFormat(datePattern));
        }

        DefaultDateTypeAdapter(int style) {
            this(DateFormat.getDateInstance(style, Locale.US), DateFormat.getDateInstance(style));
        }

        public DefaultDateTypeAdapter(int dateStyle, int timeStyle) {
            this(DateFormat.getDateTimeInstance(dateStyle, timeStyle, Locale.US), DateFormat.getDateTimeInstance(dateStyle, timeStyle));
        }

        DefaultDateTypeAdapter(DateFormat enUsFormat, DateFormat localFormat) {
            this.enUsFormat = enUsFormat;
            this.localFormat = localFormat;
            this.iso8601Format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.US);
            this.iso8601Format.setTimeZone(TimeZone.getTimeZone("UTC"));
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(Date src, Type typeOfSrc, JsonSerializationContext context) {
            JsonPrimitive jsonPrimitive;
            synchronized (this.localFormat) {
                String dateFormatAsString = this.enUsFormat.format(src);
                jsonPrimitive = new JsonPrimitive(dateFormatAsString);
            }
            return jsonPrimitive;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public Date deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            if (!(json instanceof JsonPrimitive)) {
                throw new JsonParseException("The date should be a string value");
            }
            Date date = deserializeToDate(json);
            if (typeOfT == Date.class) {
                return date;
            }
            if (typeOfT == Timestamp.class) {
                return new Timestamp(date.getTime());
            }
            if (typeOfT == java.sql.Date.class) {
                return new java.sql.Date(date.getTime());
            }
            throw new IllegalArgumentException(getClass() + " cannot deserialize to " + typeOfT);
        }

        private Date deserializeToDate(JsonElement json) {
            Date parse;
            synchronized (this.localFormat) {
                try {
                    parse = this.localFormat.parse(json.getAsString());
                } catch (ParseException e) {
                    try {
                        return this.enUsFormat.parse(json.getAsString());
                    } catch (ParseException e2) {
                        try {
                            return this.iso8601Format.parse(json.getAsString());
                        } catch (ParseException e3) {
                            throw new JsonSyntaxException(json.getAsString(), e3);
                        }
                    }
                }
            }
            return parse;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(DefaultDateTypeAdapter.class.getSimpleName());
            sb.append('(').append(this.localFormat.getClass().getSimpleName()).append(')');
            return sb.toString();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$DefaultJavaSqlDateTypeAdapter.class */
    static final class DefaultJavaSqlDateTypeAdapter implements JsonSerializer<java.sql.Date>, JsonDeserializer<java.sql.Date> {
        private final DateFormat format = new SimpleDateFormat("MMM d, yyyy");

        DefaultJavaSqlDateTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(java.sql.Date src, Type typeOfSrc, JsonSerializationContext context) {
            JsonPrimitive jsonPrimitive;
            synchronized (this.format) {
                String dateFormatAsString = this.format.format((Date) src);
                jsonPrimitive = new JsonPrimitive(dateFormatAsString);
            }
            return jsonPrimitive;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public java.sql.Date deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            java.sql.Date date;
            if (!(json instanceof JsonPrimitive)) {
                throw new JsonParseException("The date should be a string value");
            }
            try {
                synchronized (this.format) {
                    Date date2 = this.format.parse(json.getAsString());
                    date = new java.sql.Date(date2.getTime());
                }
                return date;
            } catch (ParseException e) {
                throw new JsonSyntaxException(e);
            }
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$DefaultTimestampDeserializer.class */
    static final class DefaultTimestampDeserializer implements JsonDeserializer<Timestamp> {
        DefaultTimestampDeserializer() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public Timestamp deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            Date date = (Date) context.deserialize(json, Date.class);
            return new Timestamp(date.getTime());
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$DefaultTimeTypeAdapter.class */
    static final class DefaultTimeTypeAdapter implements JsonSerializer<Time>, JsonDeserializer<Time> {
        private final DateFormat format = new SimpleDateFormat("hh:mm:ss a");

        DefaultTimeTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(Time src, Type typeOfSrc, JsonSerializationContext context) {
            JsonPrimitive jsonPrimitive;
            synchronized (this.format) {
                String dateFormatAsString = this.format.format((Date) src);
                jsonPrimitive = new JsonPrimitive(dateFormatAsString);
            }
            return jsonPrimitive;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public Time deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            Time time;
            if (!(json instanceof JsonPrimitive)) {
                throw new JsonParseException("The date should be a string value");
            }
            try {
                synchronized (this.format) {
                    Date date = this.format.parse(json.getAsString());
                    time = new Time(date.getTime());
                }
                return time;
            } catch (ParseException e) {
                throw new JsonSyntaxException(e);
            }
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$GregorianCalendarTypeAdapter.class */
    private static final class GregorianCalendarTypeAdapter implements JsonSerializer<GregorianCalendar>, JsonDeserializer<GregorianCalendar> {
        private static final String YEAR = "year";
        private static final String MONTH = "month";
        private static final String DAY_OF_MONTH = "dayOfMonth";
        private static final String HOUR_OF_DAY = "hourOfDay";
        private static final String MINUTE = "minute";
        private static final String SECOND = "second";

        private GregorianCalendarTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(GregorianCalendar src, Type typeOfSrc, JsonSerializationContext context) {
            JsonObject obj = new JsonObject();
            obj.addProperty(YEAR, Integer.valueOf(src.get(1)));
            obj.addProperty(MONTH, Integer.valueOf(src.get(2)));
            obj.addProperty(DAY_OF_MONTH, Integer.valueOf(src.get(5)));
            obj.addProperty(HOUR_OF_DAY, Integer.valueOf(src.get(11)));
            obj.addProperty(MINUTE, Integer.valueOf(src.get(12)));
            obj.addProperty(SECOND, Integer.valueOf(src.get(13)));
            return obj;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public GregorianCalendar deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            JsonObject obj = json.getAsJsonObject();
            int year = obj.get(YEAR).getAsInt();
            int month = obj.get(MONTH).getAsInt();
            int dayOfMonth = obj.get(DAY_OF_MONTH).getAsInt();
            int hourOfDay = obj.get(HOUR_OF_DAY).getAsInt();
            int minute = obj.get(MINUTE).getAsInt();
            int second = obj.get(SECOND).getAsInt();
            return new GregorianCalendar(year, month, dayOfMonth, hourOfDay, minute, second);
        }

        public String toString() {
            return GregorianCalendarTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$DefaultInetAddressAdapter.class */
    static final class DefaultInetAddressAdapter implements JsonDeserializer<InetAddress>, JsonSerializer<InetAddress> {
        DefaultInetAddressAdapter() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public InetAddress deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            try {
                return InetAddress.getByName(json.getAsString());
            } catch (UnknownHostException e) {
                throw new JsonParseException(e);
            }
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(InetAddress src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src.getHostAddress());
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$EnumTypeAdapter.class */
    private static final class EnumTypeAdapter<T extends Enum<T>> implements JsonSerializer<T>, JsonDeserializer<T> {
        private EnumTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(T src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src.name());
        }

        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public T deserialize2(JsonElement jsonElement, Type type, JsonDeserializationContext jsonDeserializationContext) throws JsonParseException {
            return (T) Enum.valueOf((Class) type, jsonElement.getAsString());
        }

        public String toString() {
            return EnumTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$UrlTypeAdapter.class */
    private static final class UrlTypeAdapter implements JsonSerializer<URL>, JsonDeserializer<URL> {
        private UrlTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(URL src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src.toExternalForm());
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public URL deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            try {
                return new URL(json.getAsString());
            } catch (MalformedURLException e) {
                throw new JsonSyntaxException(e);
            }
        }

        public String toString() {
            return UrlTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$UriTypeAdapter.class */
    private static final class UriTypeAdapter implements JsonSerializer<URI>, JsonDeserializer<URI> {
        private UriTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(URI src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src.toASCIIString());
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public URI deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            try {
                return new URI(json.getAsString());
            } catch (URISyntaxException e) {
                throw new JsonSyntaxException(e);
            }
        }

        public String toString() {
            return UriTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$UuidTypeAdapter.class */
    private static final class UuidTypeAdapter implements JsonSerializer<UUID>, JsonDeserializer<UUID> {
        private UuidTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(UUID src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src.toString());
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public UUID deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            return UUID.fromString(json.getAsString());
        }

        public String toString() {
            return UuidTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$LocaleTypeAdapter.class */
    private static final class LocaleTypeAdapter implements JsonSerializer<Locale>, JsonDeserializer<Locale> {
        private LocaleTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(Locale src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src.toString());
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public Locale deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            String locale = json.getAsString();
            StringTokenizer tokenizer = new StringTokenizer(locale, "_");
            String language = null;
            String country = null;
            String variant = null;
            if (tokenizer.hasMoreElements()) {
                language = tokenizer.nextToken();
            }
            if (tokenizer.hasMoreElements()) {
                country = tokenizer.nextToken();
            }
            if (tokenizer.hasMoreElements()) {
                variant = tokenizer.nextToken();
            }
            if (country == null && variant == null) {
                return new Locale(language);
            }
            if (variant == null) {
                return new Locale(language, country);
            }
            return new Locale(language, country, variant);
        }

        public String toString() {
            return LocaleTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$CollectionTypeAdapter.class */
    private static final class CollectionTypeAdapter implements JsonSerializer<Collection>, JsonDeserializer<Collection> {
        private CollectionTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(Collection src, Type typeOfSrc, JsonSerializationContext context) {
            if (src == null) {
                return JsonNull.createJsonNull();
            }
            JsonArray array = new JsonArray();
            Type childGenericType = null;
            if (typeOfSrc instanceof ParameterizedType) {
                Class<?> rawTypeOfSrc = C$Gson$Types.getRawType(typeOfSrc);
                childGenericType = C$Gson$Types.getCollectionElementType(typeOfSrc, rawTypeOfSrc);
            }
            for (Object child : src) {
                if (child == null) {
                    array.add(JsonNull.createJsonNull());
                } else {
                    Type childType = (childGenericType == null || childGenericType == Object.class) ? child.getClass() : childGenericType;
                    JsonElement element = context.serialize(child, childType);
                    array.add(element);
                }
            }
            return array;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public Collection deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            if (json.isJsonNull()) {
                return null;
            }
            Collection collection = constructCollectionType(typeOfT, context);
            Type childType = C$Gson$Types.getCollectionElementType(typeOfT, C$Gson$Types.getRawType(typeOfT));
            Iterator i$ = json.getAsJsonArray().iterator();
            while (i$.hasNext()) {
                JsonElement childElement = i$.next();
                if (childElement == null || childElement.isJsonNull()) {
                    collection.add(null);
                } else {
                    Object value = context.deserialize(childElement, childType);
                    collection.add(value);
                }
            }
            return collection;
        }

        private Collection constructCollectionType(Type collectionType, JsonDeserializationContext context) {
            JsonDeserializationContextDefault contextImpl = (JsonDeserializationContextDefault) context;
            ObjectConstructor objectConstructor = contextImpl.getObjectConstructor();
            return (Collection) objectConstructor.construct(collectionType);
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$BigDecimalTypeAdapter.class */
    private static final class BigDecimalTypeAdapter implements JsonSerializer<BigDecimal>, JsonDeserializer<BigDecimal> {
        private BigDecimalTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(BigDecimal src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive((Number) src);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public BigDecimal deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            try {
                return json.getAsBigDecimal();
            } catch (IllegalStateException e) {
                throw new JsonSyntaxException(e);
            } catch (NumberFormatException e2) {
                throw new JsonSyntaxException(e2);
            } catch (UnsupportedOperationException e3) {
                throw new JsonSyntaxException(e3);
            }
        }

        public String toString() {
            return BigDecimalTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$BigIntegerTypeAdapter.class */
    private static final class BigIntegerTypeAdapter implements JsonSerializer<BigInteger>, JsonDeserializer<BigInteger> {
        private BigIntegerTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(BigInteger src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive((Number) src);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public BigInteger deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            try {
                return json.getAsBigInteger();
            } catch (IllegalStateException e) {
                throw new JsonSyntaxException(e);
            } catch (NumberFormatException e2) {
                throw new JsonSyntaxException(e2);
            } catch (UnsupportedOperationException e3) {
                throw new JsonSyntaxException(e3);
            }
        }

        public String toString() {
            return BigIntegerTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$NumberTypeAdapter.class */
    private static final class NumberTypeAdapter implements JsonSerializer<Number>, JsonDeserializer<Number> {
        private NumberTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(Number src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public Number deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            try {
                return json.getAsNumber();
            } catch (IllegalStateException e) {
                throw new JsonSyntaxException(e);
            } catch (NumberFormatException e2) {
                throw new JsonSyntaxException(e2);
            } catch (UnsupportedOperationException e3) {
                throw new JsonSyntaxException(e3);
            }
        }

        public String toString() {
            return NumberTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$LongSerializer.class */
    private static final class LongSerializer implements JsonSerializer<Long> {
        private final LongSerializationPolicy longSerializationPolicy;

        private LongSerializer(LongSerializationPolicy longSerializationPolicy) {
            this.longSerializationPolicy = longSerializationPolicy;
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(Long src, Type typeOfSrc, JsonSerializationContext context) {
            return this.longSerializationPolicy.serialize(src);
        }

        public String toString() {
            return LongSerializer.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$LongDeserializer.class */
    private static final class LongDeserializer implements JsonDeserializer<Long> {
        private LongDeserializer() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public Long deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            try {
                return Long.valueOf(json.getAsLong());
            } catch (IllegalStateException e) {
                throw new JsonSyntaxException(e);
            } catch (NumberFormatException e2) {
                throw new JsonSyntaxException(e2);
            } catch (UnsupportedOperationException e3) {
                throw new JsonSyntaxException(e3);
            }
        }

        public String toString() {
            return LongDeserializer.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$IntegerTypeAdapter.class */
    private static final class IntegerTypeAdapter implements JsonSerializer<Integer>, JsonDeserializer<Integer> {
        private IntegerTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(Integer src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive((Number) src);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public Integer deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            try {
                return Integer.valueOf(json.getAsInt());
            } catch (IllegalStateException e) {
                throw new JsonSyntaxException(e);
            } catch (NumberFormatException e2) {
                throw new JsonSyntaxException(e2);
            } catch (UnsupportedOperationException e3) {
                throw new JsonSyntaxException(e3);
            }
        }

        public String toString() {
            return IntegerTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$ShortTypeAdapter.class */
    private static final class ShortTypeAdapter implements JsonSerializer<Short>, JsonDeserializer<Short> {
        private ShortTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(Short src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive((Number) src);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public Short deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            try {
                return Short.valueOf(json.getAsShort());
            } catch (IllegalStateException e) {
                throw new JsonSyntaxException(e);
            } catch (NumberFormatException e2) {
                throw new JsonSyntaxException(e2);
            } catch (UnsupportedOperationException e3) {
                throw new JsonSyntaxException(e3);
            }
        }

        public String toString() {
            return ShortTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$ByteTypeAdapter.class */
    private static final class ByteTypeAdapter implements JsonSerializer<Byte>, JsonDeserializer<Byte> {
        private ByteTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(Byte src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive((Number) src);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public Byte deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            try {
                return Byte.valueOf(json.getAsByte());
            } catch (IllegalStateException e) {
                throw new JsonSyntaxException(e);
            } catch (NumberFormatException e2) {
                throw new JsonSyntaxException(e2);
            } catch (UnsupportedOperationException e3) {
                throw new JsonSyntaxException(e3);
            }
        }

        public String toString() {
            return ByteTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$FloatSerializer.class */
    static final class FloatSerializer implements JsonSerializer<Float> {
        private final boolean serializeSpecialFloatingPointValues;

        FloatSerializer(boolean serializeSpecialDoubleValues) {
            this.serializeSpecialFloatingPointValues = serializeSpecialDoubleValues;
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(Float src, Type typeOfSrc, JsonSerializationContext context) {
            if (!this.serializeSpecialFloatingPointValues && (Float.isNaN(src.floatValue()) || Float.isInfinite(src.floatValue()))) {
                throw new IllegalArgumentException(src + " is not a valid float value as per JSON specification. To override this behavior, use GsonBuilder.serializeSpecialFloatingPointValues() method.");
            }
            return new JsonPrimitive((Number) src);
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$FloatDeserializer.class */
    private static final class FloatDeserializer implements JsonDeserializer<Float> {
        private FloatDeserializer() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public Float deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            try {
                return Float.valueOf(json.getAsFloat());
            } catch (IllegalStateException e) {
                throw new JsonSyntaxException(e);
            } catch (NumberFormatException e2) {
                throw new JsonSyntaxException(e2);
            } catch (UnsupportedOperationException e3) {
                throw new JsonSyntaxException(e3);
            }
        }

        public String toString() {
            return FloatDeserializer.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$DoubleSerializer.class */
    static final class DoubleSerializer implements JsonSerializer<Double> {
        private final boolean serializeSpecialFloatingPointValues;

        DoubleSerializer(boolean serializeSpecialDoubleValues) {
            this.serializeSpecialFloatingPointValues = serializeSpecialDoubleValues;
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(Double src, Type typeOfSrc, JsonSerializationContext context) {
            if (!this.serializeSpecialFloatingPointValues && (Double.isNaN(src.doubleValue()) || Double.isInfinite(src.doubleValue()))) {
                throw new IllegalArgumentException(src + " is not a valid double value as per JSON specification. To override this behavior, use GsonBuilder.serializeSpecialDoubleValues() method.");
            }
            return new JsonPrimitive((Number) src);
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$DoubleDeserializer.class */
    private static final class DoubleDeserializer implements JsonDeserializer<Double> {
        private DoubleDeserializer() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public Double deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            try {
                return Double.valueOf(json.getAsDouble());
            } catch (IllegalStateException e) {
                throw new JsonSyntaxException(e);
            } catch (NumberFormatException e2) {
                throw new JsonSyntaxException(e2);
            } catch (UnsupportedOperationException e3) {
                throw new JsonSyntaxException(e3);
            }
        }

        public String toString() {
            return DoubleDeserializer.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$CharacterTypeAdapter.class */
    private static final class CharacterTypeAdapter implements JsonSerializer<Character>, JsonDeserializer<Character> {
        private CharacterTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(Character src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public Character deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            return Character.valueOf(json.getAsCharacter());
        }

        public String toString() {
            return CharacterTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$StringTypeAdapter.class */
    private static final class StringTypeAdapter implements JsonSerializer<String>, JsonDeserializer<String> {
        private StringTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(String src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public String deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            return json.getAsString();
        }

        public String toString() {
            return StringTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$StringBuilderTypeAdapter.class */
    private static final class StringBuilderTypeAdapter implements JsonSerializer<StringBuilder>, JsonDeserializer<StringBuilder> {
        private StringBuilderTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(StringBuilder src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src.toString());
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public StringBuilder deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            return new StringBuilder(json.getAsString());
        }

        public String toString() {
            return StringBuilderTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$StringBufferTypeAdapter.class */
    private static final class StringBufferTypeAdapter implements JsonSerializer<StringBuffer>, JsonDeserializer<StringBuffer> {
        private StringBufferTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(StringBuffer src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src.toString());
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public StringBuffer deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            return new StringBuffer(json.getAsString());
        }

        public String toString() {
            return StringBufferTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$BooleanTypeAdapter.class */
    private static final class BooleanTypeAdapter implements JsonSerializer<Boolean>, JsonDeserializer<Boolean> {
        private BooleanTypeAdapter() {
        }

        @Override // com.google.gson.JsonSerializer
        public JsonElement serialize(Boolean src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.gson.JsonDeserializer
        /* renamed from: deserialize */
        public Boolean deserialize2(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            try {
                return Boolean.valueOf(json.getAsBoolean());
            } catch (IllegalStateException e) {
                throw new JsonSyntaxException(e);
            } catch (UnsupportedOperationException e2) {
                throw new JsonSyntaxException(e2);
            }
        }

        public String toString() {
            return BooleanTypeAdapter.class.getSimpleName();
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/DefaultTypeAdapters$DefaultConstructorCreator.class */
    private static final class DefaultConstructorCreator<T> implements InstanceCreator<T> {
        private final Class<? extends T> defaultInstance;
        private final DefaultConstructorAllocator allocator;

        public DefaultConstructorCreator(Class<? extends T> defaultInstance, DefaultConstructorAllocator allocator) {
            this.defaultInstance = defaultInstance;
            this.allocator = allocator;
        }

        @Override // com.google.gson.InstanceCreator
        public T createInstance(Type type) {
            try {
                T t = (T) this.allocator.newInstance(C$Gson$Types.getRawType(type));
                return t == null ? (T) this.allocator.newInstance(this.defaultInstance) : t;
            } catch (Exception e) {
                throw new JsonIOException(e);
            }
        }

        public String toString() {
            return DefaultConstructorCreator.class.getSimpleName();
        }
    }
}
