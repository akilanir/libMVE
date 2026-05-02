.class public Lzmq/LB;
.super Ljava/lang/Object;
.source "LB.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private active:I

.field private current:I

.field private dropping:Z

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
    .line 25
    const-class v0, Lzmq/LB;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/LB;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput v0, p0, Lzmq/LB;->active:I

    .line 46
    iput v0, p0, Lzmq/LB;->current:I

    .line 47
    iput-boolean v0, p0, Lzmq/LB;->more:Z

    .line 48
    iput-boolean v0, p0, Lzmq/LB;->dropping:Z

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lzmq/LB;->pipes:Ljava/util/List;

    .line 51
    return-void
.end method


# virtual methods
.method public activated(Lzmq/Pipe;)V
    .registers 5
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 84
    iget-object v0, p0, Lzmq/LB;->pipes:Ljava/util/List;

    iget-object v1, p0, Lzmq/LB;->pipes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    iget v2, p0, Lzmq/LB;->active:I

    invoke-static {v0, v1, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 85
    iget v0, p0, Lzmq/LB;->active:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lzmq/LB;->active:I

    .line 86
    return-void
.end method

.method public attach(Lzmq/Pipe;)V
    .registers 3
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 55
    iget-object v0, p0, Lzmq/LB;->pipes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    invoke-virtual {p0, p1}, Lzmq/LB;->activated(Lzmq/Pipe;)V

    .line 57
    return-void
.end method

.method public hasOut()Z
    .registers 6

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 138
    iget-boolean v0, p0, Lzmq/LB;->more:Z

    if-eqz v0, :cond_1f

    move v0, v1

    .line 156
    :goto_7
    return v0

    .line 149
    :cond_8
    iget v0, p0, Lzmq/LB;->active:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/LB;->active:I

    .line 150
    iget-object v0, p0, Lzmq/LB;->pipes:Ljava/util/List;

    iget v3, p0, Lzmq/LB;->current:I

    iget v4, p0, Lzmq/LB;->active:I

    invoke-static {v0, v3, v4}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 151
    iget v0, p0, Lzmq/LB;->current:I

    iget v3, p0, Lzmq/LB;->active:I

    if-ne v0, v3, :cond_1f

    .line 152
    iput v2, p0, Lzmq/LB;->current:I

    .line 142
    :cond_1f
    iget v0, p0, Lzmq/LB;->active:I

    if-lez v0, :cond_35

    .line 144
    iget-object v0, p0, Lzmq/LB;->pipes:Ljava/util/List;

    iget v3, p0, Lzmq/LB;->current:I

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmq/Pipe;

    invoke-virtual {v0}, Lzmq/Pipe;->checkWrite()Z

    move-result v0

    if-eqz v0, :cond_8

    move v0, v1

    .line 145
    goto :goto_7

    :cond_35
    move v0, v2

    .line 156
    goto :goto_7
.end method

.method public send(Lzmq/Msg;Lzmq/ValueReference;)Z
    .registers 8
    .param p1, "msg"    # Lzmq/Msg;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lzmq/Msg;",
            "Lzmq/ValueReference",
            "<",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p2, "errno":Lzmq/ValueReference;, "Lzmq/ValueReference<Ljava/lang/Integer;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 92
    iget-boolean v0, p0, Lzmq/LB;->dropping:Z

    if-eqz v0, :cond_27

    .line 93
    invoke-virtual {p1}, Lzmq/Msg;->hasMore()Z

    move-result v0

    iput-boolean v0, p0, Lzmq/LB;->more:Z

    .line 94
    iget-boolean v0, p0, Lzmq/LB;->more:Z

    iput-boolean v0, p0, Lzmq/LB;->dropping:Z

    move v0, v1

    .line 131
    :goto_11
    return v0

    .line 106
    :cond_12
    iget v0, p0, Lzmq/LB;->active:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzmq/LB;->active:I

    .line 107
    iget v0, p0, Lzmq/LB;->current:I

    iget v3, p0, Lzmq/LB;->active:I

    if-ge v0, v3, :cond_58

    .line 108
    iget-object v0, p0, Lzmq/LB;->pipes:Ljava/util/List;

    iget v3, p0, Lzmq/LB;->current:I

    iget v4, p0, Lzmq/LB;->active:I

    invoke-static {v0, v3, v4}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 100
    :cond_27
    :goto_27
    iget v0, p0, Lzmq/LB;->active:I

    if-lez v0, :cond_3b

    .line 101
    iget-object v0, p0, Lzmq/LB;->pipes:Ljava/util/List;

    iget v3, p0, Lzmq/LB;->current:I

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmq/Pipe;

    invoke-virtual {v0, p1}, Lzmq/Pipe;->write(Lzmq/Msg;)Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 116
    :cond_3b
    iget v0, p0, Lzmq/LB;->active:I

    if-nez v0, :cond_5b

    .line 117
    const/16 v0, 0x23

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p2, v0}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    move v0, v2

    .line 118
    goto :goto_11

    .line 105
    :cond_4a
    sget-boolean v0, Lzmq/LB;->$assertionsDisabled:Z

    if-nez v0, :cond_12

    iget-boolean v0, p0, Lzmq/LB;->more:Z

    if-eqz v0, :cond_12

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 111
    :cond_58
    iput v2, p0, Lzmq/LB;->current:I

    goto :goto_27

    .line 123
    :cond_5b
    invoke-virtual {p1}, Lzmq/Msg;->hasMore()Z

    move-result v0

    iput-boolean v0, p0, Lzmq/LB;->more:Z

    .line 124
    iget-boolean v0, p0, Lzmq/LB;->more:Z

    if-nez v0, :cond_7e

    .line 125
    iget-object v0, p0, Lzmq/LB;->pipes:Ljava/util/List;

    iget v3, p0, Lzmq/LB;->current:I

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmq/Pipe;

    invoke-virtual {v0}, Lzmq/Pipe;->flush()V

    .line 126
    iget v0, p0, Lzmq/LB;->current:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lzmq/LB;->current:I

    iget v3, p0, Lzmq/LB;->active:I

    if-lt v0, v3, :cond_7e

    .line 127
    iput v2, p0, Lzmq/LB;->current:I

    :cond_7e
    move v0, v1

    .line 131
    goto :goto_11
.end method

.method public terminated(Lzmq/Pipe;)V
    .registers 5
    .param p1, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 61
    iget-object v1, p0, Lzmq/LB;->pipes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 65
    .local v0, "index":I
    iget v1, p0, Lzmq/LB;->current:I

    if-ne v0, v1, :cond_11

    iget-boolean v1, p0, Lzmq/LB;->more:Z

    if-eqz v1, :cond_11

    .line 66
    const/4 v1, 0x1

    iput-boolean v1, p0, Lzmq/LB;->dropping:Z

    .line 71
    :cond_11
    iget v1, p0, Lzmq/LB;->active:I

    if-ge v0, v1, :cond_2b

    .line 72
    iget v1, p0, Lzmq/LB;->active:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lzmq/LB;->active:I

    .line 73
    iget-object v1, p0, Lzmq/LB;->pipes:Ljava/util/List;

    iget v2, p0, Lzmq/LB;->active:I

    invoke-static {v1, v0, v2}, Lzmq/Utils;->swap(Ljava/util/List;II)V

    .line 74
    iget v1, p0, Lzmq/LB;->current:I

    iget v2, p0, Lzmq/LB;->active:I

    if-ne v1, v2, :cond_2b

    .line 75
    const/4 v1, 0x0

    iput v1, p0, Lzmq/LB;->current:I

    .line 78
    :cond_2b
    iget-object v1, p0, Lzmq/LB;->pipes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 79
    return-void
.end method
