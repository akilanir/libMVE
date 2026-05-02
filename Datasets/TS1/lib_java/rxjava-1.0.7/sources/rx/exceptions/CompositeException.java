package rx.exceptions;

import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/* loaded from: rxjava-1.0.7.jar:rx/exceptions/CompositeException.class */
public final class CompositeException extends RuntimeException {
    private static final long serialVersionUID = 3026362227162912146L;
    private final List<Throwable> exceptions;
    private final String message;
    private Throwable cause;

    public CompositeException(String messagePrefix, Collection<? extends Throwable> errors) {
        this.cause = null;
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        List<Throwable> _exceptions = new ArrayList<>();
        for (Throwable ex : errors) {
            if (ex instanceof CompositeException) {
                linkedHashSet.addAll(((CompositeException) ex).getExceptions());
            } else {
                linkedHashSet.add(ex);
            }
        }
        _exceptions.addAll(linkedHashSet);
        this.exceptions = Collections.unmodifiableList(_exceptions);
        this.message = this.exceptions.size() + " exceptions occurred. ";
    }

    public CompositeException(Collection<? extends Throwable> errors) {
        this(null, errors);
    }

    public List<Throwable> getExceptions() {
        return this.exceptions;
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        return this.message;
    }

    @Override // java.lang.Throwable
    public synchronized Throwable getCause() {
        if (this.cause == null) {
            Throwable _cause = new CompositeExceptionCausalChain();
            Set<Throwable> seenCauses = new HashSet<>();
            Throwable chain = _cause;
            Iterator i$ = this.exceptions.iterator();
            while (i$.hasNext()) {
                Throwable e = i$.next();
                if (!seenCauses.contains(e)) {
                    seenCauses.add(e);
                    List<Throwable> listOfCauses = getListOfCauses(e);
                    for (Throwable child : listOfCauses) {
                        if (seenCauses.contains(child)) {
                            e = new RuntimeException("Duplicate found in causal chain so cropping to prevent loop ...");
                        } else {
                            seenCauses.add(child);
                        }
                    }
                    try {
                        chain.initCause(e);
                    } catch (Throwable th) {
                    }
                    chain = chain.getCause();
                }
            }
            this.cause = _cause;
        }
        return this.cause;
    }

    @Override // java.lang.Throwable
    public void printStackTrace() {
        printStackTrace(System.err);
    }

    @Override // java.lang.Throwable
    public void printStackTrace(PrintStream s) {
        printStackTrace(new WrappedPrintStream(s));
    }

    @Override // java.lang.Throwable
    public void printStackTrace(PrintWriter s) {
        printStackTrace(new WrappedPrintWriter(s));
    }

    private void printStackTrace(PrintStreamOrWriter s) {
        StringBuilder bldr = new StringBuilder();
        bldr.append(this).append("\n");
        StackTraceElement[] arr$ = getStackTrace();
        for (StackTraceElement myStackElement : arr$) {
            bldr.append("\tat ").append(myStackElement).append("\n");
        }
        int i = 1;
        for (Throwable ex : this.exceptions) {
            bldr.append("  ComposedException ").append(i).append(" :").append("\n");
            appendStackTrace(bldr, ex, "\t");
            i++;
        }
        synchronized (s.lock()) {
            s.println(bldr.toString());
        }
    }

    private void appendStackTrace(StringBuilder bldr, Throwable ex, String prefix) {
        bldr.append(prefix).append(ex).append("\n");
        StackTraceElement[] arr$ = ex.getStackTrace();
        for (StackTraceElement stackElement : arr$) {
            bldr.append("\t\tat ").append(stackElement).append("\n");
        }
        if (ex.getCause() != null) {
            bldr.append("\tCaused by: ");
            appendStackTrace(bldr, ex.getCause(), "");
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/exceptions/CompositeException$PrintStreamOrWriter.class */
    private static abstract class PrintStreamOrWriter {
        abstract Object lock();

        abstract void println(Object obj);

        private PrintStreamOrWriter() {
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/exceptions/CompositeException$WrappedPrintStream.class */
    private static class WrappedPrintStream extends PrintStreamOrWriter {
        private final PrintStream printStream;

        WrappedPrintStream(PrintStream printStream) {
            super();
            this.printStream = printStream;
        }

        @Override // rx.exceptions.CompositeException.PrintStreamOrWriter
        Object lock() {
            return this.printStream;
        }

        @Override // rx.exceptions.CompositeException.PrintStreamOrWriter
        void println(Object o) {
            this.printStream.println(o);
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/exceptions/CompositeException$WrappedPrintWriter.class */
    private static class WrappedPrintWriter extends PrintStreamOrWriter {
        private final PrintWriter printWriter;

        WrappedPrintWriter(PrintWriter printWriter) {
            super();
            this.printWriter = printWriter;
        }

        @Override // rx.exceptions.CompositeException.PrintStreamOrWriter
        Object lock() {
            return this.printWriter;
        }

        @Override // rx.exceptions.CompositeException.PrintStreamOrWriter
        void println(Object o) {
            this.printWriter.println(o);
        }
    }

    /* loaded from: rxjava-1.0.7.jar:rx/exceptions/CompositeException$CompositeExceptionCausalChain.class */
    static final class CompositeExceptionCausalChain extends RuntimeException {
        private static final long serialVersionUID = 3875212506787802066L;
        static String MESSAGE = "Chain of Causes for CompositeException In Order Received =>";

        CompositeExceptionCausalChain() {
        }

        @Override // java.lang.Throwable
        public String getMessage() {
            return MESSAGE;
        }
    }

    private final List<Throwable> getListOfCauses(Throwable ex) {
        List<Throwable> list = new ArrayList<>();
        Throwable root = ex.getCause();
        if (root == null) {
            return list;
        }
        while (true) {
            list.add(root);
            if (root.getCause() == null) {
                return list;
            }
            root = root.getCause();
        }
    }
}
