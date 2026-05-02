.class public final Lorg/acra/collector/CollectorUtil;
.super Ljava/lang/Object;
.source "CollectorUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static safeClose(Ljava/io/Reader;)V
    .registers 2
    .param p0, "reader"    # Ljava/io/Reader;

    .prologue
    .line 14
    if-nez p0, :cond_3

    .line 21
    :goto_2
    return-void

    .line 17
    :cond_3
    :try_start_3
    invoke-virtual {p0}, Ljava/io/Reader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_6} :catch_7

    goto :goto_2

    .line 18
    :catch_7
    move-exception v0

    goto :goto_2
.end method
