.class public Lorg/apache/commons/beanutils/ConversionException;
.super Ljava/lang/RuntimeException;
.source "ConversionException.java"


# instance fields
.field protected cause:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConversionException;->cause:Ljava/lang/Throwable;

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConversionException;->cause:Ljava/lang/Throwable;

    .line 58
    iput-object p2, p0, Lorg/apache/commons/beanutils/ConversionException;->cause:Ljava/lang/Throwable;

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 70
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/ConversionException;->cause:Ljava/lang/Throwable;

    .line 71
    iput-object p1, p0, Lorg/apache/commons/beanutils/ConversionException;->cause:Ljava/lang/Throwable;

    .line 73
    return-void
.end method


# virtual methods
.method public getCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lorg/apache/commons/beanutils/ConversionException;->cause:Ljava/lang/Throwable;

    return-object v0
.end method
