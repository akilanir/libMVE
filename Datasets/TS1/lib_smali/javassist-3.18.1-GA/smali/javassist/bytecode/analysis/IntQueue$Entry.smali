.class Ljavassist/bytecode/analysis/IntQueue$Entry;
.super Ljava/lang/Object;
.source "IntQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/analysis/IntQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Entry"
.end annotation


# instance fields
.field private next:Ljavassist/bytecode/analysis/IntQueue$Entry;

.field private value:I


# direct methods
.method private constructor <init>(I)V
    .registers 2
    .param p1, "value"    # I

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput p1, p0, Ljavassist/bytecode/analysis/IntQueue$Entry;->value:I

    .line 26
    return-void
.end method

.method synthetic constructor <init>(ILjavassist/bytecode/analysis/IntQueue$1;)V
    .registers 3
    .param p1, "x0"    # I
    .param p2, "x1"    # Ljavassist/bytecode/analysis/IntQueue$1;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Ljavassist/bytecode/analysis/IntQueue$Entry;-><init>(I)V

    return-void
.end method

.method static synthetic access$100(Ljavassist/bytecode/analysis/IntQueue$Entry;)Ljavassist/bytecode/analysis/IntQueue$Entry;
    .registers 2
    .param p0, "x0"    # Ljavassist/bytecode/analysis/IntQueue$Entry;

    .prologue
    .line 21
    iget-object v0, p0, Ljavassist/bytecode/analysis/IntQueue$Entry;->next:Ljavassist/bytecode/analysis/IntQueue$Entry;

    return-object v0
.end method

.method static synthetic access$102(Ljavassist/bytecode/analysis/IntQueue$Entry;Ljavassist/bytecode/analysis/IntQueue$Entry;)Ljavassist/bytecode/analysis/IntQueue$Entry;
    .registers 2
    .param p0, "x0"    # Ljavassist/bytecode/analysis/IntQueue$Entry;
    .param p1, "x1"    # Ljavassist/bytecode/analysis/IntQueue$Entry;

    .prologue
    .line 21
    iput-object p1, p0, Ljavassist/bytecode/analysis/IntQueue$Entry;->next:Ljavassist/bytecode/analysis/IntQueue$Entry;

    return-object p1
.end method

.method static synthetic access$200(Ljavassist/bytecode/analysis/IntQueue$Entry;)I
    .registers 2
    .param p0, "x0"    # Ljavassist/bytecode/analysis/IntQueue$Entry;

    .prologue
    .line 21
    iget v0, p0, Ljavassist/bytecode/analysis/IntQueue$Entry;->value:I

    return v0
.end method
