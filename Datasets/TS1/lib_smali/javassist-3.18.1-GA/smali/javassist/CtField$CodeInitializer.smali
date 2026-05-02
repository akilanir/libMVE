.class Ljavassist/CtField$CodeInitializer;
.super Ljavassist/CtField$CodeInitializer0;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CodeInitializer"
.end annotation


# instance fields
.field private expression:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "expr"    # Ljava/lang/String;

    .prologue
    .line 914
    invoke-direct {p0}, Ljavassist/CtField$CodeInitializer0;-><init>()V

    iput-object p1, p0, Ljavassist/CtField$CodeInitializer;->expression:Ljava/lang/String;

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
    .line 917
    iget-object v0, p0, Ljavassist/CtField$CodeInitializer;->expression:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljavassist/compiler/Javac;->compileExpr(Ljava/lang/String;)V

    .line 918
    return-void
.end method

.method getConstantValue(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;)I
    .registers 7
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "type"    # Ljavassist/CtClass;

    .prologue
    .line 922
    :try_start_0
    iget-object v2, p0, Ljavassist/CtField$CodeInitializer;->expression:Ljava/lang/String;

    new-instance v3, Ljavassist/compiler/SymbolTable;

    invoke-direct {v3}, Ljavassist/compiler/SymbolTable;-><init>()V

    invoke-static {v2, v3}, Ljavassist/compiler/Javac;->parseExpr(Ljava/lang/String;Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 923
    .local v1, "t":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p0, p1, p2, v1}, Ljavassist/CtField$CodeInitializer;->getConstantValue2(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;Ljavassist/compiler/ast/ASTree;)I
    :try_end_e
    .catch Ljavassist/compiler/CompileError; {:try_start_0 .. :try_end_e} :catch_10

    move-result v2

    .line 926
    .end local v1    # "t":Ljavassist/compiler/ast/ASTree;
    :goto_f
    return v2

    .line 925
    :catch_10
    move-exception v0

    .line 926
    .local v0, "e":Ljavassist/compiler/CompileError;
    const/4 v2, 0x0

    goto :goto_f
.end method
