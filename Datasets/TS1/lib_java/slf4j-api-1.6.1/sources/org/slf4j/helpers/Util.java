package org.slf4j.helpers;

/* loaded from: slf4j-api-1.6.1.jar:org/slf4j/helpers/Util.class */
public class Util {
    public static final void report(String msg, Throwable t) {
        System.err.println(msg);
        System.err.println("Reported exception:");
        t.printStackTrace();
    }

    public static final void report(String msg) {
        System.err.println(new StringBuffer().append("SLF4J: ").append(msg).toString());
    }
}
