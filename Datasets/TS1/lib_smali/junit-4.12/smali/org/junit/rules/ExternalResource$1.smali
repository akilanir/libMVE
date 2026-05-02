.class Lorg/junit/rules/ExternalResource$1;
.super Lorg/junit/runners/model/Statement;
.source "ExternalResource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/rules/ExternalResource;->statement(Lorg/junit/runners/model/Statement;)Lorg/junit/runners/model/Statement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/rules/ExternalResource;

.field final synthetic val$base:Lorg/junit/runners/model/Statement;


# direct methods
.method constructor <init>(Lorg/junit/rules/ExternalResource;Lorg/junit/runners/model/Statement;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 45
    iput-object p1, p0, Lorg/junit/rules/ExternalResource$1;->this$0:Lorg/junit/rules/ExternalResource;

    iput-object p2, p0, Lorg/junit/rules/ExternalResource$1;->val$base:Lorg/junit/runners/model/Statement;

    invoke-direct {p0}, Lorg/junit/runners/model/Statement;-><init>()V

    return-void
.end method


# virtual methods
.method public evaluate()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 46
    iget-object v0, p0, Lorg/junit/rules/ExternalResource$1;->this$0:Lorg/junit/rules/ExternalResource;

    invoke-virtual {v0}, Lorg/junit/rules/ExternalResource;->before()V

    .line 48
    :try_start_5
    iget-object v0, p0, Lorg/junit/rules/ExternalResource$1;->val$base:Lorg/junit/runners/model/Statement;

    invoke-virtual {v0}, Lorg/junit/runners/model/Statement;->evaluate()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_10

    .line 50
    iget-object v0, p0, Lorg/junit/rules/ExternalResource$1;->this$0:Lorg/junit/rules/ExternalResource;

    invoke-virtual {v0}, Lorg/junit/rules/ExternalResource;->after()V

    .line 52
    return-void

    .line 50
    :catchall_10
    move-exception v0

    iget-object v1, p0, Lorg/junit/rules/ExternalResource$1;->this$0:Lorg/junit/rules/ExternalResource;

    invoke-virtual {v1}, Lorg/junit/rules/ExternalResource;->after()V

    throw v0
.end method
