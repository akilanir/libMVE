.class public final Lorg/acra/sender/HttpSenderFactory;
.super Ljava/lang/Object;
.source "HttpSenderFactory.java"

# interfaces
.implements Lorg/acra/sender/ReportSenderFactory;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)Lorg/acra/sender/ReportSender;
    .registers 7
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
    .line 16
    new-instance v0, Lorg/acra/sender/HttpSender;

    invoke-virtual {p2}, Lorg/acra/config/ACRAConfiguration;->httpMethod()Lorg/acra/sender/HttpSender$Method;

    move-result-object v1

    invoke-virtual {p2}, Lorg/acra/config/ACRAConfiguration;->reportType()Lorg/acra/sender/HttpSender$Type;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, p2, v1, v2, v3}, Lorg/acra/sender/HttpSender;-><init>(Lorg/acra/config/ACRAConfiguration;Lorg/acra/sender/HttpSender$Method;Lorg/acra/sender/HttpSender$Type;Ljava/util/Map;)V

    return-object v0
.end method
