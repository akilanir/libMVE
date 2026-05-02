package org.acra.sender;

import android.content.Context;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import org.acra.ACRA;
import org.acra.ACRAConstants;
import org.acra.ReportField;
import org.acra.collections.ImmutableSet;
import org.acra.collector.CrashReportData;
import org.acra.config.ACRAConfiguration;
import org.acra.util.HttpRequest;
import org.acra.util.JSONReportBuilder;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/sender/HttpSender.class */
public class HttpSender implements ReportSender {
    private final ACRAConfiguration config;

    @Nullable
    private final Uri mFormUri;
    private final Map<ReportField, String> mMapping;
    private final Method mMethod;
    private final Type mType;

    @Nullable
    private String mUsername;

    @Nullable
    private String mPassword;

    /* loaded from: ch.acra.acra.4.9.0.jar:org/acra/sender/HttpSender$Method.class */
    public enum Method {
        POST,
        PUT
    }

    /* loaded from: ch.acra.acra.4.9.0.jar:org/acra/sender/HttpSender$Type.class */
    public enum Type {
        FORM { // from class: org.acra.sender.HttpSender.Type.1
            @Override // org.acra.sender.HttpSender.Type
            @NonNull
            public String getContentType() {
                return "application/x-www-form-urlencoded";
            }
        },
        JSON { // from class: org.acra.sender.HttpSender.Type.2
            @Override // org.acra.sender.HttpSender.Type
            @NonNull
            public String getContentType() {
                return "application/json";
            }
        };

        @NonNull
        public abstract String getContentType();
    }

    public HttpSender(@NonNull ACRAConfiguration config, @NonNull Method method, @NonNull Type type, @Nullable Map<ReportField, String> mapping) {
        this(config, method, type, null, mapping);
    }

    public HttpSender(@NonNull ACRAConfiguration config, @NonNull Method method, @NonNull Type type, @Nullable String formUri, @Nullable Map<ReportField, String> mapping) {
        this.config = config;
        this.mMethod = method;
        this.mFormUri = formUri == null ? null : Uri.parse(formUri);
        this.mMapping = mapping;
        this.mType = type;
        this.mUsername = null;
        this.mPassword = null;
    }

    public void setBasicAuth(@Nullable String username, @Nullable String password) {
        this.mUsername = username;
        this.mPassword = password;
    }

    @Override // org.acra.sender.ReportSender
    public void send(@NonNull Context context, @NonNull CrashReportData report) throws ReportSenderException {
        String reportAsString;
        try {
            URL reportUrl = this.mFormUri == null ? new URL(this.config.formUri()) : new URL(this.mFormUri.toString());
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Connect to " + reportUrl.toString());
            }
            String login = this.mUsername != null ? this.mUsername : isNull(this.config.formUriBasicAuthLogin()) ? null : this.config.formUriBasicAuthLogin();
            String password = this.mPassword != null ? this.mPassword : isNull(this.config.formUriBasicAuthPassword()) ? null : this.config.formUriBasicAuthPassword();
            HttpRequest request = new HttpRequest(this.config);
            request.setConnectionTimeOut(this.config.connectionTimeout());
            request.setSocketTimeOut(this.config.socketTimeout());
            request.setLogin(login);
            request.setPassword(password);
            request.setHeaders(this.config.getHttpHeaders());
            switch (this.mType) {
                case JSON:
                    reportAsString = report.toJSON().toString();
                    break;
                case FORM:
                default:
                    Map<String, String> finalReport = remap(report);
                    reportAsString = HttpRequest.getParamsAsFormString(finalReport);
                    break;
            }
            switch (this.mMethod) {
                case POST:
                    break;
                case PUT:
                    reportUrl = new URL(reportUrl.toString() + '/' + report.getProperty(ReportField.REPORT_ID));
                    break;
                default:
                    throw new UnsupportedOperationException("Unknown method: " + this.mMethod.name());
            }
            request.send(context, reportUrl, this.mMethod, reportAsString, this.mType);
        } catch (IOException e) {
            throw new ReportSenderException("Error while sending " + this.config.reportType() + " report via Http " + this.mMethod.name(), e);
        } catch (JSONReportBuilder.JSONReportException e2) {
            throw new ReportSenderException("Error while sending " + this.config.reportType() + " report via Http " + this.mMethod.name(), e2);
        }
    }

    @NonNull
    private Map<String, String> remap(@NonNull Map<ReportField, String> report) {
        Set<ReportField> fields = this.config.getReportFields();
        if (fields.isEmpty()) {
            fields = new ImmutableSet<>(ACRAConstants.DEFAULT_REPORT_FIELDS);
        }
        Map<String, String> finalReport = new HashMap<>(report.size());
        for (ReportField field : fields) {
            if (this.mMapping == null || this.mMapping.get(field) == null) {
                finalReport.put(field.toString(), report.get(field));
            } else {
                finalReport.put(this.mMapping.get(field), report.get(field));
            }
        }
        return finalReport;
    }

    private boolean isNull(@Nullable String aString) {
        return aString == null || ACRAConstants.NULL_VALUE.equals(aString);
    }
}
