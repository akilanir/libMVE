package org.msgpack.template.builder;

import java.lang.reflect.Type;
import java.util.logging.Level;
import java.util.logging.Logger;
import javassist.ClassClassPath;
import javassist.ClassPool;
import javassist.CtClass;
import javassist.LoaderClassPath;
import javassist.NotFoundException;
import org.msgpack.template.AbstractTemplate;
import org.msgpack.template.FieldOption;
import org.msgpack.template.Template;
import org.msgpack.template.TemplateRegistry;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/JavassistTemplateBuilder.class */
public class JavassistTemplateBuilder extends AbstractTemplateBuilder {
    private static Logger LOG = Logger.getLogger(JavassistTemplateBuilder.class.getName());
    protected ClassPool pool;
    protected int seqId;
    protected ClassLoader loader;

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/JavassistTemplateBuilder$JavassistTemplate.class */
    public static abstract class JavassistTemplate<T> extends AbstractTemplate<T> {
        public Class<T> targetClass;
        public Template<?>[] templates;

        public JavassistTemplate(Class<T> targetClass, Template<?>[] templates) {
            this.targetClass = targetClass;
            this.templates = templates;
        }
    }

    public JavassistTemplateBuilder(TemplateRegistry registry) {
        this(registry, null);
    }

    public JavassistTemplateBuilder(TemplateRegistry registry, ClassLoader cl) {
        super(registry);
        this.seqId = 0;
        this.pool = new ClassPool();
        this.pool.appendClassPath(new ClassClassPath(getClass()));
        boolean appended = false;
        this.loader = cl;
        if (this.loader == null) {
            this.loader = this.pool.getClassLoader();
        }
        try {
            if (this.loader != null) {
                this.pool.appendClassPath(new LoaderClassPath(this.loader));
                appended = true;
            }
        } catch (SecurityException e) {
            if (LOG.isLoggable(Level.WARNING)) {
                LOG.log(Level.WARNING, "Cannot append a search path of classloader", (Throwable) e);
            }
        }
        if (!appended) {
            this.pool.appendSystemPath();
        }
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

    public void addClassLoader(ClassLoader cl) {
        this.pool.appendClassPath(new LoaderClassPath(cl));
    }

    protected CtClass makeCtClass(String className) {
        return this.pool.makeClass(className);
    }

    protected CtClass getCtClass(String className) throws NotFoundException {
        return this.pool.get(className);
    }

    protected int nextSeqId() {
        int i = this.seqId;
        this.seqId = i + 1;
        return i;
    }

    protected BuildContext createBuildContext() {
        return new DefaultBuildContext(this);
    }

    @Override // org.msgpack.template.builder.AbstractTemplateBuilder
    public <T> Template<T> buildTemplate(Class<T> targetClass, FieldEntry[] entries) {
        Template<?>[] tmpls = toTemplate(entries);
        BuildContext bc = createBuildContext();
        return bc.buildTemplate(targetClass, entries, tmpls);
    }

    private Template<?>[] toTemplate(FieldEntry[] from) {
        Template<?>[] tmpls = new Template[from.length];
        for (int i = 0; i < from.length; i++) {
            FieldEntry e = from[i];
            if (!e.isAvailable()) {
                tmpls[i] = null;
            } else {
                Template tmpl = this.registry.lookup(e.getGenericType());
                tmpls[i] = tmpl;
            }
        }
        return tmpls;
    }

    @Override // org.msgpack.template.builder.AbstractTemplateBuilder, org.msgpack.template.builder.TemplateBuilder
    public void writeTemplate(Type targetType, String directoryName) {
        Class<?> targetClass = (Class) targetType;
        checkClassValidation(targetClass);
        FieldOption implicitOption = getFieldOption(targetClass);
        FieldEntry[] entries = toFieldEntries(targetClass, implicitOption);
        writeTemplate(targetClass, entries, directoryName);
    }

    private void writeTemplate(Class<?> targetClass, FieldEntry[] entries, String directoryName) {
        Template[] tmpls = toTemplate(entries);
        BuildContext bc = createBuildContext();
        bc.writeTemplate(targetClass, entries, tmpls, directoryName);
    }

    @Override // org.msgpack.template.builder.AbstractTemplateBuilder, org.msgpack.template.builder.TemplateBuilder
    public <T> Template<T> loadTemplate(Type targetType) {
        Class<?> cls = (Class) targetType;
        try {
            String tmplName = cls.getName() + "_$$_Template";
            ClassLoader cl = cls.getClassLoader();
            if (cl != null) {
                cl.loadClass(tmplName);
                FieldOption implicitOption = getFieldOption(cls);
                FieldEntry[] entries = toFieldEntries(cls, implicitOption);
                Template<?>[] tmpls = toTemplate(entries);
                BuildContext bc = createBuildContext();
                return bc.loadTemplate(cls, entries, tmpls);
            }
            return null;
        } catch (ClassNotFoundException e) {
            return null;
        }
    }

    protected ClassLoader getClassLoader() {
        return this.loader;
    }
}
