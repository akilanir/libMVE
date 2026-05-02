package org.springframework.core;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/core/NestedExceptionUtils.class */
public abstract class NestedExceptionUtils {
    public static String buildMessage(String message, Throwable cause) {
        if (cause != null) {
            StringBuilder sb = new StringBuilder();
            if (message != null) {
                sb.append(message).append("; ");
            }
            sb.append("nested exception is ").append(cause);
            return sb.toString();
        }
        return message;
    }
}
