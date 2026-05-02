.class public interface abstract Lorg/acra/sender/ReportSenderFactory;
.super Ljava/lang/Object;
.source "ReportSenderFactory.java"


# virtual methods
.method public abstract create(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)Lorg/acra/sender/ReportSender;
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method
