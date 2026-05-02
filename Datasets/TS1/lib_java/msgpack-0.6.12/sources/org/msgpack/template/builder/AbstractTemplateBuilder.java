package org.msgpack.template.builder;

import java.lang.annotation.Annotation;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Field;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import org.msgpack.annotation.Beans;
import org.msgpack.annotation.Ignore;
import org.msgpack.annotation.Index;
import org.msgpack.annotation.Message;
import org.msgpack.annotation.MessagePackBeans;
import org.msgpack.annotation.MessagePackMessage;
import org.msgpack.annotation.MessagePackOrdinalEnum;
import org.msgpack.annotation.NotNullable;
import org.msgpack.annotation.Optional;
import org.msgpack.annotation.OrdinalEnum;
import org.msgpack.template.FieldList;
import org.msgpack.template.FieldOption;
import org.msgpack.template.Template;
import org.msgpack.template.TemplateRegistry;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/AbstractTemplateBuilder.class */
public abstract class AbstractTemplateBuilder implements TemplateBuilder {
    protected TemplateRegistry registry;

    protected abstract <T> Template<T> buildTemplate(Class<T> cls, FieldEntry[] fieldEntryArr);

    protected AbstractTemplateBuilder(TemplateRegistry registry) {
        this.registry = registry;
    }

    @Override // org.msgpack.template.builder.TemplateBuilder
    public <T> Template<T> buildTemplate(Type targetType) throws TemplateBuildException {
        Class<?> cls = (Class) targetType;
        checkClassValidation(cls);
        FieldOption fieldOption = getFieldOption(cls);
        FieldEntry[] entries = toFieldEntries(cls, fieldOption);
        return buildTemplate(cls, entries);
    }

    @Override // org.msgpack.template.builder.TemplateBuilder
    public <T> Template<T> buildTemplate(Class<T> targetClass, FieldList fieldList) throws TemplateBuildException {
        checkClassValidation(targetClass);
        FieldEntry[] entries = toFieldEntries((Class<?>) targetClass, fieldList);
        return buildTemplate(targetClass, entries);
    }

    protected void checkClassValidation(Class<?> targetClass) {
        if (targetClass.isInterface()) {
            throw new TemplateBuildException("Cannot build template for interface: " + targetClass.getName());
        }
        if (Modifier.isAbstract(targetClass.getModifiers())) {
            throw new TemplateBuildException("Cannot build template for abstract class: " + targetClass.getName());
        }
        if (targetClass.isArray()) {
            throw new TemplateBuildException("Cannot build template for array class: " + targetClass.getName());
        }
        if (targetClass.isPrimitive()) {
            throw new TemplateBuildException("Cannot build template of primitive type: " + targetClass.getName());
        }
    }

    protected FieldOption getFieldOption(Class<?> targetClass) {
        Message m = (Message) targetClass.getAnnotation(Message.class);
        if (m == null) {
            return FieldOption.DEFAULT;
        }
        MessagePackMessage mpm = (MessagePackMessage) targetClass.getAnnotation(MessagePackMessage.class);
        if (mpm == null) {
            return FieldOption.DEFAULT;
        }
        return m.value();
    }

    private FieldEntry[] toFieldEntries(Class<?> targetClass, FieldList flist) {
        List<FieldList.Entry> src = flist.getList();
        FieldEntry[] entries = new FieldEntry[src.size()];
        for (int i = 0; i < src.size(); i++) {
            FieldList.Entry s = src.get(i);
            if (s.isAvailable()) {
                try {
                    entries[i] = new DefaultFieldEntry(targetClass.getDeclaredField(s.getName()), s.getOption());
                } catch (NoSuchFieldException e) {
                    throw new TemplateBuildException(e);
                } catch (SecurityException e2) {
                    throw new TemplateBuildException(e2);
                }
            } else {
                entries[i] = new DefaultFieldEntry();
            }
        }
        return entries;
    }

    protected FieldEntry[] toFieldEntries(Class<?> targetClass, FieldOption from) {
        Field[] fields = getFields(targetClass);
        List<FieldEntry> indexed = new ArrayList<>();
        int maxIndex = -1;
        for (Field f : fields) {
            FieldOption opt = getFieldOption(f, from);
            if (opt != FieldOption.IGNORE) {
                int index = getFieldIndex(f, maxIndex);
                if (indexed.size() > index && indexed.get(index) != null) {
                    throw new TemplateBuildException("duplicated index: " + index);
                }
                if (index < 0) {
                    throw new TemplateBuildException("invalid index: " + index);
                }
                while (indexed.size() <= index) {
                    indexed.add(null);
                }
                indexed.set(index, new DefaultFieldEntry(f, opt));
                if (maxIndex < index) {
                    maxIndex = index;
                }
            }
        }
        FieldEntry[] entries = new FieldEntry[maxIndex + 1];
        for (int i = 0; i < indexed.size(); i++) {
            FieldEntry e = indexed.get(i);
            if (e == null) {
                entries[i] = new DefaultFieldEntry();
            } else {
                entries[i] = e;
            }
        }
        return entries;
    }

    private Field[] getFields(Class<?> targetClass) {
        List<Field[]> succ = new ArrayList<>();
        int total = 0;
        Class<?> cls = targetClass;
        while (true) {
            Class<?> c = cls;
            if (c == Object.class) {
                break;
            }
            Field[] fields = c.getDeclaredFields();
            total += fields.length;
            succ.add(fields);
            cls = c.getSuperclass();
        }
        Field[] result = new Field[total];
        int off = 0;
        for (int i = succ.size() - 1; i >= 0; i--) {
            Field[] fields2 = succ.get(i);
            System.arraycopy(fields2, 0, result, off, fields2.length);
            off += fields2.length;
        }
        return result;
    }

    private FieldOption getFieldOption(Field field, FieldOption from) {
        int mod = field.getModifiers();
        if (Modifier.isStatic(mod) || Modifier.isFinal(mod) || Modifier.isTransient(mod)) {
            return FieldOption.IGNORE;
        }
        if (isAnnotated(field, (Class<? extends Annotation>) Ignore.class)) {
            return FieldOption.IGNORE;
        }
        if (isAnnotated(field, (Class<? extends Annotation>) Optional.class)) {
            return FieldOption.OPTIONAL;
        }
        if (isAnnotated(field, (Class<? extends Annotation>) NotNullable.class)) {
            return FieldOption.NOTNULLABLE;
        }
        if (from != FieldOption.DEFAULT) {
            return from;
        }
        if (field.getType().isPrimitive()) {
            return FieldOption.NOTNULLABLE;
        }
        return FieldOption.OPTIONAL;
    }

    private int getFieldIndex(Field field, int maxIndex) {
        Index a = (Index) field.getAnnotation(Index.class);
        if (a == null) {
            return maxIndex + 1;
        }
        return a.value();
    }

    @Override // org.msgpack.template.builder.TemplateBuilder
    public void writeTemplate(Type targetType, String directoryName) {
        throw new UnsupportedOperationException(targetType.toString());
    }

    @Override // org.msgpack.template.builder.TemplateBuilder
    public <T> Template<T> loadTemplate(Type targetType) {
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static boolean isAnnotated(Class<?> targetClass, Class<? extends Annotation> cls) {
        return targetClass.getAnnotation(cls) != null;
    }

    public static boolean isAnnotated(AccessibleObject accessibleObject, Class<? extends Annotation> with) {
        return accessibleObject.getAnnotation(with) != null;
    }

    public static boolean matchAtClassTemplateBuilder(Class<?> targetClass, boolean hasAnnotation) {
        return hasAnnotation ? isAnnotated(targetClass, (Class<? extends Annotation>) Message.class) || isAnnotated(targetClass, (Class<? extends Annotation>) MessagePackMessage.class) : (targetClass.isEnum() || targetClass.isInterface()) ? false : true;
    }

    public static boolean matchAtBeansClassTemplateBuilder(Type targetType, boolean hasAnnotation) {
        Class<?> targetClass = (Class) targetType;
        return hasAnnotation ? isAnnotated((Class<?>) targetType, (Class<? extends Annotation>) Beans.class) || isAnnotated((Class<?>) targetType, (Class<? extends Annotation>) MessagePackBeans.class) : (targetClass.isEnum() && targetClass.isInterface()) ? false : true;
    }

    public static boolean matchAtArrayTemplateBuilder(Class<?> targetClass, boolean hasAnnotation) {
        if (targetClass instanceof GenericArrayType) {
            return true;
        }
        return targetClass.isArray();
    }

    public static boolean matchAtOrdinalEnumTemplateBuilder(Class<?> targetClass, boolean hasAnnotation) {
        if (hasAnnotation) {
            return isAnnotated(targetClass, (Class<? extends Annotation>) OrdinalEnum.class) || isAnnotated(targetClass, (Class<? extends Annotation>) MessagePackOrdinalEnum.class);
        }
        return targetClass.isEnum();
    }
}
