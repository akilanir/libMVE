package me.drakeet.mailotto;

/* loaded from: me.drakeet.mailotto.mailotto.1.0.2.jar:me/drakeet/mailotto/Mail.class */
public class Mail {
    public Class<?> from;
    public Class<?> to;
    public Object content;

    public Mail(Object content, Class<?> to) {
        this(content, to, null);
    }

    public Mail(Object content, Class<?> to, Class<?> from) {
        this.to = to;
        this.from = from;
        this.content = content;
    }
}
