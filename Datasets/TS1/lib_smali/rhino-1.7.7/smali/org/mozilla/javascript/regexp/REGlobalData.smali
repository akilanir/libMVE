.class Lorg/mozilla/javascript/regexp/REGlobalData;
.super Ljava/lang/Object;
.source "NativeRegExp.java"


# instance fields
.field backTrackStackTop:Lorg/mozilla/javascript/regexp/REBackTrackData;

.field cp:I

.field multiline:Z

.field parens:[J

.field regexp:Lorg/mozilla/javascript/regexp/RECompiled;

.field skipped:I

.field stateStackTop:Lorg/mozilla/javascript/regexp/REProgState;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 2915
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method parensIndex(I)I
    .registers 4
    .param p1, "i"    # I

    .prologue
    .line 2933
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->parens:[J

    aget-wide v0, v0, p1

    long-to-int v0, v0

    return v0
.end method

.method parensLength(I)I
    .registers 5
    .param p1, "i"    # I

    .prologue
    .line 2941
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->parens:[J

    aget-wide v0, v0, p1

    const/16 v2, 0x20

    ushr-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method setParens(III)V
    .registers 10
    .param p1, "i"    # I
    .param p2, "index"    # I
    .param p3, "length"    # I

    .prologue
    .line 2947
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->backTrackStackTop:Lorg/mozilla/javascript/regexp/REBackTrackData;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->backTrackStackTop:Lorg/mozilla/javascript/regexp/REBackTrackData;

    iget-object v0, v0, Lorg/mozilla/javascript/regexp/REBackTrackData;->parens:[J

    iget-object v1, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->parens:[J

    if-ne v0, v1, :cond_16

    .line 2948
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->parens:[J

    invoke-virtual {v0}, [J->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    iput-object v0, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->parens:[J

    .line 2950
    :cond_16
    iget-object v0, p0, Lorg/mozilla/javascript/regexp/REGlobalData;->parens:[J

    int-to-long v1, p2

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    int-to-long v3, p3

    const/16 v5, 0x20

    shl-long/2addr v3, v5

    or-long/2addr v1, v3

    aput-wide v1, v0, p1

    .line 2951
    return-void
.end method
