.class public interface abstract Lorg/acra/sender/ReportSender;
.super Ljava/lang/Object;
.source "ReportSender.java"


# virtual methods
.method public abstract send(Landroid/content/Context;Lorg/acra/collector/CrashReportData;)V
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lorg/acra/collector/CrashReportData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/acra/sender/ReportSenderException;
        }
    .end annotation
.end method
