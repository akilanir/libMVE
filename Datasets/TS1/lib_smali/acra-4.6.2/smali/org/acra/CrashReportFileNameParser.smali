.class final Lorg/acra/CrashReportFileNameParser;
.super Ljava/lang/Object;
.source "CrashReportFileNameParser.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isApproved(Ljava/lang/String;)Z
    .registers 3
    .param p1, "reportFileName"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-virtual {p0, p1}, Lorg/acra/CrashReportFileNameParser;->isSilent(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    const-string v0, "-approved"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public isSilent(Ljava/lang/String;)Z
    .registers 3
    .param p1, "reportFileName"    # Ljava/lang/String;

    .prologue
    .line 33
    sget-object v0, Lorg/acra/ACRAConstants;->SILENT_SUFFIX:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method
