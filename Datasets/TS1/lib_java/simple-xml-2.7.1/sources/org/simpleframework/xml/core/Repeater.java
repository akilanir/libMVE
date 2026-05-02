package org.simpleframework.xml.core;

import org.simpleframework.xml.stream.InputNode;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Repeater.class */
interface Repeater extends Converter {
    @Override // org.simpleframework.xml.core.Converter
    Object read(InputNode inputNode, Object obj) throws Exception;
}
