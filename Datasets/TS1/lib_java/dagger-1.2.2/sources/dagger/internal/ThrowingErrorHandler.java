package dagger.internal;

import dagger.internal.Linker;
import java.util.List;

/* loaded from: dagger-1.2.2.jar:dagger/internal/ThrowingErrorHandler.class */
public final class ThrowingErrorHandler implements Linker.ErrorHandler {
    @Override // dagger.internal.Linker.ErrorHandler
    public void handleErrors(List<String> errors) {
        if (errors.isEmpty()) {
            return;
        }
        StringBuilder message = new StringBuilder();
        message.append("Errors creating object graph:");
        for (String error : errors) {
            message.append("\n  ").append(error);
        }
        throw new IllegalStateException(message.toString());
    }
}
