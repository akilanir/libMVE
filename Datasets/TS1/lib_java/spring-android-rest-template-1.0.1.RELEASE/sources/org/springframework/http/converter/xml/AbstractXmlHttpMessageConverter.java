package org.springframework.http.converter.xml;

import java.io.IOException;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.AbstractHttpMessageConverter;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/xml/AbstractXmlHttpMessageConverter.class */
public abstract class AbstractXmlHttpMessageConverter<T> extends AbstractHttpMessageConverter<T> {
    private final TransformerFactory transformerFactory;

    protected abstract T readFromSource(Class<? extends T> cls, HttpHeaders httpHeaders, Source source) throws IOException;

    protected abstract void writeToResult(T t, HttpHeaders httpHeaders, Result result) throws IOException;

    protected AbstractXmlHttpMessageConverter() {
        super(MediaType.APPLICATION_XML, MediaType.TEXT_XML, new MediaType("application", "*+xml"));
        this.transformerFactory = TransformerFactory.newInstance();
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public final T readInternal(Class<? extends T> clazz, HttpInputMessage inputMessage) throws IOException {
        return readFromSource(clazz, inputMessage.getHeaders(), new StreamSource(inputMessage.getBody()));
    }

    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    protected final void writeInternal(T t, HttpOutputMessage outputMessage) throws IOException {
        writeToResult(t, outputMessage.getHeaders(), new StreamResult(outputMessage.getBody()));
    }

    protected void transform(Source source, Result result) throws TransformerException {
        this.transformerFactory.newTransformer().transform(source, result);
    }
}
