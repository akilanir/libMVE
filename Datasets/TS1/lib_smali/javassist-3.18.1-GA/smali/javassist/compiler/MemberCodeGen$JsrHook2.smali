.class Ljavassist/compiler/MemberCodeGen$JsrHook2;
.super Ljavassist/compiler/CodeGen$ReturnHook;
.source "MemberCodeGen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/compiler/MemberCodeGen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "JsrHook2"
.end annotation


# instance fields
.field target:I

.field var:I


# direct methods
.method constructor <init>(Ljavassist/compiler/CodeGen;[I)V
    .registers 4
    .param p1, "gen"    # Ljavassist/compiler/CodeGen;
    .param p2, "retTarget"    # [I

    .prologue
    .line 155
    invoke-direct {p0, p1}, Ljavassist/compiler/CodeGen$ReturnHook;-><init>(Ljavassist/compiler/CodeGen;)V

    .line 156
    const/4 v0, 0x0

    aget v0, p2, v0

    iput v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook2;->target:I

    .line 157
    const/4 v0, 0x1

    aget v0, p2, v0

    iput v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook2;->var:I

    .line 158
    return-void
.end method


# virtual methods
.method protected doit(Ljavassist/bytecode/Bytecode;I)Z
    .registers 5
    .param p1, "b"    # Ljavassist/bytecode/Bytecode;
    .param p2, "opcode"    # I

    .prologue
    .line 161
    packed-switch p2, :pswitch_data_3c

    .line 180
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "fatal"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 165
    :pswitch_b
    iget v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook2;->var:I

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    .line 183
    :goto_10
    :pswitch_10
    const/16 v0, 0xa7

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 184
    iget v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook2;->target:I

    invoke-virtual {p1}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v1

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x3

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 185
    const/4 v0, 0x1

    return v0

    .line 168
    :pswitch_23
    iget v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook2;->var:I

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addIstore(I)V

    goto :goto_10

    .line 171
    :pswitch_29
    iget v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook2;->var:I

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addLstore(I)V

    goto :goto_10

    .line 174
    :pswitch_2f
    iget v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook2;->var:I

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addDstore(I)V

    goto :goto_10

    .line 177
    :pswitch_35
    iget v0, p0, Ljavassist/compiler/MemberCodeGen$JsrHook2;->var:I

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addFstore(I)V

    goto :goto_10

    .line 161
    nop

    :pswitch_data_3c
    .packed-switch 0xac
        :pswitch_23
        :pswitch_29
        :pswitch_35
        :pswitch_2f
        :pswitch_b
        :pswitch_10
    .end packed-switch
.end method
