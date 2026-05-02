.class Lorg/junit/experimental/max/MaxCore$1;
.super Lorg/junit/runner/Request;
.source "MaxCore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/experimental/max/MaxCore;->constructLeafRequest(Ljava/util/List;)Lorg/junit/runner/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/experimental/max/MaxCore;

.field final synthetic val$runners:Ljava/util/List;


# direct methods
.method constructor <init>(Lorg/junit/experimental/max/MaxCore;Ljava/util/List;)V
    .registers 3

    .prologue
    .line 112
    iput-object p1, p0, Lorg/junit/experimental/max/MaxCore$1;->this$0:Lorg/junit/experimental/max/MaxCore;

    iput-object p2, p0, Lorg/junit/experimental/max/MaxCore$1;->val$runners:Ljava/util/List;

    invoke-direct {p0}, Lorg/junit/runner/Request;-><init>()V

    return-void
.end method


# virtual methods
.method public getRunner()Lorg/junit/runner/Runner;
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 114
    :try_start_1
    new-instance v2, Lorg/junit/experimental/max/MaxCore$1$1;

    const/4 v1, 0x0

    check-cast v1, Ljava/lang/Class;

    iget-object v3, p0, Lorg/junit/experimental/max/MaxCore$1;->val$runners:Ljava/util/List;

    invoke-direct {v2, p0, v1, v3}, Lorg/junit/experimental/max/MaxCore$1$1;-><init>(Lorg/junit/experimental/max/MaxCore$1;Ljava/lang/Class;Ljava/util/List;)V
    :try_end_b
    .catch Lorg/junit/runners/model/InitializationError; {:try_start_1 .. :try_end_b} :catch_d

    move-object v1, v2

    .line 117
    :goto_c
    return-object v1

    .line 116
    :catch_d
    move-exception v0

    .line 117
    .local v0, "e":Lorg/junit/runners/model/InitializationError;
    new-instance v1, Lorg/junit/internal/runners/ErrorReportingRunner;

    invoke-direct {v1, v4, v0}, Lorg/junit/internal/runners/ErrorReportingRunner;-><init>(Ljava/lang/Class;Ljava/lang/Throwable;)V

    goto :goto_c
.end method
