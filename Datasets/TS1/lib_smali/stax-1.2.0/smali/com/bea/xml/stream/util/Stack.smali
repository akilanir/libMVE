.class public final Lcom/bea/xml/stream/util/Stack;
.super Ljava/util/AbstractCollection;
.source "Stack.java"


# instance fields
.field private pointer:I

.field private values:[Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 27
    const/16 v0, 0xf

    invoke-direct {p0, v0}, Lcom/bea/xml/stream/util/Stack;-><init>(I)V

    .line 28
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    .line 31
    if-gez p1, :cond_b

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 32
    :cond_b
    new-array v0, p1, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/bea/xml/stream/util/Stack;->values:[Ljava/lang/Object;

    .line 33
    const/4 v0, 0x0

    iput v0, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    .line 34
    return-void
.end method

.method private constructor <init>([Ljava/lang/Object;I)V
    .registers 3
    .param p1, "values"    # [Ljava/lang/Object;
    .param p2, "pointer"    # I

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/bea/xml/stream/util/Stack;->values:[Ljava/lang/Object;

    .line 38
    iput p2, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    .line 39
    return-void
.end method

.method private resize()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 42
    iget v1, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    if-nez v1, :cond_b

    .line 43
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iput-object v1, p0, Lcom/bea/xml/stream/util/Stack;->values:[Ljava/lang/Object;

    .line 49
    :goto_a
    return-void

    .line 46
    :cond_b
    iget v1, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    mul-int/lit8 v1, v1, 0x2

    new-array v0, v1, [Ljava/lang/Object;

    .line 47
    .local v0, "o":[Ljava/lang/Object;
    iget-object v1, p0, Lcom/bea/xml/stream/util/Stack;->values:[Ljava/lang/Object;

    iget v2, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    iput-object v0, p0, Lcom/bea/xml/stream/util/Stack;->values:[Ljava/lang/Object;

    goto :goto_a
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 52
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/util/Stack;->push(Ljava/lang/Object;)V

    .line 53
    const/4 v0, 0x1

    return v0
.end method

.method public clear()V
    .registers 4

    .prologue
    .line 57
    iget-object v0, p0, Lcom/bea/xml/stream/util/Stack;->values:[Ljava/lang/Object;

    .line 58
    .local v0, "v":[Ljava/lang/Object;
    :goto_2
    iget v1, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    if-lez v1, :cond_10

    .line 59
    iget v1, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    const/4 v2, 0x0

    aput-object v2, v0, v1

    goto :goto_2

    .line 61
    :cond_10
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 72
    iget v1, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    new-array v0, v1, [Ljava/lang/Object;

    .line 73
    .local v0, "newValues":[Ljava/lang/Object;
    iget-object v1, p0, Lcom/bea/xml/stream/util/Stack;->values:[Ljava/lang/Object;

    iget v2, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 74
    new-instance v1, Lcom/bea/xml/stream/util/Stack;

    iget v2, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    invoke-direct {v1, v0, v2}, Lcom/bea/xml/stream/util/Stack;-><init>([Ljava/lang/Object;I)V

    return-object v1
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 63
    iget v0, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 66
    iget v1, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    new-array v0, v1, [Ljava/lang/Object;

    .line 67
    .local v0, "o":[Ljava/lang/Object;
    iget-object v1, p0, Lcom/bea/xml/stream/util/Stack;->values:[Ljava/lang/Object;

    iget v2, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 68
    new-instance v1, Lcom/bea/xml/stream/util/ArrayIterator;

    invoke-direct {v1, v0}, Lcom/bea/xml/stream/util/ArrayIterator;-><init>([Ljava/lang/Object;)V

    return-object v1
.end method

.method public peek()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 99
    :try_start_0
    iget-object v1, p0, Lcom/bea/xml/stream/util/Stack;->values:[Ljava/lang/Object;

    iget v2, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    add-int/lit8 v2, v2, -0x1

    aget-object v1, v1, v2
    :try_end_8
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_8} :catch_9

    return-object v1

    .line 100
    :catch_9
    move-exception v0

    .line 101
    .local v0, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v1, Ljava/util/EmptyStackException;

    invoke-direct {v1}, Ljava/util/EmptyStackException;-><init>()V

    throw v1
.end method

.method public pop()Ljava/lang/Object;
    .registers 6

    .prologue
    .line 86
    :try_start_0
    iget-object v2, p0, Lcom/bea/xml/stream/util/Stack;->values:[Ljava/lang/Object;

    iget v3, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    aget-object v1, v2, v3

    .line 87
    .local v1, "o":Ljava/lang/Object;
    iget-object v2, p0, Lcom/bea/xml/stream/util/Stack;->values:[Ljava/lang/Object;

    iget v3, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    const/4 v4, 0x0

    aput-object v4, v2, v3
    :try_end_11
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_11} :catch_12

    .line 88
    return-object v1

    .line 89
    .end local v1    # "o":Ljava/lang/Object;
    :catch_12
    move-exception v0

    .line 92
    .local v0, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    iget v2, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    if-gez v2, :cond_1a

    const/4 v2, 0x0

    iput v2, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    .line 93
    :cond_1a
    new-instance v2, Ljava/util/EmptyStackException;

    invoke-direct {v2}, Ljava/util/EmptyStackException;-><init>()V

    throw v2
.end method

.method public push(Ljava/lang/Object;)V
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 80
    iget v0, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    iget-object v1, p0, Lcom/bea/xml/stream/util/Stack;->values:[Ljava/lang/Object;

    array-length v1, v1

    if-ne v0, v1, :cond_a

    invoke-direct {p0}, Lcom/bea/xml/stream/util/Stack;->resize()V

    .line 81
    :cond_a
    iget-object v0, p0, Lcom/bea/xml/stream/util/Stack;->values:[Ljava/lang/Object;

    iget v1, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    aput-object p1, v0, v1

    .line 82
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 77
    iget v0, p0, Lcom/bea/xml/stream/util/Stack;->pointer:I

    return v0
.end method
