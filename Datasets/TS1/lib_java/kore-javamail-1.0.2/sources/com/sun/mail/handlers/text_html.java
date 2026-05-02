package com.sun.mail.handlers;

import korex.activation.ActivationDataFlavor;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/handlers/text_html.class */
public class text_html extends text_plain {
    private static ActivationDataFlavor myDF = new ActivationDataFlavor(String.class, "text/html", "HTML String");

    @Override // com.sun.mail.handlers.text_plain
    protected ActivationDataFlavor getDF() {
        return myDF;
    }
}
