package retrofit;

/* loaded from: retrofit-1.9.0.jar:retrofit/ErrorHandler.class */
public interface ErrorHandler {
    public static final ErrorHandler DEFAULT = new ErrorHandler() { // from class: retrofit.ErrorHandler.1
        @Override // retrofit.ErrorHandler
        public Throwable handleError(RetrofitError cause) {
            return cause;
        }
    };

    Throwable handleError(RetrofitError retrofitError);
}
