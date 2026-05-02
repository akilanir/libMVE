.class Ljavassist/CtField$PtreeInitializer;
.super Ljavassist/CtField$CodeInitializer0;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PtreeInitializer"
.end annotation


# instance fields
.field private expression:Ljavassist/compiler/ast/ASTree;


# direct methods
.method constructor <init>(Ljavassist/compiler/ast/ASTree;)V
    .registers 2
    .param p1, "expr"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 934
    invoke-direct {p0}, Ljavassist/CtField$CodeInitializer0;-><init>()V

    iput-object p1, p0, Ljavassist/CtField$PtreeInitializer;->expression:Ljavassist/compiler/ast/ASTree;

    return-void
.end method


# virtual methods
.method compileExpr(Ljavassist/compiler/Javac;)V
    .registers 3
    .param p1, "drv"    # Ljavassist/compiler/Javac;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 937
    iget-object v0, p0, Ljavassist/CtField$PtreeInitializer;->expression:Ljavassist/compiler/ast/ASTree;

    invoke-virtual {p1, v0}, Ljavassist/compiler/Javac;->compileExpr(Ljavassist/compiler/ast/ASTree;)V

    .line 938
    return-void
.end method

.method getConstantValue(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;)I
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "type"    # Ljavassist/CtClass;

    .prologue
    .line 941
    iget-object v0, p0, Ljavassist/CtField$PtreeInitializer;->expression:Ljavassist/compiler/ast/ASTree;

    invoke-virtual {p0, p1, p2, v0}, Ljavassist/CtField$PtreeInitializer;->getConstantValue2(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;Ljavassist/compiler/ast/ASTree;)I

    move-result v0

    return v0
.end method
