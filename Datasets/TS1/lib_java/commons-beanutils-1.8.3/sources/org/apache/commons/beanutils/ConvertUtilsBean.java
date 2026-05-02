package org.apache.commons.beanutils;

import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.math.BigInteger;
import org.apache.commons.beanutils.converters.ArrayConverter;
import org.apache.commons.beanutils.converters.BigDecimalConverter;
import org.apache.commons.beanutils.converters.BigIntegerConverter;
import org.apache.commons.beanutils.converters.BooleanConverter;
import org.apache.commons.beanutils.converters.ByteConverter;
import org.apache.commons.beanutils.converters.CalendarConverter;
import org.apache.commons.beanutils.converters.CharacterConverter;
import org.apache.commons.beanutils.converters.ClassConverter;
import org.apache.commons.beanutils.converters.ConverterFacade;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DoubleConverter;
import org.apache.commons.beanutils.converters.FileConverter;
import org.apache.commons.beanutils.converters.FloatConverter;
import org.apache.commons.beanutils.converters.IntegerConverter;
import org.apache.commons.beanutils.converters.LongConverter;
import org.apache.commons.beanutils.converters.ShortConverter;
import org.apache.commons.beanutils.converters.SqlDateConverter;
import org.apache.commons.beanutils.converters.SqlTimeConverter;
import org.apache.commons.beanutils.converters.SqlTimestampConverter;
import org.apache.commons.beanutils.converters.StringConverter;
import org.apache.commons.beanutils.converters.URLConverter;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/ConvertUtilsBean.class */
public class ConvertUtilsBean {
    private WeakFastHashMap converters = new WeakFastHashMap();
    private Log log;
    private Boolean defaultBoolean;
    private Byte defaultByte;
    private Character defaultCharacter;
    private Double defaultDouble;
    private Float defaultFloat;
    private Integer defaultInteger;
    private Long defaultLong;
    static Class class$org$apache$commons$beanutils$ConvertUtils;
    static Class class$java$lang$Boolean;
    static Class class$java$lang$Byte;
    static Class class$java$lang$Character;
    static Class class$java$lang$Double;
    static Class class$java$lang$Float;
    static Class class$java$lang$Integer;
    static Class class$java$lang$Long;
    static Class class$java$lang$Short;
    static Class class$java$lang$String;
    static Class class$java$math$BigDecimal;
    static Class class$java$math$BigInteger;
    static Class class$java$lang$Class;
    static Class class$java$util$Date;
    static Class class$java$util$Calendar;
    static Class class$java$io$File;
    static Class class$java$sql$Date;
    static Class class$java$sql$Time;
    static Class class$java$sql$Timestamp;
    static Class class$java$net$URL;
    static Class class$java$util$Collection;
    static Class array$Ljava$lang$String;
    private static final Integer ZERO = new Integer(0);
    private static final Character SPACE = new Character(' ');
    private static Short defaultShort = new Short((short) 0);

    protected static ConvertUtilsBean getInstance() {
        return BeanUtilsBean.getInstance().getConvertUtils();
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public ConvertUtilsBean() {
        Class cls;
        if (class$org$apache$commons$beanutils$ConvertUtils == null) {
            cls = class$("org.apache.commons.beanutils.ConvertUtils");
            class$org$apache$commons$beanutils$ConvertUtils = cls;
        } else {
            cls = class$org$apache$commons$beanutils$ConvertUtils;
        }
        this.log = LogFactory.getLog(cls);
        this.defaultBoolean = Boolean.FALSE;
        this.defaultByte = new Byte((byte) 0);
        this.defaultCharacter = new Character(' ');
        this.defaultDouble = new Double(0.0d);
        this.defaultFloat = new Float(0.0f);
        this.defaultInteger = new Integer(0);
        this.defaultLong = new Long(0L);
        this.converters.setFast(false);
        deregister();
        this.converters.setFast(true);
    }

    public boolean getDefaultBoolean() {
        return this.defaultBoolean.booleanValue();
    }

    public void setDefaultBoolean(boolean newDefaultBoolean) {
        Class cls;
        this.defaultBoolean = newDefaultBoolean ? Boolean.TRUE : Boolean.FALSE;
        register(new BooleanConverter(this.defaultBoolean), Boolean.TYPE);
        BooleanConverter booleanConverter = new BooleanConverter(this.defaultBoolean);
        if (class$java$lang$Boolean == null) {
            cls = class$("java.lang.Boolean");
            class$java$lang$Boolean = cls;
        } else {
            cls = class$java$lang$Boolean;
        }
        register(booleanConverter, cls);
    }

    public byte getDefaultByte() {
        return this.defaultByte.byteValue();
    }

    public void setDefaultByte(byte newDefaultByte) {
        Class cls;
        this.defaultByte = new Byte(newDefaultByte);
        register(new ByteConverter(this.defaultByte), Byte.TYPE);
        ByteConverter byteConverter = new ByteConverter(this.defaultByte);
        if (class$java$lang$Byte == null) {
            cls = class$("java.lang.Byte");
            class$java$lang$Byte = cls;
        } else {
            cls = class$java$lang$Byte;
        }
        register(byteConverter, cls);
    }

    public char getDefaultCharacter() {
        return this.defaultCharacter.charValue();
    }

    public void setDefaultCharacter(char newDefaultCharacter) {
        Class cls;
        this.defaultCharacter = new Character(newDefaultCharacter);
        register(new CharacterConverter(this.defaultCharacter), Character.TYPE);
        CharacterConverter characterConverter = new CharacterConverter(this.defaultCharacter);
        if (class$java$lang$Character == null) {
            cls = class$("java.lang.Character");
            class$java$lang$Character = cls;
        } else {
            cls = class$java$lang$Character;
        }
        register(characterConverter, cls);
    }

    public double getDefaultDouble() {
        return this.defaultDouble.doubleValue();
    }

    public void setDefaultDouble(double newDefaultDouble) {
        Class cls;
        this.defaultDouble = new Double(newDefaultDouble);
        register(new DoubleConverter(this.defaultDouble), Double.TYPE);
        DoubleConverter doubleConverter = new DoubleConverter(this.defaultDouble);
        if (class$java$lang$Double == null) {
            cls = class$("java.lang.Double");
            class$java$lang$Double = cls;
        } else {
            cls = class$java$lang$Double;
        }
        register(doubleConverter, cls);
    }

    public float getDefaultFloat() {
        return this.defaultFloat.floatValue();
    }

    public void setDefaultFloat(float newDefaultFloat) {
        Class cls;
        this.defaultFloat = new Float(newDefaultFloat);
        register(new FloatConverter(this.defaultFloat), Float.TYPE);
        FloatConverter floatConverter = new FloatConverter(this.defaultFloat);
        if (class$java$lang$Float == null) {
            cls = class$("java.lang.Float");
            class$java$lang$Float = cls;
        } else {
            cls = class$java$lang$Float;
        }
        register(floatConverter, cls);
    }

    public int getDefaultInteger() {
        return this.defaultInteger.intValue();
    }

    public void setDefaultInteger(int newDefaultInteger) {
        Class cls;
        this.defaultInteger = new Integer(newDefaultInteger);
        register(new IntegerConverter(this.defaultInteger), Integer.TYPE);
        IntegerConverter integerConverter = new IntegerConverter(this.defaultInteger);
        if (class$java$lang$Integer == null) {
            cls = class$("java.lang.Integer");
            class$java$lang$Integer = cls;
        } else {
            cls = class$java$lang$Integer;
        }
        register(integerConverter, cls);
    }

    public long getDefaultLong() {
        return this.defaultLong.longValue();
    }

    public void setDefaultLong(long newDefaultLong) {
        Class cls;
        this.defaultLong = new Long(newDefaultLong);
        register(new LongConverter(this.defaultLong), Long.TYPE);
        LongConverter longConverter = new LongConverter(this.defaultLong);
        if (class$java$lang$Long == null) {
            cls = class$("java.lang.Long");
            class$java$lang$Long = cls;
        } else {
            cls = class$java$lang$Long;
        }
        register(longConverter, cls);
    }

    public short getDefaultShort() {
        return defaultShort.shortValue();
    }

    public void setDefaultShort(short newDefaultShort) {
        Class cls;
        defaultShort = new Short(newDefaultShort);
        register(new ShortConverter(defaultShort), Short.TYPE);
        ShortConverter shortConverter = new ShortConverter(defaultShort);
        if (class$java$lang$Short == null) {
            cls = class$("java.lang.Short");
            class$java$lang$Short = cls;
        } else {
            cls = class$java$lang$Short;
        }
        register(shortConverter, cls);
    }

    public String convert(Object value) {
        Class cls;
        Class cls2;
        Object value2;
        Class cls3;
        Class cls4;
        if (value == null) {
            return null;
        }
        if (value.getClass().isArray()) {
            if (Array.getLength(value) < 1 || (value2 = Array.get(value, 0)) == null) {
                return null;
            }
            if (class$java$lang$String == null) {
                cls3 = class$("java.lang.String");
                class$java$lang$String = cls3;
            } else {
                cls3 = class$java$lang$String;
            }
            Converter converter = lookup(cls3);
            if (class$java$lang$String == null) {
                cls4 = class$("java.lang.String");
                class$java$lang$String = cls4;
            } else {
                cls4 = class$java$lang$String;
            }
            return (String) converter.convert(cls4, value2);
        }
        if (class$java$lang$String == null) {
            cls = class$("java.lang.String");
            class$java$lang$String = cls;
        } else {
            cls = class$java$lang$String;
        }
        Converter converter2 = lookup(cls);
        if (class$java$lang$String == null) {
            cls2 = class$("java.lang.String");
            class$java$lang$String = cls2;
        } else {
            cls2 = class$java$lang$String;
        }
        return (String) converter2.convert(cls2, value);
    }

    public Object convert(String value, Class clazz) {
        Class cls;
        if (this.log.isDebugEnabled()) {
            this.log.debug(new StringBuffer().append("Convert string '").append(value).append("' to class '").append(clazz.getName()).append("'").toString());
        }
        Converter converter = lookup(clazz);
        if (converter == null) {
            if (class$java$lang$String == null) {
                cls = class$("java.lang.String");
                class$java$lang$String = cls;
            } else {
                cls = class$java$lang$String;
            }
            converter = lookup(cls);
        }
        if (this.log.isTraceEnabled()) {
            this.log.trace(new StringBuffer().append("  Using converter ").append(converter).toString());
        }
        return converter.convert(clazz, value);
    }

    public Object convert(String[] values, Class clazz) {
        Class cls;
        Class type = clazz;
        if (clazz.isArray()) {
            type = clazz.getComponentType();
        }
        if (this.log.isDebugEnabled()) {
            this.log.debug(new StringBuffer().append("Convert String[").append(values.length).append("] to class '").append(type.getName()).append("[]'").toString());
        }
        Converter converter = lookup(type);
        if (converter == null) {
            if (class$java$lang$String == null) {
                cls = class$("java.lang.String");
                class$java$lang$String = cls;
            } else {
                cls = class$java$lang$String;
            }
            converter = lookup(cls);
        }
        if (this.log.isTraceEnabled()) {
            this.log.trace(new StringBuffer().append("  Using converter ").append(converter).toString());
        }
        Object array = Array.newInstance((Class<?>) type, values.length);
        for (int i = 0; i < values.length; i++) {
            Array.set(array, i, converter.convert(type, values[i]));
        }
        return array;
    }

    public Object convert(Object value, Class targetType) {
        Class cls;
        Class cls2;
        Class cls3;
        Class sourceType = value == null ? null : value.getClass();
        if (this.log.isDebugEnabled()) {
            if (value == null) {
                this.log.debug(new StringBuffer().append("Convert null value to type '").append(targetType.getName()).append("'").toString());
            } else {
                this.log.debug(new StringBuffer().append("Convert type '").append(sourceType.getName()).append("' value '").append(value).append("' to type '").append(targetType.getName()).append("'").toString());
            }
        }
        Object converted = value;
        Converter converter = lookup(sourceType, targetType);
        if (converter != null) {
            if (this.log.isTraceEnabled()) {
                this.log.trace(new StringBuffer().append("  Using converter ").append(converter).toString());
            }
            converted = converter.convert(targetType, value);
        }
        if (class$java$lang$String == null) {
            cls = class$("java.lang.String");
            class$java$lang$String = cls;
        } else {
            cls = class$java$lang$String;
        }
        if (targetType == cls && converted != null && !(converted instanceof String)) {
            if (class$java$lang$String == null) {
                cls2 = class$("java.lang.String");
                class$java$lang$String = cls2;
            } else {
                cls2 = class$java$lang$String;
            }
            Converter converter2 = lookup(cls2);
            if (converter2 != null) {
                if (this.log.isTraceEnabled()) {
                    this.log.trace(new StringBuffer().append("  Using converter ").append(converter2).toString());
                }
                if (class$java$lang$String == null) {
                    cls3 = class$("java.lang.String");
                    class$java$lang$String = cls3;
                } else {
                    cls3 = class$java$lang$String;
                }
                converted = converter2.convert(cls3, converted);
            }
            if (converted != null && !(converted instanceof String)) {
                converted = converted.toString();
            }
        }
        return converted;
    }

    public void deregister() {
        Class cls;
        Class cls2;
        this.converters.clear();
        registerPrimitives(false);
        registerStandard(false, false);
        registerOther(true);
        registerArrays(false, 0);
        if (class$java$math$BigDecimal == null) {
            cls = class$("java.math.BigDecimal");
            class$java$math$BigDecimal = cls;
        } else {
            cls = class$java$math$BigDecimal;
        }
        register(cls, new BigDecimalConverter());
        if (class$java$math$BigInteger == null) {
            cls2 = class$("java.math.BigInteger");
            class$java$math$BigInteger = cls2;
        } else {
            cls2 = class$java$math$BigInteger;
        }
        register(cls2, new BigIntegerConverter());
    }

    public void register(boolean throwException, boolean defaultNull, int defaultArraySize) {
        registerPrimitives(throwException);
        registerStandard(throwException, defaultNull);
        registerOther(throwException);
        registerArrays(throwException, defaultArraySize);
    }

    private void registerPrimitives(boolean throwException) {
        register(Boolean.TYPE, throwException ? new BooleanConverter() : new BooleanConverter(Boolean.FALSE));
        register(Byte.TYPE, throwException ? new ByteConverter() : new ByteConverter(ZERO));
        register(Character.TYPE, throwException ? new CharacterConverter() : new CharacterConverter(SPACE));
        register(Double.TYPE, throwException ? new DoubleConverter() : new DoubleConverter(ZERO));
        register(Float.TYPE, throwException ? new FloatConverter() : new FloatConverter(ZERO));
        register(Integer.TYPE, throwException ? new IntegerConverter() : new IntegerConverter(ZERO));
        register(Long.TYPE, throwException ? new LongConverter() : new LongConverter(ZERO));
        register(Short.TYPE, throwException ? new ShortConverter() : new ShortConverter(ZERO));
    }

    private void registerStandard(boolean throwException, boolean defaultNull) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        Class cls8;
        Class cls9;
        Class cls10;
        Class cls11;
        Number defaultNumber = defaultNull ? null : ZERO;
        BigDecimal bigDecDeflt = defaultNull ? null : new BigDecimal("0.0");
        BigInteger bigIntDeflt = defaultNull ? null : new BigInteger("0");
        Boolean booleanDefault = defaultNull ? null : Boolean.FALSE;
        Character charDefault = defaultNull ? null : SPACE;
        String stringDefault = defaultNull ? null : "";
        if (class$java$math$BigDecimal == null) {
            cls = class$("java.math.BigDecimal");
            class$java$math$BigDecimal = cls;
        } else {
            cls = class$java$math$BigDecimal;
        }
        register(cls, throwException ? new BigDecimalConverter() : new BigDecimalConverter(bigDecDeflt));
        if (class$java$math$BigInteger == null) {
            cls2 = class$("java.math.BigInteger");
            class$java$math$BigInteger = cls2;
        } else {
            cls2 = class$java$math$BigInteger;
        }
        register(cls2, throwException ? new BigIntegerConverter() : new BigIntegerConverter(bigIntDeflt));
        if (class$java$lang$Boolean == null) {
            cls3 = class$("java.lang.Boolean");
            class$java$lang$Boolean = cls3;
        } else {
            cls3 = class$java$lang$Boolean;
        }
        register(cls3, throwException ? new BooleanConverter() : new BooleanConverter(booleanDefault));
        if (class$java$lang$Byte == null) {
            cls4 = class$("java.lang.Byte");
            class$java$lang$Byte = cls4;
        } else {
            cls4 = class$java$lang$Byte;
        }
        register(cls4, throwException ? new ByteConverter() : new ByteConverter(defaultNumber));
        if (class$java$lang$Character == null) {
            cls5 = class$("java.lang.Character");
            class$java$lang$Character = cls5;
        } else {
            cls5 = class$java$lang$Character;
        }
        register(cls5, throwException ? new CharacterConverter() : new CharacterConverter(charDefault));
        if (class$java$lang$Double == null) {
            cls6 = class$("java.lang.Double");
            class$java$lang$Double = cls6;
        } else {
            cls6 = class$java$lang$Double;
        }
        register(cls6, throwException ? new DoubleConverter() : new DoubleConverter(defaultNumber));
        if (class$java$lang$Float == null) {
            cls7 = class$("java.lang.Float");
            class$java$lang$Float = cls7;
        } else {
            cls7 = class$java$lang$Float;
        }
        register(cls7, throwException ? new FloatConverter() : new FloatConverter(defaultNumber));
        if (class$java$lang$Integer == null) {
            cls8 = class$("java.lang.Integer");
            class$java$lang$Integer = cls8;
        } else {
            cls8 = class$java$lang$Integer;
        }
        register(cls8, throwException ? new IntegerConverter() : new IntegerConverter(defaultNumber));
        if (class$java$lang$Long == null) {
            cls9 = class$("java.lang.Long");
            class$java$lang$Long = cls9;
        } else {
            cls9 = class$java$lang$Long;
        }
        register(cls9, throwException ? new LongConverter() : new LongConverter(defaultNumber));
        if (class$java$lang$Short == null) {
            cls10 = class$("java.lang.Short");
            class$java$lang$Short = cls10;
        } else {
            cls10 = class$java$lang$Short;
        }
        register(cls10, throwException ? new ShortConverter() : new ShortConverter(defaultNumber));
        if (class$java$lang$String == null) {
            cls11 = class$("java.lang.String");
            class$java$lang$String = cls11;
        } else {
            cls11 = class$java$lang$String;
        }
        register(cls11, throwException ? new StringConverter() : new StringConverter(stringDefault));
    }

    private void registerOther(boolean throwException) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        Class cls8;
        if (class$java$lang$Class == null) {
            cls = class$("java.lang.Class");
            class$java$lang$Class = cls;
        } else {
            cls = class$java$lang$Class;
        }
        register(cls, throwException ? new ClassConverter() : new ClassConverter(null));
        if (class$java$util$Date == null) {
            cls2 = class$("java.util.Date");
            class$java$util$Date = cls2;
        } else {
            cls2 = class$java$util$Date;
        }
        register(cls2, throwException ? new DateConverter() : new DateConverter(null));
        if (class$java$util$Calendar == null) {
            cls3 = class$("java.util.Calendar");
            class$java$util$Calendar = cls3;
        } else {
            cls3 = class$java$util$Calendar;
        }
        register(cls3, throwException ? new CalendarConverter() : new CalendarConverter(null));
        if (class$java$io$File == null) {
            cls4 = class$("java.io.File");
            class$java$io$File = cls4;
        } else {
            cls4 = class$java$io$File;
        }
        register(cls4, throwException ? new FileConverter() : new FileConverter(null));
        if (class$java$sql$Date == null) {
            cls5 = class$("java.sql.Date");
            class$java$sql$Date = cls5;
        } else {
            cls5 = class$java$sql$Date;
        }
        register(cls5, throwException ? new SqlDateConverter() : new SqlDateConverter(null));
        if (class$java$sql$Time == null) {
            cls6 = class$("java.sql.Time");
            class$java$sql$Time = cls6;
        } else {
            cls6 = class$java$sql$Time;
        }
        register(cls6, throwException ? new SqlTimeConverter() : new SqlTimeConverter(null));
        if (class$java$sql$Timestamp == null) {
            cls7 = class$("java.sql.Timestamp");
            class$java$sql$Timestamp = cls7;
        } else {
            cls7 = class$java$sql$Timestamp;
        }
        register(cls7, throwException ? new SqlTimestampConverter() : new SqlTimestampConverter(null));
        if (class$java$net$URL == null) {
            cls8 = class$("java.net.URL");
            class$java$net$URL = cls8;
        } else {
            cls8 = class$java$net$URL;
        }
        register(cls8, throwException ? new URLConverter() : new URLConverter(null));
    }

    private void registerArrays(boolean throwException, int defaultArraySize) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        Class cls8;
        Class cls9;
        Class cls10;
        Class cls11;
        Class cls12;
        Class cls13;
        Class cls14;
        Class cls15;
        Class cls16;
        Class cls17;
        Class cls18;
        Class cls19;
        registerArrayConverter(Boolean.TYPE, new BooleanConverter(), throwException, defaultArraySize);
        registerArrayConverter(Byte.TYPE, new ByteConverter(), throwException, defaultArraySize);
        registerArrayConverter(Character.TYPE, new CharacterConverter(), throwException, defaultArraySize);
        registerArrayConverter(Double.TYPE, new DoubleConverter(), throwException, defaultArraySize);
        registerArrayConverter(Float.TYPE, new FloatConverter(), throwException, defaultArraySize);
        registerArrayConverter(Integer.TYPE, new IntegerConverter(), throwException, defaultArraySize);
        registerArrayConverter(Long.TYPE, new LongConverter(), throwException, defaultArraySize);
        registerArrayConverter(Short.TYPE, new ShortConverter(), throwException, defaultArraySize);
        if (class$java$math$BigDecimal == null) {
            cls = class$("java.math.BigDecimal");
            class$java$math$BigDecimal = cls;
        } else {
            cls = class$java$math$BigDecimal;
        }
        registerArrayConverter(cls, new BigDecimalConverter(), throwException, defaultArraySize);
        if (class$java$math$BigInteger == null) {
            cls2 = class$("java.math.BigInteger");
            class$java$math$BigInteger = cls2;
        } else {
            cls2 = class$java$math$BigInteger;
        }
        registerArrayConverter(cls2, new BigIntegerConverter(), throwException, defaultArraySize);
        if (class$java$lang$Boolean == null) {
            cls3 = class$("java.lang.Boolean");
            class$java$lang$Boolean = cls3;
        } else {
            cls3 = class$java$lang$Boolean;
        }
        registerArrayConverter(cls3, new BooleanConverter(), throwException, defaultArraySize);
        if (class$java$lang$Byte == null) {
            cls4 = class$("java.lang.Byte");
            class$java$lang$Byte = cls4;
        } else {
            cls4 = class$java$lang$Byte;
        }
        registerArrayConverter(cls4, new ByteConverter(), throwException, defaultArraySize);
        if (class$java$lang$Character == null) {
            cls5 = class$("java.lang.Character");
            class$java$lang$Character = cls5;
        } else {
            cls5 = class$java$lang$Character;
        }
        registerArrayConverter(cls5, new CharacterConverter(), throwException, defaultArraySize);
        if (class$java$lang$Double == null) {
            cls6 = class$("java.lang.Double");
            class$java$lang$Double = cls6;
        } else {
            cls6 = class$java$lang$Double;
        }
        registerArrayConverter(cls6, new DoubleConverter(), throwException, defaultArraySize);
        if (class$java$lang$Float == null) {
            cls7 = class$("java.lang.Float");
            class$java$lang$Float = cls7;
        } else {
            cls7 = class$java$lang$Float;
        }
        registerArrayConverter(cls7, new FloatConverter(), throwException, defaultArraySize);
        if (class$java$lang$Integer == null) {
            cls8 = class$("java.lang.Integer");
            class$java$lang$Integer = cls8;
        } else {
            cls8 = class$java$lang$Integer;
        }
        registerArrayConverter(cls8, new IntegerConverter(), throwException, defaultArraySize);
        if (class$java$lang$Long == null) {
            cls9 = class$("java.lang.Long");
            class$java$lang$Long = cls9;
        } else {
            cls9 = class$java$lang$Long;
        }
        registerArrayConverter(cls9, new LongConverter(), throwException, defaultArraySize);
        if (class$java$lang$Short == null) {
            cls10 = class$("java.lang.Short");
            class$java$lang$Short = cls10;
        } else {
            cls10 = class$java$lang$Short;
        }
        registerArrayConverter(cls10, new ShortConverter(), throwException, defaultArraySize);
        if (class$java$lang$String == null) {
            cls11 = class$("java.lang.String");
            class$java$lang$String = cls11;
        } else {
            cls11 = class$java$lang$String;
        }
        registerArrayConverter(cls11, new StringConverter(), throwException, defaultArraySize);
        if (class$java$lang$Class == null) {
            cls12 = class$("java.lang.Class");
            class$java$lang$Class = cls12;
        } else {
            cls12 = class$java$lang$Class;
        }
        registerArrayConverter(cls12, new ClassConverter(), throwException, defaultArraySize);
        if (class$java$util$Date == null) {
            cls13 = class$("java.util.Date");
            class$java$util$Date = cls13;
        } else {
            cls13 = class$java$util$Date;
        }
        registerArrayConverter(cls13, new DateConverter(), throwException, defaultArraySize);
        if (class$java$util$Calendar == null) {
            cls14 = class$("java.util.Calendar");
            class$java$util$Calendar = cls14;
        } else {
            cls14 = class$java$util$Calendar;
        }
        registerArrayConverter(cls14, new DateConverter(), throwException, defaultArraySize);
        if (class$java$io$File == null) {
            cls15 = class$("java.io.File");
            class$java$io$File = cls15;
        } else {
            cls15 = class$java$io$File;
        }
        registerArrayConverter(cls15, new FileConverter(), throwException, defaultArraySize);
        if (class$java$sql$Date == null) {
            cls16 = class$("java.sql.Date");
            class$java$sql$Date = cls16;
        } else {
            cls16 = class$java$sql$Date;
        }
        registerArrayConverter(cls16, new SqlDateConverter(), throwException, defaultArraySize);
        if (class$java$sql$Time == null) {
            cls17 = class$("java.sql.Time");
            class$java$sql$Time = cls17;
        } else {
            cls17 = class$java$sql$Time;
        }
        registerArrayConverter(cls17, new SqlTimeConverter(), throwException, defaultArraySize);
        if (class$java$sql$Timestamp == null) {
            cls18 = class$("java.sql.Timestamp");
            class$java$sql$Timestamp = cls18;
        } else {
            cls18 = class$java$sql$Timestamp;
        }
        registerArrayConverter(cls18, new SqlTimestampConverter(), throwException, defaultArraySize);
        if (class$java$net$URL == null) {
            cls19 = class$("java.net.URL");
            class$java$net$URL = cls19;
        } else {
            cls19 = class$java$net$URL;
        }
        registerArrayConverter(cls19, new URLConverter(), throwException, defaultArraySize);
    }

    private void registerArrayConverter(Class componentType, Converter componentConverter, boolean throwException, int defaultArraySize) {
        Converter arrayConverter;
        Class arrayType = Array.newInstance((Class<?>) componentType, 0).getClass();
        if (throwException) {
            arrayConverter = new ArrayConverter(arrayType, componentConverter);
        } else {
            arrayConverter = new ArrayConverter(arrayType, componentConverter, defaultArraySize);
        }
        register(arrayType, arrayConverter);
    }

    private void register(Class clazz, Converter converter) {
        register(new ConverterFacade(converter), clazz);
    }

    public void deregister(Class clazz) {
        this.converters.remove(clazz);
    }

    public Converter lookup(Class clazz) {
        return (Converter) this.converters.get(clazz);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00d6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public org.apache.commons.beanutils.Converter lookup(java.lang.Class r5, java.lang.Class r6) {
        /*
            Method dump skipped, instructions count: 258
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.beanutils.ConvertUtilsBean.lookup(java.lang.Class, java.lang.Class):org.apache.commons.beanutils.Converter");
    }

    public void register(Converter converter, Class clazz) {
        this.converters.put(clazz, converter);
    }
}
