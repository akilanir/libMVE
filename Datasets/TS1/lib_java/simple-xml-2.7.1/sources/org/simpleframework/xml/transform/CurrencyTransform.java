package org.simpleframework.xml.transform;

import java.util.Currency;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/CurrencyTransform.class */
class CurrencyTransform implements Transform<Currency> {
    CurrencyTransform() {
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.simpleframework.xml.transform.Transform
    public Currency read(String symbol) {
        return Currency.getInstance(symbol);
    }

    @Override // org.simpleframework.xml.transform.Transform
    public String write(Currency currency) {
        return currency.toString();
    }
}
