package org.springframework.http.converter;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.util.Assert;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/FormHttpMessageConverter.class */
public class FormHttpMessageConverter implements HttpMessageConverter<MultiValueMap<String, ?>> {
    private static final byte[] BOUNDARY_CHARS = {45, 95, 49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90};
    private final Random rnd = new Random();
    private Charset charset = Charset.forName("UTF-8");
    private List<MediaType> supportedMediaTypes = new ArrayList();
    private List<HttpMessageConverter<?>> partConverters = new ArrayList();

    public FormHttpMessageConverter() {
        this.supportedMediaTypes.add(MediaType.APPLICATION_FORM_URLENCODED);
        this.supportedMediaTypes.add(MediaType.MULTIPART_FORM_DATA);
        this.partConverters.add(new ByteArrayHttpMessageConverter());
        StringHttpMessageConverter stringHttpMessageConverter = new StringHttpMessageConverter();
        stringHttpMessageConverter.setWriteAcceptCharset(false);
        this.partConverters.add(stringHttpMessageConverter);
        this.partConverters.add(new ResourceHttpMessageConverter());
    }

    public final void setPartConverters(List<HttpMessageConverter<?>> partConverters) {
        Assert.notEmpty(partConverters, "'partConverters' must not be empty");
        this.partConverters = partConverters;
    }

    public final void addPartConverter(HttpMessageConverter<?> partConverter) {
        Assert.notNull(partConverter, "'partConverter' must not be NULL");
        this.partConverters.add(partConverter);
    }

    public void setCharset(Charset charset) {
        this.charset = charset;
    }

    @Override // org.springframework.http.converter.HttpMessageConverter
    public boolean canRead(Class<?> clazz, MediaType mediaType) {
        if (!MultiValueMap.class.isAssignableFrom(clazz)) {
            return false;
        }
        if (mediaType == null) {
            return true;
        }
        for (MediaType supportedMediaType : getSupportedMediaTypes()) {
            if (!supportedMediaType.equals(MediaType.MULTIPART_FORM_DATA) && supportedMediaType.includes(mediaType)) {
                return true;
            }
        }
        return false;
    }

    @Override // org.springframework.http.converter.HttpMessageConverter
    public boolean canWrite(Class<?> clazz, MediaType mediaType) {
        if (!MultiValueMap.class.isAssignableFrom(clazz)) {
            return false;
        }
        if (mediaType == null || MediaType.ALL.equals(mediaType)) {
            return true;
        }
        for (MediaType supportedMediaType : getSupportedMediaTypes()) {
            if (supportedMediaType.isCompatibleWith(mediaType)) {
                return true;
            }
        }
        return false;
    }

    public void setSupportedMediaTypes(List<MediaType> supportedMediaTypes) {
        this.supportedMediaTypes = supportedMediaTypes;
    }

    @Override // org.springframework.http.converter.HttpMessageConverter
    public List<MediaType> getSupportedMediaTypes() {
        return Collections.unmodifiableList(this.supportedMediaTypes);
    }

    @Override // org.springframework.http.converter.HttpMessageConverter
    /* renamed from: read, reason: merged with bridge method [inline-methods] */
    public MultiValueMap<String, ?> read2(Class<? extends MultiValueMap<String, ?>> clazz, HttpInputMessage inputMessage) throws IOException, HttpMessageNotReadableException {
        MediaType contentType = inputMessage.getHeaders().getContentType();
        Charset charset = contentType.getCharSet() != null ? contentType.getCharSet() : this.charset;
        String body = FileCopyUtils.copyToString(new InputStreamReader(inputMessage.getBody(), charset));
        String[] pairs = StringUtils.tokenizeToStringArray(body, "&");
        LinkedMultiValueMap linkedMultiValueMap = new LinkedMultiValueMap(pairs.length);
        for (String pair : pairs) {
            int idx = pair.indexOf(61);
            if (idx == -1) {
                linkedMultiValueMap.add(URLDecoder.decode(pair, charset.name()), (Object) null);
            } else {
                String name = URLDecoder.decode(pair.substring(0, idx), charset.name());
                String value = URLDecoder.decode(pair.substring(idx + 1), charset.name());
                linkedMultiValueMap.add(name, value);
            }
        }
        return linkedMultiValueMap;
    }

    @Override // org.springframework.http.converter.HttpMessageConverter
    public void write(MultiValueMap<String, ?> map, MediaType contentType, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        if (!isMultipart(map, contentType)) {
            writeForm(map, contentType, outputMessage);
        } else {
            writeMultipart(map, outputMessage);
        }
    }

    private boolean isMultipart(MultiValueMap<String, ?> map, MediaType contentType) {
        if (contentType != null) {
            return MediaType.MULTIPART_FORM_DATA.equals(contentType);
        }
        for (String name : map.keySet()) {
            for (Object value : (List) map.get(name)) {
                if (value != null && !(value instanceof String)) {
                    return true;
                }
            }
        }
        return false;
    }

    private void writeForm(MultiValueMap<String, String> form, MediaType contentType, HttpOutputMessage outputMessage) throws IOException {
        Charset charset;
        if (contentType != null) {
            outputMessage.getHeaders().setContentType(contentType);
            charset = contentType.getCharSet() != null ? contentType.getCharSet() : this.charset;
        } else {
            outputMessage.getHeaders().setContentType(MediaType.APPLICATION_FORM_URLENCODED);
            charset = this.charset;
        }
        StringBuilder builder = new StringBuilder();
        Iterator<String> nameIterator = form.keySet().iterator();
        while (nameIterator.hasNext()) {
            String name = nameIterator.next();
            Iterator<String> valueIterator = ((List) form.get(name)).iterator();
            while (valueIterator.hasNext()) {
                String value = valueIterator.next();
                builder.append(URLEncoder.encode(name, charset.name()));
                if (value != null) {
                    builder.append('=');
                    builder.append(URLEncoder.encode(value, charset.name()));
                    if (valueIterator.hasNext()) {
                        builder.append('&');
                    }
                }
            }
            if (nameIterator.hasNext()) {
                builder.append('&');
            }
        }
        byte[] bytes = builder.toString().getBytes(charset.name());
        outputMessage.getHeaders().setContentLength(bytes.length);
        FileCopyUtils.copy(bytes, outputMessage.getBody());
    }

    private void writeMultipart(MultiValueMap<String, Object> parts, HttpOutputMessage outputMessage) throws IOException {
        byte[] boundary = generateMultipartBoundary();
        Map<String, String> parameters = Collections.singletonMap("boundary", new String(boundary, "US-ASCII"));
        MediaType contentType = new MediaType(MediaType.MULTIPART_FORM_DATA, parameters);
        outputMessage.getHeaders().setContentType(contentType);
        writeParts(outputMessage.getBody(), parts, boundary);
        writeEnd(boundary, outputMessage.getBody());
    }

    private void writeParts(OutputStream os, MultiValueMap<String, Object> parts, byte[] boundary) throws IOException {
        for (Map.Entry<String, List<Object>> entry : parts.entrySet()) {
            String name = entry.getKey();
            for (Object part : entry.getValue()) {
                writeBoundary(boundary, os);
                HttpEntity<?> entity = getEntity(part);
                writePart(name, entity, os);
                writeNewLine(os);
            }
        }
    }

    private void writeBoundary(byte[] boundary, OutputStream os) throws IOException {
        os.write(45);
        os.write(45);
        os.write(boundary);
        writeNewLine(os);
    }

    private HttpEntity<?> getEntity(Object part) {
        if (part instanceof HttpEntity) {
            return (HttpEntity) part;
        }
        return new HttpEntity<>(part);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v5, types: [java.util.Map, org.springframework.http.HttpHeaders] */
    private void writePart(String name, HttpEntity<?> partEntity, OutputStream os) throws IOException {
        Object partBody = partEntity.getBody();
        Class<?> partType = partBody.getClass();
        ?? headers = partEntity.getHeaders();
        MediaType partContentType = headers.getContentType();
        for (HttpMessageConverter<?> messageConverter : this.partConverters) {
            if (messageConverter.canWrite(partType, partContentType)) {
                HttpOutputMessage multipartOutputMessage = new MultipartHttpOutputMessage(os);
                multipartOutputMessage.getHeaders().setContentDispositionFormData(name, getFilename(partBody));
                if (!headers.isEmpty()) {
                    multipartOutputMessage.getHeaders().putAll(headers);
                }
                messageConverter.write(partBody, partContentType, multipartOutputMessage);
                return;
            }
        }
        throw new HttpMessageNotWritableException("Could not write request: no suitable HttpMessageConverter found for request type [" + partType.getName() + "]");
    }

    private void writeEnd(byte[] boundary, OutputStream os) throws IOException {
        os.write(45);
        os.write(45);
        os.write(boundary);
        os.write(45);
        os.write(45);
        writeNewLine(os);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void writeNewLine(OutputStream os) throws IOException {
        os.write(13);
        os.write(10);
    }

    protected byte[] generateMultipartBoundary() {
        byte[] boundary = new byte[this.rnd.nextInt(11) + 30];
        for (int i = 0; i < boundary.length; i++) {
            boundary[i] = BOUNDARY_CHARS[this.rnd.nextInt(BOUNDARY_CHARS.length)];
        }
        return boundary;
    }

    protected String getFilename(Object part) {
        if (part instanceof Resource) {
            Resource resource = (Resource) part;
            return resource.getFilename();
        }
        return null;
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/FormHttpMessageConverter$MultipartHttpOutputMessage.class */
    private class MultipartHttpOutputMessage implements HttpOutputMessage {
        private final OutputStream os;
        private final HttpHeaders headers = new HttpHeaders();
        private boolean headersWritten = false;

        public MultipartHttpOutputMessage(OutputStream os) {
            this.os = os;
        }

        @Override // org.springframework.http.HttpMessage
        public HttpHeaders getHeaders() {
            return this.headersWritten ? HttpHeaders.readOnlyHttpHeaders(this.headers) : this.headers;
        }

        @Override // org.springframework.http.HttpOutputMessage
        public OutputStream getBody() throws IOException {
            writeHeaders();
            return this.os;
        }

        private void writeHeaders() throws IOException {
            if (!this.headersWritten) {
                for (Map.Entry<String, List<String>> entry : this.headers.entrySet()) {
                    byte[] headerName = getAsciiBytes(entry.getKey());
                    for (String headerValueString : entry.getValue()) {
                        byte[] headerValue = getAsciiBytes(headerValueString);
                        this.os.write(headerName);
                        this.os.write(58);
                        this.os.write(32);
                        this.os.write(headerValue);
                        FormHttpMessageConverter.this.writeNewLine(this.os);
                    }
                }
                FormHttpMessageConverter.this.writeNewLine(this.os);
                this.headersWritten = true;
            }
        }

        protected byte[] getAsciiBytes(String name) {
            try {
                return name.getBytes("US-ASCII");
            } catch (UnsupportedEncodingException ex) {
                throw new IllegalStateException(ex);
            }
        }
    }
}
