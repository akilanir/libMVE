package org.msgpack.template.builder;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.template.AbstractTemplate;
import org.msgpack.template.Template;
import org.msgpack.template.TemplateRegistry;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/ReflectionTemplateBuilder.class */
public class ReflectionTemplateBuilder extends AbstractTemplateBuilder {
    private static Logger LOG = Logger.getLogger(ReflectionBeansTemplateBuilder.class.getName());

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate.class */
    protected static abstract class ReflectionFieldTemplate extends AbstractTemplate<Object> {
        protected FieldEntry entry;

        ReflectionFieldTemplate(FieldEntry entry) {
            this.entry = entry;
        }

        void setNil(Object v) {
            this.entry.set(v, null);
        }
    }

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/ReflectionTemplateBuilder$FieldTemplateImpl.class */
    static final class FieldTemplateImpl extends ReflectionFieldTemplate {
        private Template template;

        public FieldTemplateImpl(FieldEntry entry, Template template) {
            super(entry);
            this.template = template;
        }

        @Override // org.msgpack.template.Template
        public void write(Packer packer, Object v, boolean required) throws IOException {
            this.template.write(packer, v, required);
        }

        @Override // org.msgpack.template.Template
        public Object read(Unpacker unpacker, Object to, boolean required) throws IOException {
            Object f = this.entry.get(to);
            Object o = this.template.read(unpacker, f, required);
            if (o != f) {
                this.entry.set(to, o);
            }
            return o;
        }
    }

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate.class */
    protected static class ReflectionClassTemplate<T> extends AbstractTemplate<T> {
        protected Class<T> targetClass;
        protected ReflectionFieldTemplate[] templates;

        protected ReflectionClassTemplate(Class<T> targetClass, ReflectionFieldTemplate[] templates) {
            this.targetClass = targetClass;
            this.templates = templates;
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // org.msgpack.template.Template
        public void write(Packer packer, T target, boolean required) throws IOException {
            if (target == null) {
                if (required) {
                    throw new MessageTypeException("attempted to write null");
                }
                packer.writeNil();
                return;
            }
            try {
                packer.writeArrayBegin(this.templates.length);
                for (FieldTemplateImpl fieldTemplateImpl : this.templates) {
                    if (!fieldTemplateImpl.entry.isAvailable()) {
                        packer.writeNil();
                    } else {
                        Object obj = fieldTemplateImpl.entry.get(target);
                        if (obj == null) {
                            if (fieldTemplateImpl.entry.isNotNullable()) {
                                throw new MessageTypeException(fieldTemplateImpl.entry.getName() + " cannot be null by @NotNullable");
                            }
                            packer.writeNil();
                        } else {
                            fieldTemplateImpl.write(packer, obj, true);
                        }
                    }
                }
                packer.writeArrayEnd();
            } catch (IOException e) {
                throw e;
            } catch (Exception e2) {
                throw new MessageTypeException(e2);
            }
        }

        @Override // org.msgpack.template.Template
        public T read(Unpacker unpacker, T to, boolean required) throws IOException {
            if (!required && unpacker.trySkipNil()) {
                return null;
            }
            if (to == null) {
                try {
                    to = this.targetClass.newInstance();
                } catch (IOException e) {
                    throw e;
                } catch (Exception e2) {
                    throw new MessageTypeException(e2);
                }
            }
            unpacker.readArrayBegin();
            for (int i = 0; i < this.templates.length; i++) {
                ReflectionFieldTemplate tmpl = this.templates[i];
                if (!tmpl.entry.isAvailable()) {
                    unpacker.skip();
                } else if (!tmpl.entry.isOptional() || !unpacker.trySkipNil()) {
                    tmpl.read(unpacker, to, false);
                }
            }
            unpacker.readArrayEnd();
            return to;
        }
    }

    public ReflectionTemplateBuilder(TemplateRegistry registry) {
        this(registry, null);
    }

    public ReflectionTemplateBuilder(TemplateRegistry registry, ClassLoader cl) {
        super(registry);
    }

    @Override // org.msgpack.template.builder.TemplateBuilder
    public boolean matchType(Type targetType, boolean hasAnnotation) {
        Class<?> targetClass = (Class) targetType;
        boolean matched = matchAtClassTemplateBuilder(targetClass, hasAnnotation);
        if (matched && LOG.isLoggable(Level.FINE)) {
            LOG.fine("matched type: " + targetClass.getName());
        }
        return matched;
    }

    @Override // org.msgpack.template.builder.AbstractTemplateBuilder
    public <T> Template<T> buildTemplate(Class<T> targetClass, FieldEntry[] entries) {
        if (entries == null) {
            throw new NullPointerException("entries is null: " + targetClass);
        }
        ReflectionFieldTemplate[] tmpls = toTemplates(entries);
        return new ReflectionClassTemplate(targetClass, tmpls);
    }

    protected ReflectionFieldTemplate[] toTemplates(FieldEntry[] entries) {
        for (FieldEntry fieldEntry : entries) {
            Field field = ((DefaultFieldEntry) fieldEntry).getField();
            int mod = field.getModifiers();
            if (!Modifier.isPublic(mod)) {
                field.setAccessible(true);
            }
        }
        ReflectionFieldTemplate[] templates = new ReflectionFieldTemplate[entries.length];
        for (int i = 0; i < entries.length; i++) {
            FieldEntry entry = entries[i];
            Template template = this.registry.lookup(entry.getGenericType());
            templates[i] = new FieldTemplateImpl(entry, template);
        }
        return templates;
    }
}
