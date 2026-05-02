.class public final Lorg/acra/sender/EmailIntentSenderFactory;
.super Ljava/lang/Object;
.source "EmailIntentSenderFactory.java"

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
    .registers 4
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
    new-instance v0, Lorg/acra/sender/EmailIntentSender;

    invoke-direct {v0, p2}, Lorg/acra/sender/EmailIntentSender;-><init>(Lorg/acra/config/ACRAConfiguration;)V

    return-object v0
.end method
