.class public final Lorg/acra/sender/DefaultReportSenderFactory;
.super Ljava/lang/Object;
.source "DefaultReportSenderFactory.java"

# interfaces
.implements Lorg/acra/sender/ReportSenderFactory;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)Lorg/acra/sender/ReportSender;
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 25
    new-instance v0, Lorg/acra/util/PackageManagerWrapper;

    invoke-direct {v0, p1}, Lorg/acra/util/PackageManagerWrapper;-><init>(Landroid/content/Context;)V

    .line 26
    .local v0, "pm":Lorg/acra/util/PackageManagerWrapper;
    const-string v1, ""

    invoke-virtual {p2}, Lorg/acra/config/ACRAConfiguration;->mailTo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_39

    .line 28
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " reports will be sent by email (if accepted by user)."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    new-instance v1, Lorg/acra/sender/EmailIntentSenderFactory;

    invoke-direct {v1}, Lorg/acra/sender/EmailIntentSenderFactory;-><init>()V

    invoke-virtual {v1, p1, p2}, Lorg/acra/sender/EmailIntentSenderFactory;->create(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)Lorg/acra/sender/ReportSender;

    move-result-object v1

    .line 46
    :goto_38
    return-object v1

    .line 30
    :cond_39
    const-string v1, "android.permission.INTERNET"

    invoke-virtual {v0, v1}, Lorg/acra/util/PackageManagerWrapper;->hasPermission(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_71

    .line 35
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " should be granted permission "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "android.permission.INTERNET"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " if you want your crash reports to be sent. If you don\'t want to add this permission to your application you can also enable sending reports by email. If this is your will then provide your email address in @AcraConfig(mailTo=\"your.account@domain.com\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 35
    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    new-instance v1, Lorg/acra/sender/NullSender;

    invoke-direct {v1}, Lorg/acra/sender/NullSender;-><init>()V

    goto :goto_38

    .line 41
    :cond_71
    invoke-virtual {p2}, Lorg/acra/config/ACRAConfiguration;->formUri()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_af

    const-string v1, ""

    invoke-virtual {p2}, Lorg/acra/config/ACRAConfiguration;->formUri()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_af

    .line 43
    sget-boolean v1, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v1, :cond_a5

    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " reports will be sent by Http."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    :cond_a5
    new-instance v1, Lorg/acra/sender/HttpSenderFactory;

    invoke-direct {v1}, Lorg/acra/sender/HttpSenderFactory;-><init>()V

    invoke-virtual {v1, p1, p2}, Lorg/acra/sender/HttpSenderFactory;->create(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)Lorg/acra/sender/ReportSender;

    move-result-object v1

    goto :goto_38

    .line 46
    :cond_af
    new-instance v1, Lorg/acra/sender/NullSender;

    invoke-direct {v1}, Lorg/acra/sender/NullSender;-><init>()V

    goto :goto_38
.end method
