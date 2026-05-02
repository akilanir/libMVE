package org.acra.sender;

import android.content.Context;
import android.support.annotation.NonNull;
import org.acra.config.ACRAConfiguration;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/sender/HttpSenderFactory.class */
public final class HttpSenderFactory implements ReportSenderFactory {
    @Override // org.acra.sender.ReportSenderFactory
    @NonNull
    public ReportSender create(@NonNull Context context, @NonNull ACRAConfiguration config) {
        return new HttpSender(config, config.httpMethod(), config.reportType(), null);
    }
}
