.class public final Lorg/acra/CrashReportDialog;
.super Lorg/acra/dialog/CrashReportDialog;
.source "CrashReportDialog.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Lorg/acra/dialog/CrashReportDialog;-><init>()V

    return-void
.end method


# virtual methods
.method protected buildAndShowDialog(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 17
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v2, "org.acra.CrashReportDialog has been deprecated. Please use org.acra.dialog.CrashReportDialog instead"

    invoke-interface {v0, v1, v2}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    invoke-super {p0, p1}, Lorg/acra/dialog/CrashReportDialog;->buildAndShowDialog(Landroid/os/Bundle;)V

    .line 19
    return-void
.end method
