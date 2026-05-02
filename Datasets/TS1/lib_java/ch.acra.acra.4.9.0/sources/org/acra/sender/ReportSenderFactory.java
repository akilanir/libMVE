package org.acra.sender;

import android.content.Context;
import android.support.annotation.NonNull;
import org.acra.config.ACRAConfiguration;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/sender/ReportSenderFactory.class */
public interface ReportSenderFactory {
    @NonNull
    ReportSender create(@NonNull Context context, @NonNull ACRAConfiguration aCRAConfiguration);
}
