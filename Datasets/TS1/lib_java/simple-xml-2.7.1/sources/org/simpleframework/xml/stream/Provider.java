package org.simpleframework.xml.stream;

import java.io.InputStream;
import java.io.Reader;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/Provider.class */
interface Provider {
    EventReader provide(InputStream inputStream) throws Exception;

    EventReader provide(Reader reader) throws Exception;
}
