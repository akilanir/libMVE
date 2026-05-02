package org.apache.james.mime4j.parser;

import java.io.IOException;
import java.io.InputStream;
import org.apache.james.mime4j.MimeException;
import org.apache.james.mime4j.stream.BodyDescriptor;
import org.apache.james.mime4j.stream.Field;

/* loaded from: apache-mime4j-core-0.7.2.jar:org/apache/james/mime4j/parser/ContentHandler.class */
public interface ContentHandler {
    void startMessage() throws MimeException;

    void endMessage() throws MimeException;

    void startBodyPart() throws MimeException;

    void endBodyPart() throws MimeException;

    void startHeader() throws MimeException;

    void field(Field field) throws MimeException;

    void endHeader() throws MimeException;

    void preamble(InputStream inputStream) throws MimeException, IOException;

    void epilogue(InputStream inputStream) throws MimeException, IOException;

    void startMultipart(BodyDescriptor bodyDescriptor) throws MimeException;

    void endMultipart() throws MimeException;

    void body(BodyDescriptor bodyDescriptor, InputStream inputStream) throws MimeException, IOException;

    void raw(InputStream inputStream) throws MimeException, IOException;
}
