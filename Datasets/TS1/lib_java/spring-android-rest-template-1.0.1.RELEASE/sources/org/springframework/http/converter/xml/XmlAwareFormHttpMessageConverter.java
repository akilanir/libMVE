package org.springframework.http.converter.xml;

import org.springframework.http.converter.FormHttpMessageConverter;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/converter/xml/XmlAwareFormHttpMessageConverter.class */
public class XmlAwareFormHttpMessageConverter extends FormHttpMessageConverter {
    public XmlAwareFormHttpMessageConverter() {
        addPartConverter(new SourceHttpMessageConverter());
    }
}
