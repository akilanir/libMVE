package dagger.internal.codegen;

import dagger.internal.Linker;
import dagger.internal.StaticInjection;
import javax.inject.Inject;
import javax.lang.model.element.Element;

/* loaded from: dagger-compiler-1.2.2.jar:dagger/internal/codegen/GraphAnalysisStaticInjection.class */
public final class GraphAnalysisStaticInjection extends StaticInjection {
    private final Element enclosingClass;

    public GraphAnalysisStaticInjection(Element enclosingClass) {
        this.enclosingClass = enclosingClass;
    }

    public void attach(Linker linker) {
        for (Element enclosedElement : this.enclosingClass.getEnclosedElements()) {
            if (enclosedElement.getKind().isField() && Util.isStatic(enclosedElement)) {
                Inject injectAnnotation = enclosedElement.getAnnotation(Inject.class);
                if (injectAnnotation != null) {
                    String key = GeneratorKeys.get(enclosedElement.asType());
                    linker.requestBinding(key, this.enclosingClass.toString(), getClass().getClassLoader());
                }
            }
        }
    }

    public void inject() {
        throw new UnsupportedOperationException();
    }
}
