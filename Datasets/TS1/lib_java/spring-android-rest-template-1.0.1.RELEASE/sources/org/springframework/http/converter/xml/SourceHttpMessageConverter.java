package org.springframework.http.converter.xml;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.TransformerException;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.sax.SAXSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConversionException;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.xml.sax.InputSource;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/xml/SourceHttpMessageConverter.class */
public class SourceHttpMessageConverter<T extends Source> extends AbstractXmlHttpMessageConverter<T> {
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public boolean supports(Class<?> clazz) {
        return DOMSource.class.equals(clazz) || SAXSource.class.equals(clazz) || StreamSource.class.equals(clazz) || Source.class.equals(clazz);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.springframework.http.converter.xml.AbstractXmlHttpMessageConverter
    public T readFromSource(Class<? extends T> clazz, HttpHeaders headers, Source source) throws IOException {
        try {
            if (DOMSource.class.equals(clazz)) {
                DOMResult domResult = new DOMResult();
                transform(source, domResult);
                return new DOMSource(domResult.getNode());
            }
            if (SAXSource.class.equals(clazz)) {
                ByteArrayInputStream bis = transformToByteArrayInputStream(source);
                return new SAXSource(new InputSource(bis));
            }
            if (StreamSource.class.equals(clazz) || Source.class.equals(clazz)) {
                ByteArrayInputStream bis2 = transformToByteArrayInputStream(source);
                return new StreamSource(bis2);
            }
            throw new HttpMessageConversionException("Could not read class [" + clazz + "]. Only DOMSource, SAXSource, and StreamSource are supported.");
        } catch (TransformerException ex) {
            throw new HttpMessageNotReadableException("Could not transform from [" + source + "] to [" + clazz + "]", ex);
        }
    }

    private ByteArrayInputStream transformToByteArrayInputStream(Source source) throws TransformerException {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        transform(source, new StreamResult(bos));
        return new ByteArrayInputStream(bos.toByteArray());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.springframework.http.converter.AbstractHttpMessageConverter
    public Long getContentLength(T t, MediaType contentType) {
        if (t instanceof DOMSource) {
            try {
                CountingOutputStream os = new CountingOutputStream();
                transform(t, new StreamResult(os));
                return Long.valueOf(os.count);
            } catch (TransformerException e) {
                return null;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.springframework.http.converter.xml.AbstractXmlHttpMessageConverter
    public void writeToResult(T t, HttpHeaders headers, Result result) throws IOException {
        try {
            transform(t, result);
        } catch (TransformerException ex) {
            throw new HttpMessageNotWritableException("Could not transform [" + t + "] to [" + result + "]", ex);
        }
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/xml/SourceHttpMessageConverter$CountingOutputStream.class */
    private static class CountingOutputStream extends OutputStream {
        private long count;

        private CountingOutputStream() {
            this.count = 0L;
        }

        @Override // java.io.OutputStream
        public void write(int b) throws IOException {
            this.count++;
        }

        @Override // java.io.OutputStream
        public void write(byte[] b) throws IOException {
            this.count += b.length;
        }

        @Override // java.io.OutputStream
        public void write(byte[] b, int off, int len) throws IOException {
            this.count += len;
        }
    }
}
