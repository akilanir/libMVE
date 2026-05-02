.class public final Lcom/google/zxing/FormatException;
.super Lcom/google/zxing/ReaderException;
.source "FormatException.java"


# static fields
.field private static final instance:Lcom/google/zxing/FormatException;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    new-instance v0, Lcom/google/zxing/FormatException;

    invoke-direct {v0}, Lcom/google/zxing/FormatException;-><init>()V

    sput-object v0, Lcom/google/zxing/FormatException;->instance:Lcom/google/zxing/FormatException;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/google/zxing/ReaderException;-><init>()V

    .line 31
    return-void
.end method

.method private constructor <init>(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/google/zxing/ReaderException;-><init>(Ljava/lang/Throwable;)V

    .line 35
    return-void
.end method

.method public static getFormatInstance()Lcom/google/zxing/FormatException;
    .registers 1

    .prologue
    .line 38
    sget-boolean v0, Lcom/google/zxing/FormatException;->isStackTrace:Z

    if-eqz v0, :cond_a

    .line 39
    new-instance v0, Lcom/google/zxing/FormatException;

    invoke-direct {v0}, Lcom/google/zxing/FormatException;-><init>()V

    .line 41
    :goto_9
    return-object v0

    :cond_a
    sget-object v0, Lcom/google/zxing/FormatException;->instance:Lcom/google/zxing/FormatException;

    goto :goto_9
.end method

.method public static getFormatInstance(Ljava/lang/Throwable;)Lcom/google/zxing/FormatException;
    .registers 2
    .param p0, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 46
    sget-boolean v0, Lcom/google/zxing/FormatException;->isStackTrace:Z

    if-eqz v0, :cond_a

    .line 47
    new-instance v0, Lcom/google/zxing/FormatException;

    invoke-direct {v0, p0}, Lcom/google/zxing/FormatException;-><init>(Ljava/lang/Throwable;)V

    .line 49
    :goto_9
    return-object v0

    :cond_a
    sget-object v0, Lcom/google/zxing/FormatException;->instance:Lcom/google/zxing/FormatException;

    goto :goto_9
.end method
