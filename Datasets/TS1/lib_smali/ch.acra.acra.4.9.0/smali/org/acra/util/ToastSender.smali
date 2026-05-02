.class public final Lorg/acra/util/ToastSender;
.super Ljava/lang/Object;
.source "ToastSender.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static sendToast(Landroid/content/Context;II)V
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "toastResourceId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p2, "toastLength"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x1L
        .end annotation
    .end param

    .prologue
    .line 31
    :try_start_0
    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_7} :catch_8

    .line 35
    :goto_7
    return-void

    .line 32
    :catch_8
    move-exception v0

    .line 33
    .local v0, "e":Ljava/lang/RuntimeException;
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v3, "Could not send crash Toast"

    invoke-interface {v1, v2, v3, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7
.end method
