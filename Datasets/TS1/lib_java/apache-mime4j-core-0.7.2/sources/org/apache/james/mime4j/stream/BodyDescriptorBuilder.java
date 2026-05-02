package org.apache.james.mime4j.stream;

import org.apache.james.mime4j.MimeException;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/stream/BodyDescriptorBuilder.class */
public interface BodyDescriptorBuilder {
    void reset();

    Field addField(RawField rawField) throws MimeException;

    BodyDescriptor build();

    BodyDescriptorBuilder newChild();
}
