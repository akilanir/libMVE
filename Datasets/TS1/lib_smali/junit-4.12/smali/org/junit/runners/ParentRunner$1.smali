.class Lorg/junit/runners/ParentRunner$1;
.super Ljava/lang/Object;
.source "ParentRunner.java"

# interfaces
.implements Lorg/junit/runners/model/RunnerScheduler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/runners/ParentRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/runners/ParentRunner;


# direct methods
.method constructor <init>(Lorg/junit/runners/ParentRunner;)V
    .registers 2

    .prologue
    .line 74
    .local p0, "this":Lorg/junit/runners/ParentRunner$1;, "Lorg/junit/runners/ParentRunner.1;"
    iput-object p1, p0, Lorg/junit/runners/ParentRunner$1;->this$0:Lorg/junit/runners/ParentRunner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public finished()V
    .registers 1

    .prologue
    .line 76
    .local p0, "this":Lorg/junit/runners/ParentRunner$1;, "Lorg/junit/runners/ParentRunner.1;"
    return-void
.end method

.method public schedule(Ljava/lang/Runnable;)V
    .registers 2
    .param p1, "childStatement"    # Ljava/lang/Runnable;

    .prologue
    .line 71
    .local p0, "this":Lorg/junit/runners/ParentRunner$1;, "Lorg/junit/runners/ParentRunner.1;"
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 72
    return-void
.end method
