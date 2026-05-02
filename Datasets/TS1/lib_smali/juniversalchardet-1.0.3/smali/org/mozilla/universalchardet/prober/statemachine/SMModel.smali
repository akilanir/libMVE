.class public abstract Lorg/mozilla/universalchardet/prober/statemachine/SMModel;
.super Ljava/lang/Object;
.source "SMModel.java"


# static fields
.field public static final ERROR:I = 0x1

.field public static final ITSME:I = 0x2

.field public static final START:I


# instance fields
.field protected charLenTable:[I

.field protected classFactor:I

.field protected classTable:Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;

.field protected name:Ljava/lang/String;

.field protected stateTable:Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;


# direct methods
.method public constructor <init>(Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;ILorg/mozilla/universalchardet/prober/statemachine/PkgInt;[ILjava/lang/String;)V
    .registers 6
    .param p1, "classTable"    # Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;
    .param p2, "classFactor"    # I
    .param p3, "stateTable"    # Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;
    .param p4, "charLenTable"    # [I
    .param p5, "name"    # Ljava/lang/String;

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, Lorg/mozilla/universalchardet/prober/statemachine/SMModel;->classTable:Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;

    .line 71
    iput p2, p0, Lorg/mozilla/universalchardet/prober/statemachine/SMModel;->classFactor:I

    .line 72
    iput-object p3, p0, Lorg/mozilla/universalchardet/prober/statemachine/SMModel;->stateTable:Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;

    .line 73
    iput-object p4, p0, Lorg/mozilla/universalchardet/prober/statemachine/SMModel;->charLenTable:[I

    .line 74
    iput-object p5, p0, Lorg/mozilla/universalchardet/prober/statemachine/SMModel;->name:Ljava/lang/String;

    .line 75
    return-void
.end method


# virtual methods
.method public getCharLen(I)I
    .registers 3
    .param p1, "cls"    # I

    .prologue
    .line 90
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/statemachine/SMModel;->charLenTable:[I

    aget v0, v0, p1

    return v0
.end method

.method public getClass(B)I
    .registers 4
    .param p1, "b"    # B

    .prologue
    .line 79
    and-int/lit16 v0, p1, 0xff

    .line 80
    .local v0, "c":I
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/statemachine/SMModel;->classTable:Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;

    invoke-virtual {v1, v0}, Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;->unpack(I)I

    move-result v1

    return v1
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/statemachine/SMModel;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNextState(II)I
    .registers 5
    .param p1, "cls"    # I
    .param p2, "currentState"    # I

    .prologue
    .line 85
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/statemachine/SMModel;->stateTable:Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;

    iget v1, p0, Lorg/mozilla/universalchardet/prober/statemachine/SMModel;->classFactor:I

    mul-int/2addr v1, p2

    add-int/2addr v1, p1

    invoke-virtual {v0, v1}, Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;->unpack(I)I

    move-result v0

    return v0
.end method
