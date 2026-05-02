.class Lorg/apache/commons/net/nntp/ThreadContainer;
.super Ljava/lang/Object;
.source "ThreadContainer.java"


# instance fields
.field child:Lorg/apache/commons/net/nntp/ThreadContainer;

.field next:Lorg/apache/commons/net/nntp/ThreadContainer;

.field parent:Lorg/apache/commons/net/nntp/ThreadContainer;

.field threadable:Lorg/apache/commons/net/nntp/Threadable;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method findChild(Lorg/apache/commons/net/nntp/ThreadContainer;)Z
    .registers 3
    .param p1, "target"    # Lorg/apache/commons/net/nntp/ThreadContainer;

    .prologue
    .line 40
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-nez v0, :cond_6

    .line 41
    const/4 v0, 0x0

    .line 45
    :goto_5
    return v0

    .line 42
    :cond_6
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-ne v0, p1, :cond_c

    .line 43
    const/4 v0, 0x1

    goto :goto_5

    .line 45
    :cond_c
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    invoke-virtual {v0, p1}, Lorg/apache/commons/net/nntp/ThreadContainer;->findChild(Lorg/apache/commons/net/nntp/ThreadContainer;)Z

    move-result v0

    goto :goto_5
.end method

.method flush()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 54
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-eqz v0, :cond_26

    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-nez v0, :cond_26

    .line 55
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "no threadable in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_26
    iput-object v1, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 60
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-eqz v0, :cond_36

    .line 61
    iget-object v2, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-nez v0, :cond_5d

    move-object v0, v1

    :goto_33
    invoke-interface {v2, v0}, Lorg/apache/commons/net/nntp/Threadable;->setChild(Lorg/apache/commons/net/nntp/Threadable;)V

    .line 64
    :cond_36
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-eqz v0, :cond_41

    .line 65
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    invoke-virtual {v0}, Lorg/apache/commons/net/nntp/ThreadContainer;->flush()V

    .line 66
    iput-object v1, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 69
    :cond_41
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-eqz v0, :cond_4f

    .line 70
    iget-object v2, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-nez v0, :cond_62

    move-object v0, v1

    :goto_4c
    invoke-interface {v2, v0}, Lorg/apache/commons/net/nntp/Threadable;->setNext(Lorg/apache/commons/net/nntp/Threadable;)V

    .line 73
    :cond_4f
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-eqz v0, :cond_5a

    .line 74
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    invoke-virtual {v0}, Lorg/apache/commons/net/nntp/ThreadContainer;->flush()V

    .line 75
    iput-object v1, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 78
    :cond_5a
    iput-object v1, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    .line 79
    return-void

    .line 61
    :cond_5d
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v0, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    goto :goto_33

    .line 70
    :cond_62
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v0, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    goto :goto_4c
.end method

.method reverseChildren()V
    .registers 5

    .prologue
    .line 86
    iget-object v3, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-eqz v3, :cond_22

    .line 88
    const/4 v1, 0x0

    .local v1, "prev":Lorg/apache/commons/net/nntp/ThreadContainer;
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .local v0, "kid":Lorg/apache/commons/net/nntp/ThreadContainer;
    iget-object v2, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 89
    .local v2, "rest":Lorg/apache/commons/net/nntp/ThreadContainer;
    :goto_9
    if-eqz v0, :cond_16

    .line 94
    iput-object v1, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 90
    move-object v1, v0

    .line 91
    move-object v0, v2

    .line 92
    if-nez v2, :cond_13

    const/4 v2, 0x0

    :goto_12
    goto :goto_9

    :cond_13
    iget-object v2, v2, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_12

    .line 97
    :cond_16
    iput-object v1, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 100
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    :goto_1a
    if-eqz v0, :cond_22

    .line 101
    invoke-virtual {v0}, Lorg/apache/commons/net/nntp/ThreadContainer;->reverseChildren()V

    .line 100
    iget-object v0, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_1a

    .line 104
    .end local v0    # "kid":Lorg/apache/commons/net/nntp/ThreadContainer;
    .end local v1    # "prev":Lorg/apache/commons/net/nntp/ThreadContainer;
    .end local v2    # "rest":Lorg/apache/commons/net/nntp/ThreadContainer;
    :cond_22
    return-void
.end method
