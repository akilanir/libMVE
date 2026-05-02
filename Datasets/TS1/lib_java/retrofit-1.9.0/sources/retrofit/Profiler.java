package retrofit;

/* loaded from: retrofit-1.9.0.jar:retrofit/Profiler.class */
public interface Profiler<T> {
    T beforeCall();

    void afterCall(RequestInformation requestInformation, long j, int i, T t);

    /* loaded from: retrofit-1.9.0.jar:retrofit/Profiler$RequestInformation.class */
    public static final class RequestInformation {
        private final String method;
        private final String baseUrl;
        private final String relativePath;
        private final long contentLength;
        private final String contentType;

        public RequestInformation(String method, String baseUrl, String relativePath, long contentLength, String contentType) {
            this.method = method;
            this.baseUrl = baseUrl;
            this.relativePath = relativePath;
            this.contentLength = contentLength;
            this.contentType = contentType;
        }

        public String getMethod() {
            return this.method;
        }

        public String getBaseUrl() {
            return this.baseUrl;
        }

        public String getRelativePath() {
            return this.relativePath;
        }

        public long getContentLength() {
            return this.contentLength;
        }

        public String getContentType() {
            return this.contentType;
        }
    }
}
