.class public Lorg/piwik/sdk/tools/Logy;
.super Ljava/lang/Object;
.source "Logy.java"


# static fields
.field public static final DEBUG:I = 0x1

.field public static final NORMAL:I = 0x0

.field public static final QUIET:I = -0x1

.field public static final SILENT:I = -0x2

.field public static final VERBOSE:I = 0x2

.field public static sLoglevel:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 24
    const/4 v0, -0x1

    sput v0, Lorg/piwik/sdk/tools/Logy;->sLoglevel:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "c"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .line 33
    sget v0, Lorg/piwik/sdk/tools/Logy;->sLoglevel:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_8

    .line 34
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    :cond_8
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "c"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .line 57
    sget v0, Lorg/piwik/sdk/tools/Logy;->sLoglevel:I

    const/4 v1, -0x2

    if-eq v0, v1, :cond_8

    .line 58
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    :cond_8
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5
    .param p0, "c"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .line 63
    sget v0, Lorg/piwik/sdk/tools/Logy;->sLoglevel:I

    const/4 v1, -0x2

    if-eq v0, v1, :cond_8

    .line 64
    invoke-static {p0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 66
    :cond_8
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "c"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .line 39
    sget v0, Lorg/piwik/sdk/tools/Logy;->sLoglevel:I

    if-ltz v0, :cond_7

    .line 40
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    :cond_7
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "c"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .line 27
    sget v0, Lorg/piwik/sdk/tools/Logy;->sLoglevel:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_8

    .line 28
    invoke-static {p0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    :cond_8
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "c"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;

    .line 45
    sget v0, Lorg/piwik/sdk/tools/Logy;->sLoglevel:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_8

    .line 46
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    :cond_8
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5
    .param p0, "c"    # Ljava/lang/String;
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .line 51
    sget v0, Lorg/piwik/sdk/tools/Logy;->sLoglevel:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_8

    .line 52
    invoke-static {p0, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 54
    :cond_8
    return-void
.end method
