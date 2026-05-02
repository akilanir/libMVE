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

.field private final mType:Lorg/acra/sender/HttpSender$Type;


# direct methods
.method public constructor <init>(Lorg/acra/sender/HttpSender$Method;Lorg/acra/sender/HttpSender$Type;Ljava/lang/String;Ljava/util/Map;)V
    .registers 6
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
    .line 173
    .local p4, "mapping":Ljava/util/Map;, "Ljava/util/Map<Lorg/acra/ReportField;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 174
    iput-object p1, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    .line 175
    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/sender/HttpSender;->mFormUri:Landroid/net/Uri;

    .line 176
    iput-object p4, p0, Lorg/acra/sender/HttpSender;->mMapping:Ljava/util/Map;

    .line 177
    iput-object p2, p0, Lorg/acra/sender/HttpSender;->mType:Lorg/acra/sender/HttpSender$Type;

    .line 178
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
    .line 141
    .local p3, "mapping":Ljava/util/Map;, "Ljava/util/Map<Lorg/acra/ReportField;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    iput-object p1, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    .line 143
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/acra/sender/HttpSender;->mFormUri:Landroid/net/Uri;

    .line 144
    iput-object p3, p0, Lorg/acra/sender/HttpSender;->mMapping:Ljava/util/Map;

    .line 145
    iput-object p2, p0, Lorg/acra/sender/HttpSender;->mType:Lorg/acra/sender/HttpSender$Type;

    .line 146
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
    .line 238
    .local p1, "report":Ljava/util/Map;, "Ljava/util/Map<Lorg/acra/ReportField;Ljava/lang/String;>;"
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v6

    invoke-virtual {v6}, Lorg/acra/ACRAConfiguration;->customReportContent()[Lorg/acra/ReportField;

    move-result-object v2

    .line 239
    .local v2, "fields":[Lorg/acra/ReportField;
    array-length v6, v2

    if-nez v6, :cond_d

    .line 240
    sget-object v2, Lorg/acra/ACRAConstants;->DEFAULT_REPORT_FIELDS:[Lorg/acra/ReportField;

    .line 243
    :cond_d
    new-instance v3, Ljava/util/HashMap;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v6

    invoke-direct {v3, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 244
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

    .line 245
    .local v1, "field":Lorg/acra/ReportField;
    iget-object v6, p0, Lorg/acra/sender/HttpSender;->mMapping:Ljava/util/Map;

    if-eqz v6, :cond_29

    iget-object v6, p0, Lorg/acra/sender/HttpSender;->mMapping:Ljava/util/Map;

    invoke-interface {v6, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_37

    .line 246
    :cond_29
    invoke-virtual {v1}, Lorg/acra/ReportField;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v3, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    :goto_34
    add-int/lit8 v4, v4, 0x1

    goto :goto_19

    .line 248
    :cond_37
    iget-object v6, p0, Lorg/acra/sender/HttpSender;->mMapping:Ljava/util/Map;

    invoke-interface {v6, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v3, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_34

    .line 251
    .end local v1    # "field":Lorg/acra/ReportField;
    :cond_45
    return-object v3
.end method


# virtual methods
.method public send(Lorg/acra/collector/CrashReportData;)V
    .registers 13
    .param p1, "report"    # Lorg/acra/collector/CrashReportData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/acra/sender/ReportSenderException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 184
    :try_start_1
    iget-object v8, p0, Lorg/acra/sender/HttpSender;->mFormUri:Landroid/net/Uri;

    if-nez v8, :cond_f7

    new-instance v5, Ljava/net/URL;

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v8

    invoke-virtual {v8}, Lorg/acra/ACRAConfiguration;->formUri()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 185
    .local v5, "reportUrl":Ljava/net/URL;
    :goto_12
    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Connect to "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v8

    invoke-virtual {v8}, Lorg/acra/ACRAConfiguration;->formUriBasicAuthLogin()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/acra/ACRAConfiguration;->isNull(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_136

    move-object v2, v3

    .line 189
    .local v2, "login":Ljava/lang/String;
    :goto_3d
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v8

    invoke-virtual {v8}, Lorg/acra/ACRAConfiguration;->formUriBasicAuthPassword()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/acra/ACRAConfiguration;->isNull(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_140

    .line 192
    .local v3, "password":Ljava/lang/String;
    :goto_4b
    new-instance v7, Lorg/acra/util/HttpRequest;

    invoke-direct {v7}, Lorg/acra/util/HttpRequest;-><init>()V

    .line 193
    .local v7, "request":Lorg/acra/util/HttpRequest;
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v8

    invoke-virtual {v8}, Lorg/acra/ACRAConfiguration;->connectionTimeout()I

    move-result v8

    invoke-virtual {v7, v8}, Lorg/acra/util/HttpRequest;->setConnectionTimeOut(I)V

    .line 194
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v8

    invoke-virtual {v8}, Lorg/acra/ACRAConfiguration;->socketTimeout()I

    move-result v8

    invoke-virtual {v7, v8}, Lorg/acra/util/HttpRequest;->setSocketTimeOut(I)V

    .line 195
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v8

    invoke-virtual {v8}, Lorg/acra/ACRAConfiguration;->maxNumberOfRequestRetries()I

    move-result v8

    invoke-virtual {v7, v8}, Lorg/acra/util/HttpRequest;->setMaxNrRetries(I)V

    .line 196
    invoke-virtual {v7, v2}, Lorg/acra/util/HttpRequest;->setLogin(Ljava/lang/String;)V

    .line 197
    invoke-virtual {v7, v3}, Lorg/acra/util/HttpRequest;->setPassword(Ljava/lang/String;)V

    .line 198
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v8

    invoke-virtual {v8}, Lorg/acra/ACRAConfiguration;->getHttpHeaders()Ljava/util/Map;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/acra/util/HttpRequest;->setHeaders(Ljava/util/Map;)V

    .line 200
    const-string v4, ""

    .line 203
    .local v4, "reportAsString":Ljava/lang/String;
    sget-object v8, Lorg/acra/sender/HttpSender$1;->$SwitchMap$org$acra$sender$HttpSender$Type:[I

    iget-object v9, p0, Lorg/acra/sender/HttpSender;->mType:Lorg/acra/sender/HttpSender$Type;

    invoke-virtual {v9}, Lorg/acra/sender/HttpSender$Type;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_184

    .line 209
    invoke-direct {p0, p1}, Lorg/acra/sender/HttpSender;->remap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    .line 210
    .local v1, "finalReport":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {v1}, Lorg/acra/util/HttpRequest;->getParamsAsFormString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v4

    .line 216
    .end local v1    # "finalReport":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_99
    sget-object v8, Lorg/acra/sender/HttpSender$1;->$SwitchMap$org$acra$sender$HttpSender$Method:[I

    iget-object v9, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    invoke-virtual {v9}, Lorg/acra/sender/HttpSender$Method;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_18a

    .line 223
    new-instance v8, Ljava/lang/UnsupportedOperationException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unknown method: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    invoke-virtual {v10}, Lorg/acra/sender/HttpSender$Method;->name()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_c5
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_c5} :catch_c5
    .catch Lorg/acra/util/JSONReportBuilder$JSONReportException; {:try_start_1 .. :try_end_c5} :catch_104

    .line 227
    .end local v2    # "login":Ljava/lang/String;
    .end local v3    # "password":Ljava/lang/String;
    .end local v4    # "reportAsString":Ljava/lang/String;
    .end local v5    # "reportUrl":Ljava/net/URL;
    .end local v7    # "request":Lorg/acra/util/HttpRequest;
    :catch_c5
    move-exception v0

    .line 228
    .local v0, "e":Ljava/io/IOException;
    new-instance v8, Lorg/acra/sender/ReportSenderException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Error while sending "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v10

    invoke-virtual {v10}, Lorg/acra/ACRAConfiguration;->reportType()Lorg/acra/sender/HttpSender$Type;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " report via Http "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    invoke-virtual {v10}, Lorg/acra/sender/HttpSender$Method;->name()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v0}, Lorg/acra/sender/ReportSenderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 184
    .end local v0    # "e":Ljava/io/IOException;
    :cond_f7
    :try_start_f7
    new-instance v5, Ljava/net/URL;

    iget-object v8, p0, Lorg/acra/sender/HttpSender;->mFormUri:Landroid/net/Uri;

    invoke-virtual {v8}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_102
    .catch Ljava/io/IOException; {:try_start_f7 .. :try_end_102} :catch_c5
    .catch Lorg/acra/util/JSONReportBuilder$JSONReportException; {:try_start_f7 .. :try_end_102} :catch_104

    goto/16 :goto_12

    .line 230
    :catch_104
    move-exception v0

    .line 231
    .local v0, "e":Lorg/acra/util/JSONReportBuilder$JSONReportException;
    new-instance v8, Lorg/acra/sender/ReportSenderException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Error while sending "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v10

    invoke-virtual {v10}, Lorg/acra/ACRAConfiguration;->reportType()Lorg/acra/sender/HttpSender$Type;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " report via Http "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    invoke-virtual {v10}, Lorg/acra/sender/HttpSender$Method;->name()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v0}, Lorg/acra/sender/ReportSenderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 187
    .end local v0    # "e":Lorg/acra/util/JSONReportBuilder$JSONReportException;
    .restart local v5    # "reportUrl":Ljava/net/URL;
    :cond_136
    :try_start_136
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v8

    invoke-virtual {v8}, Lorg/acra/ACRAConfiguration;->formUriBasicAuthLogin()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_3d

    .line 189
    .restart local v2    # "login":Ljava/lang/String;
    :cond_140
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v8

    invoke-virtual {v8}, Lorg/acra/ACRAConfiguration;->formUriBasicAuthPassword()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_4b

    .line 205
    .restart local v3    # "password":Ljava/lang/String;
    .restart local v4    # "reportAsString":Ljava/lang/String;
    .restart local v7    # "request":Lorg/acra/util/HttpRequest;
    :pswitch_14a
    invoke-virtual {p1}, Lorg/acra/collector/CrashReportData;->toJSON()Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    .line 206
    goto/16 :goto_99

    .line 220
    :pswitch_154
    new-instance v6, Ljava/net/URL;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0x2f

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lorg/acra/ReportField;->REPORT_ID:Lorg/acra/ReportField;

    invoke-virtual {p1, v9}, Lorg/acra/collector/CrashReportData;->getProperty(Lorg/acra/ReportField;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .end local v5    # "reportUrl":Ljava/net/URL;
    .local v6, "reportUrl":Ljava/net/URL;
    move-object v5, v6

    .line 225
    .end local v6    # "reportUrl":Ljava/net/URL;
    :pswitch_17b
    iget-object v8, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    iget-object v9, p0, Lorg/acra/sender/HttpSender;->mType:Lorg/acra/sender/HttpSender$Type;

    invoke-virtual {v7, v5, v8, v4, v9}, Lorg/acra/util/HttpRequest;->send(Ljava/net/URL;Lorg/acra/sender/HttpSender$Method;Ljava/lang/String;Lorg/acra/sender/HttpSender$Type;)V
    :try_end_182
    .catch Ljava/io/IOException; {:try_start_136 .. :try_end_182} :catch_c5
    .catch Lorg/acra/util/JSONReportBuilder$JSONReportException; {:try_start_136 .. :try_end_182} :catch_104

    .line 234
    return-void

    .line 203
    nop

    :pswitch_data_184
    .packed-switch 0x1
        :pswitch_14a
    .end packed-switch

    .line 216
    :pswitch_data_18a
    .packed-switch 0x1
        :pswitch_17b
        :pswitch_154
    .end packed-switch
.end method
