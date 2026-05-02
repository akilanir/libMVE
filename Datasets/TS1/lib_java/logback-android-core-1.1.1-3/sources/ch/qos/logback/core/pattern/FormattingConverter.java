package ch.qos.logback.core.pattern;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/FormattingConverter.class */
public abstract class FormattingConverter<E> extends Converter<E> {
    static final int INITIAL_BUF_SIZE = 256;
    static final int MAX_CAPACITY = 1024;
    FormatInfo formattingInfo;

    public final FormatInfo getFormattingInfo() {
        return this.formattingInfo;
    }

    public final void setFormattingInfo(FormatInfo formatInfo) {
        if (this.formattingInfo != null) {
            throw new IllegalStateException("FormattingInfo has been already set");
        }
        this.formattingInfo = formatInfo;
    }

    @Override // ch.qos.logback.core.pattern.Converter
    public final void write(StringBuilder sb, E e) {
        String convert = convert(e);
        if (this.formattingInfo == null) {
            sb.append(convert);
            return;
        }
        int min = this.formattingInfo.getMin();
        int max = this.formattingInfo.getMax();
        if (convert == null) {
            if (0 < min) {
                SpacePadder.spacePad(sb, min);
                return;
            }
            return;
        }
        int length = convert.length();
        if (length > max) {
            if (this.formattingInfo.isLeftTruncate()) {
                sb.append(convert.substring(length - max));
                return;
            } else {
                sb.append(convert.substring(0, max));
                return;
            }
        }
        if (length >= min) {
            sb.append(convert);
        } else if (this.formattingInfo.isLeftPad()) {
            SpacePadder.leftPad(sb, convert, min);
        } else {
            SpacePadder.rightPad(sb, convert, min);
        }
    }
}
