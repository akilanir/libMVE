package org.simpleframework.xml.core;

import java.util.List;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Instantiator.class */
interface Instantiator {
    boolean isDefault();

    Object getInstance() throws Exception;

    Object getInstance(Criteria criteria) throws Exception;

    Parameter getParameter(String str);

    List<Parameter> getParameters();

    List<Creator> getCreators();
}
