.class public Lorg/acra/sender/SenderServiceStarter;
.super Ljava/lang/Object;
.source "SenderServiceStarter.java"


# instance fields
.field private final config:Lorg/acra/config/ACRAConfiguration;

.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lorg/acra/sender/SenderServiceStarter;->context:Landroid/content/Context;

    .line 24
    iput-object p2, p0, Lorg/acra/sender/SenderServiceStarter;->config:Lorg/acra/config/ACRAConfiguration;

    .line 25
    return-void
.end method


# virtual methods
.method public startService(ZZ)V
    .registers 7
    .param p1, "onlySendSilentReports"    # Z
    .param p2, "approveReportsFirst"    # Z

    .prologue
    .line 34
    sget-boolean v1, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v1, :cond_d

    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v3, "About to start SenderService"

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    :cond_d
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lorg/acra/sender/SenderServiceStarter;->context:Landroid/content/Context;

    const-class v2, Lorg/acra/sender/SenderService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 36
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "onlySendSilentReports"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 37
    const-string v1, "approveReportsFirst"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 39
    const-string v1, "reportSenderFactories"

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lorg/acra/sender/SenderServiceStarter;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v3}, Lorg/acra/config/ACRAConfiguration;->reportSenderFactoryClasses()Lorg/acra/collections/ImmutableSet;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 41
    const-string v1, "acraConfig"

    iget-object v2, p0, Lorg/acra/sender/SenderServiceStarter;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 42
    iget-object v1, p0, Lorg/acra/sender/SenderServiceStarter;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 43
    return-void
.end method
