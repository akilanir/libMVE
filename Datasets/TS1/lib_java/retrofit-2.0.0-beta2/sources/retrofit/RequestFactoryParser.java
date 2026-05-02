package retrofit;

import com.squareup.okhttp.Headers;
import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.RequestBody;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import retrofit.RequestBuilderAction;
import retrofit.http.Body;
import retrofit.http.DELETE;
import retrofit.http.Field;
import retrofit.http.FieldMap;
import retrofit.http.FormUrlEncoded;
import retrofit.http.GET;
import retrofit.http.HEAD;
import retrofit.http.HTTP;
import retrofit.http.Header;
import retrofit.http.Multipart;
import retrofit.http.PATCH;
import retrofit.http.POST;
import retrofit.http.PUT;
import retrofit.http.Part;
import retrofit.http.PartMap;
import retrofit.http.Path;
import retrofit.http.Query;
import retrofit.http.QueryMap;
import retrofit.http.Url;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestFactoryParser.class */
final class RequestFactoryParser {
    private static final String PARAM = "[a-zA-Z][a-zA-Z0-9_-]*";
    private static final Pattern PARAM_NAME_REGEX = Pattern.compile(PARAM);
    private static final Pattern PARAM_URL_REGEX = Pattern.compile("\\{([a-zA-Z][a-zA-Z0-9_-]*)\\}");
    private final Method method;
    private String httpMethod;
    private boolean hasBody;
    private boolean isFormEncoded;
    private boolean isMultipart;
    private String relativeUrl;
    private Headers headers;
    private MediaType contentType;
    private RequestBuilderAction[] requestBuilderActions;
    private Set<String> relativeUrlParamNames;

    static RequestFactory parse(Method method, Type responseType, Retrofit retrofit2) {
        RequestFactoryParser parser = new RequestFactoryParser(method);
        parser.parseMethodAnnotations(responseType);
        parser.parseParameters(retrofit2);
        return parser.toRequestFactory(retrofit2.baseUrl());
    }

    private RequestFactoryParser(Method method) {
        this.method = method;
    }

    private RequestFactory toRequestFactory(BaseUrl baseUrl) {
        return new RequestFactory(this.httpMethod, baseUrl, this.relativeUrl, this.headers, this.contentType, this.hasBody, this.isFormEncoded, this.isMultipart, this.requestBuilderActions);
    }

    private RuntimeException parameterError(Throwable cause, int index, String message, Object... args) {
        return Utils.methodError(cause, this.method, message + " (parameter #" + (index + 1) + ")", args);
    }

    private RuntimeException parameterError(int index, String message, Object... args) {
        return Utils.methodError(this.method, message + " (parameter #" + (index + 1) + ")", args);
    }

    private void parseMethodAnnotations(Type responseType) {
        for (Annotation annotation : this.method.getAnnotations()) {
            if (annotation instanceof DELETE) {
                parseHttpMethodAndPath("DELETE", ((DELETE) annotation).value(), false);
            } else if (annotation instanceof GET) {
                parseHttpMethodAndPath("GET", ((GET) annotation).value(), false);
            } else if (annotation instanceof HEAD) {
                parseHttpMethodAndPath("HEAD", ((HEAD) annotation).value(), false);
                if (!Void.class.equals(responseType)) {
                    throw Utils.methodError(this.method, "HEAD method must use Void as response type.", new Object[0]);
                }
            } else if (annotation instanceof PATCH) {
                parseHttpMethodAndPath("PATCH", ((PATCH) annotation).value(), true);
            } else if (annotation instanceof POST) {
                parseHttpMethodAndPath("POST", ((POST) annotation).value(), true);
            } else if (annotation instanceof PUT) {
                parseHttpMethodAndPath("PUT", ((PUT) annotation).value(), true);
            } else if (annotation instanceof HTTP) {
                HTTP http = (HTTP) annotation;
                parseHttpMethodAndPath(http.method(), http.path(), http.hasBody());
            } else if (annotation instanceof retrofit.http.Headers) {
                String[] headersToParse = ((retrofit.http.Headers) annotation).value();
                if (headersToParse.length == 0) {
                    throw Utils.methodError(this.method, "@Headers annotation is empty.", new Object[0]);
                }
                this.headers = parseHeaders(headersToParse);
            } else if (annotation instanceof Multipart) {
                if (this.isFormEncoded) {
                    throw Utils.methodError(this.method, "Only one encoding annotation is allowed.", new Object[0]);
                }
                this.isMultipart = true;
            } else if (!(annotation instanceof FormUrlEncoded)) {
                continue;
            } else {
                if (this.isMultipart) {
                    throw Utils.methodError(this.method, "Only one encoding annotation is allowed.", new Object[0]);
                }
                this.isFormEncoded = true;
            }
        }
        if (this.httpMethod == null) {
            throw Utils.methodError(this.method, "HTTP method annotation is required (e.g., @GET, @POST, etc.).", new Object[0]);
        }
        if (!this.hasBody) {
            if (this.isMultipart) {
                throw Utils.methodError(this.method, "Multipart can only be specified on HTTP methods with request body (e.g., @POST).", new Object[0]);
            }
            if (this.isFormEncoded) {
                throw Utils.methodError(this.method, "FormUrlEncoded can only be specified on HTTP methods with request body (e.g., @POST).", new Object[0]);
            }
        }
    }

    private void parseHttpMethodAndPath(String httpMethod, String value, boolean hasBody) {
        if (this.httpMethod != null) {
            throw Utils.methodError(this.method, "Only one HTTP method is allowed. Found: %s and %s.", this.httpMethod, httpMethod);
        }
        this.httpMethod = httpMethod;
        this.hasBody = hasBody;
        if (value.isEmpty()) {
            return;
        }
        int question = value.indexOf(63);
        if (question != -1 && question < value.length() - 1) {
            String queryParams = value.substring(question + 1);
            Matcher queryParamMatcher = PARAM_URL_REGEX.matcher(queryParams);
            if (queryParamMatcher.find()) {
                throw Utils.methodError(this.method, "URL query string \"%s\" must not have replace block. For dynamic query parameters use @Query.", queryParams);
            }
        }
        this.relativeUrl = value;
        this.relativeUrlParamNames = parsePathParameters(value);
    }

    private Headers parseHeaders(String[] headers) {
        Headers.Builder builder = new Headers.Builder();
        for (String header : headers) {
            int colon = header.indexOf(58);
            if (colon == -1 || colon == 0 || colon == header.length() - 1) {
                throw Utils.methodError(this.method, "@Headers value must be in the form \"Name: Value\". Found: \"%s\"", header);
            }
            String headerName = header.substring(0, colon);
            String headerValue = header.substring(colon + 1).trim();
            if ("Content-Type".equalsIgnoreCase(headerName)) {
                this.contentType = MediaType.parse(headerValue);
            } else {
                builder.add(headerName, headerValue);
            }
        }
        return builder.build();
    }

    private void parseParameters(Retrofit retrofit2) {
        Type[] methodParameterTypes = this.method.getGenericParameterTypes();
        Annotation[][] methodParameterAnnotationArrays = this.method.getParameterAnnotations();
        boolean gotField = false;
        boolean gotPart = false;
        boolean gotBody = false;
        boolean gotPath = false;
        boolean gotQuery = false;
        boolean gotUrl = false;
        int count = methodParameterAnnotationArrays.length;
        RequestBuilderAction[] requestBuilderActions = new RequestBuilderAction[count];
        for (int i = 0; i < count; i++) {
            Type methodParameterType = methodParameterTypes[i];
            Annotation[] methodParameterAnnotations = methodParameterAnnotationArrays[i];
            if (methodParameterAnnotations != null) {
                for (Annotation methodParameterAnnotation : methodParameterAnnotations) {
                    RequestBuilderAction action = null;
                    if (methodParameterAnnotation instanceof Url) {
                        if (gotUrl) {
                            throw parameterError(i, "Multiple @Url method annotations found.", new Object[0]);
                        }
                        if (gotPath) {
                            throw parameterError(i, "@Path parameters may not be used with @Url.", new Object[0]);
                        }
                        if (gotQuery) {
                            throw parameterError(i, "A @Url parameter must not come after a @Query", new Object[0]);
                        }
                        if (methodParameterType != String.class) {
                            throw parameterError(i, "@Url must be String type.", new Object[0]);
                        }
                        if (this.relativeUrl != null) {
                            throw parameterError(i, "@Url cannot be used with @%s URL", this.httpMethod);
                        }
                        gotUrl = true;
                        action = new RequestBuilderAction.Url();
                    } else if (methodParameterAnnotation instanceof Path) {
                        if (gotQuery) {
                            throw parameterError(i, "A @Path parameter must not come after a @Query.", new Object[0]);
                        }
                        if (gotUrl) {
                            throw parameterError(i, "@Path parameters may not be used with @Url.", new Object[0]);
                        }
                        if (this.relativeUrl == null) {
                            throw parameterError(i, "@Path can only be used with relative url on @%s", this.httpMethod);
                        }
                        gotPath = true;
                        Path path = (Path) methodParameterAnnotation;
                        String name = path.value();
                        validatePathName(i, name);
                        action = new RequestBuilderAction.Path(name, path.encoded());
                    } else if (methodParameterAnnotation instanceof Query) {
                        Query query = (Query) methodParameterAnnotation;
                        action = new RequestBuilderAction.Query(query.value(), query.encoded());
                        gotQuery = true;
                    } else if (methodParameterAnnotation instanceof QueryMap) {
                        if (!Map.class.isAssignableFrom(Utils.getRawType(methodParameterType))) {
                            throw parameterError(i, "@QueryMap parameter type must be Map.", new Object[0]);
                        }
                        QueryMap queryMap = (QueryMap) methodParameterAnnotation;
                        action = new RequestBuilderAction.QueryMap(queryMap.encoded());
                    } else if (methodParameterAnnotation instanceof Header) {
                        Header header = (Header) methodParameterAnnotation;
                        action = new RequestBuilderAction.Header(header.value());
                    } else if (methodParameterAnnotation instanceof Field) {
                        if (!this.isFormEncoded) {
                            throw parameterError(i, "@Field parameters can only be used with form encoding.", new Object[0]);
                        }
                        Field field = (Field) methodParameterAnnotation;
                        action = new RequestBuilderAction.Field(field.value(), field.encoded());
                        gotField = true;
                    } else if (methodParameterAnnotation instanceof FieldMap) {
                        if (!this.isFormEncoded) {
                            throw parameterError(i, "@FieldMap parameters can only be used with form encoding.", new Object[0]);
                        }
                        if (!Map.class.isAssignableFrom(Utils.getRawType(methodParameterType))) {
                            throw parameterError(i, "@FieldMap parameter type must be Map.", new Object[0]);
                        }
                        FieldMap fieldMap = (FieldMap) methodParameterAnnotation;
                        action = new RequestBuilderAction.FieldMap(fieldMap.encoded());
                        gotField = true;
                    } else if (methodParameterAnnotation instanceof Part) {
                        if (!this.isMultipart) {
                            throw parameterError(i, "@Part parameters can only be used with multipart encoding.", new Object[0]);
                        }
                        Part part = (Part) methodParameterAnnotation;
                        Headers headers = Headers.of(new String[]{"Content-Disposition", "form-data; name=\"" + part.value() + "\"", "Content-Transfer-Encoding", part.encoding()});
                        try {
                            Converter<?, RequestBody> converter = retrofit2.requestConverter(methodParameterType, methodParameterAnnotations);
                            action = new RequestBuilderAction.Part(headers, converter);
                            gotPart = true;
                        } catch (RuntimeException e) {
                            throw parameterError(e, i, "Unable to create @Part converter for %s", methodParameterType);
                        }
                    } else if (methodParameterAnnotation instanceof PartMap) {
                        if (!this.isMultipart) {
                            throw parameterError(i, "@PartMap parameters can only be used with multipart encoding.", new Object[0]);
                        }
                        if (!Map.class.isAssignableFrom(Utils.getRawType(methodParameterType))) {
                            throw parameterError(i, "@PartMap parameter type must be Map.", new Object[0]);
                        }
                        PartMap partMap = (PartMap) methodParameterAnnotation;
                        action = new RequestBuilderAction.PartMap(retrofit2, partMap.encoding(), methodParameterAnnotations);
                        gotPart = true;
                    } else if (methodParameterAnnotation instanceof Body) {
                        if (this.isFormEncoded || this.isMultipart) {
                            throw parameterError(i, "@Body parameters cannot be used with form or multi-part encoding.", new Object[0]);
                        }
                        if (gotBody) {
                            throw parameterError(i, "Multiple @Body method annotations found.", new Object[0]);
                        }
                        try {
                            Converter<?, RequestBody> converter2 = retrofit2.requestConverter(methodParameterType, methodParameterAnnotations);
                            action = new RequestBuilderAction.Body(converter2);
                            gotBody = true;
                        } catch (RuntimeException e2) {
                            throw parameterError(e2, i, "Unable to create @Body converter for %s", methodParameterType);
                        }
                    }
                    if (action != null) {
                        if (requestBuilderActions[i] != null) {
                            throw parameterError(i, "Multiple Retrofit annotations found, only one allowed.", new Object[0]);
                        }
                        requestBuilderActions[i] = action;
                    }
                }
            }
            if (requestBuilderActions[i] == null) {
                throw parameterError(i, "No Retrofit annotation found.", new Object[0]);
            }
        }
        if (this.relativeUrl == null && !gotUrl) {
            throw Utils.methodError(this.method, "Missing either @%s URL or @Url parameter.", this.httpMethod);
        }
        if (!this.isFormEncoded && !this.isMultipart && !this.hasBody && gotBody) {
            throw Utils.methodError(this.method, "Non-body HTTP method cannot contain @Body.", new Object[0]);
        }
        if (this.isFormEncoded && !gotField) {
            throw Utils.methodError(this.method, "Form-encoded method must contain at least one @Field.", new Object[0]);
        }
        if (this.isMultipart && !gotPart) {
            throw Utils.methodError(this.method, "Multipart method must contain at least one @Part.", new Object[0]);
        }
        this.requestBuilderActions = requestBuilderActions;
    }

    private void validatePathName(int index, String name) {
        if (!PARAM_NAME_REGEX.matcher(name).matches()) {
            throw parameterError(index, "@Path parameter name must match %s. Found: %s", PARAM_URL_REGEX.pattern(), name);
        }
        if (!this.relativeUrlParamNames.contains(name)) {
            throw parameterError(index, "URL \"%s\" does not contain \"{%s}\".", this.relativeUrl, name);
        }
    }

    static Set<String> parsePathParameters(String path) {
        Matcher m = PARAM_URL_REGEX.matcher(path);
        Set<String> patterns = new LinkedHashSet<>();
        while (m.find()) {
            patterns.add(m.group(1));
        }
        return patterns;
    }
}
