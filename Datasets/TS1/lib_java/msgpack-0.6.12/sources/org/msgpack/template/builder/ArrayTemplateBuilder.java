package org.msgpack.template.builder;

import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.template.AbstractTemplate;
import org.msgpack.template.BooleanArrayTemplate;
import org.msgpack.template.ByteArrayTemplate;
import org.msgpack.template.DoubleArrayTemplate;
import org.msgpack.template.FieldList;
import org.msgpack.template.FloatArrayTemplate;
import org.msgpack.template.IntegerArrayTemplate;
import org.msgpack.template.LongArrayTemplate;
import org.msgpack.template.ObjectArrayTemplate;
import org.msgpack.template.ShortArrayTemplate;
import org.msgpack.template.Template;
import org.msgpack.template.TemplateRegistry;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/ArrayTemplateBuilder.class */
public class ArrayTemplateBuilder extends AbstractTemplateBuilder {
    private static final Logger LOG = Logger.getLogger(ArrayTemplateBuilder.class.getName());

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/ArrayTemplateBuilder$ReflectionMultidimentionalArrayTemplate.class */
    static class ReflectionMultidimentionalArrayTemplate extends AbstractTemplate {
        private Class componentClass;
        private Template componentTemplate;

        public ReflectionMultidimentionalArrayTemplate(Class componentClass, Template componentTemplate) {
            this.componentClass = componentClass;
            this.componentTemplate = componentTemplate;
        }

        Class getComponentClass() {
            return this.componentClass;
        }

        @Override // org.msgpack.template.Template
        public void write(Packer packer, Object v, boolean required) throws IOException {
            if (v == null) {
                if (required) {
                    throw new MessageTypeException("Attempted to write null");
                }
                packer.writeNil();
            } else {
                if (!(v instanceof Object[]) || !this.componentClass.isAssignableFrom(v.getClass().getComponentType())) {
                    throw new MessageTypeException();
                }
                Object[] array = (Object[]) v;
                int length = array.length;
                packer.writeArrayBegin(length);
                for (Object obj : array) {
                    this.componentTemplate.write(packer, obj, required);
                }
                packer.writeArrayEnd();
            }
        }

        @Override // org.msgpack.template.Template
        public Object read(Unpacker unpacker, Object to, boolean required) throws IOException {
            if (!required && unpacker.trySkipNil()) {
                return null;
            }
            int length = unpacker.readArrayBegin();
            Object[] array = (Object[]) Array.newInstance((Class<?>) this.componentClass, length);
            for (int i = 0; i < length; i++) {
                array[i] = this.componentTemplate.read(unpacker, null, required);
            }
            unpacker.readArrayEnd();
            return array;
        }
    }

    public ArrayTemplateBuilder(TemplateRegistry registry) {
        super(registry);
    }

    @Override // org.msgpack.template.builder.TemplateBuilder
    public boolean matchType(Type targetType, boolean forceBuild) {
        Class<?> targetClass = (Class) targetType;
        boolean matched = AbstractTemplateBuilder.matchAtArrayTemplateBuilder(targetClass, false);
        if (matched && LOG.isLoggable(Level.FINE)) {
            LOG.fine("matched type: " + targetClass.getName());
        }
        return matched;
    }

    @Override // org.msgpack.template.builder.AbstractTemplateBuilder, org.msgpack.template.builder.TemplateBuilder
    public <T> Template<T> buildTemplate(Type arrayType) {
        Class<?> baseClass;
        Type baseType;
        int dim = 1;
        if (arrayType instanceof GenericArrayType) {
            GenericArrayType type = (GenericArrayType) arrayType;
            baseType = type.getGenericComponentType();
            while (baseType instanceof GenericArrayType) {
                baseType = ((GenericArrayType) baseType).getGenericComponentType();
                dim++;
            }
            if (baseType instanceof ParameterizedType) {
                baseClass = (Class) ((ParameterizedType) baseType).getRawType();
            } else {
                baseClass = (Class) baseType;
            }
        } else {
            Class<?> type2 = (Class) arrayType;
            baseClass = type2.getComponentType();
            while (baseClass.isArray()) {
                baseClass = baseClass.getComponentType();
                dim++;
            }
            baseType = baseClass;
        }
        return toTemplate(arrayType, baseType, baseClass, dim);
    }

    private Template toTemplate(Type arrayType, Type genericBaseType, Class baseClass, int dim) {
        if (dim == 1) {
            if (baseClass == Boolean.TYPE) {
                return BooleanArrayTemplate.getInstance();
            }
            if (baseClass == Short.TYPE) {
                return ShortArrayTemplate.getInstance();
            }
            if (baseClass == Integer.TYPE) {
                return IntegerArrayTemplate.getInstance();
            }
            if (baseClass == Long.TYPE) {
                return LongArrayTemplate.getInstance();
            }
            if (baseClass == Float.TYPE) {
                return FloatArrayTemplate.getInstance();
            }
            if (baseClass == Double.TYPE) {
                return DoubleArrayTemplate.getInstance();
            }
            if (baseClass == Byte.TYPE) {
                return ByteArrayTemplate.getInstance();
            }
            Template baseTemplate = this.registry.lookup(genericBaseType);
            return new ObjectArrayTemplate(baseClass, baseTemplate);
        }
        if (dim == 2) {
            Class componentClass = Array.newInstance((Class<?>) baseClass, 0).getClass();
            return new ReflectionMultidimentionalArrayTemplate(componentClass, toTemplate(arrayType, genericBaseType, baseClass, dim - 1));
        }
        ReflectionMultidimentionalArrayTemplate componentTemplate = (ReflectionMultidimentionalArrayTemplate) toTemplate(arrayType, genericBaseType, baseClass, dim - 1);
        Class componentClass2 = Array.newInstance((Class<?>) componentTemplate.getComponentClass(), 0).getClass();
        return new ReflectionMultidimentionalArrayTemplate(componentClass2, componentTemplate);
    }

    @Override // org.msgpack.template.builder.AbstractTemplateBuilder, org.msgpack.template.builder.TemplateBuilder
    public <T> Template<T> buildTemplate(Class<T> targetClass, FieldList flist) throws TemplateBuildException {
        throw new UnsupportedOperationException(targetClass.getName());
    }

    @Override // org.msgpack.template.builder.AbstractTemplateBuilder
    protected <T> Template<T> buildTemplate(Class<T> targetClass, FieldEntry[] entries) {
        throw new UnsupportedOperationException(targetClass.getName());
    }

    @Override // org.msgpack.template.builder.AbstractTemplateBuilder, org.msgpack.template.builder.TemplateBuilder
    public void writeTemplate(Type targetType, String directoryName) {
        throw new UnsupportedOperationException(targetType.toString());
    }

    @Override // org.msgpack.template.builder.AbstractTemplateBuilder, org.msgpack.template.builder.TemplateBuilder
    public <T> Template<T> loadTemplate(Type targetType) {
        return null;
    }
}
