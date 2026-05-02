.class public Lorg/junit/internal/runners/InitializationError;
.super Ljava/lang/Exception;
.source "InitializationError.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final fErrors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 31
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Throwable;

    const/4 v1, 0x0

    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lorg/junit/internal/runners/InitializationError;-><init>([Ljava/lang/Throwable;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 22
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 23
    iput-object p1, p0, Lorg/junit/internal/runners/InitializationError;->fErrors:Ljava/util/List;

    .line 24
    return-void
.end method

.method public varargs constructor <init>([Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "errors"    # [Ljava/lang/Throwable;

    .prologue
    .line 27
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/junit/internal/runners/InitializationError;-><init>(Ljava/util/List;)V

    .line 28
    return-void
.end method


# virtual methods
.method public getCauses()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 35
    iget-object v0, p0, Lorg/junit/internal/runners/InitializationError;->fErrors:Ljava/util/List;

    return-object v0
.end method
