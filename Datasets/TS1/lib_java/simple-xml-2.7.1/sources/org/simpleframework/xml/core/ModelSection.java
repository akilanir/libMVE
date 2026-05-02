package org.simpleframework.xml.core;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ModelSection.class */
class ModelSection implements Section {
    private LabelMap attributes;
    private LabelMap elements;
    private ModelMap models;
    private Model model;

    public ModelSection(Model model) {
        this.model = model;
    }

    @Override // org.simpleframework.xml.core.Section
    public String getName() {
        return this.model.getName();
    }

    @Override // org.simpleframework.xml.core.Section
    public String getPrefix() {
        return this.model.getPrefix();
    }

    @Override // org.simpleframework.xml.core.Section
    public String getPath(String name) throws Exception {
        Expression path = this.model.getExpression();
        if (path == null) {
            return name;
        }
        return path.getElement(name);
    }

    @Override // org.simpleframework.xml.core.Section
    public String getAttribute(String name) throws Exception {
        Expression path = this.model.getExpression();
        if (path == null) {
            return name;
        }
        return path.getAttribute(name);
    }

    @Override // java.lang.Iterable
    public Iterator<String> iterator() {
        List<String> list = new ArrayList<>();
        for (String element : this.model) {
            list.add(element);
        }
        return list.iterator();
    }

    @Override // org.simpleframework.xml.core.Section
    public boolean isSection(String name) throws Exception {
        return getModels().get(name) != null;
    }

    public ModelMap getModels() throws Exception {
        if (this.models == null) {
            this.models = this.model.getModels();
        }
        return this.models;
    }

    @Override // org.simpleframework.xml.core.Section
    public Label getText() throws Exception {
        return this.model.getText();
    }

    @Override // org.simpleframework.xml.core.Section
    public LabelMap getAttributes() throws Exception {
        if (this.attributes == null) {
            this.attributes = this.model.getAttributes();
        }
        return this.attributes;
    }

    @Override // org.simpleframework.xml.core.Section
    public LabelMap getElements() throws Exception {
        if (this.elements == null) {
            this.elements = this.model.getElements();
        }
        return this.elements;
    }

    @Override // org.simpleframework.xml.core.Section
    public Label getElement(String name) throws Exception {
        return getElements().getLabel(name);
    }

    @Override // org.simpleframework.xml.core.Section
    public Section getSection(String name) throws Exception {
        Model model;
        ModelMap map = getModels();
        ModelList list = map.get(name);
        if (list != null && (model = list.take()) != null) {
            return new ModelSection(model);
        }
        return null;
    }
}
