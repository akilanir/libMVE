package freemarker.ext.beans;

import freemarker.core._ConcurrentMapFactory;
import freemarker.ext.util.IdentityHashMap;
import freemarker.ext.util.ModelCache;
import freemarker.ext.util.ModelFactory;
import freemarker.ext.util.WrapperTemplateModel;
import freemarker.log.Logger;
import freemarker.template.AdapterTemplateModel;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateDateModel;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateNumberModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import freemarker.template.utility.ClassUtil;
import freemarker.template.utility.Collections12;
import freemarker.template.utility.SecurityUtilities;
import freemarker.template.utility.UndeclaredThrowableException;
import java.beans.BeanInfo;
import java.beans.IndexedPropertyDescriptor;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.MethodDescriptor;
import java.beans.PropertyDescriptor;
import java.io.InputStream;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.StringTokenizer;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/BeansWrapper.class */
public class BeansWrapper implements ObjectWrapper {
    static final Object CAN_NOT_UNWRAP = new Object();
    private static final Class BIGINTEGER_CLASS;
    private static final Class BOOLEAN_CLASS;
    private static final Class CHARACTER_CLASS;
    private static final Class COLLECTION_CLASS;
    private static final Class DATE_CLASS;
    private static final Class HASHADAPTER_CLASS;
    private static final Class ITERABLE_CLASS;
    private static final Class LIST_CLASS;
    private static final Class MAP_CLASS;
    private static final Class NUMBER_CLASS;
    private static final Class OBJECT_CLASS;
    private static final Class SEQUENCEADAPTER_CLASS;
    private static final Class SET_CLASS;
    private static final Class SETADAPTER_CLASS;
    private static final Class STRING_CLASS;
    private static final boolean DEVELOPMENT;
    private static final Constructor ENUMS_MODEL_CTOR;
    private static final Logger logger;
    private static final Set UNSAFE_METHODS;
    static final Object GENERIC_GET_KEY;
    private static final Object CONSTRUCTORS;
    private static final Object ARGTYPES;
    private static final boolean javaRebelAvailable;
    private static final BeansWrapper INSTANCE;
    public static final int EXPOSE_ALL = 0;
    public static final int EXPOSE_SAFE = 1;
    public static final int EXPOSE_PROPERTIES_ONLY = 2;
    public static final int EXPOSE_NOTHING = 3;
    private boolean simpleMapWrapper;
    private static final ModelFactory ITERATOR_FACTORY;
    private static final ModelFactory ENUMERATION_FACTORY;
    static Class class$java$math$BigInteger;
    static Class class$java$lang$Boolean;
    static Class class$java$lang$Character;
    static Class class$java$util$Collection;
    static Class class$java$util$Date;
    static Class class$freemarker$ext$beans$HashAdapter;
    static Class class$java$util$List;
    static Class class$java$util$Map;
    static Class class$java$lang$Number;
    static Class class$java$lang$Object;
    static Class class$freemarker$ext$beans$SequenceAdapter;
    static Class class$java$util$Set;
    static Class class$freemarker$ext$beans$SetAdapter;
    static Class class$java$lang$String;
    static Class class$java$util$ResourceBundle;
    static Class class$java$util$Iterator;
    static Class class$java$util$Enumeration;
    static Class class$java$lang$Integer;
    static Class class$java$lang$Long;
    static Class class$java$lang$Float;
    static Class class$java$lang$Double;
    static Class class$java$lang$Byte;
    static Class class$java$lang$Short;
    static Class class$java$math$BigDecimal;
    static Class class$freemarker$ext$beans$BeansWrapper;
    private final Object sharedClassIntrospectionCacheLock = new Object();
    private final Map genericClassIntrospectionCache = _ConcurrentMapFactory.newMaybeConcurrentHashMap();
    private final boolean isGenericClassIntrospectionCacheConcurrentMap = _ConcurrentMapFactory.isConcurrent(this.genericClassIntrospectionCache);
    private final Set genericClassIntrospectionCacheClassNames = new HashSet();
    private final Set genericClassIntrospectionsInProgress = new HashSet();
    private final StaticModels staticModels = new StaticModels(this);
    private final ClassBasedModelFactory enumModels = createEnumModels(this);
    private final ModelCache modelCache = new BeansModelCache(this);
    private final BooleanModel FALSE = new BooleanModel(Boolean.FALSE, this);
    private final BooleanModel TRUE = new BooleanModel(Boolean.TRUE, this);
    private int exposureLevel = 1;
    private TemplateModel nullModel = null;
    private boolean methodsShadowItems = true;
    private boolean exposeFields = false;
    private int defaultDateType = 0;
    private ObjectWrapper outerIdentity = this;
    private boolean strict = false;
    private final ModelFactory BOOLEAN_FACTORY = new ModelFactory(this) { // from class: freemarker.ext.beans.BeansWrapper.1
        private final BeansWrapper this$0;

        {
            this.this$0 = this;
        }

        @Override // freemarker.ext.util.ModelFactory
        public TemplateModel create(Object object, ObjectWrapper wrapper) {
            return ((Boolean) object).booleanValue() ? this.this$0.TRUE : this.this$0.FALSE;
        }
    };

    static {
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
        Class iterable;
        if (class$java$math$BigInteger == null) {
            cls = class$("java.math.BigInteger");
            class$java$math$BigInteger = cls;
        } else {
            cls = class$java$math$BigInteger;
        }
        BIGINTEGER_CLASS = cls;
        if (class$java$lang$Boolean == null) {
            cls2 = class$("java.lang.Boolean");
            class$java$lang$Boolean = cls2;
        } else {
            cls2 = class$java$lang$Boolean;
        }
        BOOLEAN_CLASS = cls2;
        if (class$java$lang$Character == null) {
            cls3 = class$("java.lang.Character");
            class$java$lang$Character = cls3;
        } else {
            cls3 = class$java$lang$Character;
        }
        CHARACTER_CLASS = cls3;
        if (class$java$util$Collection == null) {
            cls4 = class$("java.util.Collection");
            class$java$util$Collection = cls4;
        } else {
            cls4 = class$java$util$Collection;
        }
        COLLECTION_CLASS = cls4;
        if (class$java$util$Date == null) {
            cls5 = class$("java.util.Date");
            class$java$util$Date = cls5;
        } else {
            cls5 = class$java$util$Date;
        }
        DATE_CLASS = cls5;
        if (class$freemarker$ext$beans$HashAdapter == null) {
            cls6 = class$("freemarker.ext.beans.HashAdapter");
            class$freemarker$ext$beans$HashAdapter = cls6;
        } else {
            cls6 = class$freemarker$ext$beans$HashAdapter;
        }
        HASHADAPTER_CLASS = cls6;
        if (class$java$util$List == null) {
            cls7 = class$("java.util.List");
            class$java$util$List = cls7;
        } else {
            cls7 = class$java$util$List;
        }
        LIST_CLASS = cls7;
        if (class$java$util$Map == null) {
            cls8 = class$("java.util.Map");
            class$java$util$Map = cls8;
        } else {
            cls8 = class$java$util$Map;
        }
        MAP_CLASS = cls8;
        if (class$java$lang$Number == null) {
            cls9 = class$("java.lang.Number");
            class$java$lang$Number = cls9;
        } else {
            cls9 = class$java$lang$Number;
        }
        NUMBER_CLASS = cls9;
        if (class$java$lang$Object == null) {
            cls10 = class$("java.lang.Object");
            class$java$lang$Object = cls10;
        } else {
            cls10 = class$java$lang$Object;
        }
        OBJECT_CLASS = cls10;
        if (class$freemarker$ext$beans$SequenceAdapter == null) {
            cls11 = class$("freemarker.ext.beans.SequenceAdapter");
            class$freemarker$ext$beans$SequenceAdapter = cls11;
        } else {
            cls11 = class$freemarker$ext$beans$SequenceAdapter;
        }
        SEQUENCEADAPTER_CLASS = cls11;
        if (class$java$util$Set == null) {
            cls12 = class$("java.util.Set");
            class$java$util$Set = cls12;
        } else {
            cls12 = class$java$util$Set;
        }
        SET_CLASS = cls12;
        if (class$freemarker$ext$beans$SetAdapter == null) {
            cls13 = class$("freemarker.ext.beans.SetAdapter");
            class$freemarker$ext$beans$SetAdapter = cls13;
        } else {
            cls13 = class$freemarker$ext$beans$SetAdapter;
        }
        SETADAPTER_CLASS = cls13;
        if (class$java$lang$String == null) {
            cls14 = class$("java.lang.String");
            class$java$lang$String = cls14;
        } else {
            cls14 = class$java$lang$String;
        }
        STRING_CLASS = cls14;
        try {
            iterable = Class.forName("java.lang.Iterable");
        } catch (ClassNotFoundException e) {
            iterable = null;
        }
        ITERABLE_CLASS = iterable;
        DEVELOPMENT = "true".equals(SecurityUtilities.getSystemProperty("freemarker.development"));
        ENUMS_MODEL_CTOR = enumsModelCtor();
        logger = Logger.getLogger("freemarker.beans");
        UNSAFE_METHODS = createUnsafeMethodsSet();
        GENERIC_GET_KEY = new Object();
        CONSTRUCTORS = new Object();
        ARGTYPES = new Object();
        javaRebelAvailable = isJavaRebelAvailable();
        INSTANCE = new BeansWrapper();
        ITERATOR_FACTORY = new ModelFactory() { // from class: freemarker.ext.beans.BeansWrapper.2
            @Override // freemarker.ext.util.ModelFactory
            public TemplateModel create(Object object, ObjectWrapper wrapper) {
                return new IteratorModel((Iterator) object, (BeansWrapper) wrapper);
            }
        };
        ENUMERATION_FACTORY = new ModelFactory() { // from class: freemarker.ext.beans.BeansWrapper.3
            @Override // freemarker.ext.util.ModelFactory
            public TemplateModel create(Object object, ObjectWrapper wrapper) {
                return new EnumerationModel((Enumeration) object, (BeansWrapper) wrapper);
            }
        };
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public BeansWrapper() {
        if (javaRebelAvailable) {
            JavaRebelIntegration.registerWrapper(this);
        }
    }

    public boolean isStrict() {
        return this.strict;
    }

    public void setStrict(boolean strict) {
        this.strict = strict;
    }

    public void setOuterIdentity(ObjectWrapper outerIdentity) {
        this.outerIdentity = outerIdentity;
    }

    public ObjectWrapper getOuterIdentity() {
        return this.outerIdentity;
    }

    public void setSimpleMapWrapper(boolean simpleMapWrapper) {
        this.simpleMapWrapper = simpleMapWrapper;
    }

    public boolean isSimpleMapWrapper() {
        return this.simpleMapWrapper;
    }

    public void setExposureLevel(int exposureLevel) {
        if (exposureLevel < 0 || exposureLevel > 3) {
            throw new IllegalArgumentException(new StringBuffer().append("Illegal exposure level ").append(exposureLevel).toString());
        }
        this.exposureLevel = exposureLevel;
    }

    int getExposureLevel() {
        return this.exposureLevel;
    }

    public void setExposeFields(boolean exposeFields) {
        this.exposeFields = exposeFields;
    }

    public boolean isExposeFields() {
        return this.exposeFields;
    }

    public synchronized void setMethodsShadowItems(boolean methodsShadowItems) {
        this.methodsShadowItems = methodsShadowItems;
    }

    boolean isMethodsShadowItems() {
        return this.methodsShadowItems;
    }

    public synchronized void setDefaultDateType(int defaultDateType) {
        this.defaultDateType = defaultDateType;
    }

    protected int getDefaultDateType() {
        return this.defaultDateType;
    }

    public void setUseCache(boolean useCache) {
        this.modelCache.setUseCache(useCache);
    }

    public void setNullModel(TemplateModel nullModel) {
        this.nullModel = nullModel;
    }

    public static final BeansWrapper getDefaultInstance() {
        return INSTANCE;
    }

    @Override // freemarker.template.ObjectWrapper
    public TemplateModel wrap(Object object) throws TemplateModelException {
        if (object == null) {
            return this.nullModel;
        }
        return this.modelCache.getInstance(object);
    }

    protected TemplateModel getInstance(Object object, ModelFactory factory) {
        return factory.create(object, this);
    }

    protected ModelFactory getModelFactory(Class clazz) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        Class cls8;
        if (class$java$util$Map == null) {
            cls = class$("java.util.Map");
            class$java$util$Map = cls;
        } else {
            cls = class$java$util$Map;
        }
        if (cls.isAssignableFrom(clazz)) {
            return this.simpleMapWrapper ? SimpleMapModel.FACTORY : MapModel.FACTORY;
        }
        if (class$java$util$Collection == null) {
            cls2 = class$("java.util.Collection");
            class$java$util$Collection = cls2;
        } else {
            cls2 = class$java$util$Collection;
        }
        if (cls2.isAssignableFrom(clazz)) {
            return CollectionModel.FACTORY;
        }
        if (class$java$lang$Number == null) {
            cls3 = class$("java.lang.Number");
            class$java$lang$Number = cls3;
        } else {
            cls3 = class$java$lang$Number;
        }
        if (cls3.isAssignableFrom(clazz)) {
            return NumberModel.FACTORY;
        }
        if (class$java$util$Date == null) {
            cls4 = class$("java.util.Date");
            class$java$util$Date = cls4;
        } else {
            cls4 = class$java$util$Date;
        }
        if (cls4.isAssignableFrom(clazz)) {
            return DateModel.FACTORY;
        }
        if (class$java$lang$Boolean == null) {
            cls5 = class$("java.lang.Boolean");
            class$java$lang$Boolean = cls5;
        } else {
            cls5 = class$java$lang$Boolean;
        }
        if (cls5 == clazz) {
            return this.BOOLEAN_FACTORY;
        }
        if (class$java$util$ResourceBundle == null) {
            cls6 = class$("java.util.ResourceBundle");
            class$java$util$ResourceBundle = cls6;
        } else {
            cls6 = class$java$util$ResourceBundle;
        }
        if (cls6.isAssignableFrom(clazz)) {
            return ResourceBundleModel.FACTORY;
        }
        if (class$java$util$Iterator == null) {
            cls7 = class$("java.util.Iterator");
            class$java$util$Iterator = cls7;
        } else {
            cls7 = class$java$util$Iterator;
        }
        if (cls7.isAssignableFrom(clazz)) {
            return ITERATOR_FACTORY;
        }
        if (class$java$util$Enumeration == null) {
            cls8 = class$("java.util.Enumeration");
            class$java$util$Enumeration = cls8;
        } else {
            cls8 = class$java$util$Enumeration;
        }
        if (cls8.isAssignableFrom(clazz)) {
            return ENUMERATION_FACTORY;
        }
        if (clazz.isArray()) {
            return ArrayModel.FACTORY;
        }
        return StringModel.FACTORY;
    }

    public Object unwrap(TemplateModel model) throws TemplateModelException {
        return unwrap(model, OBJECT_CLASS);
    }

    public Object unwrap(TemplateModel model, Class hint) throws TemplateModelException {
        Object obj = unwrapInternal(model, hint);
        if (obj == CAN_NOT_UNWRAP) {
            throw new TemplateModelException(new StringBuffer().append("Can not unwrap model of type ").append(model.getClass().getName()).append(" to type ").append(hint.getName()).toString());
        }
        return obj;
    }

    Object unwrapInternal(TemplateModel model, Class hint) throws TemplateModelException {
        return unwrap(model, hint, null);
    }

    private Object unwrap(TemplateModel model, Class hint, Map recursionStops) throws TemplateModelException {
        Number number;
        Number number2;
        Number number3;
        if (model == null || model == this.nullModel) {
            return null;
        }
        boolean isBoolean = Boolean.TYPE == hint;
        boolean isChar = Character.TYPE == hint;
        if (model instanceof AdapterTemplateModel) {
            Object adapted = ((AdapterTemplateModel) model).getAdaptedObject(hint);
            if (hint.isInstance(adapted)) {
                return adapted;
            }
            if ((adapted instanceof Number) && (((hint.isPrimitive() && !isChar && !isBoolean) || NUMBER_CLASS.isAssignableFrom(hint)) && (number3 = convertUnwrappedNumber(hint, (Number) adapted)) != null)) {
                return number3;
            }
        }
        if (model instanceof WrapperTemplateModel) {
            Object wrapped = ((WrapperTemplateModel) model).getWrappedObject();
            if (hint.isInstance(wrapped)) {
                return wrapped;
            }
            if ((wrapped instanceof Number) && (((hint.isPrimitive() && !isChar && !isBoolean) || NUMBER_CLASS.isAssignableFrom(hint)) && (number2 = convertUnwrappedNumber(hint, (Number) wrapped)) != null)) {
                return number2;
            }
        }
        if (STRING_CLASS == hint) {
            if (model instanceof TemplateScalarModel) {
                return ((TemplateScalarModel) model).getAsString();
            }
            return CAN_NOT_UNWRAP;
        }
        if (((hint.isPrimitive() && !isChar && !isBoolean) || NUMBER_CLASS.isAssignableFrom(hint)) && (model instanceof TemplateNumberModel) && (number = convertUnwrappedNumber(hint, ((TemplateNumberModel) model).getAsNumber())) != null) {
            return number;
        }
        if (isBoolean || BOOLEAN_CLASS == hint) {
            if (model instanceof TemplateBooleanModel) {
                return ((TemplateBooleanModel) model).getAsBoolean() ? Boolean.TRUE : Boolean.FALSE;
            }
            return CAN_NOT_UNWRAP;
        }
        if (MAP_CLASS == hint && (model instanceof TemplateHashModel)) {
            return new HashAdapter((TemplateHashModel) model, this);
        }
        if (LIST_CLASS == hint && (model instanceof TemplateSequenceModel)) {
            return new SequenceAdapter((TemplateSequenceModel) model, this);
        }
        if (SET_CLASS == hint && (model instanceof TemplateCollectionModel)) {
            return new SetAdapter((TemplateCollectionModel) model, this);
        }
        if (COLLECTION_CLASS == hint || ITERABLE_CLASS == hint) {
            if (model instanceof TemplateCollectionModel) {
                return new CollectionAdapter((TemplateCollectionModel) model, this);
            }
            if (model instanceof TemplateSequenceModel) {
                return new SequenceAdapter((TemplateSequenceModel) model, this);
            }
        }
        if (hint.isArray()) {
            if (model instanceof TemplateSequenceModel) {
                if (recursionStops != null) {
                    Object retval = recursionStops.get(model);
                    if (retval != null) {
                        return retval;
                    }
                } else {
                    recursionStops = new IdentityHashMap();
                }
                TemplateSequenceModel seq = (TemplateSequenceModel) model;
                Class componentType = hint.getComponentType();
                Object array = Array.newInstance((Class<?>) componentType, seq.size());
                recursionStops.put(model, array);
                try {
                    int size = seq.size();
                    for (int i = 0; i < size; i++) {
                        Object val = unwrap(seq.get(i), componentType, recursionStops);
                        if (val == CAN_NOT_UNWRAP) {
                            Object obj = CAN_NOT_UNWRAP;
                            recursionStops.remove(model);
                            return obj;
                        }
                        Array.set(array, i, val);
                    }
                    return array;
                } finally {
                    recursionStops.remove(model);
                }
            }
            return CAN_NOT_UNWRAP;
        }
        if (isChar || hint == CHARACTER_CLASS) {
            if (model instanceof TemplateScalarModel) {
                String s = ((TemplateScalarModel) model).getAsString();
                if (s.length() == 1) {
                    return new Character(s.charAt(0));
                }
            }
            return CAN_NOT_UNWRAP;
        }
        if (DATE_CLASS.isAssignableFrom(hint) && (model instanceof TemplateDateModel)) {
            Date date = ((TemplateDateModel) model).getAsDate();
            if (hint.isInstance(date)) {
                return date;
            }
        }
        if (model instanceof TemplateNumberModel) {
            Number number4 = ((TemplateNumberModel) model).getAsNumber();
            if (hint.isInstance(number4)) {
                return number4;
            }
        }
        if (model instanceof TemplateDateModel) {
            Date date2 = ((TemplateDateModel) model).getAsDate();
            if (hint.isInstance(date2)) {
                return date2;
            }
        }
        if ((model instanceof TemplateScalarModel) && hint.isAssignableFrom(STRING_CLASS)) {
            return ((TemplateScalarModel) model).getAsString();
        }
        if ((model instanceof TemplateBooleanModel) && hint.isAssignableFrom(BOOLEAN_CLASS)) {
            return ((TemplateBooleanModel) model).getAsBoolean() ? Boolean.TRUE : Boolean.FALSE;
        }
        if ((model instanceof TemplateHashModel) && hint.isAssignableFrom(HASHADAPTER_CLASS)) {
            return new HashAdapter((TemplateHashModel) model, this);
        }
        if ((model instanceof TemplateSequenceModel) && hint.isAssignableFrom(SEQUENCEADAPTER_CLASS)) {
            return new SequenceAdapter((TemplateSequenceModel) model, this);
        }
        if ((model instanceof TemplateCollectionModel) && hint.isAssignableFrom(SETADAPTER_CLASS)) {
            return new SetAdapter((TemplateCollectionModel) model, this);
        }
        if (hint.isInstance(model)) {
            return model;
        }
        return CAN_NOT_UNWRAP;
    }

    private static Number convertUnwrappedNumber(Class hint, Number number) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        Class cls8;
        if (hint != Integer.TYPE) {
            if (class$java$lang$Integer == null) {
                cls = class$("java.lang.Integer");
                class$java$lang$Integer = cls;
            } else {
                cls = class$java$lang$Integer;
            }
            if (hint != cls) {
                if (hint != Long.TYPE) {
                    if (class$java$lang$Long == null) {
                        cls2 = class$("java.lang.Long");
                        class$java$lang$Long = cls2;
                    } else {
                        cls2 = class$java$lang$Long;
                    }
                    if (hint != cls2) {
                        if (hint != Float.TYPE) {
                            if (class$java$lang$Float == null) {
                                cls3 = class$("java.lang.Float");
                                class$java$lang$Float = cls3;
                            } else {
                                cls3 = class$java$lang$Float;
                            }
                            if (hint != cls3) {
                                if (hint != Double.TYPE) {
                                    if (class$java$lang$Double == null) {
                                        cls4 = class$("java.lang.Double");
                                        class$java$lang$Double = cls4;
                                    } else {
                                        cls4 = class$java$lang$Double;
                                    }
                                    if (hint != cls4) {
                                        if (hint != Byte.TYPE) {
                                            if (class$java$lang$Byte == null) {
                                                cls5 = class$("java.lang.Byte");
                                                class$java$lang$Byte = cls5;
                                            } else {
                                                cls5 = class$java$lang$Byte;
                                            }
                                            if (hint != cls5) {
                                                if (hint != Short.TYPE) {
                                                    if (class$java$lang$Short == null) {
                                                        cls6 = class$("java.lang.Short");
                                                        class$java$lang$Short = cls6;
                                                    } else {
                                                        cls6 = class$java$lang$Short;
                                                    }
                                                    if (hint != cls6) {
                                                        if (class$java$math$BigInteger == null) {
                                                            cls7 = class$("java.math.BigInteger");
                                                            class$java$math$BigInteger = cls7;
                                                        } else {
                                                            cls7 = class$java$math$BigInteger;
                                                        }
                                                        if (hint == cls7) {
                                                            return number instanceof BigInteger ? number : new BigInteger(number.toString());
                                                        }
                                                        if (class$java$math$BigDecimal == null) {
                                                            cls8 = class$("java.math.BigDecimal");
                                                            class$java$math$BigDecimal = cls8;
                                                        } else {
                                                            cls8 = class$java$math$BigDecimal;
                                                        }
                                                        if (hint == cls8) {
                                                            if (number instanceof BigDecimal) {
                                                                return number;
                                                            }
                                                            if (number instanceof BigInteger) {
                                                                return new BigDecimal((BigInteger) number);
                                                            }
                                                            if (number instanceof Long) {
                                                                return new BigDecimal(number.toString());
                                                            }
                                                            return new BigDecimal(number.doubleValue());
                                                        }
                                                        if (hint.isInstance(number)) {
                                                            return number;
                                                        }
                                                        return null;
                                                    }
                                                }
                                                return number instanceof Short ? (Short) number : new Short(number.shortValue());
                                            }
                                        }
                                        return number instanceof Byte ? (Byte) number : new Byte(number.byteValue());
                                    }
                                }
                                return number instanceof Double ? (Double) number : new Double(number.doubleValue());
                            }
                        }
                        return number instanceof Float ? (Float) number : new Float(number.floatValue());
                    }
                }
                return number instanceof Long ? (Long) number : new Long(number.longValue());
            }
        }
        return number instanceof Integer ? (Integer) number : new Integer(number.intValue());
    }

    TemplateModel invokeMethod(Object object, Method method, Object[] args) throws InvocationTargetException, IllegalAccessException, TemplateModelException {
        Object retval = method.invoke(object, args);
        return method.getReturnType() == Void.TYPE ? TemplateModel.NOTHING : getOuterIdentity().wrap(retval);
    }

    public TemplateHashModel getStaticModels() {
        return this.staticModels;
    }

    public TemplateHashModel getEnumModels() {
        if (this.enumModels == null) {
            throw new UnsupportedOperationException("Enums not supported before J2SE 5.");
        }
        return this.enumModels;
    }

    public Object newInstance(Class clazz, List arguments) throws TemplateModelException {
        Object[] objargs;
        Constructor ctor;
        try {
            Object ctors = getClassIntrospectionData(clazz).get(CONSTRUCTORS);
            if (ctors == null) {
                throw new TemplateModelException(new StringBuffer().append("Class ").append(clazz.getName()).append(" has no public constructors.").toString());
            }
            if (ctors instanceof SimpleMemberModel) {
                SimpleMemberModel smm = (SimpleMemberModel) ctors;
                ctor = (Constructor) smm.getMember();
                objargs = smm.unwrapArguments(arguments, this);
            } else if (ctors instanceof OverloadedMethods) {
                OverloadedMethods overloadedConstructors = (OverloadedMethods) ctors;
                MemberAndArguments maa = overloadedConstructors.getMemberAndArguments(arguments);
                objargs = maa.getArgs();
                ctor = (Constructor) maa.getMember();
            } else {
                throw new Error();
            }
            return ctor.newInstance(objargs);
        } catch (TemplateModelException e) {
            throw e;
        } catch (Exception e2) {
            throw new TemplateModelException(new StringBuffer().append("Could not create instance of class ").append(clazz.getName()).toString(), e2);
        }
    }

    Map getClassIntrospectionData(Class clazz) {
        Map introspData;
        if (this.isGenericClassIntrospectionCacheConcurrentMap && (introspData = (Map) this.genericClassIntrospectionCache.get(clazz)) != null) {
            return introspData;
        }
        synchronized (this.sharedClassIntrospectionCacheLock) {
            Map introspData2 = (Map) this.genericClassIntrospectionCache.get(clazz);
            if (introspData2 != null) {
                return introspData2;
            }
            String className = clazz.getName();
            if (this.genericClassIntrospectionCacheClassNames.contains(className)) {
                onSameNameClassesDetected(className);
            }
            while (introspData2 == null && this.genericClassIntrospectionsInProgress.contains(clazz)) {
                try {
                    this.sharedClassIntrospectionCacheLock.wait();
                    introspData2 = (Map) this.genericClassIntrospectionCache.get(clazz);
                } catch (InterruptedException e) {
                    throw new RuntimeException(new StringBuffer().append("Class inrospection data lookup aborded: ").append(e).toString());
                }
            }
            if (introspData2 != null) {
                return introspData2;
            }
            this.genericClassIntrospectionsInProgress.add(clazz);
            try {
                Map introspData3 = createClassIntrospectionData(clazz);
                synchronized (this.sharedClassIntrospectionCacheLock) {
                    this.genericClassIntrospectionCache.put(clazz, introspData3);
                    this.genericClassIntrospectionCacheClassNames.add(className);
                }
                synchronized (this.sharedClassIntrospectionCacheLock) {
                    this.genericClassIntrospectionsInProgress.remove(clazz);
                    this.sharedClassIntrospectionCacheLock.notifyAll();
                }
                return introspData3;
            } catch (Throwable th) {
                synchronized (this.sharedClassIntrospectionCacheLock) {
                    this.genericClassIntrospectionsInProgress.remove(clazz);
                    this.sharedClassIntrospectionCacheLock.notifyAll();
                    throw th;
                }
            }
        }
    }

    public void removeFromClassIntrospectionCache(Class clazz) {
        synchronized (this.sharedClassIntrospectionCacheLock) {
            removeFromGenericClassIntrospectionCache(clazz);
            this.staticModels.removeFromCache(clazz);
            if (this.enumModels != null) {
                this.enumModels.removeFromCache(clazz);
            }
        }
    }

    public void clearClassIntrospecitonCache() {
        synchronized (this.sharedClassIntrospectionCacheLock) {
            clearGenericClassIntrospectionCache();
            this.staticModels.clearCache();
            if (this.enumModels != null) {
                this.enumModels.clearCache();
            }
        }
    }

    void onSameNameClassesDetected(String className) {
        if (logger.isInfoEnabled()) {
            logger.info(new StringBuffer().append("Detected multiple classes with the same name, \"").append(className).append("\". Assuming it was a class-reloading. Clearing BeansWrapper ").append("caches to release old data.").toString());
        }
        clearClassIntrospecitonCache();
    }

    Object getSharedClassIntrospectionCacheLock() {
        return this.sharedClassIntrospectionCacheLock;
    }

    private void removeFromGenericClassIntrospectionCache(Class clazz) {
        synchronized (this.sharedClassIntrospectionCacheLock) {
            this.genericClassIntrospectionCache.remove(clazz);
            this.genericClassIntrospectionCacheClassNames.remove(clazz.getName());
            this.modelCache.clearCache();
        }
    }

    private void clearGenericClassIntrospectionCache() {
        synchronized (this.sharedClassIntrospectionCacheLock) {
            this.genericClassIntrospectionCache.clear();
            this.genericClassIntrospectionCacheClassNames.clear();
            this.modelCache.clearCache();
        }
    }

    int keyCount(Class clazz) {
        Map map = getClassIntrospectionData(clazz);
        int count = map.size();
        if (map.containsKey(CONSTRUCTORS)) {
            count--;
        }
        if (map.containsKey(GENERIC_GET_KEY)) {
            count--;
        }
        if (map.containsKey(ARGTYPES)) {
            count--;
        }
        return count;
    }

    Set keySet(Class clazz) {
        Set set = new HashSet(getClassIntrospectionData(clazz).keySet());
        set.remove(CONSTRUCTORS);
        set.remove(GENERIC_GET_KEY);
        set.remove(ARGTYPES);
        return set;
    }

    private Map createClassIntrospectionData(Class clazz) {
        Map introspData = new HashMap();
        if (this.exposeFields) {
            addFieldsToClassIntrospectionData(introspData, clazz);
        }
        Map accessibleMethods = discoverAccessibleMethods(clazz);
        addGenericGetToClassIntrospectionData(introspData, accessibleMethods);
        if (this.exposureLevel != 3) {
            try {
                addBeanInfoToClassInrospectionData(introspData, clazz, accessibleMethods);
            } catch (IntrospectionException e) {
                logger.warn(new StringBuffer().append("Couldn't properly perform introspection for class ").append(clazz).toString(), e);
                introspData.clear();
            }
        }
        addConstructorsToClassIntrospectionData(introspData, clazz);
        if (introspData.size() > 1) {
            return introspData;
        }
        if (introspData.size() == 0) {
            return Collections12.EMPTY_MAP;
        }
        Map.Entry e2 = (Map.Entry) introspData.entrySet().iterator().next();
        return Collections12.singletonMap(e2.getKey(), e2.getValue());
    }

    private void addFieldsToClassIntrospectionData(Map introspData, Class clazz) throws SecurityException {
        Field[] fields = clazz.getFields();
        for (Field field : fields) {
            if ((field.getModifiers() & 8) == 0) {
                introspData.put(field.getName(), field);
            }
        }
    }

    private void addBeanInfoToClassInrospectionData(Map introspData, Class clazz, Map accessibleMethods) throws IntrospectionException {
        BeanInfo beanInfo = Introspector.getBeanInfo(clazz);
        PropertyDescriptor[] pda = beanInfo.getPropertyDescriptors();
        int pdaLength = pda != null ? pda.length : 0;
        for (int i = pdaLength - 1; i >= 0; i--) {
            addPropertyDescriptorToClassIntrospectionData(pda[i], clazz, accessibleMethods, introspData);
        }
        if (this.exposureLevel < 2) {
            MethodAppearanceDecision decision = new MethodAppearanceDecision();
            MethodDescriptor[] mda = beanInfo.getMethodDescriptors();
            int mdaLength = mda != null ? mda.length : 0;
            for (int i2 = mdaLength - 1; i2 >= 0; i2--) {
                MethodDescriptor md = mda[i2];
                Method publicMethod = getAccessibleMethod(md.getMethod(), accessibleMethods);
                if (publicMethod != null && isSafeMethod(publicMethod)) {
                    decision.setDefaults(publicMethod);
                    finetuneMethodAppearance(clazz, publicMethod, decision);
                    PropertyDescriptor propDesc = decision.getExposeAsProperty();
                    if (propDesc != null && !(introspData.get(propDesc.getName()) instanceof PropertyDescriptor)) {
                        addPropertyDescriptorToClassIntrospectionData(propDesc, clazz, accessibleMethods, introspData);
                    }
                    String methodKey = decision.getExposeMethodAs();
                    if (methodKey != null) {
                        Object previous = introspData.get(methodKey);
                        if (previous instanceof Method) {
                            OverloadedMethods overloadedMethods = new OverloadedMethods(this);
                            overloadedMethods.addMember((Method) previous);
                            overloadedMethods.addMember(publicMethod);
                            introspData.put(methodKey, overloadedMethods);
                            getArgTypes(introspData).remove(previous);
                        } else if (previous instanceof OverloadedMethods) {
                            ((OverloadedMethods) previous).addMember(publicMethod);
                        } else if (decision.getMethodShadowsProperty() || !(previous instanceof PropertyDescriptor)) {
                            introspData.put(methodKey, publicMethod);
                            getArgTypes(introspData).put(publicMethod, publicMethod.getParameterTypes());
                        }
                    }
                }
            }
        }
    }

    private void addPropertyDescriptorToClassIntrospectionData(PropertyDescriptor pd, Class clazz, Map accessibleMethods, Map classMap) {
        if (pd instanceof IndexedPropertyDescriptor) {
            IndexedPropertyDescriptor ipd = (IndexedPropertyDescriptor) pd;
            Method readMethod = ipd.getIndexedReadMethod();
            Method publicReadMethod = getAccessibleMethod(readMethod, accessibleMethods);
            if (publicReadMethod != null && isSafeMethod(publicReadMethod)) {
                if (readMethod != publicReadMethod) {
                    try {
                        ipd = new IndexedPropertyDescriptor(ipd.getName(), ipd.getReadMethod(), (Method) null, publicReadMethod, (Method) null);
                    } catch (IntrospectionException e) {
                        logger.warn(new StringBuffer().append("Failed creating a publicly-accessible property descriptor for ").append(clazz.getName()).append(" indexed property ").append(pd.getName()).append(", read method ").append(publicReadMethod).toString(), e);
                        return;
                    }
                }
                classMap.put(ipd.getName(), ipd);
                getArgTypes(classMap).put(publicReadMethod, publicReadMethod.getParameterTypes());
                return;
            }
            return;
        }
        Method readMethod2 = pd.getReadMethod();
        Method publicReadMethod2 = getAccessibleMethod(readMethod2, accessibleMethods);
        if (publicReadMethod2 != null && isSafeMethod(publicReadMethod2)) {
            if (readMethod2 != publicReadMethod2) {
                try {
                    pd = new PropertyDescriptor(pd.getName(), publicReadMethod2, (Method) null);
                    pd.setReadMethod(publicReadMethod2);
                } catch (IntrospectionException e2) {
                    logger.warn(new StringBuffer().append("Failed creating a publicly-accessible property descriptor for ").append(clazz.getName()).append(" property ").append(pd.getName()).append(", read method ").append(publicReadMethod2).toString(), e2);
                    return;
                }
            }
            classMap.put(pd.getName(), pd);
        }
    }

    private void addGenericGetToClassIntrospectionData(Map introspData, Map accessibleMethods) {
        Method genericGet = getFirstAccessibleMethod(MethodSignature.GET_STRING_SIGNATURE, accessibleMethods);
        if (genericGet == null) {
            genericGet = getFirstAccessibleMethod(MethodSignature.GET_OBJECT_SIGNATURE, accessibleMethods);
        }
        if (genericGet != null) {
            introspData.put(GENERIC_GET_KEY, genericGet);
        }
    }

    private void addConstructorsToClassIntrospectionData(Map introspData, Class clazz) {
        try {
            Constructor[] ctors = clazz.getConstructors();
            if (ctors.length == 1) {
                Constructor ctor = ctors[0];
                introspData.put(CONSTRUCTORS, new SimpleMemberModel(ctor, ctor.getParameterTypes()));
            } else if (ctors.length > 1) {
                OverloadedMethods ctorMap = new OverloadedMethods(this);
                for (Constructor constructor : ctors) {
                    ctorMap.addMember(constructor);
                }
                introspData.put(CONSTRUCTORS, ctorMap);
            }
        } catch (SecurityException e) {
            logger.warn(new StringBuffer().append("Canont discover constructors for class ").append(clazz.getName()).toString(), e);
        }
    }

    protected void finetuneMethodAppearance(Class clazz, Method m, MethodAppearanceDecision decision) {
    }

    private static Map getArgTypes(Map classMap) {
        Map argTypes = (Map) classMap.get(ARGTYPES);
        if (argTypes == null) {
            argTypes = new HashMap();
            classMap.put(ARGTYPES, argTypes);
        }
        return argTypes;
    }

    static Class[] getArgTypes(Map classMap, AccessibleObject methodOrCtor) {
        return (Class[]) ((Map) classMap.get(ARGTYPES)).get(methodOrCtor);
    }

    private static Method getFirstAccessibleMethod(MethodSignature sig, Map accessibles) {
        List l = (List) accessibles.get(sig);
        if (l == null || l.isEmpty()) {
            return null;
        }
        return (Method) l.iterator().next();
    }

    private static Method getAccessibleMethod(Method m, Map accessibles) {
        if (m == null) {
            return null;
        }
        MethodSignature sig = new MethodSignature(m);
        List<Method> l = (List) accessibles.get(sig);
        if (l == null) {
            return null;
        }
        for (Method am : l) {
            if (am.getReturnType() == m.getReturnType()) {
                return am;
            }
        }
        return null;
    }

    boolean isSafeMethod(Method method) {
        return this.exposureLevel < 1 || !UNSAFE_METHODS.contains(method);
    }

    private static Map discoverAccessibleMethods(Class clazz) {
        Map map = new HashMap();
        discoverAccessibleMethods(clazz, map);
        return map;
    }

    private static void discoverAccessibleMethods(Class clazz, Map map) {
        if (Modifier.isPublic(clazz.getModifiers())) {
            try {
                Method[] methods = clazz.getMethods();
                for (Method method : methods) {
                    MethodSignature sig = new MethodSignature(method);
                    List methodList = (List) map.get(sig);
                    if (methodList == null) {
                        methodList = new LinkedList();
                        map.put(sig, methodList);
                    }
                    methodList.add(method);
                }
                return;
            } catch (SecurityException e) {
                logger.warn(new StringBuffer().append("Could not discover accessible methods of class ").append(clazz.getName()).append(", attemping superclasses/interfaces.").toString(), e);
            }
        }
        Class[] interfaces = clazz.getInterfaces();
        for (Class cls : interfaces) {
            discoverAccessibleMethods(cls, map);
        }
        Class superclass = clazz.getSuperclass();
        if (superclass != null) {
            discoverAccessibleMethods(superclass, map);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/BeansWrapper$MethodSignature.class */
    private static final class MethodSignature {
        private static final MethodSignature GET_STRING_SIGNATURE = new MethodSignature("get", new Class[]{BeansWrapper.STRING_CLASS});
        private static final MethodSignature GET_OBJECT_SIGNATURE = new MethodSignature("get", new Class[]{BeansWrapper.OBJECT_CLASS});
        private final String name;
        private final Class[] args;

        private MethodSignature(String name, Class[] args) {
            this.name = name;
            this.args = args;
        }

        MethodSignature(Method method) {
            this(method.getName(), method.getParameterTypes());
        }

        public boolean equals(Object o) {
            if (o instanceof MethodSignature) {
                MethodSignature ms = (MethodSignature) o;
                return ms.name.equals(this.name) && Arrays.equals(this.args, ms.args);
            }
            return false;
        }

        public int hashCode() {
            return this.name.hashCode() ^ this.args.length;
        }
    }

    private static final Set createUnsafeMethodsSet() {
        Class cls;
        Properties props = new Properties();
        if (class$freemarker$ext$beans$BeansWrapper == null) {
            cls = class$("freemarker.ext.beans.BeansWrapper");
            class$freemarker$ext$beans$BeansWrapper = cls;
        } else {
            cls = class$freemarker$ext$beans$BeansWrapper;
        }
        InputStream in = cls.getResourceAsStream("unsafeMethods.txt");
        if (in != null) {
            methodSpec = null;
            try {
                try {
                    props.load(in);
                    in.close();
                    Set set = new HashSet((props.size() * 4) / 3, 0.75f);
                    Map primClasses = createPrimitiveClassesMap();
                    for (String methodSpec : props.keySet()) {
                        try {
                            set.add(parseMethodSpec(methodSpec, primClasses));
                        } catch (ClassNotFoundException e) {
                            if (DEVELOPMENT) {
                                throw e;
                            }
                        } catch (NoSuchMethodException e2) {
                            if (DEVELOPMENT) {
                                throw e2;
                            }
                        }
                    }
                    return set;
                } catch (Throwable th) {
                    in.close();
                    throw th;
                }
            } catch (Exception e3) {
                throw new RuntimeException(new StringBuffer().append("Could not load unsafe method ").append(methodSpec).append(" ").append(e3.getClass().getName()).append(" ").append(e3.getMessage()).toString());
            }
        }
        return Collections.EMPTY_SET;
    }

    private static Method parseMethodSpec(String methodSpec, Map primClasses) throws ClassNotFoundException, NoSuchMethodException {
        int brace = methodSpec.indexOf(40);
        int dot = methodSpec.lastIndexOf(46, brace);
        Class clazz = ClassUtil.forName(methodSpec.substring(0, dot));
        String methodName = methodSpec.substring(dot + 1, brace);
        String argSpec = methodSpec.substring(brace + 1, methodSpec.length() - 1);
        StringTokenizer tok = new StringTokenizer(argSpec, ",");
        int argcount = tok.countTokens();
        Class[] argTypes = new Class[argcount];
        for (int i = 0; i < argcount; i++) {
            String argClassName = tok.nextToken();
            argTypes[i] = (Class) primClasses.get(argClassName);
            if (argTypes[i] == null) {
                argTypes[i] = ClassUtil.forName(argClassName);
            }
        }
        return clazz.getMethod(methodName, argTypes);
    }

    private static Map createPrimitiveClassesMap() {
        Map map = new HashMap();
        map.put("boolean", Boolean.TYPE);
        map.put("byte", Byte.TYPE);
        map.put("char", Character.TYPE);
        map.put("short", Short.TYPE);
        map.put("int", Integer.TYPE);
        map.put("long", Long.TYPE);
        map.put("float", Float.TYPE);
        map.put("double", Double.TYPE);
        return map;
    }

    public static void coerceBigDecimals(AccessibleObject callable, Object[] args) {
        Class[] formalTypes = null;
        for (int i = 0; i < args.length; i++) {
            Object arg = args[i];
            if (arg instanceof BigDecimal) {
                if (formalTypes == null) {
                    if (callable instanceof Method) {
                        formalTypes = ((Method) callable).getParameterTypes();
                    } else if (callable instanceof Constructor) {
                        formalTypes = ((Constructor) callable).getParameterTypes();
                    } else {
                        throw new IllegalArgumentException(new StringBuffer().append("Expected method or  constructor; callable is ").append(callable.getClass().getName()).toString());
                    }
                }
                args[i] = coerceBigDecimal((BigDecimal) arg, formalTypes[i]);
            }
        }
    }

    public static void coerceBigDecimals(Class[] formalTypes, Object[] args) {
        int typeLen = formalTypes.length;
        int argsLen = args.length;
        int min = Math.min(typeLen, argsLen);
        for (int i = 0; i < min; i++) {
            Object arg = args[i];
            if (arg instanceof BigDecimal) {
                args[i] = coerceBigDecimal((BigDecimal) arg, formalTypes[i]);
            }
        }
        if (argsLen > typeLen) {
            Class varArgType = formalTypes[typeLen - 1];
            for (int i2 = typeLen; i2 < argsLen; i2++) {
                Object arg2 = args[i2];
                if (arg2 instanceof BigDecimal) {
                    args[i2] = coerceBigDecimal((BigDecimal) arg2, varArgType);
                }
            }
        }
    }

    public static Object coerceBigDecimal(BigDecimal bd, Class formalType) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        if (formalType != Integer.TYPE) {
            if (class$java$lang$Integer == null) {
                cls = class$("java.lang.Integer");
                class$java$lang$Integer = cls;
            } else {
                cls = class$java$lang$Integer;
            }
            if (formalType != cls) {
                if (formalType != Double.TYPE) {
                    if (class$java$lang$Double == null) {
                        cls2 = class$("java.lang.Double");
                        class$java$lang$Double = cls2;
                    } else {
                        cls2 = class$java$lang$Double;
                    }
                    if (formalType != cls2) {
                        if (formalType != Long.TYPE) {
                            if (class$java$lang$Long == null) {
                                cls3 = class$("java.lang.Long");
                                class$java$lang$Long = cls3;
                            } else {
                                cls3 = class$java$lang$Long;
                            }
                            if (formalType != cls3) {
                                if (formalType != Float.TYPE) {
                                    if (class$java$lang$Float == null) {
                                        cls4 = class$("java.lang.Float");
                                        class$java$lang$Float = cls4;
                                    } else {
                                        cls4 = class$java$lang$Float;
                                    }
                                    if (formalType != cls4) {
                                        if (formalType != Short.TYPE) {
                                            if (class$java$lang$Short == null) {
                                                cls5 = class$("java.lang.Short");
                                                class$java$lang$Short = cls5;
                                            } else {
                                                cls5 = class$java$lang$Short;
                                            }
                                            if (formalType != cls5) {
                                                if (formalType != Byte.TYPE) {
                                                    if (class$java$lang$Byte == null) {
                                                        cls6 = class$("java.lang.Byte");
                                                        class$java$lang$Byte = cls6;
                                                    } else {
                                                        cls6 = class$java$lang$Byte;
                                                    }
                                                    if (formalType != cls6) {
                                                        if (BIGINTEGER_CLASS.isAssignableFrom(formalType)) {
                                                            return bd.toBigInteger();
                                                        }
                                                        return bd;
                                                    }
                                                }
                                                return new Byte(bd.byteValue());
                                            }
                                        }
                                        return new Short(bd.shortValue());
                                    }
                                }
                                return new Float(bd.floatValue());
                            }
                        }
                        return new Long(bd.longValue());
                    }
                }
                return new Double(bd.doubleValue());
            }
        }
        return new Integer(bd.intValue());
    }

    private static ClassBasedModelFactory createEnumModels(BeansWrapper wrapper) {
        if (ENUMS_MODEL_CTOR != null) {
            try {
                return (ClassBasedModelFactory) ENUMS_MODEL_CTOR.newInstance(wrapper);
            } catch (Exception e) {
                throw new UndeclaredThrowableException(e);
            }
        }
        return null;
    }

    private static Constructor enumsModelCtor() {
        Class<?> cls;
        try {
            Class.forName("java.lang.Enum");
            Class<?> cls2 = Class.forName("freemarker.ext.beans._EnumModels");
            Class<?>[] clsArr = new Class[1];
            if (class$freemarker$ext$beans$BeansWrapper == null) {
                cls = class$("freemarker.ext.beans.BeansWrapper");
                class$freemarker$ext$beans$BeansWrapper = cls;
            } else {
                cls = class$freemarker$ext$beans$BeansWrapper;
            }
            clsArr[0] = cls;
            return cls2.getDeclaredConstructor(clsArr);
        } catch (Exception e) {
            return null;
        }
    }

    private static boolean isJavaRebelAvailable() {
        try {
            JavaRebelIntegration.testAvailability();
            return true;
        } catch (NoClassDefFoundError e) {
            return false;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/BeansWrapper$MethodAppearanceDecision.class */
    public static final class MethodAppearanceDecision {
        private PropertyDescriptor exposeAsProperty;
        private String exposeMethodAs;
        private boolean methodShadowsProperty;

        void setDefaults(Method m) {
            this.exposeAsProperty = null;
            this.exposeMethodAs = m.getName();
            this.methodShadowsProperty = true;
        }

        public PropertyDescriptor getExposeAsProperty() {
            return this.exposeAsProperty;
        }

        public void setExposeAsProperty(PropertyDescriptor exposeAsProperty) {
            this.exposeAsProperty = exposeAsProperty;
        }

        public String getExposeMethodAs() {
            return this.exposeMethodAs;
        }

        public void setExposeMethodAs(String exposeAsMethod) {
            this.exposeMethodAs = exposeAsMethod;
        }

        public boolean getMethodShadowsProperty() {
            return this.methodShadowsProperty;
        }

        public void setMethodShadowsProperty(boolean shadowEarlierProperty) {
            this.methodShadowsProperty = shadowEarlierProperty;
        }
    }
}
