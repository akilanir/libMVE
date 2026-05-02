package rx.plugins;

/* loaded from: rxjava-1.0.7.jar:rx/plugins/RxJavaObservableExecutionHookDefault.class */
class RxJavaObservableExecutionHookDefault extends RxJavaObservableExecutionHook {
    private static RxJavaObservableExecutionHookDefault INSTANCE = new RxJavaObservableExecutionHookDefault();

    RxJavaObservableExecutionHookDefault() {
    }

    public static RxJavaObservableExecutionHook getInstance() {
        return INSTANCE;
    }
}
