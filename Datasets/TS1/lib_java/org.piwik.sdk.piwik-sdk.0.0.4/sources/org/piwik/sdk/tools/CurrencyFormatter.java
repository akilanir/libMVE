package org.piwik.sdk.tools;

import java.text.DecimalFormat;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.4.jar:org/piwik/sdk/tools/CurrencyFormatter.class */
public class CurrencyFormatter {
    public static String priceString(int cents) {
        DecimalFormat form = new DecimalFormat("0.00");
        return form.format(cents / 100.0d);
    }
}
