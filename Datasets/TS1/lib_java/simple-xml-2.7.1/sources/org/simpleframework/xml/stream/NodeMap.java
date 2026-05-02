package org.simpleframework.xml.stream;

import java.util.Iterator;
import org.simpleframework.xml.stream.Node;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/NodeMap.class */
public interface NodeMap<T extends Node> extends Iterable<String> {
    T getNode();

    String getName();

    T get(String str);

    T remove(String str);

    @Override // java.lang.Iterable
    Iterator<String> iterator();

    T put(String str, String str2);
}
