.class Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;
.super Ljava/lang/Object;
.source "Analyzer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/analysis/Analyzer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ExceptionInfo"
.end annotation


# instance fields
.field private end:I

.field private handler:I

.field private start:I

.field private type:Ljavassist/bytecode/analysis/Type;


# direct methods
.method private constructor <init>(IIILjavassist/bytecode/analysis/Type;)V
    .registers 5
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "handler"    # I
    .param p4, "type"    # Ljavassist/bytecode/analysis/Type;

    .prologue
    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput p1, p0, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->start:I

    .line 101
    iput p2, p0, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->end:I

    .line 102
    iput p3, p0, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->handler:I

    .line 103
    iput-object p4, p0, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->type:Ljavassist/bytecode/analysis/Type;

    .line 104
    return-void
.end method

.method synthetic constructor <init>(IIILjavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Analyzer$1;)V
    .registers 6
    .param p1, "x0"    # I
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # Ljavassist/bytecode/analysis/Type;
    .param p5, "x4"    # Ljavassist/bytecode/analysis/Analyzer$1;

    .prologue
    .line 93
    invoke-direct {p0, p1, p2, p3, p4}, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;-><init>(IIILjavassist/bytecode/analysis/Type;)V

    return-void
.end method

.method static synthetic access$100(Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;)I
    .registers 2
    .param p0, "x0"    # Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;

    .prologue
    .line 93
    iget v0, p0, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->start:I

    return v0
.end method

.method static synthetic access$200(Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;)I
    .registers 2
    .param p0, "x0"    # Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;

    .prologue
    .line 93
    iget v0, p0, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->end:I

    return v0
.end method

.method static synthetic access$300(Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;)Ljavassist/bytecode/analysis/Type;
    .registers 2
    .param p0, "x0"    # Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;

    .prologue
    .line 93
    iget-object v0, p0, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->type:Ljavassist/bytecode/analysis/Type;

    return-object v0
.end method

.method static synthetic access$400(Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;)I
    .registers 2
    .param p0, "x0"    # Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;

    .prologue
    .line 93
    iget v0, p0, Ljavassist/bytecode/analysis/Analyzer$ExceptionInfo;->handler:I

    return v0
.end method
