package rx.functions;

import java.util.concurrent.Callable;

/* loaded from: rxjava-1.0.7.jar:rx/functions/Func0.class */
public interface Func0<R> extends Function, Callable<R> {
    R call();
}
