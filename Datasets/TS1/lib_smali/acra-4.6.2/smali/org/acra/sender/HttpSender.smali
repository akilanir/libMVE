.class public Lorg/acra/sender/HttpSender;
.super Ljava/lang/Object;
.source "HttpSender.java"

# interfaces
.implements Lorg/acra/sender/ReportSender;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/acra/sender/HttpSender$1;,
        Lorg/acra/sender/HttpSender$Type;,
        Lorg/acra/sender/HttpSender$Method;
    }
.end annotation


# instance fields
.field private final mFormUri:Landroid/net/Uri;

.field private final mMapping:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/acra/ReportField;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mMethod:Lorg/acra/sender/HttpSender$Method;

.field private mPassword:Ljava/lang/String;

.field private final mType:Lorg/acra/sender/HttpSender$Type;

.field private mUsername:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/acra/sender/HttpSender$Method;Lorg/acra/sender/HttpSender$Type;Ljava/lang/String;Ljava/util/Map;)V
    .registers 7
    .param p1, "method"    # Lorg/acra/sender/HttpSender$Method;
    .param p2, "type"    # Lorg/acra/sender/HttpSender$Type;
    .param p3, "formUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/acra/sender/HttpSender$Method;",
            "Lorg/acra/sender/HttpSender$Type;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Lorg/acra/ReportField;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p4, "mapping":Ljava/util/Map;, "Ljava/util/Map<Lorg/acra/ReportField;Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 178
    iput-object p1, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    .line 179
    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/sender/HttpSender;->mFormUri:Landroid/net/Uri;

    .line 180
    iput-object p4, p0, Lorg/acra/sender/HttpSender;->mMapping:Ljava/util/Map;

    .line 181
    iput-object p2, p0, Lorg/acra/sender/HttpSender;->mType:Lorg/acra/sender/HttpSender$Type;

    .line 182
    iput-object v1, p0, Lorg/acra/sender/HttpSender;->mUsername:Ljava/lang/String;

    .line 183
    iput-object v1, p0, Lorg/acra/sender/HttpSender;->mPassword:Ljava/lang/String;

    .line 184
    return-void
.end method

.method public constructor <init>(Lorg/acra/sender/HttpSender$Method;Lorg/acra/sender/HttpSender$Type;Ljava/util/Map;)V
    .registers 5
    .param p1, "method"    # Lorg/acra/sender/HttpSender$Method;
    .param p2, "type"    # Lorg/acra/sender/HttpSender$Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/acra/sender/HttpSender$Method;",
            "Lorg/acra/sender/HttpSender$Type;",
            "Ljava/util/Map",
            "<",
            "Lorg/acra/ReportField;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "mapping":Ljava/util/Map;, "Ljava/util/Map<Lorg/acra/ReportField;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 144
    iput-object p1, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    .line 145
    iput-object v0, p0, Lorg/acra/sender/HttpSender;->mFormUri:Landroid/net/Uri;

    .line 146
    iput-object p3, p0, Lorg/acra/sender/HttpSender;->mMapping:Ljava/util/Map;

    .line 147
    iput-object p2, p0, Lorg/acra/sender/HttpSender;->mType:Lorg/acra/sender/HttpSender$Type;

    .line 148
    iput-object v0, p0, Lorg/acra/sender/HttpSender;->mUsername:Ljava/lang/String;

    .line 149
    iput-object v0, p0, Lorg/acra/sender/HttpSender;->mPassword:Ljava/lang/String;

    .line 150
    return-void
.end method

.method private remap(Ljava/util/Map;)Ljava/util/Map;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lorg/acra/ReportField;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 260
    .local p1, "report":Ljava/util/Map;, "Ljava/util/Map<Lorg/acra/ReportField;Ljava/lang/String;>;"
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v6

    invoke-virtual {v6}, Lorg/acra/ACRAConfiguration;->customReportContent()[Lorg/acra/ReportField;

    move-result-object v2

    .line 261
    .local v2, "fields":[Lorg/acra/ReportField;
    array-length v6, v2

    if-nez v6, :cond_d

    .line 262
    sget-object v2, Lorg/acra/ACRAConstants;->DEFAULT_REPORT_FIELDS:[Lorg/acra/ReportField;

    .line 265
    :cond_d
    new-instance v3, Ljava/util/HashMap;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v6

    invoke-direct {v3, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 266
    .local v3, "finalReport":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    move-object v0, v2

    .local v0, "arr$":[Lorg/acra/ReportField;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_19
    if-ge v4, v5, :cond_45

    aget-object v1, v0, v4

    .line 267
    .local v1, "field":Lorg/acra/ReportField;
    iget-object v6, p0, Lorg/acra/sender/HttpSender;->mMapping:Ljava/util/Map;

    if-eqz v6, :cond_29

    iget-object v6, p0, Lorg/acra/sender/HttpSender;->mMapping:Ljava/util/Map;

    invoke-interface {v6, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_37

    .line 268
    :cond_29
    invoke-virtual {v1}, Lorg/acra/ReportField;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v3, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    :goto_34
    add-int/lit8 v4, v4, 0x1

    goto :goto_19

    .line 270
    :cond_37
    iget-object v6, p0, Lorg/acra/sender/HttpSender;->mMapping:Ljava/util/Map;

    invoke-interface {v6, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v3, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_34

    .line 273
    .end local v1    # "field":Lorg/acra/ReportField;
    :cond_45
    return-object v3
.end method


# virtual methods
.method public send(Landroid/content/Context;Lorg/acra/collector/CrashReportData;)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "report"    # Lorg/acra/collector/CrashReportData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/acra/sender/ReportSenderException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 207
    :try_start_1
    iget-object v1, p0, Lorg/acra/sender/HttpSender;->mFormUri:Landroid/net/Uri;

    if-nez v1, :cond_e6

    new-instance v2, Ljava/net/URL;

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ACRAConfiguration;->formUri()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 208
    .local v2, "reportUrl":Ljava/net/URL;
    :goto_12
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Connect to "

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v3, v5}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 210
    iget-object v1, p0, Lorg/acra/sender/HttpSender;->mUsername:Ljava/lang/String;

    if-eqz v1, :cond_125

    iget-object v8, p0, Lorg/acra/sender/HttpSender;->mUsername:Ljava/lang/String;

    .line 212
    .local v8, "login":Ljava/lang/String;
    :goto_36
    iget-object v1, p0, Lorg/acra/sender/HttpSender;->mPassword:Ljava/lang/String;

    if-eqz v1, :cond_140

    iget-object v9, p0, Lorg/acra/sender/HttpSender;->mPassword:Ljava/lang/String;

    .line 215
    .local v9, "password":Ljava/lang/String;
    :cond_3c
    :goto_3c
    new-instance v0, Lorg/acra/util/HttpRequest;

    invoke-direct {v0}, Lorg/acra/util/HttpRequest;-><init>()V

    .line 216
    .local v0, "request":Lorg/acra/util/HttpRequest;
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ACRAConfiguration;->connectionTimeout()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/acra/util/HttpRequest;->setConnectionTimeOut(I)V

    .line 217
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ACRAConfiguration;->socketTimeout()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/acra/util/HttpRequest;->setSocketTimeOut(I)V

    .line 218
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ACRAConfiguration;->maxNumberOfRequestRetries()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/acra/util/HttpRequest;->setMaxNrRetries(I)V

    .line 219
    invoke-virtual {v0, v8}, Lorg/acra/util/HttpRequest;->setLogin(Ljava/lang/String;)V

    .line 220
    invoke-virtual {v0, v9}, Lorg/acra/util/HttpRequest;->setPassword(Ljava/lang/String;)V

    .line 221
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ACRAConfiguration;->getHttpHeaders()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/acra/util/HttpRequest;->setHeaders(Ljava/util/Map;)V

    .line 225
    sget-object v1, Lorg/acra/sender/HttpSender$1;->$SwitchMap$org$acra$sender$HttpSender$Type:[I

    iget-object v3, p0, Lorg/acra/sender/HttpSender;->mType:Lorg/acra/sender/HttpSender$Type;

    invoke-virtual {v3}, Lorg/acra/sender/HttpSender$Type;->ordinal()I

    move-result v3

    aget v1, v1, v3

    packed-switch v1, :pswitch_data_192

    .line 231
    invoke-direct {p0, p2}, Lorg/acra/sender/HttpSender;->remap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v7

    .line 232
    .local v7, "finalReport":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {v7}, Lorg/acra/util/HttpRequest;->getParamsAsFormString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v4

    .line 238
    .end local v7    # "finalReport":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local v4, "reportAsString":Ljava/lang/String;
    :goto_88
    sget-object v1, Lorg/acra/sender/HttpSender$1;->$SwitchMap$org$acra$sender$HttpSender$Method:[I

    iget-object v3, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    invoke-virtual {v3}, Lorg/acra/sender/HttpSender$Method;->ordinal()I

    move-result v3

    aget v1, v1, v3

    packed-switch v1, :pswitch_data_198

    .line 245
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown method: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    invoke-virtual {v5}, Lorg/acra/sender/HttpSender$Method;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_b4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_b4} :catch_b4
    .catch Lorg/acra/util/JSONReportBuilder$JSONReportException; {:try_start_1 .. :try_end_b4} :catch_f3

    .line 249
    .end local v0    # "request":Lorg/acra/util/HttpRequest;
    .end local v2    # "reportUrl":Ljava/net/URL;
    .end local v4    # "reportAsString":Ljava/lang/String;
    .end local v8    # "login":Ljava/lang/String;
    .end local v9    # "password":Ljava/lang/String;
    :catch_b4
    move-exception v6

    .line 250
    .local v6, "e":Ljava/io/IOException;
    new-instance v1, Lorg/acra/sender/ReportSenderException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error while sending "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Lorg/acra/ACRAConfiguration;->reportType()Lorg/acra/sender/HttpSender$Type;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " report via Http "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    invoke-virtual {v5}, Lorg/acra/sender/HttpSender$Method;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v6}, Lorg/acra/sender/ReportSenderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 207
    .end local v6    # "e":Ljava/io/IOException;
    :cond_e6
    :try_start_e6
    new-instance v2, Ljava/net/URL;

    iget-object v1, p0, Lorg/acra/sender/HttpSender;->mFormUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_f1
    .catch Ljava/io/IOException; {:try_start_e6 .. :try_end_f1} :catch_b4
    .catch Lorg/acra/util/JSONReportBuilder$JSONReportException; {:try_start_e6 .. :try_end_f1} :catch_f3

    goto/16 :goto_12

    .line 252
    :catch_f3
    move-exception v6

    .line 253
    .local v6, "e":Lorg/acra/util/JSONReportBuilder$JSONReportException;
    new-instance v1, Lorg/acra/sender/ReportSenderException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error while sending "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Lorg/acra/ACRAConfiguration;->reportType()Lorg/acra/sender/HttpSender$Type;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " report via Http "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    invoke-virtual {v5}, Lorg/acra/sender/HttpSender$Method;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v6}, Lorg/acra/sender/ReportSenderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 210
    .end local v6    # "e":Lorg/acra/util/JSONReportBuilder$JSONReportException;
    .restart local v2    # "reportUrl":Ljava/net/URL;
    :cond_125
    :try_start_125
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ACRAConfiguration;->formUriBasicAuthLogin()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/acra/ACRAConfiguration;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_136

    move-object v8, v9

    goto/16 :goto_36

    :cond_136
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ACRAConfiguration;->formUriBasicAuthLogin()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_36

    .line 212
    .restart local v8    # "login":Ljava/lang/String;
    :cond_140
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ACRAConfiguration;->formUriBasicAuthPassword()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/acra/ACRAConfiguration;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3c

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ACRAConfiguration;->formUriBasicAuthPassword()Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_3c

    .line 227
    .restart local v0    # "request":Lorg/acra/util/HttpRequest;
    .restart local v9    # "password":Ljava/lang/String;
    :pswitch_158
    invoke-virtual {p2}, Lorg/acra/collector/CrashReportData;->toJSON()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    .line 228
    .restart local v4    # "reportAsString":Ljava/lang/String;
    goto/16 :goto_88

    .line 242
    :pswitch_162
    new-instance v10, Ljava/net/URL;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v3, 0x2f

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v3, Lorg/acra/ReportField;->REPORT_ID:Lorg/acra/ReportField;

    invoke-virtual {p2, v3}, Lorg/acra/collector/CrashReportData;->getProperty(Lorg/acra/ReportField;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v10, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .end local v2    # "reportUrl":Ljava/net/URL;
    .local v10, "reportUrl":Ljava/net/URL;
    move-object v2, v10

    .line 247
    .end local v10    # "reportUrl":Ljava/net/URL;
    :pswitch_189
    iget-object v3, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    iget-object v5, p0, Lorg/acra/sender/HttpSender;->mType:Lorg/acra/sender/HttpSender$Type;

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/acra/util/HttpRequest;->send(Landroid/content/Context;Ljava/net/URL;Lorg/acra/sender/HttpSender$Method;Ljava/lang/String;Lorg/acra/sender/HttpSender$Type;)V
    :try_end_191
    .catch Ljava/io/IOException; {:try_start_125 .. :try_end_191} :catch_b4
    .catch Lorg/acra/util/JSONReportBuilder$JSONReportException; {:try_start_125 .. :try_end_191} :catch_f3

    .line 256
    return-void

    .line 225
    :pswitch_data_192
    .packed-switch 0x1
        :pswitch_158
    .end packed-switch

    .line 238
    :pswitch_data_198
    .packed-switch 0x1
        :pswitch_189
        :pswitch_162
    .end packed-switch
.end method

.method public setBasicAuth(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    .line 199
    iput-object p1, p0, Lorg/acra/sender/HttpSender;->mUsername:Ljava/lang/String;

    .line 200
    iput-object p2, p0, Lorg/acra/sender/HttpSender;->mPassword:Ljava/lang/String;

    .line 201
    return-void
.end method
