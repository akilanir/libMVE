package com.koushikdutta.ion.builder;

import com.koushikdutta.ion.builder.UrlEncodedBuilder;
import java.util.List;
import java.util.Map;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/builder/UrlEncodedBuilder.class */
public interface UrlEncodedBuilder<U extends UrlEncodedBuilder> {
    U setBodyParameter(String str, String str2);

    U setBodyParameters(Map<String, List<String>> map);
}
