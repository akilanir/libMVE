package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Model.class */
interface Model extends Iterable<String> {
    boolean isEmpty();

    boolean isModel(String str);

    boolean isElement(String str);

    boolean isAttribute(String str);

    boolean isComposite();

    void validate(Class cls) throws Exception;

    void register(Label label) throws Exception;

    void registerText(Label label) throws Exception;

    void registerElement(Label label) throws Exception;

    void registerAttribute(Label label) throws Exception;

    void registerElement(String str) throws Exception;

    void registerAttribute(String str) throws Exception;

    Model register(String str, String str2, int i) throws Exception;

    Model lookup(String str, int i);

    Model lookup(Expression expression);

    LabelMap getElements() throws Exception;

    LabelMap getAttributes() throws Exception;

    ModelMap getModels() throws Exception;

    Label getText();

    Expression getExpression();

    String getPrefix();

    String getName();

    int getIndex();
}
