.class Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;
.super Ljava/lang/Object;
.source "Codegen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/optimizer/BodyCodegen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExceptionManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    }
.end annotation


# instance fields
.field private exceptionInfo:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/mozilla/javascript/optimizer/BodyCodegen;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/optimizer/BodyCodegen;)V
    .registers 3

    .prologue
    .line 3947
    iput-object p1, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->this$0:Lorg/mozilla/javascript/optimizer/BodyCodegen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3948
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->exceptionInfo:Ljava/util/LinkedList;

    .line 3949
    return-void
.end method

.method private endCatch(Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;II)V
    .registers 11
    .param p1, "ei"    # Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    .param p2, "exceptionType"    # I
    .param p3, "catchEnd"    # I

    .prologue
    .line 4109
    iget-object v3, p1, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->exceptionStarts:[I

    aget v3, v3, p2

    if-nez v3, :cond_e

    .line 4110
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "bad exception start"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 4113
    :cond_e
    iget-object v3, p1, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->exceptionStarts:[I

    aget v1, v3, p2

    .line 4114
    .local v1, "currentStart":I
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->this$0:Lorg/mozilla/javascript/optimizer/BodyCodegen;

    iget-object v3, v3, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, v1}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v2

    .line 4115
    .local v2, "currentStartPC":I
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->this$0:Lorg/mozilla/javascript/optimizer/BodyCodegen;

    iget-object v3, v3, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    invoke-virtual {v3, p3}, Lorg/mozilla/classfile/ClassFileWriter;->getLabelPC(I)I

    move-result v0

    .line 4116
    .local v0, "catchEndPC":I
    if-eq v2, v0, :cond_39

    .line 4117
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->this$0:Lorg/mozilla/javascript/optimizer/BodyCodegen;

    iget-object v3, v3, Lorg/mozilla/javascript/optimizer/BodyCodegen;->cfw:Lorg/mozilla/classfile/ClassFileWriter;

    iget-object v4, p1, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->exceptionStarts:[I

    aget v4, v4, p2

    iget-object v5, p1, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    aget v5, v5, p2

    iget-object v6, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->this$0:Lorg/mozilla/javascript/optimizer/BodyCodegen;

    # invokes: Lorg/mozilla/javascript/optimizer/BodyCodegen;->exceptionTypeToName(I)Ljava/lang/String;
    invoke-static {v6, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->access$100(Lorg/mozilla/javascript/optimizer/BodyCodegen;I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, p3, v5, v6}, Lorg/mozilla/classfile/ClassFileWriter;->addExceptionHandler(IIILjava/lang/String;)V

    .line 4122
    :cond_39
    return-void
.end method

.method private getTop()Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    .registers 2

    .prologue
    .line 4126
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->exceptionInfo:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;

    return-object v0
.end method


# virtual methods
.method addHandler(III)V
    .registers 6
    .param p1, "exceptionType"    # I
    .param p2, "handlerLabel"    # I
    .param p3, "startLabel"    # I

    .prologue
    .line 3975
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->getTop()Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;

    move-result-object v0

    .line 3976
    .local v0, "top":Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    iget-object v1, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    aput p2, v1, p1

    .line 3977
    iget-object v1, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->exceptionStarts:[I

    aput p3, v1, p1

    .line 3978
    return-void
.end method

.method markInlineFinallyEnd(Lorg/mozilla/javascript/Node;I)V
    .registers 8
    .param p1, "finallyBlock"    # Lorg/mozilla/javascript/Node;
    .param p2, "finallyEnd"    # I

    .prologue
    .line 4083
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->exceptionInfo:Ljava/util/LinkedList;

    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->exceptionInfo:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v2

    .line 4085
    .local v2, "iter":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;>;"
    :cond_c
    invoke-interface {v2}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v3

    if-eqz v3, :cond_34

    .line 4086
    invoke-interface {v2}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;

    .line 4087
    .local v0, "ei":Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    const/4 v3, 0x5

    if-ge v1, v3, :cond_30

    .line 4088
    iget-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    aget v3, v3, v1

    if-eqz v3, :cond_2d

    iget-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->currentFinally:Lorg/mozilla/javascript/Node;

    if-ne v3, p1, :cond_2d

    .line 4090
    iget-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->exceptionStarts:[I

    aput p2, v3, v1

    .line 4091
    const/4 v3, 0x0

    iput-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->currentFinally:Lorg/mozilla/javascript/Node;

    .line 4087
    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 4094
    :cond_30
    iget-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->finallyBlock:Lorg/mozilla/javascript/Node;

    if-ne v3, p1, :cond_c

    .line 4098
    .end local v0    # "ei":Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    .end local v1    # "i":I
    :cond_34
    return-void
.end method

.method markInlineFinallyStart(Lorg/mozilla/javascript/Node;I)V
    .registers 8
    .param p1, "finallyBlock"    # Lorg/mozilla/javascript/Node;
    .param p2, "finallyStart"    # I

    .prologue
    .line 4054
    iget-object v3, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->exceptionInfo:Ljava/util/LinkedList;

    iget-object v4, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->exceptionInfo:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v2

    .line 4056
    .local v2, "iter":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;>;"
    :cond_c
    invoke-interface {v2}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v3

    if-eqz v3, :cond_37

    .line 4057
    invoke-interface {v2}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;

    .line 4058
    .local v0, "ei":Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    const/4 v3, 0x5

    if-ge v1, v3, :cond_33

    .line 4059
    iget-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    aget v3, v3, v1

    if-eqz v3, :cond_30

    iget-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->currentFinally:Lorg/mozilla/javascript/Node;

    if-nez v3, :cond_30

    .line 4060
    invoke-direct {p0, v0, v1, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->endCatch(Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;II)V

    .line 4061
    iget-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->exceptionStarts:[I

    const/4 v4, 0x0

    aput v4, v3, v1

    .line 4062
    iput-object p1, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->currentFinally:Lorg/mozilla/javascript/Node;

    .line 4058
    :cond_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 4065
    :cond_33
    iget-object v3, v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->finallyBlock:Lorg/mozilla/javascript/Node;

    if-ne v3, p1, :cond_c

    .line 4069
    .end local v0    # "ei":Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    .end local v1    # "i":I
    :cond_37
    return-void
.end method

.method popExceptionInfo()V
    .registers 2

    .prologue
    .line 4027
    iget-object v0, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->exceptionInfo:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    .line 4028
    return-void
.end method

.method pushExceptionInfo(Lorg/mozilla/javascript/ast/Jump;)V
    .registers 6
    .param p1, "node"    # Lorg/mozilla/javascript/ast/Jump;

    .prologue
    .line 3959
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->this$0:Lorg/mozilla/javascript/optimizer/BodyCodegen;

    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/Jump;->getFinally()Lorg/mozilla/javascript/Node;

    move-result-object v3

    # invokes: Lorg/mozilla/javascript/optimizer/BodyCodegen;->getFinallyAtTarget(Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;
    invoke-static {v2, v3}, Lorg/mozilla/javascript/optimizer/BodyCodegen;->access$000(Lorg/mozilla/javascript/optimizer/BodyCodegen;Lorg/mozilla/javascript/Node;)Lorg/mozilla/javascript/Node;

    move-result-object v1

    .line 3960
    .local v1, "fBlock":Lorg/mozilla/javascript/Node;
    new-instance v0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;

    invoke-direct {v0, p0, p1, v1}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;-><init>(Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;Lorg/mozilla/javascript/ast/Jump;Lorg/mozilla/javascript/Node;)V

    .line 3961
    .local v0, "ei":Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    iget-object v2, p0, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->exceptionInfo:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 3962
    return-void
.end method

.method removeHandler(II)I
    .registers 7
    .param p1, "exceptionType"    # I
    .param p2, "endLabel"    # I

    .prologue
    const/4 v2, 0x0

    .line 4012
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->getTop()Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;

    move-result-object v1

    .line 4013
    .local v1, "top":Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    iget-object v3, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    aget v3, v3, p1

    if-eqz v3, :cond_17

    .line 4014
    iget-object v3, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    aget v0, v3, p1

    .line 4015
    .local v0, "handlerLabel":I
    invoke-direct {p0, v1, p1, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->endCatch(Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;II)V

    .line 4016
    iget-object v3, v1, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;->handlerLabels:[I

    aput v2, v3, p1

    .line 4019
    .end local v0    # "handlerLabel":I
    :goto_16
    return v0

    :cond_17
    move v0, v2

    goto :goto_16
.end method

.method setHandlers([II)V
    .registers 6
    .param p1, "handlerLabels"    # [I
    .param p2, "startLabel"    # I

    .prologue
    .line 3992
    invoke-direct {p0}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->getTop()Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;

    move-result-object v1

    .line 3993
    .local v1, "top":Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager$ExceptionInfo;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    array-length v2, p1

    if-ge v0, v2, :cond_14

    .line 3994
    aget v2, p1, v0

    if-eqz v2, :cond_11

    .line 3995
    aget v2, p1, v0

    invoke-virtual {p0, v0, v2, p2}, Lorg/mozilla/javascript/optimizer/BodyCodegen$ExceptionManager;->addHandler(III)V

    .line 3993
    :cond_11
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 3998
    :cond_14
    return-void
.end method
