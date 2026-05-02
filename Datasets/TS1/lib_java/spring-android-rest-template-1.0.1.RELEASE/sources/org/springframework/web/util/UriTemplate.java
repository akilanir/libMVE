package org.springframework.web.util;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.util.Assert;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriTemplate.class */
public class UriTemplate implements Serializable {
    private static final long serialVersionUID = 1;
    private static final Pattern NAMES_PATTERN = Pattern.compile("\\{([^/]+?)\\}");
    private static final String DEFAULT_VARIABLE_PATTERN = "(.*)";
    private final UriComponents uriComponents;
    private final List<String> variableNames;
    private final Pattern matchPattern;
    private final String uriTemplate;

    public UriTemplate(String uriTemplate) {
        Parser parser = new Parser(uriTemplate);
        this.uriTemplate = uriTemplate;
        this.variableNames = parser.getVariableNames();
        this.matchPattern = parser.getMatchPattern();
        this.uriComponents = UriComponentsBuilder.fromUriString(uriTemplate).build();
    }

    public List<String> getVariableNames() {
        return this.variableNames;
    }

    public URI expand(Map<String, ?> uriVariables) {
        UriComponents expandedComponents = this.uriComponents.expand(uriVariables);
        UriComponents encodedComponents = expandedComponents.encode();
        return encodedComponents.toUri();
    }

    public URI expand(Object... uriVariableValues) {
        UriComponents expandedComponents = this.uriComponents.expand(uriVariableValues);
        UriComponents encodedComponents = expandedComponents.encode();
        return encodedComponents.toUri();
    }

    public boolean matches(String uri) {
        if (uri == null) {
            return false;
        }
        Matcher matcher = this.matchPattern.matcher(uri);
        return matcher.matches();
    }

    public Map<String, String> match(String uri) {
        Assert.notNull(uri, "'uri' must not be null");
        Map<String, String> result = new LinkedHashMap<>(this.variableNames.size());
        Matcher matcher = this.matchPattern.matcher(uri);
        if (matcher.find()) {
            for (int i = 1; i <= matcher.groupCount(); i++) {
                String name = this.variableNames.get(i - 1);
                String value = matcher.group(i);
                result.put(name, value);
            }
        }
        return result;
    }

    @Deprecated
    protected URI encodeUri(String uri) {
        try {
            String encoded = UriUtils.encodeUri(uri, "UTF-8");
            return new URI(encoded);
        } catch (UnsupportedEncodingException ex) {
            throw new IllegalStateException(ex);
        } catch (URISyntaxException ex2) {
            throw new IllegalArgumentException("Could not create URI from [" + uri + "]: " + ex2, ex2);
        }
    }

    public String toString() {
        return this.uriTemplate;
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriTemplate$Parser.class */
    private static class Parser {
        private final List<String> variableNames;
        private final StringBuilder patternBuilder;

        private Parser(String uriTemplate) {
            this.variableNames = new LinkedList();
            this.patternBuilder = new StringBuilder();
            Assert.hasText(uriTemplate, "'uriTemplate' must not be null");
            Matcher m = UriTemplate.NAMES_PATTERN.matcher(uriTemplate);
            int i = 0;
            while (true) {
                int end = i;
                if (m.find()) {
                    this.patternBuilder.append(quote(uriTemplate, end, m.start()));
                    String match = m.group(1);
                    int colonIdx = match.indexOf(58);
                    if (colonIdx == -1) {
                        this.patternBuilder.append(UriTemplate.DEFAULT_VARIABLE_PATTERN);
                        this.variableNames.add(match);
                    } else {
                        if (colonIdx + 1 == match.length()) {
                            throw new IllegalArgumentException("No custom regular expression specified after ':' in \"" + match + "\"");
                        }
                        String variablePattern = match.substring(colonIdx + 1, match.length());
                        this.patternBuilder.append('(');
                        this.patternBuilder.append(variablePattern);
                        this.patternBuilder.append(')');
                        String variableName = match.substring(0, colonIdx);
                        this.variableNames.add(variableName);
                    }
                    i = m.end();
                } else {
                    this.patternBuilder.append(quote(uriTemplate, end, uriTemplate.length()));
                    int lastIdx = this.patternBuilder.length() - 1;
                    if (lastIdx >= 0 && this.patternBuilder.charAt(lastIdx) == '/') {
                        this.patternBuilder.deleteCharAt(lastIdx);
                        return;
                    }
                    return;
                }
            }
        }

        private String quote(String fullPath, int start, int end) {
            if (start == end) {
                return "";
            }
            return Pattern.quote(fullPath.substring(start, end));
        }

        /* JADX INFO: Access modifiers changed from: private */
        public List<String> getVariableNames() {
            return Collections.unmodifiableList(this.variableNames);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public Pattern getMatchPattern() {
            return Pattern.compile(this.patternBuilder.toString());
        }
    }
}
