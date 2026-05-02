.class Lfreemarker/core/SequenceBuiltins$sortBI$KVP;
.super Ljava/lang/Object;
.source "SequenceBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins$sortBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "KVP"
.end annotation


# instance fields
.field private key:Ljava/lang/Object;

.field private value:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 359
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 360
    iput-object p1, p0, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;->key:Ljava/lang/Object;

    .line 361
    iput-object p2, p0, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;->value:Ljava/lang/Object;

    .line 362
    return-void
.end method

.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Lfreemarker/core/SequenceBuiltins$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;
    .param p3, "x2"    # Lfreemarker/core/SequenceBuiltins$1;

    .prologue
    .line 358
    invoke-direct {p0, p1, p2}, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method static access$600(Lfreemarker/core/SequenceBuiltins$sortBI$KVP;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    .prologue
    .line 358
    iget-object v0, p0, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;->value:Ljava/lang/Object;

    return-object v0
.end method

.method static access$700(Lfreemarker/core/SequenceBuiltins$sortBI$KVP;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    .prologue
    .line 358
    iget-object v0, p0, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;->key:Ljava/lang/Object;

    return-object v0
.end method
