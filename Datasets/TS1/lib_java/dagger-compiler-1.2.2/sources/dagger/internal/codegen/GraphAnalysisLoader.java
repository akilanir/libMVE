package dagger.internal.codegen;

import dagger.internal.Binding;
import dagger.internal.Loader;
import dagger.internal.ModuleAdapter;
import dagger.internal.StaticInjection;
import javax.annotation.processing.ProcessingEnvironment;
import javax.lang.model.element.ElementKind;
import javax.lang.model.element.TypeElement;

/* loaded from: dagger-compiler-1.2.2.jar:dagger/internal/codegen/GraphAnalysisLoader.class */
public final class GraphAnalysisLoader extends Loader {
    private final ProcessingEnvironment processingEnv;

    public GraphAnalysisLoader(ProcessingEnvironment processingEnv) {
        this.processingEnv = processingEnv;
    }

    public Binding<?> getAtInjectBinding(String key, String className, ClassLoader classLoader, boolean mustHaveInjections) {
        String sourceClassName = className.replace('$', '.');
        TypeElement type = this.processingEnv.getElementUtils().getTypeElement(sourceClassName);
        if (type == null || type.getKind() == ElementKind.INTERFACE) {
            return null;
        }
        return GraphAnalysisInjectBinding.create(type, mustHaveInjections);
    }

    public <T> ModuleAdapter<T> getModuleAdapter(Class<T> moduleClass) {
        throw new UnsupportedOperationException();
    }

    public StaticInjection getStaticInjection(Class<?> injectedClass) {
        throw new UnsupportedOperationException();
    }
}
