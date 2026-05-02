.class public abstract Lorg/mozilla/javascript/IdScriptableObject;
.super Lorg/mozilla/javascript/ScriptableObject;
.source "IdScriptableObject.java"

# interfaces
.implements Lorg/mozilla/javascript/IdFunctionCall;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;
    }
.end annotation


# instance fields
.field private transient prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 285
    invoke-direct {p0}, Lorg/mozilla/javascript/ScriptableObject;-><init>()V

    .line 286
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V
    .registers 3
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "prototype"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 290
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ScriptableObject;-><init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V

    .line 291
    return-void
.end method

.method private getBuiltInDescriptor(Ljava/lang/String;)Lorg/mozilla/javascript/ScriptableObject;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 759
    const/4 v4, 0x0

    .line 760
    .local v4, "value":Ljava/lang/Object;
    const/4 v0, 0x0

    .line 762
    .local v0, "attr":I
    invoke-virtual {p0}, Lorg/mozilla/javascript/IdScriptableObject;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v3

    .line 763
    .local v3, "scope":Lorg/mozilla/javascript/Scriptable;
    if-nez v3, :cond_9

    .line 764
    move-object v3, p0

    .line 767
    :cond_9
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v2

    .line 768
    .local v2, "info":I
    if-eqz v2, :cond_1f

    .line 769
    const v5, 0xffff

    and-int v1, v2, v5

    .line 770
    .local v1, "id":I
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v4

    .line 771
    ushr-int/lit8 v0, v2, 0x10

    .line 772
    invoke-static {v3, v4, v0}, Lorg/mozilla/javascript/IdScriptableObject;->buildDataDescriptor(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v5

    .line 782
    .end local v1    # "id":I
    .end local v4    # "value":Ljava/lang/Object;
    :goto_1e
    return-object v5

    .line 774
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_1f
    iget-object v5, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    if-eqz v5, :cond_3c

    .line 775
    iget-object v5, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v5, p1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v1

    .line 776
    .restart local v1    # "id":I
    if-eqz v1, :cond_3c

    .line 777
    iget-object v5, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v5, v1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 778
    iget-object v5, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v5, v1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->getAttributes(I)I

    move-result v0

    .line 779
    invoke-static {v3, v4, v0}, Lorg/mozilla/javascript/IdScriptableObject;->buildDataDescriptor(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;I)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v5

    goto :goto_1e

    .line 782
    .end local v1    # "id":I
    :cond_3c
    const/4 v5, 0x0

    goto :goto_1e
.end method

.method protected static incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;
    .registers 3
    .param p0, "f"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 684
    const-string v0, "msg.incompat.call"

    invoke-virtual {p0}, Lorg/mozilla/javascript/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0
.end method

.method protected static instanceIdInfo(II)I
    .registers 3
    .param p0, "attributes"    # I
    .param p1, "id"    # I

    .prologue
    .line 514
    shl-int/lit8 v0, p0, 0x10

    or-int/2addr v0, p1

    return v0
.end method

.method private newIdFunction(Ljava/lang/Object;ILjava/lang/String;ILorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/IdFunctionObject;
    .registers 13
    .param p1, "tag"    # Ljava/lang/Object;
    .param p2, "id"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "arity"    # I
    .param p5, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 691
    new-instance v0, Lorg/mozilla/javascript/IdFunctionObject;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lorg/mozilla/javascript/IdFunctionObject;-><init>(Lorg/mozilla/javascript/IdFunctionCall;Ljava/lang/Object;ILjava/lang/String;ILorg/mozilla/javascript/Scriptable;)V

    .line 693
    .local v0, "f":Lorg/mozilla/javascript/IdFunctionObject;
    invoke-virtual {p0}, Lorg/mozilla/javascript/IdScriptableObject;->isSealed()Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-virtual {v0}, Lorg/mozilla/javascript/IdFunctionObject;->sealObject()V

    .line 694
    :cond_14
    return-object v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 3
    .param p1, "stream"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 788
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 789
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    .line 790
    .local v0, "maxPrototypeId":I
    if-eqz v0, :cond_c

    .line 791
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/IdScriptableObject;->activatePrototypeMap(I)V

    .line 793
    :cond_c
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 4
    .param p1, "stream"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 798
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 799
    const/4 v0, 0x0

    .line 800
    .local v0, "maxPrototypeId":I
    iget-object v1, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    if-eqz v1, :cond_e

    .line 801
    iget-object v1, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->getMaxId()I

    move-result v0

    .line 803
    :cond_e
    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 804
    return-void
.end method


# virtual methods
.method public final activatePrototypeMap(I)V
    .registers 4
    .param p1, "maxPrototypeId"    # I

    .prologue
    .line 606
    new-instance v0, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-direct {v0, p0, p1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;-><init>(Lorg/mozilla/javascript/IdScriptableObject;I)V

    .line 607
    .local v0, "values":Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;
    monitor-enter p0

    .line 608
    :try_start_6
    iget-object v1, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    if-eqz v1, :cond_13

    .line 609
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 611
    :catchall_10
    move-exception v1

    monitor-exit p0
    :try_end_12
    .catchall {:try_start_6 .. :try_end_12} :catchall_10

    throw v1

    .line 610
    :cond_13
    :try_start_13
    iput-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    .line 611
    monitor-exit p0
    :try_end_16
    .catchall {:try_start_13 .. :try_end_16} :catchall_10

    .line 612
    return-void
.end method

.method protected addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V
    .registers 13
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "tag"    # Ljava/lang/Object;
    .param p3, "id"    # I
    .param p4, "name"    # Ljava/lang/String;
    .param p5, "arity"    # I

    .prologue
    .line 656
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    .local v5, "scope":Lorg/mozilla/javascript/Scriptable;
    move-object v0, p0

    move-object v1, p2

    move v2, p3

    move-object v3, p4

    move v4, p5

    .line 657
    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/IdScriptableObject;->newIdFunction(Ljava/lang/Object;ILjava/lang/String;ILorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/IdFunctionObject;

    move-result-object v6

    .line 658
    .local v6, "f":Lorg/mozilla/javascript/IdFunctionObject;
    invoke-virtual {v6, p1}, Lorg/mozilla/javascript/IdFunctionObject;->addAsProperty(Lorg/mozilla/javascript/Scriptable;)V

    .line 659
    return-void
.end method

.method protected final defaultGet(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 300
    invoke-super {p0, p1, p0}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected final defaultHas(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 295
    invoke-super {p0, p1, p0}, Lorg/mozilla/javascript/ScriptableObject;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    return v0
.end method

.method protected final defaultPut(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 305
    invoke-super {p0, p1, p0, p2}, Lorg/mozilla/javascript/ScriptableObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 306
    return-void
.end method

.method public defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;)V
    .registers 13
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "key"    # Ljava/lang/Object;
    .param p3, "desc"    # Lorg/mozilla/javascript/ScriptableObject;

    .prologue
    .line 699
    instance-of v7, p2, Ljava/lang/String;

    if-eqz v7, :cond_32

    move-object v5, p2

    .line 700
    check-cast v5, Ljava/lang/String;

    .line 701
    .local v5, "name":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v4

    .line 702
    .local v4, "info":I
    if-eqz v4, :cond_1b

    .line 703
    const v7, 0xffff

    and-int v3, v4, v7

    .line 704
    .local v3, "id":I
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/IdScriptableObject;->isAccessorDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v7

    if-eqz v7, :cond_36

    .line 705
    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/IdScriptableObject;->delete(I)V

    .line 722
    .end local v3    # "id":I
    :cond_1b
    iget-object v7, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    if-eqz v7, :cond_32

    .line 723
    iget-object v7, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v7, v5}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v3

    .line 724
    .restart local v3    # "id":I
    if-eqz v3, :cond_32

    .line 725
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/IdScriptableObject;->isAccessorDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v7

    if-eqz v7, :cond_65

    .line 726
    iget-object v7, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v7, v3}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->delete(I)V

    .line 745
    .end local v3    # "id":I
    .end local v4    # "info":I
    .end local v5    # "name":Ljava/lang/String;
    :cond_32
    invoke-super {p0, p1, p2, p3}, Lorg/mozilla/javascript/ScriptableObject;->defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;)V

    .line 746
    :goto_35
    return-void

    .line 707
    .restart local v3    # "id":I
    .restart local v4    # "info":I
    .restart local v5    # "name":Ljava/lang/String;
    :cond_36
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/IdScriptableObject;->checkPropertyDefinition(Lorg/mozilla/javascript/ScriptableObject;)V

    .line 708
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v1

    .line 709
    .local v1, "current":Lorg/mozilla/javascript/ScriptableObject;
    invoke-virtual {p0, v5, v1, p3}, Lorg/mozilla/javascript/IdScriptableObject;->checkPropertyChange(Ljava/lang/String;Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/ScriptableObject;)V

    .line 710
    ushr-int/lit8 v0, v4, 0x10

    .line 711
    .local v0, "attr":I
    const-string v7, "value"

    invoke-static {p3, v7}, Lorg/mozilla/javascript/IdScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 712
    .local v6, "value":Ljava/lang/Object;
    sget-object v7, Lorg/mozilla/javascript/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v6, v7, :cond_5d

    and-int/lit8 v7, v0, 0x1

    if-nez v7, :cond_5d

    .line 713
    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v2

    .line 714
    .local v2, "currentValue":Ljava/lang/Object;
    invoke-virtual {p0, v6, v2}, Lorg/mozilla/javascript/IdScriptableObject;->sameValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5d

    .line 715
    invoke-virtual {p0, v3, v6}, Lorg/mozilla/javascript/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 718
    .end local v2    # "currentValue":Ljava/lang/Object;
    :cond_5d
    invoke-virtual {p0, v0, p3}, Lorg/mozilla/javascript/IdScriptableObject;->applyDescriptorToAttributeBitset(ILorg/mozilla/javascript/ScriptableObject;)I

    move-result v7

    invoke-virtual {p0, v5, v7}, Lorg/mozilla/javascript/IdScriptableObject;->setAttributes(Ljava/lang/String;I)V

    goto :goto_35

    .line 728
    .end local v0    # "attr":I
    .end local v1    # "current":Lorg/mozilla/javascript/ScriptableObject;
    .end local v6    # "value":Ljava/lang/Object;
    :cond_65
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/IdScriptableObject;->checkPropertyDefinition(Lorg/mozilla/javascript/ScriptableObject;)V

    .line 729
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v1

    .line 730
    .restart local v1    # "current":Lorg/mozilla/javascript/ScriptableObject;
    invoke-virtual {p0, v5, v1, p3}, Lorg/mozilla/javascript/IdScriptableObject;->checkPropertyChange(Ljava/lang/String;Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/ScriptableObject;)V

    .line 731
    iget-object v7, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v7, v3}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->getAttributes(I)I

    move-result v0

    .line 732
    .restart local v0    # "attr":I
    const-string v7, "value"

    invoke-static {p3, v7}, Lorg/mozilla/javascript/IdScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 733
    .restart local v6    # "value":Ljava/lang/Object;
    sget-object v7, Lorg/mozilla/javascript/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v6, v7, :cond_94

    and-int/lit8 v7, v0, 0x1

    if-nez v7, :cond_94

    .line 734
    iget-object v7, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v7, v3}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 735
    .restart local v2    # "currentValue":Ljava/lang/Object;
    invoke-virtual {p0, v6, v2}, Lorg/mozilla/javascript/IdScriptableObject;->sameValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_94

    .line 736
    iget-object v7, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v7, v3, p0, v6}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->set(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 739
    .end local v2    # "currentValue":Ljava/lang/Object;
    :cond_94
    iget-object v7, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {p0, v0, p3}, Lorg/mozilla/javascript/IdScriptableObject;->applyDescriptorToAttributeBitset(ILorg/mozilla/javascript/ScriptableObject;)I

    move-result v8

    invoke-virtual {v7, v3, v8}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->setAttributes(II)V

    goto :goto_35
.end method

.method public delete(Ljava/lang/String;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 392
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v2

    .line 393
    .local v2, "info":I
    if-eqz v2, :cond_1d

    .line 395
    invoke-virtual {p0}, Lorg/mozilla/javascript/IdScriptableObject;->isSealed()Z

    move-result v3

    if-nez v3, :cond_1d

    .line 396
    ushr-int/lit8 v0, v2, 0x10

    .line 397
    .local v0, "attr":I
    and-int/lit8 v3, v0, 0x4

    if-nez v3, :cond_1c

    .line 398
    const v3, 0xffff

    and-int v1, v2, v3

    .line 399
    .local v1, "id":I
    sget-object v3, Lorg/mozilla/javascript/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    invoke-virtual {p0, v1, v3}, Lorg/mozilla/javascript/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 414
    .end local v0    # "attr":I
    .end local v1    # "id":I
    :cond_1c
    :goto_1c
    return-void

    .line 404
    :cond_1d
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    if-eqz v3, :cond_35

    .line 405
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v3, p1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v1

    .line 406
    .restart local v1    # "id":I
    if-eqz v1, :cond_35

    .line 407
    invoke-virtual {p0}, Lorg/mozilla/javascript/IdScriptableObject;->isSealed()Z

    move-result v3

    if-nez v3, :cond_1c

    .line 408
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v3, v1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->delete(I)V

    goto :goto_1c

    .line 413
    .end local v1    # "id":I
    :cond_35
    invoke-super {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->delete(Ljava/lang/String;)V

    goto :goto_1c
.end method

.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 573
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->unknown()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public final exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;
    .registers 6
    .param p1, "maxPrototypeId"    # I
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "sealed"    # Z

    .prologue
    .line 581
    if-eq p2, p0, :cond_e

    if-eqz p2, :cond_e

    .line 582
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/IdScriptableObject;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 583
    invoke-static {p2}, Lorg/mozilla/javascript/IdScriptableObject;->getObjectPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/IdScriptableObject;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 586
    :cond_e
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->activatePrototypeMap(I)V

    .line 587
    iget-object v1, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->createPrecachedConstructor()Lorg/mozilla/javascript/IdFunctionObject;

    move-result-object v0

    .line 588
    .local v0, "ctor":Lorg/mozilla/javascript/IdFunctionObject;
    if-eqz p3, :cond_1c

    .line 589
    invoke-virtual {p0}, Lorg/mozilla/javascript/IdScriptableObject;->sealObject()V

    .line 591
    :cond_1c
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/IdScriptableObject;->fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V

    .line 592
    if-eqz p3, :cond_24

    .line 593
    invoke-virtual {v0}, Lorg/mozilla/javascript/IdFunctionObject;->sealObject()V

    .line 595
    :cond_24
    invoke-virtual {v0}, Lorg/mozilla/javascript/IdFunctionObject;->exportAsScopeProperty()V

    .line 596
    return-object v0
.end method

.method protected fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V
    .registers 2
    .param p1, "ctor"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 651
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 524
    const/4 v0, 0x0

    return v0
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 646
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 334
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    .line 335
    .local v2, "value":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_a

    move-object v3, v2

    .line 351
    :goto_9
    return-object v3

    .line 338
    :cond_a
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v1

    .line 339
    .local v1, "info":I
    if-eqz v1, :cond_1f

    .line 340
    const v3, 0xffff

    and-int v0, v1, v3

    .line 341
    .local v0, "id":I
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v2

    .line 342
    sget-object v3, Lorg/mozilla/javascript/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_1f

    move-object v3, v2

    goto :goto_9

    .line 344
    .end local v0    # "id":I
    :cond_1f
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    if-eqz v3, :cond_37

    .line 345
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v3, p1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v0

    .line 346
    .restart local v0    # "id":I
    if-eqz v0, :cond_37

    .line 347
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v3, v0}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 348
    sget-object v3, Lorg/mozilla/javascript/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_37

    move-object v3, v2

    goto :goto_9

    .line 351
    .end local v0    # "id":I
    :cond_37
    sget-object v3, Lorg/mozilla/javascript/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_9
.end method

.method public getAttributes(Ljava/lang/String;)I
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 419
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v2

    .line 420
    .local v2, "info":I
    if-eqz v2, :cond_9

    .line 421
    ushr-int/lit8 v0, v2, 0x10

    .line 430
    :goto_8
    return v0

    .line 424
    :cond_9
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    if-eqz v3, :cond_1c

    .line 425
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v3, p1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v1

    .line 426
    .local v1, "id":I
    if-eqz v1, :cond_1c

    .line 427
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v3, v1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->getAttributes(I)I

    move-result v0

    goto :goto_8

    .line 430
    .end local v1    # "id":I
    :cond_1c
    invoke-super {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getAttributes(Ljava/lang/String;)I

    move-result v0

    goto :goto_8
.end method

.method getIds(Z)[Ljava/lang/Object;
    .registers 15
    .param p1, "getAll"    # Z

    .prologue
    const/4 v12, 0x0

    .line 459
    invoke-super {p0, p1}, Lorg/mozilla/javascript/ScriptableObject;->getIds(Z)[Ljava/lang/Object;

    move-result-object v8

    .line 461
    .local v8, "result":[Ljava/lang/Object;
    iget-object v10, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    if-eqz v10, :cond_f

    .line 462
    iget-object v10, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v10, p1, v8}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->getNames(Z[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    .line 465
    :cond_f
    invoke-virtual {p0}, Lorg/mozilla/javascript/IdScriptableObject;->getMaxInstanceId()I

    move-result v6

    .line 466
    .local v6, "maxInstanceId":I
    if-eqz v6, :cond_50

    .line 467
    const/4 v4, 0x0

    .line 468
    .local v4, "ids":[Ljava/lang/Object;
    const/4 v1, 0x0

    .line 470
    .local v1, "count":I
    move v3, v6

    .local v3, "id":I
    move v2, v1

    .end local v1    # "count":I
    .local v2, "count":I
    :goto_19
    if-eqz v3, :cond_47

    .line 471
    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v7

    .line 472
    .local v7, "name":Ljava/lang/String;
    invoke-virtual {p0, v7}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v5

    .line 473
    .local v5, "info":I
    if-eqz v5, :cond_5f

    .line 474
    ushr-int/lit8 v0, v5, 0x10

    .line 475
    .local v0, "attr":I
    and-int/lit8 v10, v0, 0x4

    if-nez v10, :cond_38

    .line 476
    sget-object v10, Lorg/mozilla/javascript/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v11

    if-ne v10, v11, :cond_38

    move v1, v2

    .line 470
    .end local v0    # "attr":I
    .end local v2    # "count":I
    .restart local v1    # "count":I
    :goto_34
    add-int/lit8 v3, v3, -0x1

    move v2, v1

    .end local v1    # "count":I
    .restart local v2    # "count":I
    goto :goto_19

    .line 480
    .restart local v0    # "attr":I
    :cond_38
    if-nez p1, :cond_3e

    and-int/lit8 v10, v0, 0x2

    if-nez v10, :cond_5f

    .line 481
    :cond_3e
    if-nez v2, :cond_42

    .line 483
    new-array v4, v3, [Ljava/lang/Object;

    .line 485
    :cond_42
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "count":I
    .restart local v1    # "count":I
    aput-object v7, v4, v2

    goto :goto_34

    .line 489
    .end local v0    # "attr":I
    .end local v1    # "count":I
    .end local v5    # "info":I
    .end local v7    # "name":Ljava/lang/String;
    .restart local v2    # "count":I
    :cond_47
    if-eqz v2, :cond_50

    .line 490
    array-length v10, v8

    if-nez v10, :cond_51

    array-length v10, v4

    if-ne v10, v2, :cond_51

    .line 491
    move-object v8, v4

    .line 501
    .end local v2    # "count":I
    .end local v3    # "id":I
    .end local v4    # "ids":[Ljava/lang/Object;
    :cond_50
    :goto_50
    return-object v8

    .line 494
    .restart local v2    # "count":I
    .restart local v3    # "id":I
    .restart local v4    # "ids":[Ljava/lang/Object;
    :cond_51
    array-length v10, v8

    add-int/2addr v10, v2

    new-array v9, v10, [Ljava/lang/Object;

    .line 495
    .local v9, "tmp":[Ljava/lang/Object;
    array-length v10, v8

    invoke-static {v8, v12, v9, v12, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 496
    array-length v10, v8

    invoke-static {v4, v12, v9, v10, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 497
    move-object v8, v9

    goto :goto_50

    .end local v9    # "tmp":[Ljava/lang/Object;
    .restart local v5    # "info":I
    .restart local v7    # "name":Ljava/lang/String;
    :cond_5f
    move v1, v2

    .end local v2    # "count":I
    .restart local v1    # "count":I
    goto :goto_34
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .registers 4
    .param p1, "id"    # I

    .prologue
    .line 531
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .registers 4
    .param p1, "id"    # I

    .prologue
    .line 542
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected getMaxInstanceId()I
    .registers 2

    .prologue
    .line 509
    const/4 v0, 0x0

    return v0
.end method

.method protected getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;
    .registers 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .prologue
    .line 751
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v0

    .line 752
    .local v0, "desc":Lorg/mozilla/javascript/ScriptableObject;
    if-nez v0, :cond_10

    instance-of v1, p2, Ljava/lang/String;

    if-eqz v1, :cond_10

    .line 753
    check-cast p2, Ljava/lang/String;

    .end local p2    # "id":Ljava/lang/Object;
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/IdScriptableObject;->getBuiltInDescriptor(Ljava/lang/String;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v0

    .line 755
    :cond_10
    return-object v0
.end method

.method public has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    const/4 v3, 0x1

    .line 311
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v2

    .line 312
    .local v2, "info":I
    if-eqz v2, :cond_1d

    .line 313
    ushr-int/lit8 v0, v2, 0x10

    .line 314
    .local v0, "attr":I
    and-int/lit8 v4, v0, 0x4

    if-eqz v4, :cond_e

    .line 326
    .end local v0    # "attr":I
    :cond_d
    :goto_d
    return v3

    .line 317
    .restart local v0    # "attr":I
    :cond_e
    const v4, 0xffff

    and-int v1, v2, v4

    .line 318
    .local v1, "id":I
    sget-object v4, Lorg/mozilla/javascript/IdScriptableObject;->NOT_FOUND:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v5

    if-ne v4, v5, :cond_d

    const/4 v3, 0x0

    goto :goto_d

    .line 320
    .end local v0    # "attr":I
    .end local v1    # "id":I
    :cond_1d
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    if-eqz v3, :cond_30

    .line 321
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v3, p1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v1

    .line 322
    .restart local v1    # "id":I
    if-eqz v1, :cond_30

    .line 323
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v3, v1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->has(I)Z

    move-result v3

    goto :goto_d

    .line 326
    .end local v1    # "id":I
    :cond_30
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v3

    goto :goto_d
.end method

.method public final hasPrototypeMap()Z
    .registers 2

    .prologue
    .line 601
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public final initPrototypeConstructor(Lorg/mozilla/javascript/IdFunctionObject;)V
    .registers 6
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 624
    iget-object v1, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    iget v0, v1, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->constructorId:I

    .line 625
    .local v0, "id":I
    if-nez v0, :cond_c

    .line 626
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 627
    :cond_c
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v1

    if-eq v1, v0, :cond_18

    .line 628
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 629
    :cond_18
    invoke-virtual {p0}, Lorg/mozilla/javascript/IdScriptableObject;->isSealed()Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->sealObject()V

    .line 630
    :cond_21
    iget-object v1, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    const-string v2, "constructor"

    const/4 v3, 0x2

    invoke-virtual {v1, v0, v2, p1, v3}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->initValue(ILjava/lang/String;Ljava/lang/Object;I)V

    .line 631
    return-void
.end method

.method protected initPrototypeId(I)V
    .registers 4
    .param p1, "id"    # I

    .prologue
    .line 641
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V
    .registers 12
    .param p1, "tag"    # Ljava/lang/Object;
    .param p2, "id"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "arity"    # I

    .prologue
    .line 617
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    .local v5, "scope":Lorg/mozilla/javascript/Scriptable;
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    .line 618
    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/IdScriptableObject;->newIdFunction(Ljava/lang/Object;ILjava/lang/String;ILorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/IdFunctionObject;

    move-result-object v6

    .line 619
    .local v6, "f":Lorg/mozilla/javascript/IdFunctionObject;
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    const/4 v1, 0x2

    invoke-virtual {v0, p2, p3, v6, v1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->initValue(ILjava/lang/String;Ljava/lang/Object;I)V

    .line 620
    return-void
.end method

.method public final initPrototypeValue(ILjava/lang/String;Ljava/lang/Object;I)V
    .registers 6
    .param p1, "id"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "attributes"    # I

    .prologue
    .line 636
    iget-object v0, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->initValue(ILjava/lang/String;Ljava/lang/Object;I)V

    .line 637
    return-void
.end method

.method public put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 357
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v2

    .line 358
    .local v2, "info":I
    if-eqz v2, :cond_2a

    .line 359
    if-ne p2, p0, :cond_15

    invoke-virtual {p0}, Lorg/mozilla/javascript/IdScriptableObject;->isSealed()Z

    move-result v3

    if-eqz v3, :cond_15

    .line 360
    const-string v3, "msg.modify.sealed"

    invoke-static {v3, p1}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v3

    throw v3

    .line 363
    :cond_15
    ushr-int/lit8 v0, v2, 0x10

    .line 364
    .local v0, "attr":I
    and-int/lit8 v3, v0, 0x1

    if-nez v3, :cond_25

    .line 365
    if-ne p2, p0, :cond_26

    .line 366
    const v3, 0xffff

    and-int v1, v2, v3

    .line 367
    .local v1, "id":I
    invoke-virtual {p0, v1, p3}, Lorg/mozilla/javascript/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 387
    .end local v0    # "attr":I
    .end local v1    # "id":I
    :cond_25
    :goto_25
    return-void

    .line 370
    .restart local v0    # "attr":I
    :cond_26
    invoke-interface {p2, p1, p2, p3}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_25

    .line 375
    .end local v0    # "attr":I
    :cond_2a
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    if-eqz v3, :cond_4b

    .line 376
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v3, p1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v1

    .line 377
    .restart local v1    # "id":I
    if-eqz v1, :cond_4b

    .line 378
    if-ne p2, p0, :cond_45

    invoke-virtual {p0}, Lorg/mozilla/javascript/IdScriptableObject;->isSealed()Z

    move-result v3

    if-eqz v3, :cond_45

    .line 379
    const-string v3, "msg.modify.sealed"

    invoke-static {v3, p1}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v3

    throw v3

    .line 382
    :cond_45
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v3, v1, p2, p3}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->set(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_25

    .line 386
    .end local v1    # "id":I
    :cond_4b
    invoke-super {p0, p1, p2, p3}, Lorg/mozilla/javascript/ScriptableObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_25
.end method

.method public setAttributes(Ljava/lang/String;I)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attributes"    # I

    .prologue
    .line 436
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptableObject;->checkValidAttributes(I)V

    .line 437
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v2

    .line 438
    .local v2, "info":I
    if-eqz v2, :cond_16

    .line 439
    const v3, 0xffff

    and-int v1, v2, v3

    .line 440
    .local v1, "id":I
    ushr-int/lit8 v0, v2, 0x10

    .line 441
    .local v0, "currentAttributes":I
    if-eq p2, v0, :cond_15

    .line 442
    invoke-virtual {p0, v1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->setInstanceIdAttributes(II)V

    .line 454
    .end local v0    # "currentAttributes":I
    .end local v1    # "id":I
    :cond_15
    :goto_15
    return-void

    .line 446
    :cond_16
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    if-eqz v3, :cond_28

    .line 447
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v3, p1}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->findId(Ljava/lang/String;)I

    move-result v1

    .line 448
    .restart local v1    # "id":I
    if-eqz v1, :cond_28

    .line 449
    iget-object v3, p0, Lorg/mozilla/javascript/IdScriptableObject;->prototypeValues:Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;

    invoke-virtual {v3, v1, p2}, Lorg/mozilla/javascript/IdScriptableObject$PrototypeValues;->setAttributes(II)V

    goto :goto_15

    .line 453
    .end local v1    # "id":I
    :cond_28
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->setAttributes(Ljava/lang/String;I)V

    goto :goto_15
.end method

.method protected setInstanceIdAttributes(II)V
    .registers 6
    .param p1, "id"    # I
    .param p2, "attr"    # I

    .prologue
    .line 563
    const-string v0, "InternalError"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Changing attributes not supported for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/mozilla/javascript/IdScriptableObject;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " property"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .registers 5
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 551
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
