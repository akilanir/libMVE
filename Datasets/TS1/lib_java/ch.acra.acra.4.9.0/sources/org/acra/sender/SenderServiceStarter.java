package org.acra.sender;

import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import java.util.ArrayList;
import org.acra.ACRA;
import org.acra.config.ACRAConfiguration;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/sender/SenderServiceStarter.class */
public class SenderServiceStarter {
    private final Context context;
    private final ACRAConfiguration config;

    public SenderServiceStarter(@NonNull Context context, @NonNull ACRAConfiguration config) {
        this.context = context;
        this.config = config;
    }

    public void startService(boolean onlySendSilentReports, boolean approveReportsFirst) {
        if (ACRA.DEV_LOGGING) {
            ACRA.log.d(ACRA.LOG_TAG, "About to start SenderService");
        }
        Intent intent = new Intent(this.context, (Class<?>) SenderService.class);
        intent.putExtra(SenderService.EXTRA_ONLY_SEND_SILENT_REPORTS, onlySendSilentReports);
        intent.putExtra(SenderService.EXTRA_APPROVE_REPORTS_FIRST, approveReportsFirst);
        intent.putExtra(SenderService.EXTRA_REPORT_SENDER_FACTORIES, new ArrayList(this.config.reportSenderFactoryClasses()));
        intent.putExtra(SenderService.EXTRA_ACRA_CONFIG, this.config);
        this.context.startService(intent);
    }
}
