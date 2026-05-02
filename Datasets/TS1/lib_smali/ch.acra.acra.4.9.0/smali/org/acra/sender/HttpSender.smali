.class public Lorg/acra/sender/HttpSender;
.super Ljava/lang/Object;
.source "HttpSender.java"

# interfaces
.implements Lorg/acra/sender/ReportSender;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/acra/sender/HttpSender$Type;,
        Lorg/acra/sender/HttpSender$Method;
    }
.end annotation


# instance fields
.field private final config:Lorg/acra/config/ACRAConfiguration;

.field private final mFormUri:Landroid/net/Uri;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

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
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final mType:Lorg/acra/sender/HttpSender$Type;

.field private mUsername:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/acra/config/ACRAConfiguration;Lorg/acra/sender/HttpSender$Method;Lorg/acra/sender/HttpSender$Type;Ljava/lang/String;Ljava/util/Map;)V
    .registers 8
    .param p1, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "method"    # Lorg/acra/sender/HttpSender$Method;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "type"    # Lorg/acra/sender/HttpSender$Type;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "formUri"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/acra/config/ACRAConfiguration;",
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
    .local p5, "mapping":Ljava/util/Map;, "Ljava/util/Map<Lorg/acra/ReportField;Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 169
    iput-object p1, p0, Lorg/acra/sender/HttpSender;->config:Lorg/acra/config/ACRAConfiguration;

    .line 170
    iput-object p2, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    .line 171
    if-nez p4, :cond_16

    move-object v0, v1

    :goto_b
    iput-object v0, p0, Lorg/acra/sender/HttpSender;->mFormUri:Landroid/net/Uri;

    .line 172
    iput-object p5, p0, Lorg/acra/sender/HttpSender;->mMapping:Ljava/util/Map;

    .line 173
    iput-object p3, p0, Lorg/acra/sender/HttpSender;->mType:Lorg/acra/sender/HttpSender$Type;

    .line 174
    iput-object v1, p0, Lorg/acra/sender/HttpSender;->mUsername:Ljava/lang/String;

    .line 175
    iput-object v1, p0, Lorg/acra/sender/HttpSender;->mPassword:Ljava/lang/String;

    .line 176
    return-void

    .line 171
    :cond_16
    invoke-static {p4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_b
.end method

.method public constructor <init>(Lorg/acra/config/ACRAConfiguration;Lorg/acra/sender/HttpSender$Method;Lorg/acra/sender/HttpSender$Type;Ljava/util/Map;)V
    .registers 11
    .param p1, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "method"    # Lorg/acra/sender/HttpSender$Method;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "type"    # Lorg/acra/sender/HttpSender$Type;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/acra/config/ACRAConfiguration;",
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
    .line 139
    .local p4, "mapping":Ljava/util/Map;, "Ljava/util/Map<Lorg/acra/ReportField;Ljava/lang/String;>;"
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/acra/sender/HttpSender;-><init>(Lorg/acra/config/ACRAConfiguration;Lorg/acra/sender/HttpSender$Method;Lorg/acra/sender/HttpSender$Type;Ljava/lang/String;Ljava/util/Map;)V

    .line 140
    return-void
.end method

.method private isNull(Ljava/lang/String;)Z
    .registers 3
    .param p1, "aString"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 266
    if-eqz p1, :cond_a

    const-string v0, "ACRA-NULL-STRING"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private remap(Ljava/util/Map;)Ljava/util/Map;
    .registers 8
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

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
    .line 249
    .local p1, "report":Ljava/util/Map;, "Ljava/util/Map<Lorg/acra/ReportField;Ljava/lang/String;>;"
    iget-object v3, p0, Lorg/acra/sender/HttpSender;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v3}, Lorg/acra/config/ACRAConfiguration;->getReportFields()Lorg/acra/collections/ImmutableSet;

    move-result-object v1

    .line 250
    .local v1, "fields":Ljava/util/Set;, "Ljava/util/Set<Lorg/acra/ReportField;>;"
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_13

    .line 251
    new-instance v1, Lorg/acra/collections/ImmutableSet;

    .end local v1    # "fields":Ljava/util/Set;, "Ljava/util/Set<Lorg/acra/ReportField;>;"
    sget-object v3, Lorg/acra/ACRAConstants;->DEFAULT_REPORT_FIELDS:[Lorg/acra/ReportField;

    invoke-direct {v1, v3}, Lorg/acra/collections/ImmutableSet;-><init>([Ljava/lang/Object;)V

    .line 254
    .restart local v1    # "fields":Ljava/util/Set;, "Ljava/util/Set<Lorg/acra/ReportField;>;"
    :cond_13
    new-instance v2, Ljava/util/HashMap;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(I)V

    .line 255
    .local v2, "finalReport":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_20
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_52

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/acra/ReportField;

    .line 256
    .local v0, "field":Lorg/acra/ReportField;
    iget-object v4, p0, Lorg/acra/sender/HttpSender;->mMapping:Ljava/util/Map;

    if-eqz v4, :cond_38

    iget-object v4, p0, Lorg/acra/sender/HttpSender;->mMapping:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_44

    .line 257
    :cond_38
    invoke-virtual {v0}, Lorg/acra/ReportField;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_20

    .line 259
    :cond_44
    iget-object v4, p0, Lorg/acra/sender/HttpSender;->mMapping:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_20

    .line 262
    .end local v0    # "field":Lorg/acra/ReportField;
    :cond_52
    return-object v2
.end method


# virtual methods
.method public send(Landroid/content/Context;Lorg/acra/collector/CrashReportData;)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "report"    # Lorg/acra/collector/CrashReportData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/acra/sender/ReportSenderException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 199
    :try_start_1
    iget-object v1, p0, Lorg/acra/sender/HttpSender;->mFormUri:Landroid/net/Uri;

    if-nez v1, :cond_d7

    new-instance v2, Ljava/net/URL;

    iget-object v1, p0, Lorg/acra/sender/HttpSender;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v1}, Lorg/acra/config/ACRAConfiguration;->formUri()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 200
    .local v2, "reportUrl":Ljava/net/URL;
    :goto_10
    sget-boolean v1, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v1, :cond_32

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

    .line 202
    :cond_32
    iget-object v1, p0, Lorg/acra/sender/HttpSender;->mUsername:Ljava/lang/String;

    if-eqz v1, :cond_114

    iget-object v8, p0, Lorg/acra/sender/HttpSender;->mUsername:Ljava/lang/String;

    .line 203
    .local v8, "login":Ljava/lang/String;
    :goto_38
    iget-object v1, p0, Lorg/acra/sender/HttpSender;->mPassword:Ljava/lang/String;

    if-eqz v1, :cond_12b

    iget-object v9, p0, Lorg/acra/sender/HttpSender;->mPassword:Ljava/lang/String;

    .line 205
    .local v9, "password":Ljava/lang/String;
    :cond_3e
    :goto_3e
    new-instance v0, Lorg/acra/util/HttpRequest;

    iget-object v1, p0, Lorg/acra/sender/HttpSender;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-direct {v0, v1}, Lorg/acra/util/HttpRequest;-><init>(Lorg/acra/config/ACRAConfiguration;)V

    .line 206
    .local v0, "request":Lorg/acra/util/HttpRequest;
    iget-object v1, p0, Lorg/acra/sender/HttpSender;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v1}, Lorg/acra/config/ACRAConfiguration;->connectionTimeout()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/acra/util/HttpRequest;->setConnectionTimeOut(I)V

    .line 207
    iget-object v1, p0, Lorg/acra/sender/HttpSender;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v1}, Lorg/acra/config/ACRAConfiguration;->socketTimeout()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/acra/util/HttpRequest;->setSocketTimeOut(I)V

    .line 208
    invoke-virtual {v0, v8}, Lorg/acra/util/HttpRequest;->setLogin(Ljava/lang/String;)V

    .line 209
    invoke-virtual {v0, v9}, Lorg/acra/util/HttpRequest;->setPassword(Ljava/lang/String;)V

    .line 210
    iget-object v1, p0, Lorg/acra/sender/HttpSender;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v1}, Lorg/acra/config/ACRAConfiguration;->getHttpHeaders()Lorg/acra/collections/ImmutableMap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/acra/util/HttpRequest;->setHeaders(Ljava/util/Map;)V

    .line 214
    sget-object v1, Lorg/acra/sender/HttpSender$1;->$SwitchMap$org$acra$sender$HttpSender$Type:[I

    iget-object v3, p0, Lorg/acra/sender/HttpSender;->mType:Lorg/acra/sender/HttpSender$Type;

    invoke-virtual {v3}, Lorg/acra/sender/HttpSender$Type;->ordinal()I

    move-result v3

    aget v1, v1, v3

    packed-switch v1, :pswitch_data_17a

    .line 220
    invoke-direct {p0, p2}, Lorg/acra/sender/HttpSender;->remap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v7

    .line 221
    .local v7, "finalReport":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {v7}, Lorg/acra/util/HttpRequest;->getParamsAsFormString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v4

    .line 226
    .end local v7    # "finalReport":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local v4, "reportAsString":Ljava/lang/String;
    :goto_7b
    sget-object v1, Lorg/acra/sender/HttpSender$1;->$SwitchMap$org$acra$sender$HttpSender$Method:[I

    iget-object v3, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    invoke-virtual {v3}, Lorg/acra/sender/HttpSender$Method;->ordinal()I

    move-result v3

    aget v1, v1, v3

    packed-switch v1, :pswitch_data_180

    .line 233
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
    :try_end_a7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_a7} :catch_a7
    .catch Lorg/acra/util/JSONReportBuilder$JSONReportException; {:try_start_1 .. :try_end_a7} :catch_e4

    .line 237
    .end local v0    # "request":Lorg/acra/util/HttpRequest;
    .end local v2    # "reportUrl":Ljava/net/URL;
    .end local v4    # "reportAsString":Ljava/lang/String;
    .end local v8    # "login":Ljava/lang/String;
    .end local v9    # "password":Ljava/lang/String;
    :catch_a7
    move-exception v6

    .line 238
    .local v6, "e":Ljava/io/IOException;
    new-instance v1, Lorg/acra/sender/ReportSenderException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error while sending "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lorg/acra/sender/HttpSender;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v5}, Lorg/acra/config/ACRAConfiguration;->reportType()Lorg/acra/sender/HttpSender$Type;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " report via Http "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    .line 239
    invoke-virtual {v5}, Lorg/acra/sender/HttpSender$Method;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v6}, Lorg/acra/sender/ReportSenderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 199
    .end local v6    # "e":Ljava/io/IOException;
    :cond_d7
    :try_start_d7
    new-instance v2, Ljava/net/URL;

    iget-object v1, p0, Lorg/acra/sender/HttpSender;->mFormUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_e2
    .catch Ljava/io/IOException; {:try_start_d7 .. :try_end_e2} :catch_a7
    .catch Lorg/acra/util/JSONReportBuilder$JSONReportException; {:try_start_d7 .. :try_end_e2} :catch_e4

    goto/16 :goto_10

    .line 240
    :catch_e4
    move-exception v6

    .line 241
    .local v6, "e":Lorg/acra/util/JSONReportBuilder$JSONReportException;
    new-instance v1, Lorg/acra/sender/ReportSenderException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error while sending "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lorg/acra/sender/HttpSender;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v5}, Lorg/acra/config/ACRAConfiguration;->reportType()Lorg/acra/sender/HttpSender$Type;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " report via Http "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    .line 242
    invoke-virtual {v5}, Lorg/acra/sender/HttpSender$Method;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v6}, Lorg/acra/sender/ReportSenderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 202
    .end local v6    # "e":Lorg/acra/util/JSONReportBuilder$JSONReportException;
    .restart local v2    # "reportUrl":Ljava/net/URL;
    :cond_114
    :try_start_114
    iget-object v1, p0, Lorg/acra/sender/HttpSender;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v1}, Lorg/acra/config/ACRAConfiguration;->formUriBasicAuthLogin()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/acra/sender/HttpSender;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_123

    move-object v8, v9

    goto/16 :goto_38

    :cond_123
    iget-object v1, p0, Lorg/acra/sender/HttpSender;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v1}, Lorg/acra/config/ACRAConfiguration;->formUriBasicAuthLogin()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_38

    .line 203
    .restart local v8    # "login":Ljava/lang/String;
    :cond_12b
    iget-object v1, p0, Lorg/acra/sender/HttpSender;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v1}, Lorg/acra/config/ACRAConfiguration;->formUriBasicAuthPassword()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/acra/sender/HttpSender;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3e

    iget-object v1, p0, Lorg/acra/sender/HttpSender;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v1}, Lorg/acra/config/ACRAConfiguration;->formUriBasicAuthPassword()Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_3e

    .line 216
    .restart local v0    # "request":Lorg/acra/util/HttpRequest;
    .restart local v9    # "password":Ljava/lang/String;
    :pswitch_13f
    invoke-virtual {p2}, Lorg/acra/collector/CrashReportData;->toJSON()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    .line 217
    .restart local v4    # "reportAsString":Ljava/lang/String;
    goto/16 :goto_7b

    .line 230
    :pswitch_149
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

    .line 235
    .end local v10    # "reportUrl":Ljava/net/URL;
    :pswitch_170
    iget-object v3, p0, Lorg/acra/sender/HttpSender;->mMethod:Lorg/acra/sender/HttpSender$Method;

    iget-object v5, p0, Lorg/acra/sender/HttpSender;->mType:Lorg/acra/sender/HttpSender$Type;

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/acra/util/HttpRequest;->send(Landroid/content/Context;Ljava/net/URL;Lorg/acra/sender/HttpSender$Method;Ljava/lang/String;Lorg/acra/sender/HttpSender$Type;)V
    :try_end_178
    .catch Ljava/io/IOException; {:try_start_114 .. :try_end_178} :catch_a7
    .catch Lorg/acra/util/JSONReportBuilder$JSONReportException; {:try_start_114 .. :try_end_178} :catch_e4

    .line 244
    return-void

    .line 214
    nop

    :pswitch_data_17a
    .packed-switch 0x1
        :pswitch_13f
    .end packed-switch

    .line 226
    :pswitch_data_180
    .packed-switch 0x1
        :pswitch_170
        :pswitch_149
    .end packed-switch
.end method

.method public setBasicAuth(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "username"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "password"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 191
    iput-object p1, p0, Lorg/acra/sender/HttpSender;->mUsername:Ljava/lang/String;

    .line 192
    iput-object p2, p0, Lorg/acra/sender/HttpSender;->mPassword:Ljava/lang/String;

    .line 193
    return-void
.end method
