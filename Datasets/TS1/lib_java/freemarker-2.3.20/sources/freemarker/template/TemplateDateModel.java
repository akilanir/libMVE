package freemarker.template;

import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateDateModel.class */
public interface TemplateDateModel extends TemplateModel {
    public static final int UNKNOWN = 0;
    public static final int TIME = 1;
    public static final int DATE = 2;
    public static final int DATETIME = 3;
    public static final List TYPE_NAMES = Collections.unmodifiableList(Arrays.asList("UNKNOWN", "TIME", "DATE", "DATETIME"));

    Date getAsDate() throws TemplateModelException;

    int getDateType();
}
