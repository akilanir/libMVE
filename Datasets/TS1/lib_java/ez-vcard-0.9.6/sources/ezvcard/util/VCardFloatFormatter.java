package ezvcard.util;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/util/VCardFloatFormatter.class */
public class VCardFloatFormatter extends DecimalFormat {
    public VCardFloatFormatter() {
        this(6);
    }

    public VCardFloatFormatter(int decimals) {
        setMaximumFractionDigits(decimals);
        if (decimals > 0) {
            setMinimumFractionDigits(1);
        }
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setDecimalSeparator('.');
        symbols.setMinusSign('-');
        setDecimalFormatSymbols(symbols);
    }
}
