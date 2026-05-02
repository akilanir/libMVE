.class Lcom/koushikdutta/ion/IonLog;
.super Ljava/lang/Object;
.source "IonLog.java"


# static fields
.field public static final LOGTAG:Ljava/lang/String; = "ION"

.field public static debug:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 10
    const/4 v0, 0x1

    sput-boolean v0, Lcom/koushikdutta/ion/IonLog;->debug:Z

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Ljava/lang/String;)V
    .registers 2
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 29
    sget-boolean v0, Lcom/koushikdutta/ion/IonLog;->debug:Z

    if-eqz v0, :cond_9

    .line 30
    const-string v0, "ION"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    :cond_9
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 12
    sget-boolean v0, Lcom/koushikdutta/ion/IonLog;->debug:Z

    if-eqz v0, :cond_9

    .line 13
    const-string v0, "ION"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 14
    :cond_9
    return-void
.end method

.method public static e(Ljava/lang/String;)V
    .registers 2
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 34
    const-string v0, "ION"

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 17
    const-string v0, "ION"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 18
    return-void
.end method

.method public static i(Ljava/lang/String;)V
    .registers 2
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 38
    const-string v0, "ION"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 21
    const-string v0, "ION"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 22
    return-void
.end method

.method public static w(Ljava/lang/String;)V
    .registers 2
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 42
    const-string v0, "ION"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 25
    const-string v0, "ION"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 26
    return-void
.end method
