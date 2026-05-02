package freemarker.ext.beans;

import freemarker.template.TemplateCollectionModel;
import java.util.Set;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/SetAdapter.class */
class SetAdapter extends CollectionAdapter implements Set {
    SetAdapter(TemplateCollectionModel model, BeansWrapper wrapper) {
        super(model, wrapper);
    }
}
