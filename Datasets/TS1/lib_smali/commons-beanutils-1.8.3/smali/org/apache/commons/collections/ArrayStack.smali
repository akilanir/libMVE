.class public Lorg/apache/commons/collections/ArrayStack;
.super Ljava/util/ArrayList;
.source "ArrayStack.java"

# interfaces
.implements Lorg/apache/commons/collections/Buffer;


# static fields
.field private static final serialVersionUID:J = 0x1d8f8fb5d72f1947L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 61
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "initialSize"    # I

    .prologue
    .line 71
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 72
    return-void
.end method


# virtual methods
.method public empty()Z
    .registers 2

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/apache/commons/collections/ArrayStack;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public get()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 179
    invoke-virtual {p0}, Lorg/apache/commons/collections/ArrayStack;->size()I

    move-result v0

    .line 180
    .local v0, "size":I
    if-nez v0, :cond_c

    .line 181
    new-instance v1, Lorg/apache/commons/collections/BufferUnderflowException;

    invoke-direct {v1}, Lorg/apache/commons/collections/BufferUnderflowException;-><init>()V

    throw v1

    .line 183
    :cond_c
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Lorg/apache/commons/collections/ArrayStack;->get(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public peek()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/EmptyStackException;
        }
    .end annotation

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/apache/commons/collections/ArrayStack;->size()I

    move-result v0

    .line 94
    .local v0, "n":I
    if-gtz v0, :cond_c

    .line 95
    new-instance v1, Ljava/util/EmptyStackException;

    invoke-direct {v1}, Ljava/util/EmptyStackException;-><init>()V

    throw v1

    .line 97
    :cond_c
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Lorg/apache/commons/collections/ArrayStack;->get(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public peek(I)Ljava/lang/Object;
    .registers 4
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/EmptyStackException;
        }
    .end annotation

    .prologue
    .line 111
    invoke-virtual {p0}, Lorg/apache/commons/collections/ArrayStack;->size()I

    move-result v1

    sub-int/2addr v1, p1

    add-int/lit8 v0, v1, -0x1

    .line 112
    .local v0, "m":I
    if-gez v0, :cond_f

    .line 113
    new-instance v1, Ljava/util/EmptyStackException;

    invoke-direct {v1}, Ljava/util/EmptyStackException;-><init>()V

    throw v1

    .line 115
    :cond_f
    invoke-virtual {p0, v0}, Lorg/apache/commons/collections/ArrayStack;->get(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public pop()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/EmptyStackException;
        }
    .end annotation

    .prologue
    .line 126
    invoke-virtual {p0}, Lorg/apache/commons/collections/ArrayStack;->size()I

    move-result v0

    .line 127
    .local v0, "n":I
    if-gtz v0, :cond_c

    .line 128
    new-instance v1, Ljava/util/EmptyStackException;

    invoke-direct {v1}, Ljava/util/EmptyStackException;-><init>()V

    throw v1

    .line 130
    :cond_c
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Lorg/apache/commons/collections/ArrayStack;->remove(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public push(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p1, "item"    # Ljava/lang/Object;

    .prologue
    .line 142
    invoke-virtual {p0, p1}, Lorg/apache/commons/collections/ArrayStack;->add(Ljava/lang/Object;)Z

    .line 143
    return-object p1
.end method

.method public remove()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 193
    invoke-virtual {p0}, Lorg/apache/commons/collections/ArrayStack;->size()I

    move-result v0

    .line 194
    .local v0, "size":I
    if-nez v0, :cond_c

    .line 195
    new-instance v1, Lorg/apache/commons/collections/BufferUnderflowException;

    invoke-direct {v1}, Lorg/apache/commons/collections/BufferUnderflowException;-><init>()V

    throw v1

    .line 197
    :cond_c
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Lorg/apache/commons/collections/ArrayStack;->remove(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public search(Ljava/lang/Object;)I
    .registers 6
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 158
    invoke-virtual {p0}, Lorg/apache/commons/collections/ArrayStack;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .line 159
    .local v1, "i":I
    const/4 v2, 0x1

    .line 160
    .local v2, "n":I
    :goto_7
    if-ltz v1, :cond_1f

    .line 161
    invoke-virtual {p0, v1}, Lorg/apache/commons/collections/ArrayStack;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 162
    .local v0, "current":Ljava/lang/Object;
    if-nez p1, :cond_11

    if-eqz v0, :cond_19

    :cond_11
    if-eqz p1, :cond_1a

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 169
    .end local v0    # "current":Ljava/lang/Object;
    .end local v2    # "n":I
    :cond_19
    :goto_19
    return v2

    .line 166
    .restart local v0    # "current":Ljava/lang/Object;
    .restart local v2    # "n":I
    :cond_1a
    add-int/lit8 v1, v1, -0x1

    .line 167
    add-int/lit8 v2, v2, 0x1

    .line 168
    goto :goto_7

    .line 169
    .end local v0    # "current":Ljava/lang/Object;
    :cond_1f
    const/4 v2, -0x1

    goto :goto_19
.end method
