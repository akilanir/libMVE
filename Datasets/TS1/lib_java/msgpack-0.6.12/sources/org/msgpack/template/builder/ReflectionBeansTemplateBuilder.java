package org.msgpack.template.builder;

import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.msgpack.annotation.Ignore;
import org.msgpack.annotation.Index;
import org.msgpack.annotation.NotNullable;
import org.msgpack.annotation.Optional;
import org.msgpack.packer.Packer;
import org.msgpack.template.FieldOption;
import org.msgpack.template.Template;
import org.msgpack.template.TemplateRegistry;
import org.msgpack.template.builder.ReflectionTemplateBuilder;
import org.msgpack.template.builder.beans.BeanInfo;
import org.msgpack.template.builder.beans.IntrospectionException;
import org.msgpack.template.builder.beans.Introspector;
import org.msgpack.template.builder.beans.PropertyDescriptor;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/ReflectionBeansTemplateBuilder.class */
public class ReflectionBeansTemplateBuilder extends ReflectionTemplateBuilder {
    private static Logger LOG = Logger.getLogger(ReflectionBeansTemplateBuilder.class.getName());

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/ReflectionBeansTemplateBuilder$ReflectionBeansFieldTemplate.class */
    static class ReflectionBeansFieldTemplate extends ReflectionTemplateBuilder.ReflectionFieldTemplate {
        ReflectionBeansFieldTemplate(FieldEntry entry) {
            super(entry);
        }

        @Override // org.msgpack.template.Template
        public void write(Packer packer, Object v, boolean required) throws IOException {
            packer.write(v);
        }

        @Override // org.msgpack.template.Template
        public Object read(Unpacker unpacker, Object to, boolean required) throws IOException {
            Object o = unpacker.read((Class<Object>) this.entry.getType());
            this.entry.set(to, o);
            return o;
        }
    }

    public ReflectionBeansTemplateBuilder(TemplateRegistry registry) {
        super(registry, null);
    }

    @Override // org.msgpack.template.builder.ReflectionTemplateBuilder, org.msgpack.template.builder.TemplateBuilder
    public boolean matchType(Type targetType, boolean hasAnnotation) {
        Class<?> targetClass = (Class) targetType;
        boolean matched = matchAtBeansClassTemplateBuilder(targetClass, hasAnnotation);
        if (matched && LOG.isLoggable(Level.FINE)) {
            LOG.fine("matched type: " + targetClass.getName());
        }
        return matched;
    }

    @Override // org.msgpack.template.builder.ReflectionTemplateBuilder
    protected ReflectionTemplateBuilder.ReflectionFieldTemplate[] toTemplates(FieldEntry[] entries) {
        ReflectionTemplateBuilder.ReflectionFieldTemplate[] tmpls = new ReflectionTemplateBuilder.ReflectionFieldTemplate[entries.length];
        for (int i = 0; i < entries.length; i++) {
            FieldEntry e = entries[i];
            Class<?> type = e.getType();
            if (type.isPrimitive()) {
                tmpls[i] = new ReflectionBeansFieldTemplate(e);
            } else {
                Template tmpl = this.registry.lookup(e.getGenericType());
                tmpls[i] = new ReflectionTemplateBuilder.FieldTemplateImpl(e, tmpl);
            }
        }
        return tmpls;
    }

    @Override // org.msgpack.template.builder.AbstractTemplateBuilder
    public FieldEntry[] toFieldEntries(Class<?> targetClass, FieldOption implicitOption) {
        try {
            BeanInfo desc = Introspector.getBeanInfo(targetClass);
            PropertyDescriptor[] props = desc.getPropertyDescriptors();
            ArrayList<PropertyDescriptor> list = new ArrayList<>();
            for (PropertyDescriptor pd : props) {
                if (!isIgnoreProperty(pd)) {
                    list.add(pd);
                }
            }
            PropertyDescriptor[] props2 = new PropertyDescriptor[list.size()];
            list.toArray(props2);
            BeansFieldEntry[] entries = new BeansFieldEntry[props2.length];
            for (int i = 0; i < props2.length; i++) {
                PropertyDescriptor p = props2[i];
                int index = getPropertyIndex(p);
                if (index >= 0) {
                    if (entries[index] != null) {
                        throw new TemplateBuildException("duplicated index: " + index);
                    }
                    if (index >= entries.length) {
                        throw new TemplateBuildException("invalid index: " + index);
                    }
                    entries[index] = new BeansFieldEntry(p);
                    props2[i] = null;
                }
            }
            int insertIndex = 0;
            for (PropertyDescriptor p2 : props2) {
                if (p2 != null) {
                    while (entries[insertIndex] != null) {
                        insertIndex++;
                    }
                    entries[insertIndex] = new BeansFieldEntry(p2);
                }
            }
            for (BeansFieldEntry e : entries) {
                FieldOption op = getPropertyOption(e, implicitOption);
                e.setOption(op);
            }
            return entries;
        } catch (IntrospectionException e2) {
            throw new TemplateBuildException("Class must be java beans class:" + targetClass.getName());
        }
    }

    private FieldOption getPropertyOption(BeansFieldEntry e, FieldOption implicitOption) {
        FieldOption forGetter = getMethodOption(e.getPropertyDescriptor().getReadMethod());
        if (forGetter != FieldOption.DEFAULT) {
            return forGetter;
        }
        FieldOption forSetter = getMethodOption(e.getPropertyDescriptor().getWriteMethod());
        if (forSetter != FieldOption.DEFAULT) {
            return forSetter;
        }
        return implicitOption;
    }

    private FieldOption getMethodOption(Method method) {
        if (isAnnotated(method, (Class<? extends Annotation>) Ignore.class)) {
            return FieldOption.IGNORE;
        }
        if (isAnnotated(method, (Class<? extends Annotation>) Optional.class)) {
            return FieldOption.OPTIONAL;
        }
        if (isAnnotated(method, (Class<? extends Annotation>) NotNullable.class)) {
            return FieldOption.NOTNULLABLE;
        }
        return FieldOption.DEFAULT;
    }

    private int getPropertyIndex(PropertyDescriptor desc) {
        int getterIndex = getMethodIndex(desc.getReadMethod());
        if (getterIndex >= 0) {
            return getterIndex;
        }
        int setterIndex = getMethodIndex(desc.getWriteMethod());
        return setterIndex;
    }

    private int getMethodIndex(Method method) {
        Index a = (Index) method.getAnnotation(Index.class);
        if (a == null) {
            return -1;
        }
        return a.value();
    }

    private boolean isIgnoreProperty(PropertyDescriptor desc) {
        if (desc == null) {
            return true;
        }
        Method getter = desc.getReadMethod();
        Method setter = desc.getWriteMethod();
        return getter == null || setter == null || !Modifier.isPublic(getter.getModifiers()) || !Modifier.isPublic(setter.getModifiers()) || isAnnotated(getter, (Class<? extends Annotation>) Ignore.class) || isAnnotated(setter, (Class<? extends Annotation>) Ignore.class);
    }
}
