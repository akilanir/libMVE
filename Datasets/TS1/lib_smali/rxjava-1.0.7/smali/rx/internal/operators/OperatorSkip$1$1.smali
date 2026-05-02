.class Lrx/internal/operators/OperatorSkip$1$1;
.super Ljava/lang/Object;
.source "OperatorSkip.java"

# interfaces
.implements Lrx/Producer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorSkip$1;->setProducer(Lrx/Producer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lrx/internal/operators/OperatorSkip$1;

.field final synthetic val$producer:Lrx/Producer;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorSkip$1;Lrx/Producer;)V
    .registers 3

    .prologue
    .line 66
    .local p0, "this":Lrx/internal/operators/OperatorSkip$1$1;, "Lrx/internal/operators/OperatorSkip$1.1;"
    iput-object p1, p0, Lrx/internal/operators/OperatorSkip$1$1;->this$1:Lrx/internal/operators/OperatorSkip$1;

    iput-object p2, p0, Lrx/internal/operators/OperatorSkip$1$1;->val$producer:Lrx/Producer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public request(J)V
    .registers 6
    .param p1, "n"    # J

    .prologue
    .line 70
    .local p0, "this":Lrx/internal/operators/OperatorSkip$1$1;, "Lrx/internal/operators/OperatorSkip$1.1;"
    const-wide v0, 0x7fffffffffffffffL

    cmp-long v0, p1, v0

    if-nez v0, :cond_f

    .line 72
    iget-object v0, p0, Lrx/internal/operators/OperatorSkip$1$1;->val$producer:Lrx/Producer;

    invoke-interface {v0, p1, p2}, Lrx/Producer;->request(J)V

    .line 77
    :cond_e
    :goto_e
    return-void

    .line 73
    :cond_f
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_e

    .line 75
    iget-object v0, p0, Lrx/internal/operators/OperatorSkip$1$1;->val$producer:Lrx/Producer;

    iget-object v1, p0, Lrx/internal/operators/OperatorSkip$1$1;->this$1:Lrx/internal/operators/OperatorSkip$1;

    iget-object v1, v1, Lrx/internal/operators/OperatorSkip$1;->this$0:Lrx/internal/operators/OperatorSkip;

    iget v1, v1, Lrx/internal/operators/OperatorSkip;->toSkip:I

    iget-object v2, p0, Lrx/internal/operators/OperatorSkip$1$1;->this$1:Lrx/internal/operators/OperatorSkip$1;

    iget v2, v2, Lrx/internal/operators/OperatorSkip$1;->skipped:I

    sub-int/2addr v1, v2

    int-to-long v1, v1

    add-long/2addr v1, p1

    invoke-interface {v0, v1, v2}, Lrx/Producer;->request(J)V

    goto :goto_e
.end method
