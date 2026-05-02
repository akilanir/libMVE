.class public Lorg/acra/sender/EmailIntentSender;
.super Ljava/lang/Object;
.source "EmailIntentSender.java"

# interfaces
.implements Lorg/acra/sender/ReportSender;


# instance fields
.field private final config:Lorg/acra/config/ACRAConfiguration;


# direct methods
.method public constructor <init>(Lorg/acra/config/ACRAConfiguration;)V
    .registers 2
    .param p1, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lorg/acra/sender/EmailIntentSender;->config:Lorg/acra/config/ACRAConfiguration;

    .line 45
    return-void
.end method

.method private buildBody(Lorg/acra/collector/CrashReportData;)Ljava/lang/String;
    .registers 8
    .param p1, "errorContent"    # Lorg/acra/collector/CrashReportData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 62
    iget-object v3, p0, Lorg/acra/sender/EmailIntentSender;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v3}, Lorg/acra/config/ACRAConfiguration;->getReportFields()Lorg/acra/collections/ImmutableSet;

    move-result-object v2

    .line 63
    .local v2, "fields":Ljava/util/Set;, "Ljava/util/Set<Lorg/acra/ReportField;>;"
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_13

    .line 64
    new-instance v2, Lorg/acra/collections/ImmutableSet;

    .end local v2    # "fields":Ljava/util/Set;, "Ljava/util/Set<Lorg/acra/ReportField;>;"
    sget-object v3, Lorg/acra/ACRAConstants;->DEFAULT_MAIL_REPORT_FIELDS:[Lorg/acra/ReportField;

    invoke-direct {v2, v3}, Lorg/acra/collections/ImmutableSet;-><init>([Ljava/lang/Object;)V

    .line 67
    .restart local v2    # "fields":Ljava/util/Set;, "Ljava/util/Set<Lorg/acra/ReportField;>;"
    :cond_13
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_44

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/acra/ReportField;

    .line 69
    .local v1, "field":Lorg/acra/ReportField;
    invoke-virtual {v1}, Lorg/acra/ReportField;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v5, 0x3d

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 70
    invoke-virtual {p1, v1}, Lorg/acra/collector/CrashReportData;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1c

    .line 73
    .end local v1    # "field":Lorg/acra/ReportField;
    :cond_44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public send(Landroid/content/Context;Lorg/acra/collector/CrashReportData;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "errorContent"    # Lorg/acra/collector/CrashReportData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/acra/sender/ReportSenderException;
        }
    .end annotation

    .prologue
    .line 50
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Crash Report"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 51
    .local v2, "subject":Ljava/lang/String;
    invoke-direct {p0, p2}, Lorg/acra/sender/EmailIntentSender;->buildBody(Lorg/acra/collector/CrashReportData;)Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, "body":Ljava/lang/String;
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.SENDTO"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 54
    .local v1, "emailIntent":Landroid/content/Intent;
    const-string v3, "mailto"

    iget-object v4, p0, Lorg/acra/sender/EmailIntentSender;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v4}, Lorg/acra/config/ACRAConfiguration;->mailTo()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 55
    const/high16 v3, 0x10000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 56
    const-string v3, "android.intent.extra.SUBJECT"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 57
    const-string v3, "android.intent.extra.TEXT"

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 58
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 59
    return-void
.end method
