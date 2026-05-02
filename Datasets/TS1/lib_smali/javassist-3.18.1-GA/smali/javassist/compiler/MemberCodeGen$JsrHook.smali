.class Ljavassist/compiler/MemberCodeGen$JsrHook;
.super Ljavassist/compiler/CodeGen$ReturnHook;
.source "MemberCodeGen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/compiler/MemberCodeGen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "JsrHook"
.end annotation


# instance fields
.field cgen:Ljavassist/compiler/CodeGen;

.field jsrList:Ljava/util/ArrayList;

.field var:I


# direct methods
.method constructor <init>(Ljavassist/compiler/CodeGen;)V
    .registers 3
    .param p1, "gen"    # Ljavassist/compiler/CodeGen;

    .prologue
    .line 91
    invoke-direct {p0, p1}, Ljavassist/compiler/CodeGen$ReturnHook;-><init>(Ljavassist/compiler/CodeGen;)V

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->jsrList:Ljava/util/ArrayList;

    .line 93
    iput-object p1, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->cgen:Ljavassist/compiler/CodeGen;

    .line 94
    const/4 v0, -0x1

    iput v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->var:I

    .line 95
    return-void
.end method

.method private getVar(I)I
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 98
    iget v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->var:I

    if-gez v0, :cond_11

    .line 99
    iget-object v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->cgen:Ljavassist/compiler/CodeGen;

    invoke-virtual {v0}, Ljavassist/compiler/CodeGen;->getMaxLocals()I

    move-result v0

    iput v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->var:I

    .line 100
    iget-object v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->cgen:Ljavassist/compiler/CodeGen;

    invoke-virtual {v0, p1}, Ljavassist/compiler/CodeGen;->incMaxLocals(I)V

    .line 103
    :cond_11
    iget v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->var:I

    return v0
.end method

.method private jsrJmp(Ljavassist/bytecode/Bytecode;)V
    .registers 7
    .param p1, "b"    # Ljavassist/bytecode/Bytecode;

    .prologue
    const/4 v4, 0x0

    .line 107
    const/16 v0, 0xa7

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 108
    iget-object v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->jsrList:Ljava/util/ArrayList;

    const/4 v1, 0x2

    new-array v1, v1, [I

    invoke-virtual {p1}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v2

    aput v2, v1, v4

    const/4 v2, 0x1

    iget v3, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->var:I

    aput v3, v1, v2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    invoke-virtual {p1, v4}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 110
    return-void
.end method


# virtual methods
.method protected doit(Ljavassist/bytecode/Bytecode;I)Z
    .registers 5
    .param p1, "b"    # Ljavassist/bytecode/Bytecode;
    .param p2, "opcode"    # I

    .prologue
    const/4 v1, 0x2

    const/4 v0, 0x1

    .line 113
    packed-switch p2, :pswitch_data_62

    .line 143
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "fatal"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 115
    :pswitch_d
    invoke-direct {p0, p1}, Ljavassist/compiler/MemberCodeGen$JsrHook;->jsrJmp(Ljavassist/bytecode/Bytecode;)V

    .line 146
    :goto_10
    const/4 v0, 0x0

    return v0

    .line 118
    :pswitch_12
    invoke-direct {p0, v0}, Ljavassist/compiler/MemberCodeGen$JsrHook;->getVar(I)I

    move-result v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    .line 119
    invoke-direct {p0, p1}, Ljavassist/compiler/MemberCodeGen$JsrHook;->jsrJmp(Ljavassist/bytecode/Bytecode;)V

    .line 120
    iget v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->var:I

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    goto :goto_10

    .line 123
    :pswitch_22
    invoke-direct {p0, v0}, Ljavassist/compiler/MemberCodeGen$JsrHook;->getVar(I)I

    move-result v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addIstore(I)V

    .line 124
    invoke-direct {p0, p1}, Ljavassist/compiler/MemberCodeGen$JsrHook;->jsrJmp(Ljavassist/bytecode/Bytecode;)V

    .line 125
    iget v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->var:I

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addIload(I)V

    goto :goto_10

    .line 128
    :pswitch_32
    invoke-direct {p0, v1}, Ljavassist/compiler/MemberCodeGen$JsrHook;->getVar(I)I

    move-result v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addLstore(I)V

    .line 129
    invoke-direct {p0, p1}, Ljavassist/compiler/MemberCodeGen$JsrHook;->jsrJmp(Ljavassist/bytecode/Bytecode;)V

    .line 130
    iget v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->var:I

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addLload(I)V

    goto :goto_10

    .line 133
    :pswitch_42
    invoke-direct {p0, v1}, Ljavassist/compiler/MemberCodeGen$JsrHook;->getVar(I)I

    move-result v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addDstore(I)V

    .line 134
    invoke-direct {p0, p1}, Ljavassist/compiler/MemberCodeGen$JsrHook;->jsrJmp(Ljavassist/bytecode/Bytecode;)V

    .line 135
    iget v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->var:I

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addDload(I)V

    goto :goto_10

    .line 138
    :pswitch_52
    invoke-direct {p0, v0}, Ljavassist/compiler/MemberCodeGen$JsrHook;->getVar(I)I

    move-result v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addFstore(I)V

    .line 139
    invoke-direct {p0, p1}, Ljavassist/compiler/MemberCodeGen$JsrHook;->jsrJmp(Ljavassist/bytecode/Bytecode;)V

    .line 140
    iget v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook;->var:I

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addFload(I)V

    goto :goto_10

    .line 113
    :pswitch_data_62
    .packed-switch 0xac
        :pswitch_22
        :pswitch_32
        :pswitch_52
        :pswitch_42
        :pswitch_12
        :pswitch_d
    .end packed-switch
.end method
