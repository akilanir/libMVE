package freemarker.ext.util;

import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/util/ModelFactory.class */
public interface ModelFactory {
    TemplateModel create(Object obj, ObjectWrapper objectWrapper);
}
