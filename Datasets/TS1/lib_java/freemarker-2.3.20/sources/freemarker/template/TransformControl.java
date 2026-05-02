package freemarker.template;

import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TransformControl.class */
public interface TransformControl {
    public static final int REPEAT_EVALUATION = 0;
    public static final int END_EVALUATION = 1;
    public static final int SKIP_BODY = 0;
    public static final int EVALUATE_BODY = 1;

    int onStart() throws TemplateModelException, IOException;

    int afterBody() throws TemplateModelException, IOException;

    void onError(Throwable th) throws Throwable;
}
