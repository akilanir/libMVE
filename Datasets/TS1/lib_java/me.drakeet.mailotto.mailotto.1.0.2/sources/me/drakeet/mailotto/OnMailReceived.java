package me.drakeet.mailotto;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: me.drakeet.mailotto.mailotto.1.0.2.jar:me/drakeet/mailotto/OnMailReceived.class */
public @interface OnMailReceived {
}
