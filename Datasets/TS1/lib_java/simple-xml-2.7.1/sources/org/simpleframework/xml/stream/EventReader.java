package org.simpleframework.xml.stream;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/EventReader.class */
interface EventReader {
    EventNode next() throws Exception;

    EventNode peek() throws Exception;
}
