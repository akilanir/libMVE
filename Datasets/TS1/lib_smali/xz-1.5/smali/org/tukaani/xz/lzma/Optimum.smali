.class final Lorg/tukaani/xz/lzma/Optimum;
.super Ljava/lang/Object;


# static fields
.field private static final INFINITY_PRICE:I = 0x40000000


# instance fields
.field backPrev:I

.field backPrev2:I

.field hasPrev2:Z

.field optPrev:I

.field optPrev2:I

.field prev1IsLiteral:Z

.field price:I

.field final reps:[I

.field final state:Lorg/tukaani/xz/lzma/State;


# direct methods
.method constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorg/tukaani/xz/lzma/State;

    invoke-direct {v0}, Lorg/tukaani/xz/lzma/State;-><init>()V

    iput-object v0, p0, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    return-void
.end method


# virtual methods
.method reset()V
    .registers 2

    const/high16 v0, 0x40000000    # 2.0f

    iput v0, p0, Lorg/tukaani/xz/lzma/Optimum;->price:I

    return-void
.end method

.method set1(III)V
    .registers 5

    iput p1, p0, Lorg/tukaani/xz/lzma/Optimum;->price:I

    iput p2, p0, Lorg/tukaani/xz/lzma/Optimum;->optPrev:I

    iput p3, p0, Lorg/tukaani/xz/lzma/Optimum;->backPrev:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/lzma/Optimum;->prev1IsLiteral:Z

    return-void
.end method

.method set2(III)V
    .registers 5

    iput p1, p0, Lorg/tukaani/xz/lzma/Optimum;->price:I

    add-int/lit8 v0, p2, 0x1

    iput v0, p0, Lorg/tukaani/xz/lzma/Optimum;->optPrev:I

    iput p3, p0, Lorg/tukaani/xz/lzma/Optimum;->backPrev:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/tukaani/xz/lzma/Optimum;->prev1IsLiteral:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/lzma/Optimum;->hasPrev2:Z

    return-void
.end method

.method set3(IIIII)V
    .registers 8

    const/4 v1, 0x1

    iput p1, p0, Lorg/tukaani/xz/lzma/Optimum;->price:I

    add-int v0, p2, p4

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/tukaani/xz/lzma/Optimum;->optPrev:I

    iput p5, p0, Lorg/tukaani/xz/lzma/Optimum;->backPrev:I

    iput-boolean v1, p0, Lorg/tukaani/xz/lzma/Optimum;->prev1IsLiteral:Z

    iput-boolean v1, p0, Lorg/tukaani/xz/lzma/Optimum;->hasPrev2:Z

    iput p2, p0, Lorg/tukaani/xz/lzma/Optimum;->optPrev2:I

    iput p3, p0, Lorg/tukaani/xz/lzma/Optimum;->backPrev2:I

    return-void
.end method
