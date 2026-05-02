package org.msgpack.template.builder;

import java.lang.reflect.Constructor;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.msgpack.template.TemplateRegistry;
import org.msgpack.util.android.DalvikVmChecker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/TemplateBuilderChain.class */
public class TemplateBuilderChain {
    private static final Logger LOG = Logger.getLogger(TemplateBuilderChain.class.getName());
    private static final String JAVASSIST_TEMPLATE_BUILDER_CLASS_NAME = "org.msgpack.template.builder.JavassistTemplateBuilder";
    private static final String REFLECTION_TEMPLATE_BUILDER_CLASS_NAME = "org.msgpack.template.builder.ReflectionTemplateBuilder";
    protected List<TemplateBuilder> templateBuilders;
    protected TemplateBuilder forceBuilder;

    private static boolean enableDynamicCodeGeneration() {
        return !DalvikVmChecker.isDalvikVm() && Boolean.parseBoolean(System.getProperties().getProperty("msgpack.dynamic-codegen.enabled", "true"));
    }

    public TemplateBuilderChain(TemplateRegistry registry) {
        this(registry, null);
    }

    public TemplateBuilderChain(TemplateRegistry registry, ClassLoader cl) {
        this.templateBuilders = new ArrayList();
        reset(registry, cl);
    }

    protected void reset(TemplateRegistry registry, ClassLoader cl) {
        String forceBuilderClassName;
        if (registry == null) {
            throw new NullPointerException("registry is null");
        }
        if (enableDynamicCodeGeneration()) {
            forceBuilderClassName = JAVASSIST_TEMPLATE_BUILDER_CLASS_NAME;
        } else {
            forceBuilderClassName = REFLECTION_TEMPLATE_BUILDER_CLASS_NAME;
        }
        this.forceBuilder = createForceTemplateBuilder(forceBuilderClassName, registry, cl);
        TemplateBuilder builder = this.forceBuilder;
        this.templateBuilders.add(new ArrayTemplateBuilder(registry));
        this.templateBuilders.add(new OrdinalEnumTemplateBuilder(registry));
        this.templateBuilders.add(builder);
        this.templateBuilders.add(new ReflectionBeansTemplateBuilder(registry));
    }

    private static TemplateBuilder createForceTemplateBuilder(String className, TemplateRegistry registry, ClassLoader cl) {
        try {
            Class<?> c = Class.forName(className);
            Constructor<?> cons = c.getConstructor(TemplateRegistry.class, ClassLoader.class);
            return (TemplateBuilder) cons.newInstance(registry, cl);
        } catch (Exception e) {
            if (LOG.isLoggable(Level.WARNING)) {
                LOG.log(Level.WARNING, "Failed to create a TemplateBuilder reflectively", (Throwable) e);
            }
            return new ReflectionTemplateBuilder(registry, cl);
        }
    }

    public TemplateBuilder getForceBuilder() {
        return this.forceBuilder;
    }

    public TemplateBuilder select(Type targetType, boolean hasAnnotation) {
        for (TemplateBuilder tb : this.templateBuilders) {
            if (tb.matchType(targetType, hasAnnotation)) {
                return tb;
            }
        }
        return null;
    }
}
