package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Section.class */
interface Section extends Iterable<String> {
    String getName();

    String getPrefix();

    Label getText() throws Exception;

    LabelMap getElements() throws Exception;

    LabelMap getAttributes() throws Exception;

    Label getElement(String str) throws Exception;

    Section getSection(String str) throws Exception;

    String getPath(String str) throws Exception;

    String getAttribute(String str) throws Exception;

    boolean isSection(String str) throws Exception;
}
