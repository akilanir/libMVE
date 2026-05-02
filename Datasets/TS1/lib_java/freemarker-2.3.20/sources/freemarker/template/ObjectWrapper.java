package freemarker.template;

import freemarker.ext.beans.BeansWrapper;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/ObjectWrapper.class */
public interface ObjectWrapper {
    public static final ObjectWrapper BEANS_WRAPPER = BeansWrapper.getDefaultInstance();
    public static final ObjectWrapper DEFAULT_WRAPPER = DefaultObjectWrapper.instance;
    public static final ObjectWrapper SIMPLE_WRAPPER = SimpleObjectWrapper.instance;

    TemplateModel wrap(Object obj) throws TemplateModelException;
}
