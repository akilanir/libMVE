.class public Lorg/apache/commons/beanutils/BeanAccessLanguageException;
.super Ljava/lang/IllegalArgumentException;
.source "BeanAccessLanguageException.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 47
    return-void
.end method
