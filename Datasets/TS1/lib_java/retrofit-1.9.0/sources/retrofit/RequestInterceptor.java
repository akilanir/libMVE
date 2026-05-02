package retrofit;

/* loaded from: retrofit-1.9.0.jar:retrofit/RequestInterceptor.class */
public interface RequestInterceptor {
    public static final RequestInterceptor NONE = new RequestInterceptor() { // from class: retrofit.RequestInterceptor.1
        @Override // retrofit.RequestInterceptor
        public void intercept(RequestFacade request) {
        }
    };

    /* loaded from: retrofit-1.9.0.jar:retrofit/RequestInterceptor$RequestFacade.class */
    public interface RequestFacade {
        void addHeader(String str, String str2);

        void addPathParam(String str, String str2);

        void addEncodedPathParam(String str, String str2);

        void addQueryParam(String str, String str2);

        void addEncodedQueryParam(String str, String str2);
    }

    void intercept(RequestFacade requestFacade);
}
