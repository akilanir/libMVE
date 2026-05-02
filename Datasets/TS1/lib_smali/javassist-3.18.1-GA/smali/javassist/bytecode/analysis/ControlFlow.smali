.class public Ljavassist/bytecode/analysis/ControlFlow;
.super Ljava/lang/Object;
.source "ControlFlow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/bytecode/analysis/ControlFlow$Catcher;,
        Ljavassist/bytecode/analysis/ControlFlow$Node;,
        Ljavassist/bytecode/analysis/ControlFlow$Access;,
        Ljavassist/bytecode/analysis/ControlFlow$Block;
    }
.end annotation


# instance fields
.field private basicBlocks:[Ljavassist/bytecode/analysis/ControlFlow$Block;

.field private clazz:Ljavassist/CtClass;

.field private frames:[Ljavassist/bytecode/analysis/Frame;

.field private methodInfo:Ljavassist/bytecode/MethodInfo;


# direct methods
.method public constructor <init>(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V
    .registers 13
    .param p1, "ctclazz"    # Ljavassist/CtClass;
    .param p2, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Ljavassist/bytecode/analysis/ControlFlow;->clazz:Ljavassist/CtClass;

    .line 64
    iput-object p2, p0, Ljavassist/bytecode/analysis/ControlFlow;->methodInfo:Ljavassist/bytecode/MethodInfo;

    .line 65
    const/4 v6, 0x0

    iput-object v6, p0, Ljavassist/bytecode/analysis/ControlFlow;->frames:[Ljavassist/bytecode/analysis/Frame;

    .line 66
    new-instance v6, Ljavassist/bytecode/analysis/ControlFlow$1;

    invoke-direct {v6, p0}, Ljavassist/bytecode/analysis/ControlFlow$1;-><init>(Ljavassist/bytecode/analysis/ControlFlow;)V

    invoke-virtual {v6, p2}, Ljavassist/bytecode/analysis/ControlFlow$1;->make(Ljavassist/bytecode/MethodInfo;)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v6

    check-cast v6, [Ljavassist/bytecode/analysis/ControlFlow$Block;

    check-cast v6, [Ljavassist/bytecode/analysis/ControlFlow$Block;

    iput-object v6, p0, Ljavassist/bytecode/analysis/ControlFlow;->basicBlocks:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    .line 74
    iget-object v6, p0, Ljavassist/bytecode/analysis/ControlFlow;->basicBlocks:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    array-length v5, v6

    .line 75
    .local v5, "size":I
    new-array v1, v5, [I

    .line 76
    .local v1, "counters":[I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1f
    if-ge v3, v5, :cond_35

    .line 77
    iget-object v6, p0, Ljavassist/bytecode/analysis/ControlFlow;->basicBlocks:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    aget-object v0, v6, v3

    .line 78
    .local v0, "b":Ljavassist/bytecode/analysis/ControlFlow$Block;
    iput v3, v0, Ljavassist/bytecode/analysis/ControlFlow$Block;->index:I

    .line 79
    invoke-virtual {v0}, Ljavassist/bytecode/analysis/ControlFlow$Block;->incomings()I

    move-result v6

    new-array v6, v6, [Ljavassist/bytecode/analysis/ControlFlow$Block;

    iput-object v6, v0, Ljavassist/bytecode/analysis/ControlFlow$Block;->entrances:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    .line 80
    const/4 v6, 0x0

    aput v6, v1, v3

    .line 76
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    .line 83
    .end local v0    # "b":Ljavassist/bytecode/analysis/ControlFlow$Block;
    :cond_35
    const/4 v3, 0x0

    :goto_36
    if-ge v3, v5, :cond_59

    .line 84
    iget-object v6, p0, Ljavassist/bytecode/analysis/ControlFlow;->basicBlocks:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    aget-object v0, v6, v3

    .line 85
    .restart local v0    # "b":Ljavassist/bytecode/analysis/ControlFlow$Block;
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_3d
    invoke-virtual {v0}, Ljavassist/bytecode/analysis/ControlFlow$Block;->exits()I

    move-result v6

    if-ge v4, v6, :cond_56

    .line 86
    invoke-virtual {v0, v4}, Ljavassist/bytecode/analysis/ControlFlow$Block;->exit(I)Ljavassist/bytecode/analysis/ControlFlow$Block;

    move-result-object v2

    .line 87
    .local v2, "e":Ljavassist/bytecode/analysis/ControlFlow$Block;
    iget-object v6, v2, Ljavassist/bytecode/analysis/ControlFlow$Block;->entrances:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    iget v7, v2, Ljavassist/bytecode/analysis/ControlFlow$Block;->index:I

    aget v8, v1, v7

    add-int/lit8 v9, v8, 0x1

    aput v9, v1, v7

    aput-object v0, v6, v8

    .line 85
    add-int/lit8 v4, v4, 0x1

    goto :goto_3d

    .line 83
    .end local v2    # "e":Ljavassist/bytecode/analysis/ControlFlow$Block;
    :cond_56
    add-int/lit8 v3, v3, 0x1

    goto :goto_36

    .line 90
    .end local v0    # "b":Ljavassist/bytecode/analysis/ControlFlow$Block;
    .end local v4    # "k":I
    :cond_59
    return-void
.end method

.method public constructor <init>(Ljavassist/CtMethod;)V
    .registers 4
    .param p1, "method"    # Ljavassist/CtMethod;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 56
    invoke-virtual {p1}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v0

    invoke-virtual {p1}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Ljavassist/bytecode/analysis/ControlFlow;-><init>(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V

    .line 57
    return-void
.end method

.method static synthetic access$000(Ljavassist/bytecode/analysis/ControlFlow;)Ljavassist/bytecode/MethodInfo;
    .registers 2
    .param p0, "x0"    # Ljavassist/bytecode/analysis/ControlFlow;

    .prologue
    .line 46
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow;->methodInfo:Ljavassist/bytecode/MethodInfo;

    return-object v0
.end method


# virtual methods
.method public basicBlocks()[Ljavassist/bytecode/analysis/ControlFlow$Block;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow;->basicBlocks:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    return-object v0
.end method

.method public dominatorTree()[Ljavassist/bytecode/analysis/ControlFlow$Node;
    .registers 11

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 135
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow;->basicBlocks:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    array-length v8, v0

    .line 136
    .local v8, "size":I
    if-nez v8, :cond_8

    .line 157
    :goto_7
    return-object v1

    .line 139
    :cond_8
    new-array v7, v8, [Ljavassist/bytecode/analysis/ControlFlow$Node;

    .line 140
    .local v7, "nodes":[Ljavassist/bytecode/analysis/ControlFlow$Node;
    new-array v2, v8, [Z

    .line 141
    .local v2, "visited":[Z
    new-array v4, v8, [I

    .line 142
    .local v4, "distance":[I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_f
    if-ge v6, v8, :cond_21

    .line 143
    new-instance v0, Ljavassist/bytecode/analysis/ControlFlow$Node;

    iget-object v9, p0, Ljavassist/bytecode/analysis/ControlFlow;->basicBlocks:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    aget-object v9, v9, v6

    invoke-direct {v0, v9}, Ljavassist/bytecode/analysis/ControlFlow$Node;-><init>(Ljavassist/bytecode/analysis/ControlFlow$Block;)V

    aput-object v0, v7, v6

    .line 144
    aput-boolean v3, v2, v6

    .line 142
    add-int/lit8 v6, v6, 0x1

    goto :goto_f

    .line 147
    :cond_21
    new-instance v5, Ljavassist/bytecode/analysis/ControlFlow$2;

    invoke-direct {v5, p0, v7}, Ljavassist/bytecode/analysis/ControlFlow$2;-><init>(Ljavassist/bytecode/analysis/ControlFlow;[Ljavassist/bytecode/analysis/ControlFlow$Node;)V

    .line 151
    .local v5, "access":Ljavassist/bytecode/analysis/ControlFlow$Access;
    aget-object v0, v7, v3

    invoke-virtual/range {v0 .. v5}, Ljavassist/bytecode/analysis/ControlFlow$Node;->makeDepth1stTree(Ljavassist/bytecode/analysis/ControlFlow$Node;[ZI[ILjavassist/bytecode/analysis/ControlFlow$Access;)I

    .line 153
    :cond_2b
    const/4 v6, 0x0

    :goto_2c
    if-ge v6, v8, :cond_33

    .line 154
    aput-boolean v3, v2, v6

    .line 153
    add-int/lit8 v6, v6, 0x1

    goto :goto_2c

    .line 155
    :cond_33
    aget-object v0, v7, v3

    invoke-virtual {v0, v2, v4, v5}, Ljavassist/bytecode/analysis/ControlFlow$Node;->makeDominatorTree([Z[ILjavassist/bytecode/analysis/ControlFlow$Access;)Z

    move-result v0

    if-nez v0, :cond_2b

    .line 156
    # invokes: Ljavassist/bytecode/analysis/ControlFlow$Node;->setChildren([Ljavassist/bytecode/analysis/ControlFlow$Node;)V
    invoke-static {v7}, Ljavassist/bytecode/analysis/ControlFlow$Node;->access$200([Ljavassist/bytecode/analysis/ControlFlow$Node;)V

    move-object v1, v7

    .line 157
    goto :goto_7
.end method

.method public frameAt(I)Ljavassist/bytecode/analysis/Frame;
    .registers 5
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 108
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow;->frames:[Ljavassist/bytecode/analysis/Frame;

    if-nez v0, :cond_13

    .line 109
    new-instance v0, Ljavassist/bytecode/analysis/Analyzer;

    invoke-direct {v0}, Ljavassist/bytecode/analysis/Analyzer;-><init>()V

    iget-object v1, p0, Ljavassist/bytecode/analysis/ControlFlow;->clazz:Ljavassist/CtClass;

    iget-object v2, p0, Ljavassist/bytecode/analysis/ControlFlow;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0, v1, v2}, Ljavassist/bytecode/analysis/Analyzer;->analyze(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)[Ljavassist/bytecode/analysis/Frame;

    move-result-object v0

    iput-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow;->frames:[Ljavassist/bytecode/analysis/Frame;

    .line 111
    :cond_13
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow;->frames:[Ljavassist/bytecode/analysis/Frame;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public postDominatorTree()[Ljavassist/bytecode/analysis/ControlFlow$Node;
    .registers 13

    .prologue
    const/4 v1, 0x0

    const/4 v11, 0x0

    .line 181
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow;->basicBlocks:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    array-length v9, v0

    .line 182
    .local v9, "size":I
    if-nez v9, :cond_8

    .line 216
    :goto_7
    return-object v1

    .line 185
    :cond_8
    new-array v8, v9, [Ljavassist/bytecode/analysis/ControlFlow$Node;

    .line 186
    .local v8, "nodes":[Ljavassist/bytecode/analysis/ControlFlow$Node;
    new-array v2, v9, [Z

    .line 187
    .local v2, "visited":[Z
    new-array v4, v9, [I

    .line 188
    .local v4, "distance":[I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_f
    if-ge v7, v9, :cond_21

    .line 189
    new-instance v0, Ljavassist/bytecode/analysis/ControlFlow$Node;

    iget-object v10, p0, Ljavassist/bytecode/analysis/ControlFlow;->basicBlocks:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    aget-object v10, v10, v7

    invoke-direct {v0, v10}, Ljavassist/bytecode/analysis/ControlFlow$Node;-><init>(Ljavassist/bytecode/analysis/ControlFlow$Block;)V

    aput-object v0, v8, v7

    .line 190
    aput-boolean v11, v2, v7

    .line 188
    add-int/lit8 v7, v7, 0x1

    goto :goto_f

    .line 193
    :cond_21
    new-instance v5, Ljavassist/bytecode/analysis/ControlFlow$3;

    invoke-direct {v5, p0, v8}, Ljavassist/bytecode/analysis/ControlFlow$3;-><init>(Ljavassist/bytecode/analysis/ControlFlow;[Ljavassist/bytecode/analysis/ControlFlow$Node;)V

    .line 198
    .local v5, "access":Ljavassist/bytecode/analysis/ControlFlow$Access;
    const/4 v3, 0x0

    .line 199
    .local v3, "counter":I
    const/4 v7, 0x0

    :goto_28
    if-ge v7, v9, :cond_3f

    .line 200
    aget-object v0, v8, v7

    # getter for: Ljavassist/bytecode/analysis/ControlFlow$Node;->block:Ljavassist/bytecode/analysis/ControlFlow$Block;
    invoke-static {v0}, Ljavassist/bytecode/analysis/ControlFlow$Node;->access$100(Ljavassist/bytecode/analysis/ControlFlow$Node;)Ljavassist/bytecode/analysis/ControlFlow$Block;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/bytecode/analysis/ControlFlow$Block;->exits()I

    move-result v0

    if-nez v0, :cond_3c

    .line 201
    aget-object v0, v8, v7

    invoke-virtual/range {v0 .. v5}, Ljavassist/bytecode/analysis/ControlFlow$Node;->makeDepth1stTree(Ljavassist/bytecode/analysis/ControlFlow$Node;[ZI[ILjavassist/bytecode/analysis/ControlFlow$Access;)I

    move-result v3

    .line 199
    :cond_3c
    add-int/lit8 v7, v7, 0x1

    goto :goto_28

    .line 205
    :cond_3f
    const/4 v7, 0x0

    :goto_40
    if-ge v7, v9, :cond_47

    .line 206
    aput-boolean v11, v2, v7

    .line 205
    add-int/lit8 v7, v7, 0x1

    goto :goto_40

    .line 208
    :cond_47
    const/4 v6, 0x0

    .line 209
    .local v6, "changed":Z
    const/4 v7, 0x0

    :goto_49
    if-ge v7, v9, :cond_63

    .line 210
    aget-object v0, v8, v7

    # getter for: Ljavassist/bytecode/analysis/ControlFlow$Node;->block:Ljavassist/bytecode/analysis/ControlFlow$Block;
    invoke-static {v0}, Ljavassist/bytecode/analysis/ControlFlow$Node;->access$100(Ljavassist/bytecode/analysis/ControlFlow$Node;)Ljavassist/bytecode/analysis/ControlFlow$Block;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/bytecode/analysis/ControlFlow$Block;->exits()I

    move-result v0

    if-nez v0, :cond_60

    .line 211
    aget-object v0, v8, v7

    invoke-virtual {v0, v2, v4, v5}, Ljavassist/bytecode/analysis/ControlFlow$Node;->makeDominatorTree([Z[ILjavassist/bytecode/analysis/ControlFlow$Access;)Z

    move-result v0

    if-eqz v0, :cond_60

    .line 212
    const/4 v6, 0x1

    .line 209
    :cond_60
    add-int/lit8 v7, v7, 0x1

    goto :goto_49

    .line 213
    :cond_63
    if-nez v6, :cond_3f

    .line 215
    # invokes: Ljavassist/bytecode/analysis/ControlFlow$Node;->setChildren([Ljavassist/bytecode/analysis/ControlFlow$Node;)V
    invoke-static {v8}, Ljavassist/bytecode/analysis/ControlFlow$Node;->access$200([Ljavassist/bytecode/analysis/ControlFlow$Node;)V

    move-object v1, v8

    .line 216
    goto :goto_7
.end method
