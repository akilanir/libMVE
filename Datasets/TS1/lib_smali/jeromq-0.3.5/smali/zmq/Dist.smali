.class Lzmq/Dist;
.super Ljava/lang/Object;
.source "Dist.java"


# instance fields
.field private active:I

.field private eligible:I

.field private matching:I

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
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput v0, p0, Lzmq/Dist;->matching:I

    .line 52
    iput v0, p0, Lzmq/Dist;->active:I

    .line 53
    iput v0, p0, Lzmq/Dist;->eligible:I

    .line 54
    iput-boolean v0, p0, Lzmq/Dist;->more:Z

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    .line 56
    return-void
.end method

.method private distribute(Lzmq/Msg;)V
    .registers 4
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    .line 170
    iget v1, p0, Lzmq/Dist;->matching:I

    if-nez v1, :cond_5

    .line 179
    :cond_4
    return-void

    .line 174
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget v1, p0, Lzmq/Dist;->matching:I

    if-ge v0, v1, :cond_4

    .line 175
    iget-object v1, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzmq/Pipe;

    invoke-direct {p0, v1, p1}, Lzmq/Dist;->write(Lzmq/Pipe;Lzmq/Msg;)Z

    move-result v1

    if-nez v1, :cond_1a

    .line 176
    add-int/lit8 v0, v0, -0x1

    .line 174
    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_6
.end method

.method private write(Lzmq/Pipe;Lzmq/Msg;)Z
    .registers 6
    .param p1, "pipe"    # Lzmq/Pipe;
    .param p2, "msg"    # Lzmq/Msg;

    .prologue
    .line 190
    invoke-virtual {p1, p2}, Lzmq/Pipe;->write(Lzmq/Msg;)Z

    move-result v0

    if-nez v0, :cond_43

    .line 191
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    iget-object v1, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    iget v2, p0, Lzmq/Dist;->matching:I

    add-int/lit8 v2, v2, -0x1

    invoke-static {v0, v1, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 192
    iget v0, p0, Lzmq/Dist;->matching:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/Dist;->matching:I

    .line 193
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    iget-object v1, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    iget v2, p0, Lzmq/Dist;->active:I

    add-int/lit8 v2, v2, -0x1

    invoke-static {v0, v1, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 194
    iget v0, p0, Lzmq/Dist;->active:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/Dist;->active:I

    .line 195
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    iget v1, p0, Lzmq/Dist;->active:I

    iget v2, p0, Lzmq/Dist;->eligible:I

    add-int/lit8 v2, v2, -0x1

    invoke-static {v0, v1, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 196
    iget v0, p0, Lzmq/Dist;->eligible:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/Dist;->eligible:I

    .line 197
    const/4 v0, 0x0

    .line 202
    :goto_42
    return v0

    .line 199
    :cond_43
    invoke-virtual {p2}, Lzmq/Msg;->hasMore()Z

    move-result v0

    if-nez v0, :cond_4c

    .line 200
    invoke-virtual {p1}, Lzmq/Pipe;->flush()V

    .line 202
    :cond_4c
    const/4 v0, 0x1

    goto :goto_42
.end method


# virtual methods
.method public activated(Lzmq/Pipe;)V
    .registers 5
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 129
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    iget-object v1, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    iget v2, p0, Lzmq/Dist;->eligible:I

    invoke-static {v0, v1, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 130
    iget v0, p0, Lzmq/Dist;->eligible:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lzmq/Dist;->eligible:I

    .line 134
    iget-boolean v0, p0, Lzmq/Dist;->more:Z

    if-nez v0, :cond_28

    .line 135
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    iget v1, p0, Lzmq/Dist;->eligible:I

    add-int/lit8 v1, v1, -0x1

    iget v2, p0, Lzmq/Dist;->active:I

    invoke-static {v0, v1, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 136
    iget v0, p0, Lzmq/Dist;->active:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lzmq/Dist;->active:I

    .line 138
    :cond_28
    return-void
.end method

.method public attach(Lzmq/Pipe;)V
    .registers 5
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 64
    iget-boolean v0, p0, Lzmq/Dist;->more:Z

    if-eqz v0, :cond_1f

    .line 65
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    iget v1, p0, Lzmq/Dist;->eligible:I

    iget-object v2, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v0, v1, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 68
    iget v0, p0, Lzmq/Dist;->eligible:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lzmq/Dist;->eligible:I

    .line 77
    :goto_1e
    return-void

    .line 71
    :cond_1f
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    iget v1, p0, Lzmq/Dist;->active:I

    iget-object v2, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v0, v1, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 74
    iget v0, p0, Lzmq/Dist;->active:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lzmq/Dist;->active:I

    .line 75
    iget v0, p0, Lzmq/Dist;->eligible:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lzmq/Dist;->eligible:I

    goto :goto_1e
.end method

.method public hasOut()Z
    .registers 2

    .prologue
    .line 183
    const/4 v0, 0x1

    return v0
.end method

.method public match(Lzmq/Pipe;)V
    .registers 5
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 83
    iget-object v1, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 85
    .local v0, "idx":I
    iget v1, p0, Lzmq/Dist;->matching:I

    if-ge v0, v1, :cond_b

    .line 97
    :cond_a
    :goto_a
    return-void

    .line 90
    :cond_b
    iget v1, p0, Lzmq/Dist;->eligible:I

    if-ge v0, v1, :cond_a

    .line 95
    iget-object v1, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    iget v2, p0, Lzmq/Dist;->matching:I

    invoke-static {v1, v0, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 96
    iget v1, p0, Lzmq/Dist;->matching:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lzmq/Dist;->matching:I

    goto :goto_a
.end method

.method public sendToAll(Lzmq/Msg;)Z
    .registers 3
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    .line 143
    iget v0, p0, Lzmq/Dist;->active:I

    iput v0, p0, Lzmq/Dist;->matching:I

    .line 144
    invoke-virtual {p0, p1}, Lzmq/Dist;->sendToMatching(Lzmq/Msg;)Z

    move-result v0

    return v0
.end method

.method public sendToMatching(Lzmq/Msg;)Z
    .registers 4
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    .line 151
    invoke-virtual {p1}, Lzmq/Msg;->hasMore()Z

    move-result v0

    .line 154
    .local v0, "msgMore":Z
    invoke-direct {p0, p1}, Lzmq/Dist;->distribute(Lzmq/Msg;)V

    .line 157
    if-nez v0, :cond_d

    .line 158
    iget v1, p0, Lzmq/Dist;->eligible:I

    iput v1, p0, Lzmq/Dist;->active:I

    .line 161
    :cond_d
    iput-boolean v0, p0, Lzmq/Dist;->more:Z

    .line 163
    const/4 v1, 0x1

    return v1
.end method

.method public terminated(Lzmq/Pipe;)V
    .registers 5
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 110
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    iget v1, p0, Lzmq/Dist;->matching:I

    if-ge v0, v1, :cond_1f

    .line 111
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    iget-object v1, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    iget v2, p0, Lzmq/Dist;->matching:I

    add-int/lit8 v2, v2, -0x1

    invoke-static {v0, v1, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 112
    iget v0, p0, Lzmq/Dist;->matching:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/Dist;->matching:I

    .line 114
    :cond_1f
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    iget v1, p0, Lzmq/Dist;->active:I

    if-ge v0, v1, :cond_3e

    .line 115
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    iget-object v1, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    iget v2, p0, Lzmq/Dist;->active:I

    add-int/lit8 v2, v2, -0x1

    invoke-static {v0, v1, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 116
    iget v0, p0, Lzmq/Dist;->active:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/Dist;->active:I

    .line 118
    :cond_3e
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    iget v1, p0, Lzmq/Dist;->eligible:I

    if-ge v0, v1, :cond_5d

    .line 119
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    iget-object v1, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    iget v2, p0, Lzmq/Dist;->eligible:I

    add-int/lit8 v2, v2, -0x1

    invoke-static {v0, v1, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 120
    iget v0, p0, Lzmq/Dist;->eligible:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/Dist;->eligible:I

    .line 122
    :cond_5d
    iget-object v0, p0, Lzmq/Dist;->pipes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 123
    return-void
.end method

.method public unmatch()V
    .registers 2

    .prologue
    .line 102
    const/4 v0, 0x0

    iput v0, p0, Lzmq/Dist;->matching:I

    .line 103
    return-void
.end method
