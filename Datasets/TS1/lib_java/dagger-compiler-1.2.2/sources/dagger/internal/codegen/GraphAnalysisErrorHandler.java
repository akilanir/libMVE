package dagger.internal.codegen;

import dagger.internal.Linker;
import java.util.List;
import javax.annotation.processing.ProcessingEnvironment;
import javax.lang.model.element.TypeElement;
import javax.tools.Diagnostic;

/* loaded from: dagger-compiler-1.2.2.jar:dagger/internal/codegen/GraphAnalysisErrorHandler.class */
final class GraphAnalysisErrorHandler implements Linker.ErrorHandler {
    private final ProcessingEnvironment processingEnv;
    private final String moduleName;

    GraphAnalysisErrorHandler(ProcessingEnvironment processingEnv, String moduleName) {
        this.processingEnv = processingEnv;
        this.moduleName = moduleName;
    }

    public void handleErrors(List<String> errors) {
        TypeElement module = this.processingEnv.getElementUtils().getTypeElement(this.moduleName);
        for (String error : errors) {
            this.processingEnv.getMessager().printMessage(Diagnostic.Kind.ERROR, error + " for " + this.moduleName, module);
        }
    }
}
