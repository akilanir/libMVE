package ch.qos.logback.classic.pattern;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.classic.spi.IThrowableProxy;
import ch.qos.logback.classic.spi.StackTraceElementProxy;
import ch.qos.logback.classic.spi.ThrowableProxyUtil;
import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.boolex.EvaluationException;
import ch.qos.logback.core.boolex.EventEvaluator;
import ch.qos.logback.core.status.ErrorStatus;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/ThrowableProxyConverter.class */
public class ThrowableProxyConverter extends ThrowableHandlingConverter {
    protected static final int BUILDER_CAPACITY = 2048;
    int lengthOption;
    List<EventEvaluator<ILoggingEvent>> evaluatorList = null;
    int errorCount = 0;

    public void start() {
        String firstOption = getFirstOption();
        if (firstOption == null) {
            this.lengthOption = Level.OFF_INT;
        } else {
            String lowerCase = firstOption.toLowerCase();
            if ("full".equals(lowerCase)) {
                this.lengthOption = Level.OFF_INT;
            } else if ("short".equals(lowerCase)) {
                this.lengthOption = 1;
            } else {
                try {
                    this.lengthOption = Integer.parseInt(lowerCase);
                } catch (NumberFormatException e) {
                    addError("Could not parse [" + lowerCase + "] as an integer");
                    this.lengthOption = Level.OFF_INT;
                }
            }
        }
        List optionList = getOptionList();
        if (optionList != null && optionList.size() > 1) {
            int size = optionList.size();
            for (int i = 1; i < size; i++) {
                addEvaluator((EventEvaluator) ((Map) getContext().getObject("EVALUATOR_MAP")).get((String) optionList.get(i)));
            }
        }
        super.start();
    }

    private void addEvaluator(EventEvaluator<ILoggingEvent> eventEvaluator) {
        if (this.evaluatorList == null) {
            this.evaluatorList = new ArrayList();
        }
        this.evaluatorList.add(eventEvaluator);
    }

    public void stop() {
        this.evaluatorList = null;
        super.stop();
    }

    protected void extraData(StringBuilder sb, StackTraceElementProxy stackTraceElementProxy) {
    }

    public String convert(ILoggingEvent iLoggingEvent) {
        IThrowableProxy throwableProxy = iLoggingEvent.getThrowableProxy();
        if (throwableProxy == null) {
            return "";
        }
        if (this.evaluatorList != null) {
            boolean z = true;
            int i = 0;
            while (true) {
                if (i >= this.evaluatorList.size()) {
                    break;
                }
                EventEvaluator<ILoggingEvent> eventEvaluator = this.evaluatorList.get(i);
                try {
                } catch (EvaluationException e) {
                    this.errorCount++;
                    if (this.errorCount < 4) {
                        addError("Exception thrown for evaluator named [" + eventEvaluator.getName() + "]", e);
                    } else if (this.errorCount == 4) {
                        ErrorStatus errorStatus = new ErrorStatus("Exception thrown for evaluator named [" + eventEvaluator.getName() + "].", this, e);
                        errorStatus.add(new ErrorStatus("This was the last warning about this evaluator's errors.We don't want the StatusManager to get flooded.", this));
                        addStatus(errorStatus);
                    }
                }
                if (eventEvaluator.evaluate(iLoggingEvent)) {
                    z = false;
                    break;
                }
                i++;
            }
            if (!z) {
                return "";
            }
        }
        return throwableProxyToString(throwableProxy);
    }

    protected String throwableProxyToString(IThrowableProxy iThrowableProxy) {
        StringBuilder sb = new StringBuilder(BUILDER_CAPACITY);
        recursiveAppend(sb, null, 1, iThrowableProxy);
        return sb.toString();
    }

    private void recursiveAppend(StringBuilder sb, String str, int i, IThrowableProxy iThrowableProxy) {
        if (iThrowableProxy == null) {
            return;
        }
        subjoinFirstLine(sb, str, i, iThrowableProxy);
        sb.append(CoreConstants.LINE_SEPARATOR);
        subjoinSTEPArray(sb, i, iThrowableProxy);
        IThrowableProxy[] suppressed = iThrowableProxy.getSuppressed();
        if (suppressed != null) {
            for (IThrowableProxy iThrowableProxy2 : suppressed) {
                recursiveAppend(sb, "Suppressed: ", i + 1, iThrowableProxy2);
            }
        }
        recursiveAppend(sb, "Caused by: ", i, iThrowableProxy.getCause());
    }

    private void subjoinFirstLine(StringBuilder sb, String str, int i, IThrowableProxy iThrowableProxy) {
        ThrowableProxyUtil.indent(sb, i - 1);
        if (str != null) {
            sb.append(str);
        }
        subjoinExceptionMessage(sb, iThrowableProxy);
    }

    private void subjoinExceptionMessage(StringBuilder sb, IThrowableProxy iThrowableProxy) {
        sb.append(iThrowableProxy.getClassName()).append(": ").append(iThrowableProxy.getMessage());
    }

    protected void subjoinSTEPArray(StringBuilder sb, int i, IThrowableProxy iThrowableProxy) {
        StackTraceElementProxy[] stackTraceElementProxyArray = iThrowableProxy.getStackTraceElementProxyArray();
        int commonFrames = iThrowableProxy.getCommonFrames();
        boolean z = this.lengthOption > stackTraceElementProxyArray.length;
        int length = z ? stackTraceElementProxyArray.length : this.lengthOption;
        if (commonFrames > 0 && z) {
            length -= commonFrames;
        }
        for (int i2 = 0; i2 < length; i2++) {
            ThrowableProxyUtil.indent(sb, i);
            sb.append(stackTraceElementProxyArray[i2]);
            extraData(sb, stackTraceElementProxyArray[i2]);
            sb.append(CoreConstants.LINE_SEPARATOR);
        }
        if (commonFrames <= 0 || !z) {
            return;
        }
        ThrowableProxyUtil.indent(sb, i);
        sb.append("... ").append(iThrowableProxy.getCommonFrames()).append(" common frames omitted").append(CoreConstants.LINE_SEPARATOR);
    }
}
