package retrofit;

import com.squareup.okhttp.Headers;
import com.squareup.okhttp.RequestBody;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.Array;
import java.util.Map;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestBuilderAction.class */
abstract class RequestBuilderAction {
    abstract void perform(RequestBuilder requestBuilder, Object obj);

    RequestBuilderAction() {
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestBuilderAction$Url.class */
    static final class Url extends RequestBuilderAction {
        Url() {
        }

        @Override // retrofit.RequestBuilderAction
        void perform(RequestBuilder builder, Object value) {
            builder.setRelativeUrl((String) value);
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestBuilderAction$Header.class */
    static final class Header extends RequestBuilderAction {
        private final String name;

        Header(String name) {
            this.name = (String) Utils.checkNotNull(name, "name == null");
        }

        @Override // retrofit.RequestBuilderAction
        void perform(RequestBuilder builder, Object value) {
            if (value == null) {
                return;
            }
            if (value instanceof Iterable) {
                for (Object iterableValue : (Iterable) value) {
                    if (iterableValue != null) {
                        builder.addHeader(this.name, iterableValue.toString());
                    }
                }
                return;
            }
            if (value.getClass().isArray()) {
                int arrayLength = Array.getLength(value);
                for (int x = 0; x < arrayLength; x++) {
                    Object arrayValue = Array.get(value, x);
                    if (arrayValue != null) {
                        builder.addHeader(this.name, arrayValue.toString());
                    }
                }
                return;
            }
            builder.addHeader(this.name, value.toString());
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestBuilderAction$Path.class */
    static final class Path extends RequestBuilderAction {
        private final String name;
        private final boolean encoded;

        Path(String name, boolean encoded) {
            this.name = (String) Utils.checkNotNull(name, "name == null");
            this.encoded = encoded;
        }

        @Override // retrofit.RequestBuilderAction
        void perform(RequestBuilder builder, Object value) {
            if (value == null) {
                throw new IllegalArgumentException("Path parameter \"" + this.name + "\" value must not be null.");
            }
            builder.addPathParam(this.name, value.toString(), this.encoded);
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestBuilderAction$Query.class */
    static final class Query extends RequestBuilderAction {
        private final String name;
        private final boolean encoded;

        Query(String name, boolean encoded) {
            this.name = (String) Utils.checkNotNull(name, "name == null");
            this.encoded = encoded;
        }

        @Override // retrofit.RequestBuilderAction
        void perform(RequestBuilder builder, Object value) {
            if (value == null) {
                return;
            }
            if (value instanceof Iterable) {
                for (Object iterableValue : (Iterable) value) {
                    if (iterableValue != null) {
                        builder.addQueryParam(this.name, iterableValue.toString(), this.encoded);
                    }
                }
                return;
            }
            if (value.getClass().isArray()) {
                int arrayLength = Array.getLength(value);
                for (int x = 0; x < arrayLength; x++) {
                    Object arrayValue = Array.get(value, x);
                    if (arrayValue != null) {
                        builder.addQueryParam(this.name, arrayValue.toString(), this.encoded);
                    }
                }
                return;
            }
            builder.addQueryParam(this.name, value.toString(), this.encoded);
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestBuilderAction$QueryMap.class */
    static final class QueryMap extends RequestBuilderAction {
        private final boolean encoded;

        QueryMap(boolean encoded) {
            this.encoded = encoded;
        }

        @Override // retrofit.RequestBuilderAction
        void perform(RequestBuilder builder, Object value) {
            if (value == null) {
                return;
            }
            Map<?, ?> map = (Map) value;
            for (Map.Entry<?, ?> entry : map.entrySet()) {
                Object entryKey = entry.getKey();
                if (entryKey == null) {
                    throw new IllegalArgumentException("Query map contained null key.");
                }
                Object entryValue = entry.getValue();
                if (entryValue != null) {
                    builder.addQueryParam(entryKey.toString(), entryValue.toString(), this.encoded);
                }
            }
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestBuilderAction$Field.class */
    static final class Field extends RequestBuilderAction {
        private final String name;
        private final boolean encoded;

        Field(String name, boolean encoded) {
            this.name = (String) Utils.checkNotNull(name, "name == null");
            this.encoded = encoded;
        }

        @Override // retrofit.RequestBuilderAction
        void perform(RequestBuilder builder, Object value) {
            if (value == null) {
                return;
            }
            if (value instanceof Iterable) {
                for (Object iterableValue : (Iterable) value) {
                    if (iterableValue != null) {
                        builder.addFormField(this.name, iterableValue.toString(), this.encoded);
                    }
                }
                return;
            }
            if (value.getClass().isArray()) {
                int arrayLength = Array.getLength(value);
                for (int x = 0; x < arrayLength; x++) {
                    Object arrayValue = Array.get(value, x);
                    if (arrayValue != null) {
                        builder.addFormField(this.name, arrayValue.toString(), this.encoded);
                    }
                }
                return;
            }
            builder.addFormField(this.name, value.toString(), this.encoded);
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestBuilderAction$FieldMap.class */
    static final class FieldMap extends RequestBuilderAction {
        private final boolean encoded;

        FieldMap(boolean encoded) {
            this.encoded = encoded;
        }

        @Override // retrofit.RequestBuilderAction
        void perform(RequestBuilder builder, Object value) {
            if (value == null) {
                return;
            }
            Map<?, ?> map = (Map) value;
            for (Map.Entry<?, ?> entry : map.entrySet()) {
                Object entryKey = entry.getKey();
                if (entryKey == null) {
                    throw new IllegalArgumentException("Field map contained null key.");
                }
                Object entryValue = entry.getValue();
                if (entryValue != null) {
                    builder.addFormField(entryKey.toString(), entryValue.toString(), this.encoded);
                }
            }
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestBuilderAction$Part.class */
    static final class Part<T> extends RequestBuilderAction {
        private final Headers headers;
        private final Converter<T, RequestBody> converter;

        Part(Headers headers, Converter<T, RequestBody> converter) {
            this.headers = headers;
            this.converter = converter;
        }

        @Override // retrofit.RequestBuilderAction
        void perform(RequestBuilder builder, Object value) {
            if (value == null) {
                return;
            }
            try {
                RequestBody body = this.converter.convert(value);
                builder.addPart(this.headers, body);
            } catch (IOException e) {
                throw new RuntimeException("Unable to convert " + value + " to RequestBody");
            }
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestBuilderAction$PartMap.class */
    static final class PartMap extends RequestBuilderAction {

        /* renamed from: retrofit, reason: collision with root package name */
        private final Retrofit f2retrofit;
        private final String transferEncoding;
        private final Annotation[] annotations;

        PartMap(Retrofit retrofit2, String transferEncoding, Annotation[] annotations) {
            this.f2retrofit = retrofit2;
            this.transferEncoding = transferEncoding;
            this.annotations = annotations;
        }

        @Override // retrofit.RequestBuilderAction
        void perform(RequestBuilder builder, Object value) {
            if (value == null) {
                return;
            }
            Map<?, ?> map = (Map) value;
            for (Map.Entry<?, ?> entry : map.entrySet()) {
                Object entryKey = entry.getKey();
                if (entryKey == null) {
                    throw new IllegalArgumentException("Part map contained null key.");
                }
                Object entryValue = entry.getValue();
                if (entryValue != null) {
                    Headers headers = Headers.of(new String[]{"Content-Disposition", "form-data; name=\"" + entryKey + "\"", "Content-Transfer-Encoding", this.transferEncoding});
                    Class<?> entryClass = entryValue.getClass();
                    Converter<Object, RequestBody> converter = this.f2retrofit.requestConverter(entryClass, this.annotations);
                    try {
                        RequestBody body = converter.convert(entryValue);
                        builder.addPart(headers, body);
                    } catch (IOException e) {
                        throw new RuntimeException("Unable to convert " + entryValue + " to RequestBody");
                    }
                }
            }
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestBuilderAction$Body.class */
    static final class Body<T> extends RequestBuilderAction {
        private final Converter<T, RequestBody> converter;

        Body(Converter<T, RequestBody> converter) {
            this.converter = converter;
        }

        @Override // retrofit.RequestBuilderAction
        void perform(RequestBuilder builder, Object value) {
            if (value == null) {
                throw new IllegalArgumentException("Body parameter value must not be null.");
            }
            try {
                RequestBody body = this.converter.convert(value);
                builder.setBody(body);
            } catch (IOException e) {
                throw new RuntimeException("Unable to convert " + value + " to RequestBody");
            }
        }
    }
}
