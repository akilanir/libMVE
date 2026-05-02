.class Ljavassist/compiler/Javac$3;
.super Ljava/lang/Object;
.source "Javac.java"

# interfaces
.implements Ljavassist/compiler/ProceedHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljavassist/compiler/Javac;->recordSpecialProceed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljavassist/compiler/Javac;

.field final synthetic val$cname:Ljava/lang/String;

.field final synthetic val$desc:Ljava/lang/String;

.field final synthetic val$method:Ljava/lang/String;

.field final synthetic val$texpr:Ljavassist/compiler/ast/ASTree;


# direct methods
.method constructor <init>(Ljavassist/compiler/Javac;Ljavassist/compiler/ast/ASTree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .prologue
    .line 529
    iput-object p1, p0, Ljavassist/compiler/Javac$3;->this$0:Ljavassist/compiler/Javac;

    iput-object p2, p0, Ljavassist/compiler/Javac$3;->val$texpr:Ljavassist/compiler/ast/ASTree;

    iput-object p3, p0, Ljavassist/compiler/Javac$3;->val$cname:Ljava/lang/String;

    iput-object p4, p0, Ljavassist/compiler/Javac$3;->val$method:Ljava/lang/String;

    iput-object p5, p0, Ljavassist/compiler/Javac$3;->val$desc:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doit(Ljavassist/compiler/JvstCodeGen;Ljavassist/bytecode/Bytecode;Ljavassist/compiler/ast/ASTList;)V
    .registers 10
    .param p1, "gen"    # Ljavassist/compiler/JvstCodeGen;
    .param p2, "b"    # Ljavassist/bytecode/Bytecode;
    .param p3, "args"    # Ljavassist/compiler/ast/ASTList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 533
    iget-object v1, p0, Ljavassist/compiler/Javac$3;->val$texpr:Ljavassist/compiler/ast/ASTree;

    iget-object v2, p0, Ljavassist/compiler/Javac$3;->val$cname:Ljava/lang/String;

    iget-object v3, p0, Ljavassist/compiler/Javac$3;->val$method:Ljava/lang/String;

    iget-object v4, p0, Ljavassist/compiler/Javac$3;->val$desc:Ljava/lang/String;

    move-object v0, p1

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Ljavassist/compiler/JvstCodeGen;->compileInvokeSpecial(Ljavassist/compiler/ast/ASTree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljavassist/compiler/ast/ASTList;)V

    .line 534
    return-void
.end method

.method public setReturnType(Ljavassist/compiler/JvstTypeChecker;Ljavassist/compiler/ast/ASTList;)V
    .registers 9
    .param p1, "c"    # Ljavassist/compiler/JvstTypeChecker;
    .param p2, "args"    # Ljavassist/compiler/ast/ASTList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 539
    iget-object v1, p0, Ljavassist/compiler/Javac$3;->val$texpr:Ljavassist/compiler/ast/ASTree;

    iget-object v2, p0, Ljavassist/compiler/Javac$3;->val$cname:Ljava/lang/String;

    iget-object v3, p0, Ljavassist/compiler/Javac$3;->val$method:Ljava/lang/String;

    iget-object v4, p0, Ljavassist/compiler/Javac$3;->val$desc:Ljava/lang/String;

    move-object v0, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Ljavassist/compiler/JvstTypeChecker;->compileInvokeSpecial(Ljavassist/compiler/ast/ASTree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljavassist/compiler/ast/ASTList;)V

    .line 540
    return-void
.end method
