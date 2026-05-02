.class Lzmq/FQ;
.super Ljava/lang/Object;
.source "FQ.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private active:I

.field private current:I

.field private more:Z

.field private final pipes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lzmq/Pipe;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    const-class v0, Lzmq/FQ;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/FQ;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput v0, p0, Lzmq/FQ;->active:I

    .line 47
    iput v0, p0, Lzmq/FQ;->current:I

    .line 48
    iput-boolean v0, p0, Lzmq/FQ;->more:Z

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lzmq/FQ;->pipes:Ljava/util/List;

    .line 51
    return-void
.end method


# virtual methods
.method public activated(Lzmq/Pipe;)V
    .registers 5
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 79
    iget-object v0, p0, Lzmq/FQ;->pipes:Ljava/util/List;

    iget-object v1, p0, Lzmq/FQ;->pipes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    iget v2, p0, Lzmq/FQ;->active:I

    invoke-static {v0, v1, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 80
    iget v0, p0, Lzmq/FQ;->active:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lzmq/FQ;->active:I

    .line 81
    return-void
.end method

.method public attach(Lzmq/Pipe;)V
    .registers 5
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 55
    iget-object v0, p0, Lzmq/FQ;->pipes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    iget-object v0, p0, Lzmq/FQ;->pipes:Ljava/util/List;

    iget v1, p0, Lzmq/FQ;->active:I

    iget-object v2, p0, Lzmq/FQ;->pipes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v0, v1, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 57
    iget v0, p0, Lzmq/FQ;->active:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lzmq/FQ;->active:I

    .line 58
    return-void
.end method

.method public hasIn()Z
    .registers 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 132
    iget-boolean v0, p0, Lzmq/FQ;->more:Z

    if-eqz v0, :cond_1f

    move v0, v1

    .line 153
    :goto_7
    return v0

    .line 146
    :cond_8
    iget v0, p0, Lzmq/FQ;->active:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/FQ;->active:I

    .line 147
    iget-object v0, p0, Lzmq/FQ;->pipes:Ljava/util/List;

    iget v3, p0, Lzmq/FQ;->current:I

    iget v4, p0, Lzmq/FQ;->active:I

    invoke-static {v0, v3, v4}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 148
    iget v0, p0, Lzmq/FQ;->current:I

    iget v3, p0, Lzmq/FQ;->active:I

    if-ne v0, v3, :cond_1f

    .line 149
    iput v2, p0, Lzmq/FQ;->current:I

    .line 140
    :cond_1f
    iget v0, p0, Lzmq/FQ;->active:I

    if-lez v0, :cond_35

    .line 141
    iget-object v0, p0, Lzmq/FQ;->pipes:Ljava/util/List;

    iget v3, p0, Lzmq/FQ;->current:I

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmq/Pipe;

    invoke-virtual {v0}, Lzmq/Pipe;->checkRead()Z

    move-result v0

    if-eqz v0, :cond_8

    move v0, v1

    .line 142
    goto :goto_7

    :cond_35
    move v0, v2

    .line 153
    goto :goto_7
.end method

.method public recv(Lzmq/ValueReference;)Lzmq/Msg;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lzmq/ValueReference",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lzmq/Msg;"
        }
    .end annotation

    .prologue
    .line 85
    .local p1, "errno":Lzmq/ValueReference;, "Lzmq/ValueReference<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lzmq/FQ;->recvPipe(Lzmq/ValueReference;Lzmq/ValueReference;)Lzmq/Msg;

    move-result-object v0

    return-object v0
.end method

.method public recvPipe(Lzmq/ValueReference;Lzmq/ValueReference;)Lzmq/Msg;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lzmq/ValueReference",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Lzmq/ValueReference",
            "<",
            "Lzmq/Pipe;",
            ">;)",
            "Lzmq/Msg;"
        }
    .end annotation

    .prologue
    .local p1, "errno":Lzmq/ValueReference;, "Lzmq/ValueReference<Ljava/lang/Integer;>;"
    .local p2, "pipe":Lzmq/ValueReference;, "Lzmq/ValueReference<Lzmq/Pipe;>;"
    const/4 v3, 0x0

    .line 91
    :cond_1
    :goto_1
    iget v2, p0, Lzmq/FQ;->active:I

    if-lez v2, :cond_61

    .line 94
    iget-object v2, p0, Lzmq/FQ;->pipes:Ljava/util/List;

    iget v4, p0, Lzmq/FQ;->current:I

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzmq/Pipe;

    invoke-virtual {v2}, Lzmq/Pipe;->read()Lzmq/Msg;

    move-result-object v1

    .line 95
    .local v1, "msg":Lzmq/Msg;
    if-eqz v1, :cond_39

    const/4 v0, 0x1

    .line 100
    .local v0, "fetched":Z
    :goto_16
    if-eqz v0, :cond_3b

    .line 101
    if-eqz p2, :cond_25

    .line 102
    iget-object v2, p0, Lzmq/FQ;->pipes:Ljava/util/List;

    iget v3, p0, Lzmq/FQ;->current:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p2, v2}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    .line 104
    :cond_25
    invoke-virtual {v1}, Lzmq/Msg;->hasMore()Z

    move-result v2

    iput-boolean v2, p0, Lzmq/FQ;->more:Z

    .line 105
    iget-boolean v2, p0, Lzmq/FQ;->more:Z

    if-nez v2, :cond_38

    .line 106
    iget v2, p0, Lzmq/FQ;->current:I

    add-int/lit8 v2, v2, 0x1

    iget v3, p0, Lzmq/FQ;->active:I

    rem-int/2addr v2, v3

    iput v2, p0, Lzmq/FQ;->current:I

    .line 126
    .end local v0    # "fetched":Z
    .end local v1    # "msg":Lzmq/Msg;
    :cond_38
    :goto_38
    return-object v1

    .restart local v1    # "msg":Lzmq/Msg;
    :cond_39
    move v0, v3

    .line 95
    goto :goto_16

    .line 114
    .restart local v0    # "fetched":Z
    :cond_3b
    sget-boolean v2, Lzmq/FQ;->$assertionsDisabled:Z

    if-nez v2, :cond_49

    iget-boolean v2, p0, Lzmq/FQ;->more:Z

    if-eqz v2, :cond_49

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 116
    :cond_49
    iget v2, p0, Lzmq/FQ;->active:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lzmq/FQ;->active:I

    .line 117
    iget-object v2, p0, Lzmq/FQ;->pipes:Ljava/util/List;

    iget v4, p0, Lzmq/FQ;->current:I

    iget v5, p0, Lzmq/FQ;->active:I

    invoke-static {v2, v4, v5}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 118
    iget v2, p0, Lzmq/FQ;->current:I

    iget v4, p0, Lzmq/FQ;->active:I

    if-ne v2, v4, :cond_1

    .line 119
    iput v3, p0, Lzmq/FQ;->current:I

    goto :goto_1

    .line 125
    .end local v0    # "fetched":Z
    .end local v1    # "msg":Lzmq/Msg;
    :cond_61
    const/16 v2, 0x23

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v2}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    .line 126
    const/4 v1, 0x0

    goto :goto_38
.end method

.method public terminated(Lzmq/Pipe;)V
    .registers 5
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 62
    iget-object v1, p0, Lzmq/FQ;->pipes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 66
    .local v0, "index":I
    iget v1, p0, Lzmq/FQ;->active:I

    if-ge v0, v1, :cond_20

    .line 67
    iget v1, p0, Lzmq/FQ;->active:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lzmq/FQ;->active:I

    .line 68
    iget-object v1, p0, Lzmq/FQ;->pipes:Ljava/util/List;

    iget v2, p0, Lzmq/FQ;->active:I

    invoke-static {v1, v0, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 69
    iget v1, p0, Lzmq/FQ;->current:I

    iget v2, p0, Lzmq/FQ;->active:I

    if-ne v1, v2, :cond_20

    .line 70
    const/4 v1, 0x0

    iput v1, p0, Lzmq/FQ;->current:I

    .line 73
    :cond_20
    iget-object v1, p0, Lzmq/FQ;->pipes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 74
    return-void
.end method
