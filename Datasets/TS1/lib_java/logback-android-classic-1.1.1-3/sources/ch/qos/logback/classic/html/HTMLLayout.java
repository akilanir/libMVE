package ch.qos.logback.classic.html;

import ch.qos.logback.classic.PatternLayout;
import ch.qos.logback.classic.pattern.MDCConverter;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.html.HTMLLayoutBase;
import ch.qos.logback.core.html.IThrowableRenderer;
import ch.qos.logback.core.pattern.Converter;
import java.util.Map;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/html/HTMLLayout.class */
public class HTMLLayout extends HTMLLayoutBase<ILoggingEvent> {
    static final String DEFAULT_CONVERSION_PATTERN = "%date%thread%level%logger%mdc%msg";
    IThrowableRenderer<ILoggingEvent> throwableRenderer;

    public HTMLLayout() {
        this.pattern = DEFAULT_CONVERSION_PATTERN;
        this.throwableRenderer = new DefaultThrowableRenderer();
        this.cssBuilder = new DefaultCssBuilder();
    }

    public void start() {
        int i = 0;
        if (this.throwableRenderer == null) {
            addError("ThrowableRender cannot be null.");
            i = 0 + 1;
        }
        if (i == 0) {
            super.start();
        }
    }

    protected Map<String, String> getDefaultConverterMap() {
        return PatternLayout.defaultConverterMap;
    }

    /*  JADX ERROR: Failed to decode insn: 0x0014: MOVE_MULTI
        java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[8]
        	at java.base/java.lang.System.arraycopy(Native Method)
        	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
        	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
        	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
        	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
        	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
        	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
        	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
        	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
        	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    public java.lang.String doLayout(ch.qos.logback.classic.spi.ILoggingEvent r9) {
        /*
            r8 = this;
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r1 = r0
            r1.<init>()
            r10 = r0
            r0 = r8
            r1 = r10
            r0.startNewTableIfLimitReached(r1)
            r0 = 1
            r11 = r0
            r0 = r8
            r1 = r0
            long r1 = r1.counter
            // decode failed: arraycopy: source index -1 out of bounds for object array[8]
            r2 = 1
            long r1 = r1 + r2
            r0.counter = r1
            r0 = 1
            long r-1 = r-1 & r0
            r0 = 0
            int r-1 = (r-1 > r0 ? 1 : (r-1 == r0 ? 0 : -1))
            if (r-1 != 0) goto L23
            r-1 = 0
            r11 = r-1
            r-1 = r9
            r-1.getLevel()
            r-1.toString()
            r-1.toLowerCase()
            r12 = r-1
            r-1 = r10
            java.lang.String r0 = ch.qos.logback.core.CoreConstants.LINE_SEPARATOR
            r-1.append(r0)
            r-1 = r10
            java.lang.String r0 = "<tr class=\""
            r-1.append(r0)
            r-1 = r10
            r0 = r12
            r-1.append(r0)
            r-1 = r11
            if (r-1 == 0) goto L55
            r-1 = r10
            java.lang.String r0 = " odd\">"
            r-1.append(r0)
            goto L5c
            r-1 = r10
            java.lang.String r0 = " even\">"
            r-1.append(r0)
            r-1 = r10
            java.lang.String r0 = ch.qos.logback.core.CoreConstants.LINE_SEPARATOR
            r-1.append(r0)
            r-1 = r8
            ch.qos.logback.core.pattern.Converter r-1 = r-1.head
            r13 = r-1
            r-1 = r13
            if (r-1 == 0) goto L81
            r-1 = r8
            r0 = r10
            r1 = r13
            r2 = r9
            r-1.appendEventToBuffer(r0, r1, r2)
            r-1 = r13
            r-1.getNext()
            r13 = r-1
            goto L6a
            r-1 = r10
            java.lang.String r0 = "</tr>"
            r-1.append(r0)
            r-1 = r10
            java.lang.String r0 = ch.qos.logback.core.CoreConstants.LINE_SEPARATOR
            r-1.append(r0)
            r-1 = r9
            r-1.getThrowableProxy()
            if (r-1 == 0) goto La4
            r-1 = r8
            ch.qos.logback.core.html.IThrowableRenderer<ch.qos.logback.classic.spi.ILoggingEvent> r-1 = r-1.throwableRenderer
            r0 = r10
            r1 = r9
            r-1.render(r0, r1)
            r-1 = r10
            r-1.toString()
            return r-1
        */
        throw new UnsupportedOperationException("Method not decompiled: ch.qos.logback.classic.html.HTMLLayout.doLayout(ch.qos.logback.classic.spi.ILoggingEvent):java.lang.String");
    }

    private void appendEventToBuffer(StringBuilder sb, Converter<ILoggingEvent> converter, ILoggingEvent iLoggingEvent) {
        sb.append("<td class=\"");
        sb.append(computeConverterName(converter));
        sb.append("\">");
        converter.write(sb, iLoggingEvent);
        sb.append("</td>");
        sb.append(CoreConstants.LINE_SEPARATOR);
    }

    public IThrowableRenderer getThrowableRenderer() {
        return this.throwableRenderer;
    }

    public void setThrowableRenderer(IThrowableRenderer<ILoggingEvent> iThrowableRenderer) {
        this.throwableRenderer = iThrowableRenderer;
    }

    protected String computeConverterName(Converter converter) {
        if (!(converter instanceof MDCConverter)) {
            return super.computeConverterName(converter);
        }
        String firstOption = ((MDCConverter) converter).getFirstOption();
        return firstOption != null ? firstOption : "MDC";
    }
}
