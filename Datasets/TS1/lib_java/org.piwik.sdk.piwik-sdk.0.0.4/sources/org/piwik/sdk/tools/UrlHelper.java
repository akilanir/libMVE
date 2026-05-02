package org.piwik.sdk.tools;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Pair;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.4.jar:org/piwik/sdk/tools/UrlHelper.class */
public class UrlHelper {
    private static final String PARAMETER_SEPARATOR = "&";
    private static final String NAME_VALUE_SEPARATOR = "=";

    public static List<Pair<String, String>> parse(@NonNull URI uri, @Nullable String encoding) {
        List<Pair<String, String>> result = Collections.emptyList();
        String query = uri.getRawQuery();
        if (query != null && query.length() > 0) {
            result = new ArrayList();
            parse(result, new Scanner(query), encoding);
        }
        return result;
    }

    public static void parse(@NonNull List<Pair<String, String>> parameters, @NonNull Scanner scanner, @Nullable String encoding) {
        scanner.useDelimiter(PARAMETER_SEPARATOR);
        while (scanner.hasNext()) {
            String[] nameValue = scanner.next().split(NAME_VALUE_SEPARATOR);
            if (nameValue.length == 0 || nameValue.length > 2) {
                throw new IllegalArgumentException("bad parameter");
            }
            String name = decode(nameValue[0], encoding);
            String value = null;
            if (nameValue.length == 2) {
                value = decode(nameValue[1], encoding);
            }
            parameters.add(new Pair<>(name, value));
        }
    }

    private static String decode(@NonNull String content, @Nullable String encoding) {
        try {
            return URLDecoder.decode(content, encoding != null ? encoding : "UTF-8");
        } catch (UnsupportedEncodingException problem) {
            throw new IllegalArgumentException(problem);
        }
    }
}
