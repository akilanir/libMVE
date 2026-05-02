package freemarker.core;

import java.io.PrintWriter;
import java.util.Collections;
import java.util.Set;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/_CoreAPI.class */
public class _CoreAPI {
    public static final String STACK_SECTION_SEPARATOR = "----------";

    private _CoreAPI() {
    }

    public static Set getSupportedBuiltInNames() {
        return Collections.unmodifiableSet(BuiltIn.builtins.keySet());
    }

    public static String instructionStackItemToString(TemplateElement stackEl) {
        return Environment.instructionStackItemToString(stackEl);
    }

    public static TemplateElement[] getInstructionStackSnapshot(Environment env) {
        return env.getInstructionStackSnapshot();
    }

    public static void outputInstructionStack(TemplateElement[] instructionStackSnapshot, PrintWriter pw) {
        Environment.outputInstructionStack(instructionStackSnapshot, pw);
    }
}
